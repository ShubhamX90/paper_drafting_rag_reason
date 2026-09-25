# Behavior Adherence Rubric

This is the exact five-type rubric selected by
`behavior_judge_prompt(...)` in `rag_eval/judge_prompts.py`.

| Conflict type | Rubric supplied to the judge |
| --- | --- |
| 1. No Conflict | Provide a clear and direct answer without introducing alternative viewpoints or uncertainty. |
| 2. Complementary Information | Consolidate and reconcile the different partial answers provided by the retrieved documents, without framing the response as a debate. |
| 3. Conflicting Opinions or Research Outcomes | Explicitly reflect the debate between the retrieved sources and neutrally summarize the different viewpoints. |
| 4. Conflict Due to Outdated Information | Prioritise the up-to-date information, while optionally acknowledging the presence of outdated sources. |
| 5. Conflict Due to Misinformation | Disregard inaccurate sources and provide a response grounded in reliable and verified information. |

The active prompt selects exactly one rubric for the supplied conflict type. It
does not ask the judge to score all five behaviors at once.

The BA judge is instructed to assess behavior only. It must not use answerability
correctness, factual entailment, citation validity, unsupported-claim detection,
or Single-Truth Recall as hidden BA criteria. A refusal is adherent when the
retrieved evidence genuinely does not support a confident answer, regardless of
conflict type.
