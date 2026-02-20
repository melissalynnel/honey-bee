---
name: application-review-gate
description: Enforce quality and factual integrity before any job application is submitted. Use when validating drafted resume/cover-letter/answers for accuracy, requirement alignment, clarity, and submission readiness.
---

# Application Review Gate

Run this gate on every application packet before human approval.

## Inputs
1. `applications/<job_id>/input.json`
2. `schemas/application-input.schema.json`
3. `applications/<job_id>/resume-tailored.md`
4. `applications/<job_id>/cover-letter.md`
5. `applications/<job_id>/short-answers.md`
6. `applications/<job_id>/claim_map.md`
7. Canonical resume dataset file referenced in `input.json`
8. Optional `applications/<job_id>/follow-up.md`
9. Optional `applications/<job_id>/contacts.json`

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
5. No banned phrases from `constraints.banned_phrases`.
6. Outputs are ATS-safe Markdown with clean standard headings and bullet formatting.
7. If `follow-up.md` exists, cadence and anti-spam rules are respected.
8. If `contacts.json` exists, follow-up target is consistent with primary/fallback contact logic.
9. Cover letters satisfy voice contract and structure requirements.

## Workflow
1. Validate `input.json` against schema before reviewing outputs.
2. Validate factual claims against `claim_map.md` and canonical resume dataset.
3. Validate alignment against role requirements and keyword emphasis from `input.json`.
4. Fail fast on any fabricated or unverifiable claim.
5. Check banned phrase list, ATS formatting safety, and founder-friendly tone.
6. Provide exact rewrite instructions for each issue.
7. Require human approval after pass.
8. If `follow-up.md` exists, validate:
1. no more than two unanswered follow-ups in default cadence
2. one concrete proof point tied to canonical evidence
3. role/company personalization and low-pressure close
9. If `contacts.json` exists, validate:
1. contact details are not fabricated
2. selected contact in follow-up matches primary/fallback strategy
10. For cover letters, validate:
1. 3 to 5 paragraphs
2. paragraph 1 includes one specific JD/company detail
3. paragraph 2 explains why company/mission in operator language
4. paragraph 3 contains 2 to 3 concrete resume-backed examples
5. optional paragraph 4 explains operating style with systems thinking and technical fluency
6. final paragraph ends with simple confident invitation to talk
4. no banned tone phrases: I'm excited, I'm passionate, I'm thrilled, hit the ground running, world-class, fast-paced environment
5. no banned phrases: sits at the intersection of, scrappy
6. avoid leverage, synergy, thought leader unless quoted from JD
7. include at least one sentence showing systems thinking
8. remove generic filler sentences and vague nouns without specifics
9. ends with simple ask plus contact info
10. subtly reflects at least two personal themes:
1. clarity reduces waste
2. alignment prevents friction
3. responsible technology matters
4. messaging is infrastructure, not decoration
5. execution matters more than aesthetics
11. reflects identity anchor without quoting it verbatim:
1. technically fluent storyteller
2. bridge across engineers, founders, and customers
