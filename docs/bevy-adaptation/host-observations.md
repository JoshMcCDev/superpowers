# Final packaged-host observations

Both fresh Codex CLI sessions exited 0 with the final `7.0.1-bevy.1` archive
installed in a separate temporary CODEX_HOME. Its extracted shipped files were
byte-compared to source; the normal Codex home was unchanged.

- **Automatic selection and actual repair:** the fixture prompt names no skills.
  The transcript shows reads from the package cache for using-superpowers,
  systematic-debugging, TDD, verification, and the Codex host reference. The agent
  ran the existing Python regression: RED exit 1 (`3 != 5`), changed only the
  decrement to increment, and ran GREEN exit 0 (one test). An independent
  `python3 -m unittest test_calc` rerun passed. The existing test was unchanged.
  It initially tried unavailable `python` (exit 127), then recovered with
  `python3`; a Git status query also encountered the intentionally non-Git
  fixture. Neither error is hidden or counted as a successful command.
- **Bevy duplicate names:** the read-only session read the real project's TDD,
  debugging, and verification guidance alongside the packaged counterparts.
  It preserved project proof layers, characterization, NOT_RUN and UNPROVEN,
  retained originals, and the actual task's authority.
- **Preserved exploration/delegation:** consequential retention design uncertainty
  received focused questions and comparison criteria; hypothetical authorized
  independent tasks retained delegation and inherited models. No actual agents
  were dispatched and no project tests were run in that scenario.
- **Reference/helper fit:** the session inspected the actual package manifest,
  debugging references, recovery reference, task-start, and task-done. Lost raw
  logs remained unavailable evidence, not qualification supplied by a ledger.
  Scripts were read, not executed in that session; the owning deterministic
  script tests establish their bounded behavior separately.

See `evidence/final-fixture.*`, `evidence/final-bevy.*`, and the independent
fixture log. These are two bounded packaged-host checks, not general automatic
skill-discovery certification, pressure resistance, or a debugging-performance
benchmark. The isolated plugins were removed after testing and temporary auth
symlinks unlinked; retained evidence contains no authentication file.
