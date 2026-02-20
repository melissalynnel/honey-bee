---
name: linkedin-contact-discovery
description: Identify the best follow-up contact on LinkedIn for each job after application submission. Use when jobs are ingested or when preparing follow-up outreach and you need a prioritized person to contact (hiring manager, recruiter, or relevant team lead) plus fallback contacts.
---

# LinkedIn Contact Discovery

Find and rank the best person to contact per role, then store results for follow-up workflows.

## Inputs
1. `applications/<job_id>/input.json`
2. `data/jobs/<job_id>.json` if available
3. Company and role details from `data/applications.csv`

## Outputs
1. `applications/<job_id>/contacts.json` with:
```json
{
  "job_id": "",
  "generated_at": "",
  "primary_contact": {
    "name": "",
    "title": "",
    "linkedin_url": "",
    "reason": "",
    "confidence": "high|medium|low"
  },
  "fallback_contacts": [
    {
      "name": "",
      "title": "",
      "linkedin_url": "",
      "reason": "",
      "confidence": "high|medium|low"
    }
  ]
}
```
2. Update tracker row in `data/applications.csv`:
  - `contact_person` with primary contact summary
  - `follow_up_channel` default to `linkedin` if no better channel exists

## Ranking Rules
1. Prefer hiring manager for the exact function/team.
2. If no hiring manager is identifiable, choose in order:
1. recruiter for the role/team
2. function leader (for example Head of Marketing, VP GTM)
3. adjacent team lead likely to route internally
3. Prefer contacts in same geo/team as role where possible.
4. Prefer recent and active profiles over stale profiles.

## Workflow
1. Parse job title, function, and seniority from role record.
2. Search LinkedIn for role-relevant contacts at target company.
3. Build a ranked top-3 list with reasons and confidence levels.
4. Persist contact file and sync primary contact into tracker.
5. If no strong match is found, set `confidence=low` and include best available recruiter path.

## Message Alignment Rules
1. Match outreach language to the contact’s function and seniority.
2. Keep follow-up low-pressure and specific to the submitted role.
3. Use one resume-backed proof point only.

## Safety Rules
1. Do not invent names, titles, or profile links.
2. If confidence is low, state uncertainty explicitly.
3. Do not spam multiple contacts simultaneously; use primary then fallback sequence.

