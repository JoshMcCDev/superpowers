# Bevy Dev Loop adaptation of Superpowers

The shared skills and selected helpers are adapted on
`feat/bevy-dev-loop-integration` in `JoshMcCDev/superpowers`, initially based on
upstream `2ce8aa15d05bd57213e6f746f953aafb7ded7a8b`. The current source/package
pin, clean-clone checks, and migration scope are in the
[hardening record](hardening.md); the original [validation record](validation.md)
and `evidence/` describe the initial adaptation and remain historical.

The maintained plan and file comparison are in Bevy Dev Loop's
`debugging-skill-guidance` worktree under `docs/research/`. This is an adaptation
of the existing skills, not a second router plugin. The earlier router experiment
was removed and the upstream marketplace restored. MIT licensing and upstream
attribution remain intact.

## Implemented file map

| Existing skill | Adaptation and proof boundary |
| --- | --- |
| test-driven-development | Preserve deterministic RED/GREEN and test quality; support characterization, docs/config checks, and the owning ECS/App/process/BRP/runtime layer. Preserve valid preexisting code; no manufactured failure or universal full suite. |
| verification-before-completion | Fresh evidence is claim-specific. Model judgments are advisory; retain NOT_RUN, UNKNOWN, and UNPROVEN. Diagnostic timing cannot prove ordinary deadline behavior. |
| systematic-debugging | Preserve reproduction, hypotheses, and root-cause tracing. Equivalent failures trigger bounded research; structural claims need evidence. Conditional native/Python debugger, syscall trace, and replay guidance; original logs retained. Two focused references hold boundary tracing and research detail. |
| using-superpowers | Load relevant skills on demand; honor explicit invocation, current task/project authority, and host discovery. |
| brainstorming | Preserve exploration, alternatives, and optional visual companion; ask about consequential uncertainty rather than adding approval gates to clear authorized work. |
| writing-plans | Preserve concrete tasks, interfaces, and review focus; include current scope, owner, proof, and missing evidence without imposing orchestration. |
| executing-plans | Preserve inline execution, briefs, BASE, recoverable records, and review; use existing project evidence owners, affected checks, and authorized cleanup. |
| subagent-driven-development | Preserve independent task/review workflow when authorized. Host/user rules own models and delegation. Reports, spending caps, parked findings, and ledgers cannot establish completion. Updated prompts and directly affected references. |
| dispatching-parallel-agents | Preserve independent parallel work; require delegation authority and account for shared files/worktrees. |
| requesting-code-review | Retain scoped BASE/HEAD review and evidence; support authorized independent or disclosed author self-review. |
| receiving-code-review | Validate findings technically against current scope; external posting and unrelated cleanup are not implied. |
| using-git-worktrees | Reuse existing Orca/native isolation and ownership; no automatic installs/builds/setup commits. |
| finishing-a-development-branch | Use affected proof and authorized closeout; preserve unique uncommitted files and recorded host cleanup ownership. |
| writing-skills | Single owner and progressive disclosure; distinguish behavior probes from link checks, verify actual package/host fit, separate publication authority. |
| diagnosing-superpowers | Preserve source-linked, read-only investigation and redaction. Relevant analysts and exports follow host/user authority, with inline analysis available. |

Project-specific contracts remain external: Bevy accepted docs and current code,
Gauntlet evaluation/capture/source custody, runtime proof, Jev, language guidance,
Serena, PR policy, and benchmark ownership. General skills do not grant project
mutation authority or create another qualification system.

## Helper decisions

- **Changed `find-polluter.sh`:** retains the two-argument npm invocation and adds
  `-- COMMAND ARG...`, appending each candidate path as one argument. Raw per-case
  logs, paths, and exits persist. No matches, existing pollution, failed/partial
  discovery, failed runners, detected pollution, and clean execution are distinct.
  Runner exits propagate exactly when no pollution is detected; status text
  distinguishes overlapping numeric codes. Tests cover legacy patterns, spaces,
  retained logs/exits, failure, clean execution, and partial discovery.
- **Changed `task-done`:** invokes `sdd-workspace` through Bash so packaging that
  drops executable bits does not break it. A successful helper command still
  requires the task's full acceptance evidence before claiming completion.
- **Kept `task-start`, `task-brief`, `review-package`, `sdd-workspace`:** existing
  task identity, ancestry/range rejection, output retention, and owned workspace
  behavior suffice; existing focused tests exercise them.
- **Kept packaging implementation:** corrected its test to compare the version
  with the packaged Git ref, rather than the dirty working-tree manifest.
- **Kept visual companion and graph renderer:** no demonstrated integration
  defect; no new debugger wrappers, verdict store, or general evaluation runner.

## Evaluation reuse and evidence

Use the maintained [Quorum eval lab](https://github.com/prime-radiant-inc/superpowers-evals/tree/e64684cd1fa270c464ac797747e45bbe8d127e8b)
for complete live skill scenarios. Source inspection confirmed Codex CLI support,
plugin staging, scenario inputs, baseline/candidate arms, and deterministic
post-checks. The full live harness requires a QA-driver credential and its
recommended isolated container setup; Docker was absent here. Full Quorum
pressure evaluation is **NOT_RUN**. Its source was inspected in a temporary clone;
no second permanent runner was added to this fork.

Keep Bevy's existing matched-experiment path as the owner for project economics,
accounting, identity, and qualification. The development observations retained
here are not a replacement for that path or calibrated semantic evaluation.

[NVIDIA NeMo Evaluator](https://github.com/NVIDIA-NeMo/Evaluator/tree/ea35ba36756abd59de201f60af8a2feba014744d)
was inspected as an optional integration/analysis candidate. Its solver and
comparison surfaces do not demonstrate Codex skill discovery in this environment.
The evaluator runtime's local installation remains **UNCONFIRMED**; a temporary
NVIDIA skills-plugin source is not an installed runtime. Defer integration until
there is a named capability gap in Quorum or the project experiment owner. No
NVIDIA dependency, adapter, or installation is justified by this task.

See [validation and behavior report](validation.md) for observed results,
limitations, package identity, and retained transcripts. Raw evidence is under
[evidence/](evidence/); [manifest.json](evidence/manifest.json) records file sizes
and SHA256 values. Temporary development commands are retained for provenance,
not introduced as a maintained evaluation framework.

## Bevy skill retention decision

Keep the Bevy-local skills for now. The adapted generic TDD/debugging/verification
skills reduce contradictory guidance, but normal plugin availability and a
replacement fallback have not been established. Project-local duplicate names
were exercised in an isolated session; their project proof rules remained
applicable. That observation does not prove every host's collision behavior.

Keep `search-first`, `issue-to-pr`, `github-pr-workflow`, gameplay, Rust/Python,
crate/structure/documentation health, Gauntlet/eval/benchmark/Jev, and Serena
owners. Superpowers has no demonstrated replacement for their project contracts.
A later migration may shorten overlapping generic prose while retaining routing;
no skill deletion or global activation is part of this implementation.
