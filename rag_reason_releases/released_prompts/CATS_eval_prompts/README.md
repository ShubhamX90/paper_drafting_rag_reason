# Local LLM Committee Prompts

This folder contains the paper-facing copies of the prompts used by the local
LLM committee in the latest CATS v2 evaluation pipeline. The templates preserve
the wording and decision boundaries of the active generators in
[`rag_eval/judge_prompts.py`](../rag_eval/judge_prompts.py), while replacing
runtime-injected values with explicit placeholders so that a reader can inspect
the prompt without reconstructing Python f-strings.

## Active prompt set

| File | Metric/path | Status |
| --- | --- | --- |
| `behavior_adherence_prompt.template.txt` | Behavior Adherence (BA) | Active committee prompt |
| `single_truth_recall_prompt.template.txt` | Single-Truth Recall (STR) | Active committee prompt |
| `factual_grounding_prompt.template.txt` | Committee Factual Grounding v2 | Active committee prompt |
| `behavior_rubric.md` | Type-specific BA rubric | Active rubric embedded in BA prompt |
| `committee_json_system_prompt.txt` | Local/OpenAI-compatible judge system message | Active for local, DeepSeek, and OpenRouter chat paths |

## Template variables

### Behavior Adherence

- `{query}`: user query.
- `{answer}`: model final answer after think-trace removal.
- `{conflict_type}`: integer conflict type, normally 1--5.
- `{expected_behavior}`: the selected line from `behavior_rubric.md`.
- `{provenance_block}`: optional Type 4/5 document date/source block. It is
  empty unless retrieved documents contain provenance fields.

For Type 4, provenance uses `date` or `timestamp` and optionally `source` or
`url`. For Type 5, the same fields are labelled as publication dates/sources.

### Single-Truth Recall

- `{gold_answer}`: one normalized gold answer item.
- `{model_answer}`: model final answer under evaluation.

The evaluator calls this prompt once for every normalized gold answer item and
uses the committee's binary decision plus minority-side confidence.

### Committee Factual Grounding

- `{query}`: user query.
- `{model_answer_block}`: optional block containing the first 500 characters of
  the think-trace-stripped model final answer.
- `{claim_text}`: one extracted claim.
- `{documents_block}`: eligible documents, rendered with document ID, gold
  verdict, gold key fact, and a passage.
- `{valid_document_ids}`: comma-separated eligible document IDs.

The generator truncates each rendered document passage to 350 characters and
the model-answer context to 500 characters. The caller has already filtered
documents to gold verdicts equivalent to `supports` or `partially supports`.

## Important reproducibility note

The Python generator remains the executable authority because it performs
placeholder substitution, provenance rendering, citation/document formatting,
and answer truncation. These files are faithful prompt-text copies for
inspection, paper writing, and reproduction; they should be updated whenever the
generator changes. The prompt contents are not an additional evaluation
implementation.

The current local committee uses the shared system instruction in
`committee_json_system_prompt.txt` for local OpenAI-compatible, DeepSeek, and
OpenRouter chat-completion calls. Anthropic and Codex CLI paths receive the
task prompt directly and do not add that separate system message in the active
client implementation.

## Scope

This folder intentionally contains only prompts used by the latest local
committee evaluation paths: Behavior Adherence, Single-Truth Recall, and
committee Factual Grounding v2. Historical prompt implementations are not part
of this production prompt bundle.
