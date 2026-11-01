The refactor is **not disqualified because characterization tests were written after valid implementation**. Preserve the implementation; do not delete it or manufacture RED merely to satisfy test order. Characterization should protect observable behavior, with relevant GREEN evidence before and after the refactor where available.

Relevant discovered skill paths:

- Project TDD: [.agents/skills/test-driven-development/SKILL.md](/home/josh/orca/workspaces/bevy-dev-loop/debugging-skill-guidance/.agents/skills/test-driven-development/SKILL.md)
- Project verification: [.agents/skills/verification-before-completion/SKILL.md](/home/josh/orca/workspaces/bevy-dev-loop/debugging-skill-guidance/.agents/skills/verification-before-completion/SKILL.md)
- Conditional gameplay/runtime proof: [.agents/skills/bevy-gameplay-proof/SKILL.md](/home/josh/orca/workspaces/bevy-dev-loop/debugging-skill-guidance/.agents/skills/bevy-gameplay-proof/SKILL.md)
- Discovered Superpowers counterparts under `/tmp/superpowers-adaptation-evidence/home/plugins/cache/bevy-adaptation-test/superpowers/7.0.1-bevy.1/skills/`: `using-superpowers/SKILL.md`, `test-driven-development/SKILL.md`, and `verification-before-completion/SKILL.md`. Their guidance defers to active task and project proof policy.

Project requirements come from [testing.md](/home/josh/orca/workspaces/bevy-dev-loop/debugging-skill-guidance/.agents/workflows/testing.md) and [validation.md](/home/josh/orca/workspaces/bevy-dev-loop/debugging-skill-guidance/.agents/workflows/validation.md):

- Match proof to the claim: unit tests for pure logic, direct `World` checks for ECS facts, persistent `App`/`Schedule` checks for stateful scheduling, and process plus real-client proof for BRP.
- Validate affected boundaries; broaden only for acceptance criteria or blast radius. Root Cargo defaults do not cover every workspace crate.
- Keep compile, deterministic, runtime, and visual evidence distinct. Focused tests cannot establish runtime qualification.
- Require fresh inspected evidence before claiming passing or completion.

**Runtime qualification: `NOT_RUN`; runtime-qualified behavior: `UNPROVEN`.** Missing runtime evidence blocks qualification when the active criteria require it; it does not automatically impose runtime qualification on every behavior-preserving refactor. Fresh-process evidence is required when startup, reload, replay, or final verification demands it.

No files were modified and no tests were run. The hypothetical supplies no test results, so characterization coverage and GREEN status remain unverified.