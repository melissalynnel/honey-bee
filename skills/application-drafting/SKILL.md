---
name: application-drafting
description: Generate tailored application artifacts from high-fit roles using verified candidate facts. Use when preparing resume variants, cover letters, and short-answer responses that align to a specific job posting.
---

# Application Drafting

Draft only from facts in `memory/profile_master.md` and the target role record.

## Inputs
1. `memory/profile_master.md`.
2. Target role JSON from `data/jobs/`.

## Outputs
Create per-role files under `applications/<job_id>/`:
1. `resume-tailored.md`
2. `cover-letter.md`
3. `short-answers.md`

## Workflow
1. Extract top 5 role requirements and mapped candidate evidence.
2. Rewrite resume bullets for relevance and impact.
3. Draft a concise cover letter with role-specific motivation.
4. Draft short answers with direct, factual responses.
5. Add a brief `claim_map.md` mapping each strong claim to profile evidence.

## Style Rules
1. Prefer concrete outcomes over adjectives.
2. Keep tone professional and direct.
3. Avoid generic filler and repeated phrasing.
4. Match role language without copying job text verbatim.

## Safety Rules
1. Do not fabricate metrics, tools, employers, or dates.
2. If a requirement is not met, frame it as adjacent experience plus learning plan.
3. If information is missing, insert `[[NEEDS_INPUT]]` placeholder.

