---
name: using-superpowers
description: Use when selecting relevant Superpowers skills for a task or resolving how their workflows interact with current project and host instructions.
---

# Using Superpowers

For a bounded subagent assignment, follow the supplied task and relevant skills;
do not restart the parent conversation's discovery process.

## Select the smallest useful skill

Read explicitly requested skills. Otherwise select a skill when its trigger fits
and its guidance can change the next decision. Use the current version already
loaded in the session; do not reread unchanged content or preload every skill and
reference. Ordinary source inspection can establish which owner or skill applies.

- Unexplained failure: systematic debugging, then the relevant domain guidance.
- Unclear consequential design: brainstorming before settling the implementation.
- Clear multi-step implementation: writing plans when a plan will help execution.
- Completion claim: verification-before-completion and the project's proof policy.

Announce applicable skill use briefly. Treat checklists as scoped working aids,
not permission to expand the task or create unrelated artifacts.

## Instruction and authority boundaries

The active task, applicable user/project instructions, and host permissions govern
scope and authority. Skills supply reusable mechanics. Use project-specific proof,
validation, placement, and worktree owners where they apply; do not replace them
with a generic workflow or reinterpret missing evidence as success. A loaded skill
does not authorize delegation, model changes, installation, commits, or publication.

## Platform Adaptation

If your harness appears here, read its reference file for special instructions:

- Claude Code: `references/claude-code-tools.md`
- Codex: `references/codex-tools.md`
- Pi: `references/pi-tools.md`
- Antigravity: `references/antigravity-tools.md`
- Hermes Agent: `references/hermes-tools.md`
- Muse: `references/muse-tools.md`
