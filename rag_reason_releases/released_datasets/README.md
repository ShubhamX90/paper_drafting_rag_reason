# Released Datasets

This directory is the clean reviewer-facing entry point for the final dataset
artifacts that should ship with the repository.

## Canonical released datasets

- `training_dataset_v2/`
  - `train.jsonl`: final training split (`862` rows)
  - `val.jsonl`: final validation split (`81` rows)
  - `train_stagewise.jsonl` and `val_stagewise.jsonl`: stagewise variants of the
    same released split
- `benchmark_dataset_v2/`
  - `benchmark_final_v2_holdout_clean_736.jsonl`: final benchmark holdout (`736`
    rows)
  - `benchmark_final_v2.jsonl`: broader benchmark-v2 release file (`933` rows)
  - `benchmark_final_v2_manifest.json`: source manifest from the release pack

## Scope note

Only the canonical top-level released datasets were promoted here from
`sft_inference_pipeline_v2`. Experimental augmentation sub-runs such as
`run_j/`, `run_k/`, and `run_l/` were intentionally not copied into this clean
release area because they are derivation experiments, not the base reviewer-facing
dataset deliverables.

A mismatched legacy sidecar from the source split pack was not promoted here
because its row counts (`609/49`) do not match the canonical released `862/81`
split. It remains recoverable under `legacies/data/releases_sidecars/`.

The annotation-pipeline source artifacts remain elsewhere in this repository:

- `data/final_annotations/`: source annotation pool retained for pipeline work
- `data/splits/92p5_7p5/`: internal validation split retained for committee runs
- `data/benchmarks/final_benchmark_2026-06-22/`: internal benchmark-build
  artifact retained for pipeline reproducibility

For detailed provenance, schema, distributions, source composition, and
split-integrity guidance, see
[`docs/TRAINING_DATASET_DESCRIPTION.md`](../../docs/TRAINING_DATASET_DESCRIPTION.md)
and [`docs/BENCHMARK_DATASET_DESCRIPTION.md`](../../docs/BENCHMARK_DATASET_DESCRIPTION.md).
For field definitions, JSONL loading guidance, and the different schemas used
by the training and benchmark releases, see
[`docs/DATA_FORMAT_AND_SCHEMA_REFERENCE.md`](../../docs/DATA_FORMAT_AND_SCHEMA_REFERENCE.md).
