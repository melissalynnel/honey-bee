---
name: application-review-gate
description: Enforce quality and factual integrity before any job application is submitted. Use when validating drafted resume/cover-letter/answers for accuracy, requirement alignment, clarity, and submission readiness.
---

# Application Review Gate

Run this gate on every application packet before human approval.

## Inputs
1. `applications/<job_id>/resume-tailored.md`
2. `applications/<job_id>/cover-letter.md`
3. `applications/<job_id>/short-answers.md`
4. `applications/<job_id>/claim_map.md`
5. `memory/profile_master.md`
6. `data/jobs/<job_id>.json`

## Output Contract
Write `applications/<job_id>/review.md` with:
1. `decision`: `pass` or `fail`
2. `critical_issues`: unsupported claims, contradictions, compliance risks
3. `quality_issues`: unclear phrasing, weak relevance, verbosity
4. `required_fixes`: actionable edits
5. `final_checklist`: yes/no items for human approver

## Gate Criteria
Pass only if all are true:
1. Every substantive claim is traceable to profile evidence.
2. Role requirements are addressed with concrete evidence or explicit gap framing.
3. Tone is professional, concise, and specific.
4. No placeholders remain.

## Workflow
1. Validate factual claims against `claim_map.md` and profile.
2. Validate alignment against top role requirements.
3. Fail fast on any fabricated or unverifiable claim.
4. Provide exact rewrite instructions for each issue.
5. Require human approval after pass.

