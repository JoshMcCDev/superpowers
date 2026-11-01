# Plugin hardening and migration status

The six-stage 2026-10-31 plan supersedes claims of migration readiness from the
initial adaptation. PR #1 owns workflow and package hardening; a separate Bevy
guidance PR owns current project repairs. No Bevy skill has been removed.

Baseline product revision: `e0e0f4939234bf374cbee0a74972ec4db7dee1f5`.
Baseline Bevy revision: `84823be3930df85dc5a343fec91d9c2c01573464`.
The initial source/package observations remain immutable historical evidence in
`evidence/`; their local snapshot/package does not establish reproducibility of
the hardened plugin. New results are recorded separately.

Implemented pending final package/host validation:

- Remove forced Codex model routing, stale review-range examples, automatic setup
  commits, and retry-cap completion; project authority remains binding.
- Conditional tool discovery distinguishes configured, connected, authorized,
  and exercised capabilities. No tool manager or automatic installation.
- Validate distinct ownership invariants and bounded real-behavior fixtures;
  use operation readiness and bounded waits.
- Tracked skill UI metadata defaults to the same Git source revision; explicit
  prior-package metadata remains an identified override, not a prerequisite.
- Stripped-bit nested task-start invocation repaired; task-done retains attempts,
  exact exits, and advisory check status. Missing/interrupted evidence cannot
  establish acceptance. SIGKILL may prevent an exit receipt; that stays unknown.
- Symlinked candidate files are included in pollution discovery; non-file or
  dangling candidate symlinks yield INCOMPLETE.

Gate A (workflow consistency): pending final behavioral review.
Gate B (package integrity): pending clean remote clone/rebuild and extracted
helper/host verification. Gates C–F remain pending. No full-pressure, performance,
source-sandbox, or runtime qualification claim follows from these edits.

Follow [fork installation](../codex-fork-install.md) only for a pinned, reviewed
source/package. No normal Codex installation or host configuration change has
been performed. A protected-config edit was refused by automatic review during
baseline preparation; it was not retried or bypassed. Host/model/effort facts
that are not exposed by actual receipts remain UNKNOWN.
