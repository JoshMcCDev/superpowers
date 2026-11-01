# Hardening and migration record — 2026-10-31

This is the current record for Superpowers PR #1. The initial
[adaptation report](validation.md) and `evidence/` are historical; their local
source snapshot and package are not the current reproducibility claim.

## Reachable source and reproducible package

| Input/artifact | Identity |
| --- | --- |
| Source | `JoshMcCDev/superpowers` commit `2116b3d1575b7f0f682fcf03e5f8ee72276044f1` |
| Remote reachability | Pushed on `feat/bevy-dev-loop-integration`, PR #1 |
| Package | `7.0.1-bevy.3` |
| ZIP bytes | 267819 |
| ZIP SHA256 | `0bad3b3c6ebda2bb0b0e4478eb594fd2276c89d760d165ca2881434764abf361` |
| UI metadata | Tracked with all 15 skills at the same source revision; no external override |

A fresh GitHub clone built this archive with the documented command, without a
machine-local metadata seed or unpublished source ref. Two builds from a local clean clone
matched byte-for-byte, and the fresh GitHub clone produced the same digest. All 109 shipped files matched the
pinned Git source, metadata included. The existing package layout deliberately
excludes source-only docs/tests. The fork install link in the shipped README
points to its online source guide. See [installation](../codex-fork-install.md).

`tests/codex/test-self-contained-package.sh` covers clean-clone repeatability,
exact file identity, extracted start/done and workspace/review helpers, pollution
fixtures, and missing-metadata rejection. Public helper entrypoints are invoked
through Bash when packagers strip executable bits; nested invocations also use
Bash. A Python ZIP extraction exposed a bare-entrypoint assumption in the old
workspace test; its invocation was corrected rather than hiding the failure.

## Workflow and helper hardening

- Codex/tool references and review templates follow inherited model/effort and
  actual host schemas. No suggested host configuration mutation or forced tier.
- Review uses recorded BASE..HEAD or confirmed whole-branch base. Counterexamples
  mentioning HEAD~1 remain explicitly prohibited; fixture ranges are known inputs.
- Retry caps and parked real acceptance findings leave dependent work incomplete.
  Focused proof establishes its covered claim, not every criterion. The old
  contradictory verification-table phrase was corrected in the final package.
- Meaningful ownership invariants replace validation at every layer. Fixtures
  preserve relevant behavior without copying external subsystems; readiness uses
  authoritative state and bounded waits rather than guessed sleeps.
- Conditional [tool discovery](../../skills/using-superpowers/references/tool-discovery-and-evidence.md)
  separates configured, connected, authorized, and exercised. Existing project
  safety, worker/build, capture, and evidence owners remain authoritative.
- task-start survives stripped nested executable bits. task-done retains distinct
  attempts and exact exits, including handled interruption; successful checks are
  advisory. SIGKILL can prevent a receipt, which stays missing, never acceptance.
- Pollution discovery includes symlinked file candidates. Non-file/dangling matched
  symlinks are INCOMPLETE. Fixtures cover an ordinary clean test plus a symlinked
  polluter, npm compatibility, failed runners, spaces, preexisting pollution,
  partial discovery, and retained originals.

The new helper fixture failed with exit 126 before repair; the symlink regression
failed before discovery was corrected. Both passed afterward. Eight focused shell
suites, all 15 skill frontmatters, affected shell syntax and source whitespace
checks passed. Extracted helper/workspace/review fixtures and the self-contained
package test passed. Original raw model answers retain Markdown whitespace.
ShellCheck/Graphviz/full cross-host certification are not inferred from these checks.

## Bounded behavior and migration gates

Baseline source: Bevy `84823be3930df85dc5a343fec91d9c2c01573464`, fork
`e0e0f4939234bf374cbee0a74972ec4db7dee1f5`. The
[adaptation map](adaptation-map.md) distinguishes transferred principles from
retained project owners. Bevy guidance is repaired separately in
[PR #394](https://github.com/JoshMcCDev/bevy-dev-loop/pull/394).

Thirteen ordinary prompts were run across current project guidance, corrected
plugin plus full guidance, plugin-unavailable fallback, and proposed thin overlays.
A discovered routing gap in the first thin candidate was corrected and retested:
the bug initially used its local overlay without loading the plugin procedure.
The revised candidate explicitly routed to the discovered procedural owner.
Final `7.0.1-bevy.3` was then exercised on the committed migrated tree. Observed
selection varies appropriately (for example generic debugging/verification versus
TDD for a small repair); this is not an assertion that every task loads every skill.

Inspected actions include actual Python RED/GREEN and GREEN/refactor/GREEN,
complete two-commit review, historical reproduction, retained noisy diagnostics,
provider-unavailable fallback, missing runtime proof, exhausted acceptance budget,
untrusted advice, duplicate namespaces, plugin absence, and a no-tool trivial task.
Tool catalogs were visible for Rust docs, but an actual published retrieval was
rejected by host approval policy; successful retrieval remains UNPROVEN and deep
worker execution was not attempted. No policy was relaxed to make that probe pass.

Gate A is supported for these scoped workflow consistency observations; Gate B is
supported by reachable-source, clean-clone and extracted-package tests. These are
bounded compatibility results, not full adversarial-pressure resistance or a
performance benchmark. Full Quorum pressure evaluation remains NOT_RUN because
its QA-driver credential is unavailable. Native/runtime qualification is not
established by development fixtures. Wider host behavior is unverified.

Host: Codex CLI `0.165.0`, fresh ephemeral sessions, isolated homes and actual
project registrations. Serving model/effort and per-file loaded-token accounting
were not independently exposed; they remain UNKNOWN. A proposed isolated config
write was rejected by automatic review, and no protected config edit was retried
or bypassed. The unrelated normal-home plugin profile was excluded consistently
from controlled arms. Raw usage fields, failures, timings, prompts and source
hashes are retained; no monetary or causal savings claim follows.

The [Bevy migration PR #395](https://github.com/JoshMcCDev/bevy-dev-loop/pull/395)
evidence record owns the final scenario matrix, footprint
measurements, rollback observations and Gate E/F scope. No normal Codex plugin
activation or production authority change is part of this work; reviewed installs
remain an explicit host operation, with tested project fallback when absent.
