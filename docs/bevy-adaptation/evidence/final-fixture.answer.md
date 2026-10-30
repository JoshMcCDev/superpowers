Changed [calc.py](/tmp/superpowers-adaptation-evidence/final-fixture/calc.py:2) from `value - 1` to `value + 1`. Existing test unchanged.

- Before: `python3 -m unittest -v test_calc.py` — exit 1, expected failure: `3 != 5`.
- After: same command — exit 0, 1 test passed.
- `python -m unittest -v test_calc.py` — unavailable (`python` not found).
- `git status --short` — failed because the workspace isn’t a recognized Git repository.

Evidence covers the existing `increment(4) == 5` regression; other inputs weren’t tested. No commits, dependency installs, delegation, or external services.