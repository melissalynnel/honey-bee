# EXECPLAN - Job Search Agent V1 (One-Day Build)

## Mission
Ship a practical, human-supervised job search/application agent system in one day. Deliver reliable outputs with explicit review gates.

## Timebox
Friday, February 20, 2026

## Execution Steps
1. Create baseline structure.
2. Add canonical profile and tracker schemas.
3. Run ingest on an initial role batch.
4. Score and rank roles.
5. Draft tailored application content for top roles.
6. Review drafts with strict factual and quality checks.
7. Draft follow-up outreach and schedule reminders for submitted roles.
8. Run 5 dry-run applications and record outcomes.
9. Capture issues and patch prompts/skills.

## Task Checklist
- [ ] Create folders: `skills/`, `memory/`, `data/jobs/`, `logs/canonical/`.
- [ ] Create `memory/profile_master.md` with verified candidate facts.
- [ ] Create `data/applications.csv` with columns:
  - `job_id`
  - `company`
  - `role`
  - `source_url`
  - `status`
  - `fit_score`
  - `draft_ready`
  - `review_pass`
  - `submitted`
  - `follow_up_due_at`
  - `follow_up_status`
  - `follow_up_channel`
  - `notes`
  - `updated_at`
- [ ] Ingest at least 15 job records to `data/jobs/`.
- [ ] Score all records and shortlist top 8.
- [ ] Draft full materials for top 5.
- [ ] Run review gate on all 5 drafts.
- [ ] Approve or reject each draft and log rationale.
- [ ] Create follow-up draft for each submitted role and set `follow_up_due_at`.

## Guardrails
1. Never submit externally without explicit human approval.
2. Never include claims not present in `memory/profile_master.md`.
3. Always include source URL and retrieval timestamp for each role.
4. If role requirements are unclear, mark `status=blocked` and request clarification.

## Stop/Go Criteria
Go:
1. Ingest, score, draft, and review complete for 5 roles.
2. Review gate catches all unsupported claims.

Stop and fix:
1. Any hallucinated or unverifiable claim appears in final drafts.
2. Tracker drift occurs (missing statuses or unmatched role IDs).

## End-of-Day Output
1. Ranked role list with fit rationale.
2. Five reviewed application packets.
3. Follow-up message drafts and reminder dates for submitted roles.
4. Updated tracker and canonical logs.
5. Updated skill prompts based on failures observed.
