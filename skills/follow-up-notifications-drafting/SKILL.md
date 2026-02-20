---
name: follow-up-notifications-drafting
description: Draft professional follow-up messages and schedule reminder notifications after job applications or interviews. Use when maintaining consistent outreach cadence, tracking follow-up due dates, and preparing channel-specific messages (email, LinkedIn, recruiter reply).
---

# Follow-Up Notifications And Drafting

Create structured follow-up plans and concise outreach drafts per submitted role.
Prioritize targeted outreach quality over outreach volume.

## Inputs
1. `data/applications.csv`
2. `applications/<job_id>/input.json`
3. `data/jobs/<job_id>.json` if available
4. Optional prior correspondence notes in `applications/<job_id>/`
5. Canonical resume dataset referenced in `input.json`
6. `applications/<job_id>/contacts.json` from LinkedIn contact discovery

## Outputs
For each submitted role, write:
1. `applications/<job_id>/follow-up.md`
2. Tracker updates in `data/applications.csv`:
  - `follow_up_due_at` (ISO-8601 datetime)
  - `follow_up_status` (`scheduled`, `sent`, `paused`, `closed`)
  - `follow_up_channel` (`email`, `linkedin`, `portal`, `recruiter`)
  - `last_contact_at` (ISO-8601 datetime, optional)
  - `follow_up_stage` (`none`, `f1`, `f2`, `closed`, optional)
  - `contact_person` (optional)
  - `contact_person` should be populated from `contacts.json` primary contact when available

## Follow-Up Cadence
1. First follow-up: 5 to 7 business days after submission if no response.
2. Second follow-up: 7 business days after first follow-up.
3. Stop after two unanswered follow-ups unless new signal appears.
4. If no response after second follow-up, set `follow_up_status=paused`.
5. If recruiter responds without timeline, schedule a low-friction nudge in 5 business days.

## Contact Selection Rules
1. Use `contacts.json.primary_contact` as default outreach target.
2. If no response after F1 and confidence is low, switch to top fallback contact for F2.
3. Do not message more than one new contact per stage unless user explicitly asks.
4. Record contact handoff decisions in follow-up notes and tracker.

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
3. Include one role-relevant proof point grounded in resume evidence.
4. Re-state fit in one sentence with concrete relevance.
5. Include a clear but low-pressure close.
6. Do not guilt, pressure, or over-message.

## Personalization Rules
1. Include company name and exact role title.
2. Mirror one or more role keywords from `must_have_keywords` where truthful.
3. Use one concrete proof point from canonical resume evidence.
4. Avoid repeating the exact same body copy across follow-ups.

## Anti-Spam Guardrails
1. Send at most two unanswered follow-ups per thread by default.
2. Keep each message under 120 words unless the user requests otherwise.
3. Prefer channel sequence: email -> LinkedIn -> recruiter thread when available.
4. If a message has no new value or context, do not send it.

## Value-Led Outreach Rule
1. Lead each follow-up with value, not only interest.
2. If available, include a compact role-relevant asset or idea:
- sample messaging angle
- lightweight launch hypothesis
- process improvement suggestion
3. Keep value assets concrete, short, and role-specific.

## Compensation Response Rule
1. If asked for compensation early, ask for the employer range first.
2. If a direct answer is required, provide a broad range and state that scope and total package matter.

## Safety Rules
1. Do not claim prior conversations that did not happen.
2. Do not invent referrals or internal contacts.
3. If application status is unclear, ask for status politely rather than assuming next steps.
4. Do not invent role requirements, metrics, or contacts.
