# Install the reviewed Codex fork

This guide targets `JoshMcCDev/superpowers`, not `obra/superpowers`.
Use the reachable source revision and archive digest recorded in the current
[hardening validation record](bevy-adaptation/hardening.md). Pin the full commit;
do not select a floating branch for a compatibility claim.

```bash
git clone https://github.com/JoshMcCDev/superpowers.git superpowers-bevy
cd superpowers-bevy
git checkout --detach <reviewed-full-source-commit>
bash scripts/package-codex-plugin.sh --ref HEAD --output /tmp/superpowers-bevy.zip
```

The existing builder requires Git, Bash, jq, tar/gzip, shasum, and zip/unzip for
ZIP output. Check availability first; this command does not install prerequisites.
All skill UI metadata is tracked with the skill in this source revision. An
explicit `--metadata-source` override remains supported, but is a different input
whose identity must also be recorded. No unpublished local source ref is needed.

Verify the SHA256 against the record and inspect extracted files before enabling
it. A successful archive build is not proof that the host loaded the plugin.
For an authorized installation using the exercised local-marketplace interface:

```bash
mkdir -p /tmp/superpowers-bevy-market/plugin /tmp/superpowers-bevy-market/.agents/plugins
unzip /tmp/superpowers-bevy.zip -d /tmp/superpowers-bevy-market/plugin
```

Create `/tmp/superpowers-bevy-market/.agents/plugins/marketplace.json`:

```json
{"name":"bevy-reviewed","interface":{"displayName":"Reviewed Bevy fork"},"plugins":[{"name":"superpowers","source":{"source":"local","path":"./plugin"},"policy":{"installation":"AVAILABLE","authentication":"ON_INSTALL"},"category":"Development"}]}
```

```bash
codex plugin marketplace add /tmp/superpowers-bevy-market --json
codex plugin add superpowers@bevy-reviewed --json
```

Use an isolated disposable CODEX_HOME for compatibility testing, with the user's
existing authorized authentication path; do not copy credentials into retained
artifacts. A normal installation is a separate authorized action. Persist a
reviewed marketplace outside `/tmp` if it must survive machine cleanup.

In a fresh session, inspect the loaded skill path and `.codex-plugin/plugin.json`
version, then exercise a relevant ordinary task. Configured, discovered, and
successfully exercised are different states. Check supporting relative references
and execute required helpers from the extracted package. If scripts lose their
executable bits, invoke them with Bash; nested helpers must do the same.

To disable this installation, use the current host's removal interface (exercised
as `codex plugin remove superpowers@bevy-reviewed --json` for the isolated test).
Bevy's project rules and fallback remain applicable with the plugin absent.
Never remove local guidance until its replacement/fallback have been exercised.
