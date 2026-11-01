#!/usr/bin/env bash
# Exercise the pinned Git source, clean-clone packaging, and extracted helpers.
set -euo pipefail
root=$(cd "$(dirname "$0")/../.." && pwd)
ref=${1:-HEAD}
source_sha=$(git -C "$root" rev-parse "$ref^{commit}")
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
git clone --quiet --no-hardlinks "$root" "$tmp/source"
git -C "$tmp/source" checkout --quiet --detach "$source_sha"
[ -z "$(git -C "$tmp/source" status --porcelain)" ]
bash "$tmp/source/scripts/package-codex-plugin.sh" --ref HEAD --output "$tmp/one.zip"
bash "$tmp/source/scripts/package-codex-plugin.sh" --ref HEAD --output "$tmp/two.zip"
cmp "$tmp/one.zip" "$tmp/two.zip"
python3 - "$tmp/source" "$tmp/one.zip" <<'PY'
import pathlib,subprocess,sys,zipfile
source=pathlib.Path(sys.argv[1])
with zipfile.ZipFile(sys.argv[2]) as z:
    count=0
    for n in z.namelist():
        if n.endswith('/'): continue
        expected=subprocess.check_output(['git','show','HEAD:'+n],cwd=source)
        assert z.read(n)==expected,n
        count+=1
print(f'PASS: all {count} archive files match the pinned Git source, metadata included')
PY
unzip -q "$tmp/one.zip" -d "$tmp/extracted"
bash "$root/tests/claude-code/test-task-helper-reliability.sh" "$tmp/extracted"
bash "$root/tests/claude-code/test-sdd-workspace.sh" "$tmp/extracted"
bash "$root/tests/systematic-debugging/test-find-polluter.sh" "$tmp/extracted/skills/systematic-debugging/find-polluter.sh"
# A source with missing metadata must fail; no implicit machine-local fallback.
metadata=$(find "$tmp/source/skills" -path '*/agents/openai.yaml' -print -quit)
rm "$metadata"
git -C "$tmp/source" add -u
git -C "$tmp/source" -c user.name=test -c user.email=test@example.com -c commit.gpgsign=false commit -qm 'fixture: missing metadata'
if bash "$tmp/source/scripts/package-codex-plugin.sh" --ref HEAD --output "$tmp/incomplete.zip" > "$tmp/missing.log" 2>&1; then
  echo 'FAIL: missing source metadata packaged successfully' >&2
  exit 1
fi
grep -q 'metadata source is incomplete' "$tmp/missing.log"
printf 'PASS: clean-clone reproducibility, extracted helpers, missing-metadata rejection\n'
