# Final Review and Finish

Part of superpowers:subagent-driven-development. Every task in the plan is
complete.

The final whole-branch review gets a package too: run
`bash scripts/review-package PLAN_FILE MERGE_BASE HEAD` (MERGE_BASE = the commit the
branch started from, e.g. `git merge-base main HEAD`) and include the
printed path in the final review dispatch, so the final reviewer reads
one file instead of re-deriving the branch diff with git commands. Dispatch
under the host/user-authorized model policy (see SKILL.md), using
superpowers:requesting-code-review's
[code-reviewer.md](../../requesting-code-review/code-reviewer.md). Point it at
the ledger's deferred-minor and parked lines so it can triage which must be
fixed before merge.

Validate findings against current scope and project contracts. Bundle related
supported fixes for an authorized implementer instead of spawning one agent per
finding. Run the required affected checks and review the changed range with
`bash scripts/review-package PLAN_FILE FIX_BASE HEAD` and
[re-review-prompt.md](../re-review-prompt.md). Re-review when changed code or
unresolved risk warrants it; a fixed round count is not correctness evidence.
Record dispositions and unrun criteria. Required unresolved defects or evidence
keep the relevant task incomplete; continue independent authorized work.

### Finish

Before you delete anything, collect every ledger line containing `Ruling:` —
preflight rulings, parked findings, breaker adjudications, all of them — into
your final message under "Rulings I made", in the order you made them, each
with what it costs if wrong. The list is exhaustive: if the ledger holds a
ruling, the list holds it. That list is the only place the decisions you
took on your human partner's behalf reach them — they read it and rework
whatever you got wrong. A ruling that dies with the workspace was a decision
made in secret.

Preserve required raw evidence and unique reports. Clean only owned disposable
artifacts after their required contents are retained and cleanup is authorized;
Git history does not preserve ignored logs. Leave other plans' workspaces alone.

Use superpowers:finishing-a-development-branch.
