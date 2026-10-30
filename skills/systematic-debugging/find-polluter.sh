#!/usr/bin/env bash
# Find which candidate test creates unwanted filesystem state.
# Usage: bash find-polluter.sh MARKER PATTERN [-- COMMAND ARG...]
# Default runner: npm test. A custom runner receives the test path as its last
# argument, e.g. -- python3 -m pytest. Use an adapter for Cargo test-name mapping.
# Exit 0: all matched tests clean; 1: pollution found; 2: invalid/preexisting state;
# 3: no matched tests; otherwise the failing runner's exact exit. Status text
# distinguishes a runner exit of 1/2/3 from these diagnostic outcomes.
# Logs persist in the printed temporary directory; this tool never deletes them.
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo 'Usage: find-polluter.sh MARKER PATTERN [-- COMMAND ARG...]' >&2
  exit 2
fi
marker=$1
pattern=${2#./}
shift 2
runner=(npm test)
if [ "$#" -gt 0 ]; then
  if [ "$1" != '--' ] || [ "$#" -lt 2 ]; then
    echo 'INCOMPLETE: expected -- COMMAND ARG...' >&2
    exit 2
  fi
  shift
  runner=("$@")
fi
if [ -e "$marker" ] || [ -L "$marker" ]; then
  echo "INCOMPLETE: pollution already exists: $marker" >&2
  exit 2
fi
logs=$(mktemp -d "${TMPDIR:-/tmp}/superpowers-polluter.XXXXXX")
echo "Raw logs: $logs"
if ! find . -type f \( -path "./$pattern" -o -path "./${pattern//\*\*\//}" \) -print0 2> "$logs/discovery.log" | sort -zu > "$logs/candidates.paths"; then
  echo "INCOMPLETE: candidate discovery failed; see $logs/discovery.log" >&2
  exit 2
fi
tests=()
while IFS= read -r -d '' file; do
  tests+=("$file")
done < "$logs/candidates.paths"
echo "Found ${#tests[@]} test files"
if [ "${#tests[@]}" -eq 0 ]; then
  echo 'INCOMPLETE: no tests matched; no clean result established' >&2
  exit 3
fi
count=0
for file in "${tests[@]}"; do
  count=$((count + 1))
  log="$logs/$count.log"
  echo "[$count/${#tests[@]}] Testing: $file"
  printf '%s\n' "$file" > "$logs/$count.path"
  rc=0
  "${runner[@]}" "$file" > "$log" 2>&1 || rc=$?
  printf '%s\n' "$rc" > "$logs/$count.exit"
  tail -n 5 "$log"
  echo "Exit: $rc; full output: $log"
  if [ -e "$marker" ] || [ -L "$marker" ]; then
    echo "FOUND POLLUTER: $file (runner exit $rc)"
    exit 1
  fi
  if [ "$rc" -ne 0 ]; then
    echo "INCOMPLETE: runner failed for $file; clean result not established" >&2
    exit "$rc"
  fi
done
echo 'No polluter found in the successfully executed matched tests'
