#!/usr/bin/env bash
set -euo pipefail
root=${1:-$(cd "$(dirname "$0")/../.." && pwd)}
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
# Copy only the real helpers whose nested invocation is under test.
mkdir -p "$tmp/pkg/skills/executing-plans/scripts" "$tmp/pkg/skills/subagent-driven-development/scripts"
cp "$root/skills/executing-plans/scripts/"{task-start,task-done} "$tmp/pkg/skills/executing-plans/scripts/"
cp "$root/skills/subagent-driven-development/scripts/"{sdd-workspace,task-brief} "$tmp/pkg/skills/subagent-driven-development/scripts/"
find "$tmp/pkg" -type f -exec chmod -x {} +
git init -q -b main "$tmp/repo"
cd "$tmp/repo"
printf '# Plan\n\n## Task 1: Verify\n\nRun the focused check.\n' > plan.md
git add plan.md
git -c user.name=test -c user.email=test@example.com -c commit.gpgsign=false commit -qm fixture
helpers="$tmp/pkg/skills/executing-plans/scripts"
start=$(bash "$helpers/task-start" plan.md 1)
base=$(printf '%s\n' "$start" | sed -n 's/^base: //p')
[ "$base" = "$(git rev-parse HEAD)" ]
brief=$(printf '%s\n' "$start" | sed -n 's/^brief: //p')
[ -s "$brief" ]
workspace=$(dirname "$brief")
rc=0
bash "$helpers/task-done" plan.md 1 "$base" -- sh -c 'echo first-failure; exit 7' > "$tmp/failure" 2>&1 || rc=$?
[ "$rc" = 7 ]
! grep -q 'Task 1: complete' "$workspace/progress.md" 2>/dev/null
rc=0
bash "$helpers/task-done" plan.md 1 "$base" -- sh -c 'echo interrupted; kill -TERM "$PPID"' > "$tmp/interrupted" 2>&1 || rc=$?
[ "$rc" = 143 ]
! grep -q 'Task 1: complete' "$workspace/progress.md" 2>/dev/null
bash "$helpers/task-done" plan.md 1 "$base" -- sh -c 'echo final-success' > "$tmp/success"
# Even a successful helper reports only checks; it cannot decide acceptance.
grep -q 'Task 1: checks passed' "$workspace/progress.md"
! grep -q 'Task 1: complete' "$workspace/progress.md"
grep -Rq first-failure "$workspace"
grep -Rq interrupted "$workspace"
grep -Rq final-success "$workspace"
[ "$(find "$workspace" -path '*/exit' -type f | wc -l)" -eq 3 ]
printf 'PASS: stripped-bit start/done, exact failure, interrupted retry, retained attempts, advisory success\n'
