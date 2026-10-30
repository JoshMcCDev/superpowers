Fixed [calc.py](/tmp/superpowers-adaptation-evidence/package-fixture/calc.py:2): changed `value - 1` to `value + 1`.

Verification in `package-fixture`: `python3 -m unittest test_calc`

- Before: exit 1; `AssertionError: 3 != 5`; 1 test failed.
- After: exit 0; `Ran 1 test in 0.000s`; `OK`.

Broader tests, lint, and build checks: **NOT_RUN**. No commits or installations.