# Validate distinct invariants at ownership boundaries

Trace the invalid value to its owner before adding checks. Multiple boundaries
may need different invariants; repeating the same validation at every function
adds maintenance and can hide the cause.

| Boundary | Example invariant | Proof |
| --- | --- | --- |
| External input | Required field is present and syntactically valid | Malformed/missing input rejected at the API |
| Domain owner | Operation is legal for this state/identity | Focused valid/invalid transition test |
| Dangerous side effect | The project owns the target and may mutate it | Identity/authorization check immediately before mutation |
| Evidence capture | Original bytes, conditions, and exit are retained | Inspect retained output and capture status |

Add a second check only for a distinct invariant, a real alternate entry path,
or a concrete bypass. Keep one owner for shared policy; diagnostic logging is
an observation, not another authorization or correctness gate. Tests should
exercise each meaningful bypass without duplicating a whole external subsystem.

For example, reject an empty working directory at input, verify the operation's
project/session identity at the domain owner, then verify the owned target before
Git mutation. A string-prefix test against a temporary directory is not proof
of containment, symlink identity, or mutation authority. Reuse the project's
maintained safe filesystem boundary rather than inventing one in this example.

Preserve a meaningful reproduction and original logs. State which invariant the
repair proves; do not claim the bug is impossible or all runtime paths are safe
from a passing focused test.
