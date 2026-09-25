# Stage-1 human review study

## Study design

We conducted a human review of 100 query–document pairs with existing Stage-1 LLM committee verdicts. The sample was selected with seed `20260919`, balanced by the committee verdict (supports: 34; partially supports: 33; irrelevant: 33), and deduplicated so each normalized query appeared once. The pairs came from the holdout benchmark (46), training set (50), and validation set (4).

Three reviewers each assessed all 100 pairs (300 ratings in total). For each pair, reviewers saw the query, document details, and the committee’s Stage-1 annotation. They recorded whether they agreed; when they disagreed, they selected a verdict and entered a reason. We assessed human–human agreement using pairwise exact agreement, Cohen’s κ, Fleiss’ κ, and nominal Krippendorff’s α. Committee–human agreement was measured against each reviewer and against the majority human verdict.

## Main results

### Agreement among human reviewers

| Measure | Result |
|---|---:|
| Mean pairwise exact agreement | 88.7% (266/300 reviewer-pair comparisons) |
| Fleiss’ κ (three reviewers) | 0.830 |
| Krippendorff’s α (nominal) | 0.830 |
| Unanimous human verdicts | 83/100 pairs (83%) |
| Pairs with a 2–1 human majority | 17/100 (17%); no three-way ties |

| Reviewer comparison | Exact agreement | Cohen’s κ |
|---|---:|---:|
| Reviewer 1 vs Reviewer 2 | 88/100 (88%) | 0.820 |
| Reviewer 1 vs Reviewer 3 | 85/100 (85%) | 0.776 |
| Reviewer 2 vs Reviewer 3 | 93/100 (93%) | 0.895 |

### Agreement between the committee and human review

| Comparison | Exact agreement | Cohen’s κ |
|---|---:|---:|
| Committee vs Reviewer 1 | 96/100 (96%) | 0.940 |
| Committee vs Reviewer 2 | 90/100 (90%) | 0.850 |
| Committee vs Reviewer 3 | 87/100 (87%) | 0.805 |
| Committee vs human majority | 92/100 (92%) | 0.880 |
| Committee vs all individual human ratings | 273/300 (91%) | 0.865* |

\*The pooled statistic compares each reviewer rating with the same committee verdict for that pair. It is descriptive; the 300 ratings are clustered within 100 pairs.

The reviewers changed the committee verdict in 27 of 300 ratings, affecting 18 distinct pairs. All recorded corrections were between adjacent categories:

| Committee verdict → human verdict | Correction ratings | Distinct pairs |
|---|---:|---:|
| Supports → partially supports | 11 | 7 |
| Partially supports → supports | 5 | 4 |
| Partially supports → irrelevant | 6 | 4 |
| Irrelevant → partially supports | 5 | 3 |

Human reviewers’ disagreements were also concentrated at adjacent category boundaries: supports vs partially supports on 11 pairs, and partially supports vs irrelevant on 6 pairs. No pair had a human supports–irrelevant disagreement.

## Interpretation and limitations

The reviewers showed substantial agreement with one another and with the Stage-1 committee labels on this sample. Most committee–human differences were between neighboring verdict categories; no reviewer correction moved directly between supports and irrelevant. The results support using the committee annotations as a useful first-pass labeling signal, with human review focused on ambiguous category boundaries.

These results measure agreement, not objective verdict accuracy: there was no separate adjudicated gold-standard label. The sample was deliberately balanced by committee verdict and therefore does not estimate agreement at the datasets’ natural label prevalence. The sample also combines holdout, training, and validation records, so results should not be described as a holdout-only evaluation.

Reviewers saw the committee’s Stage-1 annotation before entering their own judgment. The review was therefore not blinded, and anchoring may have increased observed agreement. The findings should be presented as agreement under this review workflow, not as an independent blinded validation of the committee.

