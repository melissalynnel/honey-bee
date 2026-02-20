---
name: role-fit-scoring
description: Evaluate normalized job records against a canonical candidate profile and produce explicit fit scores with rationale. Use when triaging opportunities, building shortlists, or deciding where to spend application effort.
---

# Role Fit Scoring

Use `memory/profile_master.md` as the only trusted candidate source.

## Inputs
1. Job records in `data/jobs/*.json`.
2. Candidate profile in `memory/profile_master.md`.

## Output Contract
For each job record, produce:
1. `fit_score` from `0` to `100`.
2. `fit_band` as `high`, `medium`, or `low`.
3. `fit_rationale` with concise evidence bullets.
4. `gaps` list with missing requirements.

Persist these fields in each job JSON and mirror top-level results in `data/applications.csv`.

## Scoring Rubric
1. Must-have match: 50 points.
2. Core domain match: 20 points.
3. Seniority/location/work authorization fit: 15 points.
4. Nice-to-have overlap: 10 points.
5. Role quality signals (clarity, comp transparency, realistic scope): 5 points.

## Workflow
1. Apply hard filters first (location, authorization, seniority mismatch).
2. Score remaining roles with explicit evidence.
3. Flag uncertain assumptions in `notes` rather than guessing.
4. Rank descending by `fit_score`.

## Quality Rules
1. Never invent profile facts.
2. Never inflate scores without evidence.
3. Keep rationale short and auditable.

