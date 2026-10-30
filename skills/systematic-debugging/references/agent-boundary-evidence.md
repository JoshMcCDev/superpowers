# Agent and tool boundary evidence

Trace one failing operation through only the implicated owners: input/context,
tool selection, execution, interpretation, retries, presentation, and retained
output. Compare actual inputs/outputs, source locations, operation identities,
and original exits/receipts. Distinguish pending from completed calls and a
summary from raw evidence. Record where data was changed, dropped, or replayed.

Compare a direct or known-good path only with equivalent versions, inputs, and
permissions. Check duplicated requests, nested retries, stale context, and output
rewriting before adding wrappers. Missing traces are an evidence gap. Retain
original artifacts and existing authority/cleanup responsibilities. Do not bypass
sandbox, receipt, budget, or verifier controls for a convenient baseline.

State the experiment and expected observation before changing the owning layer.
Narrow proven redundant or corrupting behavior within the active task; do not
turn diagnosis into an all-layer rewrite or a new verdict framework.
