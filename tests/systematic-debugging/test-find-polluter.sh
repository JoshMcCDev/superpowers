#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SCRIPT_UNDER_TEST="$REPO_ROOT/skills/systematic-debugging/find-polluter.sh"

FAILURES=0
TEST_ROOT="$(mktemp -d)"

cleanup() {
  rm -rf "$TEST_ROOT"
}
trap cleanup EXIT

pass() {
  echo "  [PASS] $1"
}

fail() {
  echo "  [FAIL] $1"
  FAILURES=$((FAILURES + 1))
}

assert_contains() {
  local haystack="$1"
  local needle="$2"
  local description="$3"

  if printf '%s' "$haystack" | grep -Fq -- "$needle"; then
    pass "$description"
  else
    fail "$description (expected output to contain: $needle)"
  fi
}

# Toy project: one top-level test, one nested test. A stubbed `npm` on PATH
# creates the pollution marker whenever any test runs, so the first test file
# executed is always identified as the polluter.
setup_project() {
  PROJECT="$TEST_ROOT/project"
  rm -rf "$PROJECT"
  mkdir -p "$PROJECT/src/feature" "$PROJECT/bin"
  echo "test('top')" > "$PROJECT/src/top.test.ts"
  echo "test('nested')" > "$PROJECT/src/feature/nested.test.ts"
  cat > "$PROJECT/bin/npm" <<'EOF'
#!/usr/bin/env bash
touch pollution.marker
EOF
  chmod +x "$PROJECT/bin/npm"
}

# run_polluter <pattern> — runs the script in the toy project with the stub
# npm first on PATH; captures combined output, never aborts on exit code.
run_polluter() {
  local pattern="$1"
  rm -f "$PROJECT/pollution.marker"
  (
    cd "$PROJECT"
    PATH="$PROJECT/bin:$PATH" "$SCRIPT_UNDER_TEST" 'pollution.marker' "$pattern" 2>&1
  ) || true
}

echo "Test: documented pattern finds nested test files (issue #2008)"
setup_project
OUTPUT="$(run_polluter 'src/**/*.test.ts')"
assert_contains "$OUTPUT" "FOUND POLLUTER" "documented pattern runs tests and detects pollution"

echo "Test: documented pattern also finds top-level test files"
setup_project
OUTPUT="$(run_polluter 'src/**/*.test.ts')"
assert_contains "$OUTPUT" "Found 2 test files" "src/**/*.test.ts matches src/top.test.ts and src/feature/nested.test.ts"

echo "Test: ./-prefixed pattern matches the same files"
setup_project
OUTPUT="$(run_polluter './src/**/*.test.ts')"
assert_contains "$OUTPUT" "Found 2 test files" "leading ./ on the pattern is accepted"

echo "Test: non-matching pattern reports an honest zero"
setup_project
OUTPUT="$(run_polluter 'nomatch/**/*.test.ts')"
assert_contains "$OUTPUT" "Found 0 test files" "empty result counts as 0, not 1"
assert_contains "$OUTPUT" "INCOMPLETE" "empty result is not certified clean"

# Custom runner appends the candidate path as a single argument and retains failures.
setup_project
printf 'test' > "$PROJECT/src/file with spaces.test.ts"
cat > "$PROJECT/bin/custom" <<'RUNNER'
#!/usr/bin/env bash
printf 'raw diagnostic for %s\n' "$1"
[ -f "$1" ] || exit 9
exit 7
RUNNER
chmod +x "$PROJECT/bin/custom"
set +e
OUTPUT="$(cd "$PROJECT" && "$SCRIPT_UNDER_TEST" pollution.marker 'src/*spaces*' -- "$PROJECT/bin/custom" 2>&1)"
RC=$?
set -e
[ "$RC" -eq 7 ] && pass 'custom failure exit preserved' || fail 'custom failure exit preserved'
assert_contains "$OUTPUT" 'INCOMPLETE' 'failed runner is not a clean result'
assert_contains "$OUTPUT" 'raw diagnostic' 'raw output remains recoverable and visible'

logs="$(printf '%s\n' "$OUTPUT" | sed -n 's/^Raw logs: //p')"
[ -f "$logs/1.log" ] && grep -Fq 'raw diagnostic' "$logs/1.log" && pass 'raw log retained' || fail 'raw log retained'
[ "$(cat "$logs/1.exit")" = 7 ] && pass 'raw exit retained' || fail 'raw exit retained'
set +e
OUTPUT="$(cd "$PROJECT" && "$SCRIPT_UNDER_TEST" pollution.marker 'no-matches' 2>&1)"
RC=$?
set -e
[ "$RC" -eq 3 ] && pass 'no matches exits incomplete' || fail 'no matches exits incomplete'

touch "$PROJECT/pollution.marker"
set +e
OUTPUT="$(cd "$PROJECT" && "$SCRIPT_UNDER_TEST" pollution.marker 'src/*.test.ts' 2>&1)"
RC=$?
set -e
[ "$RC" -ne 0 ] && pass 'preexisting pollution rejects investigation' || fail 'preexisting pollution rejects investigation'
assert_contains "$OUTPUT" 'INCOMPLETE' 'preexisting pollution has explicit status'

rm "$PROJECT/pollution.marker"
cat > "$PROJECT/bin/clean" <<'RUNNER'
#!/usr/bin/env bash
[ -f "$1" ]
RUNNER
chmod +x "$PROJECT/bin/clean"
OUTPUT="$(cd "$PROJECT" && "$SCRIPT_UNDER_TEST" pollution.marker 'src/*spaces*' -- "$PROJECT/bin/clean" 2>&1)"
assert_contains "$OUTPUT" 'No polluter found' 'clean custom runner completes'

# A partial discovery must not establish a clean result.
cat > "$PROJECT/bin/find" <<'DISCOVERY'
#!/usr/bin/env bash
printf './src/top.test.ts\0'
echo 'fixture traversal failure' >&2
exit 1
DISCOVERY
chmod +x "$PROJECT/bin/find"
set +e
OUTPUT="$(cd "$PROJECT" && PATH="$PROJECT/bin:$PATH" "$SCRIPT_UNDER_TEST" pollution.marker 'src/*.test.ts' -- "$PROJECT/bin/clean" 2>&1)"
RC=$?
set -e
[ "$RC" -eq 2 ] && pass 'partial discovery exits incomplete' || fail 'partial discovery exits incomplete'
assert_contains "$OUTPUT" 'candidate discovery failed' 'discovery error prevents clean claim'

echo ""
if [ "$FAILURES" -gt 0 ]; then
  echo "$FAILURES test(s) failed"
  exit 1
fi
echo "All tests passed"
