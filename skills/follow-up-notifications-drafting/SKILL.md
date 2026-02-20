---
name: follow-up-notifications-drafting
description: Draft professional follow-up messages and schedule reminder notifications after job applications or interviews. Use when maintaining consistent outreach cadence, tracking follow-up due dates, and preparing channel-specific messages (email, LinkedIn, recruiter reply).
---

# Follow-Up Notifications And Drafting

Create structured follow-up plans and concise outreach drafts per submitted role.

## Inputs
1. `data/applications.csv`
2. `data/jobs/<job_id>.json`
3. Optional prior correspondence notes in `applications/<job_id>/`

## Outputs
For each submitted role, write:
1. `applications/<job_id>/follow-up.md`
2. Tracker updates in `data/applications.csv`:
  - `follow_up_due_at` (ISO-8601 datetime)
  - `follow_up_status` (`scheduled`, `sent`, `paused`, `closed`)
  - `follow_up_channel` (`email`, `linkedin`, `portal`, `recruiter`)

## Follow-Up Cadence
1. First follow-up: 5 to 7 business days after submission if no response.
2. Second follow-up: 7 business days after first follow-up.
3. Stop after two unanswered follow-ups unless new signal appears.

## `follow-up.md` Template
Use this structure:

```markdown
# Follow-Up Plan
- job_id:
- due_at:
- channel:
- status:

## Message Draft
<concise, specific message>

## Notes
- reason for timing:
- references to role/application date:
```

## Message Rules
1. Keep it short, respectful, and specific to the role.
2. Mention original application/interview timing.
3. Re-state fit in one sentence with concrete relevance.
4. Include a clear but low-pressure close.
5. Do not guilt, pressure, or over-message.

## Safety Rules
1. Do not claim prior conversations that did not happen.
2. Do not invent referrals or internal contacts.
3. If application status is unclear, ask for status politely rather than assuming next steps.

