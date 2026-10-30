# Validation record — 2026-10-30

This record establishes bounded implementation and packaging observations. It
does not establish improved debugging performance, complete pressure resistance,
Bevy runtime qualification, or compatibility with every agent host.

## Behavior probes

Codex CLI `0.165.0` ran fresh ephemeral read-only sessions using the same eight
hypothetical cases in `evidence/suite-prompt.txt`. The upstream baseline skills
came from Git `2ce8aa15d05bd57213e6f746f953aafb7ded7a8b`; the final candidate
snapshot matches the shipped skill files. Both had byte-identical `AGENTS.md`
context and the same isolated CODEX_HOME, with no installed plugin during these
probes. `probe-input-identities.json` records input hashes. The CLI used its
inherited default model; the resolved model revision was not independently
pinned. These are development contract probes, not a qualified causal A/B trial.

Five baseline and five final candidate sessions completed, exit 0 each. All ten
answers were read manually, including their evidence limits and required-input
statements. They are hypothetical responses to explicit skill-reading prompts,
not automatic-discovery tests or observations of eight actual repairs.

| Case | Baseline observations | Final candidate observations |
| --- | --- | --- |
| Valid implementation and characterization | All five preserve code and explicit focused scope, often overriding contradictory skill mandates. | All five preserve code and scope directly under the adapted guidance. |
| Focused helper, paused deadline, advisory 99% | All five withhold runtime/deadline qualification. | All five retain diagnostic timing and NOT_RUN/UNPROVEN limits. |
| Three equal failed fixes | All five avoid an architecture verdict, but require or retain an architecture/failed-attempt discussion checkpoint before another fix. | All five move to bounded research and a new falsifiable hypothesis; input is conditional on an actual evidence/authority/scope gap. |
| Clear documentation correction in Orca | All five proceed without new design/worktree/setup rituals. | All five proceed with relevant deterministic validation. |
| Authorized inline three-task plan | All five avoid unauthorized agents/models and disclose author self-review. | All five preserve task gates, raw evidence, and separate self-review without unauthorized agents/models. |
| Unrelated review cleanup and unsupported DONE | All five preserve scope and reject fabricated/missing proof. | All five preserve scope and require actual acceptance evidence. |
| Review-only closeout and uncommitted notes | All five preserve workspace/notes and exact ranges. | All five preserve ownership/notes and exact ranges. |
| Link repair | All five choose proportionate checks and avoid implicit publication/evaluators. | All five choose deterministic link/routing/package checks with explicit behavioral limits. |

Most baseline cases already respect explicit user/host constraints. The result
supports resolving instruction conflicts and preserving desired behavior; it is
not evidence of a broad performance improvement. Selection was manual and
uncalibrated. No semantic judge score, significance test, or pass-rate benchmark
is claimed. Complete Quorum interaction/pressure scenarios remain NOT_RUN.

Earlier `baseline-suite`/`candidate-suite` observations had unequal repository
context and are retained as exploratory only. `matched-candidate` predates final
reference/flowchart coherence corrections; `final-candidate` is the relevant
final source observation. No earlier run is silently presented as final evidence.

Receipts retain elapsed seconds and exact exits; JSONL records retain host usage
fields. `probe-accounting.json` extracts those fields without converting them to
money, throughput, or causal savings. Provider billing and resolved model identity
remain UNKNOWN. Two concurrent sessions were used only as independent bounded
CLI probes, not delegated repository workers.

## Deterministic validation

The following owning checks passed with exit 0; raw output and exact command
arguments are retained in `evidence/deterministic-receipts.json` and its logs:

- `bash tests/systematic-debugging/test-find-polluter.sh`
- `bash tests/claude-code/test-executing-plans-scripts.sh`
- `bash tests/claude-code/test-sdd-workspace.sh`
- `bash tests/codex/test-package-codex-plugin.sh`
- `bash tests/codex/test-marketplace-manifest.sh`
- `bash tests/claude-code/test-worktree-path-policy.sh`
- `bash tests/diagnosing-superpowers/test-skill-structure.sh`
- `bash scripts/lint-shell.sh` on the six affected shell files, using a temporary
  local ShellCheck 0.9.0 binary. No system package installation was required.

All 15 skill frontmatters passed the host skill-creator validator. Changed Markdown
relative targets resolve. Affected shell files pass `bash -n`; source diff whitespace checks are clean.
Retained raw model answers include Markdown hard-break spaces and are preserved
verbatim; staged whitespace checking excludes that raw-evidence directory. The package comparison verifies all 93 shipped nonmetadata files
against current source bytes, and metadata provenance/hashes are retained.

The polluter regression was exercised against the original implementation before
the repair and failed. The existing package and worktree-policy checks also
exposed assumptions that needed updating. Final tests preserve the npm use case,
custom runner exits/logs/spaces, honest incomplete outcomes, and the stripped
executable-bit task helper regression. These fixture tests do not run Cargo or
establish Gauntlet evidence.

A broader shell-validation attempt discovered Graphviz `dot` is absent; graph
rendering is NOT_RUN. Only existing diagrams' wording/labels changed. The
Claude-specific live native-worktree test could not start because `claude` was
absent (exit 127); it is NOT_RUN, not passing. No claim of Claude/Gemini/OpenCode
host certification or full upstream-suite success follows from Codex checks.

## Final package identity

- Version: `7.0.1-bevy.1`, all 15 skills, existing helper/reference files.
- Source snapshot: `91394b2d14f23353b8417f64b6bdf1f692b6fd56`.
- Retained local ref: `refs/bevy-adaptation/package-source` (the implementation
  branch itself remains uncommitted).
- Artifact: `/home/josh/Downloads/superpowers-7.0.1-bevy.1.zip`.
- Byte size: **266586**.
- SHA256: `8e017c68169dbd11a1eaf4e0126d1fbf01fa71df3f2015b89effc17ed4b4831e`.

The existing packaging script archives the identified Git ref, not the dirty
working tree. Source-only tests/docs/manifests are intentionally excluded by its
existing layout. Fourteen `agents/openai.yaml` files came unchanged from the local
prior official plugin source; `diagnosing-superpowers` was missing there, so its
small display-name/description metadata was authored and reviewed locally.
`evidence/metadata-provenance.json` distinguishes these origins. A reproducible
metadata directory is retained as `evidence/packaging-metadata/`.

To rebuild the product inputs from the retained source ref:

```bash
bash scripts/package-codex-plugin.sh \
  --ref refs/bevy-adaptation/package-source --allow-dirty \
  --metadata-source docs/bevy-adaptation/evidence/packaging-metadata \
  --output /tmp/superpowers-bevy-rebuilt.zip
```

Archive compression timestamps may differ; compare extracted file bytes and
record the new archive identity rather than assuming identical ZIP bytes.

## Isolated packaged-host checks

Final host results and their receipts are retained as `final-fixture.*` and
`final-bevy.*`. Installation used a separate temporary CODEX_HOME and a local
marketplace extracted from the final archive; it did not alter normal Codex
plugin settings. Earlier packaged checks are retained under `package-*` and
are explicitly superseded by the final archive checks.

The fixture contains a deliberately wrong decrement implementation and an
existing increment test. The host is asked to repair only that bug, with no skill
names in the prompt. The Bevy read-only check addresses duplicate skill names,
claim-specific proof, repeated failures, consequential design uncertainty,
permitted delegation under a hypothetical authorized host, lost logs, and
packaged relative-reference/helper availability. Exact observations follow in
`host-observations.md`; neither probe grants runtime qualification or ordinary
installation authority.
