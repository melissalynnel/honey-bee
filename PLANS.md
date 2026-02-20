# Job Search Agent V1 Plan

## Objective
Build a same-day MVP for a human-supervised job search and application workflow. Optimize for quality and repeatability, not full autonomy.

## Scope (Today)
1. Ingest jobs from approved sources into a normalized structure.
2. Score role fit against a single canonical profile.
3. Draft tailored resume bullets, cover letters, and short-answer responses.
4. Run a review gate that blocks unsupported or low-quality outputs.
5. Draft follow-up outreach and schedule follow-up notifications.
6. Track all roles and statuses in a single log/tracker.

## Non-Goals (Today)
1. Fully automated form submission across job platforms.
2. Unattended autonomous applying.
3. Advanced analytics and long-horizon optimization loops.

## Working Rules
1. Keep one source of truth for candidate facts in `memory/profile_master.md`.
2. Require source URLs and timestamps for every job record.
3. Require human approval before any external submission.
4. Log each run and decision in `logs/canonical/`.
5. Keep prompts/flows reusable by codifying repeat work as skills.

## Artifacts
1. `EXECPLAN.md` for execution steps.
2. `skills/` for repeatable agent workflows.
3. `data/jobs/` for normalized job records.
4. `data/applications.csv` for status tracking.
5. `memory/` for stable context and profile facts.
6. `logs/canonical/` for run logs and review outcomes.

## Success Metrics (V1)
1. At least 15 roles ingested and normalized.
2. At least 5 end-to-end dry runs (research -> score -> draft -> review).
3. Less than 15 minutes average operator time per reviewed application draft.
4. Zero unsupported claims surviving the review gate.
5. 100% of submitted applications have a scheduled follow-up date and draft message.
