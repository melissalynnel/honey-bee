---
name: application-drafting
description: Generate tailored application artifacts from high-fit roles using verified candidate facts. Use when preparing resume variants, cover letters, and short-answer responses that align to a specific job posting.
---

# Application Drafting

Draft only from facts in `memory/profile_master.md` and the target role record.

## Inputs
1. Per-role input file `applications/<job_id>/input.json`.
2. Schema `schemas/application-input.schema.json`.
3. Canonical resume dataset file referenced in `input.json` (default `memory/master_resume.md`).

## Outputs
Create per-role files under `applications/<job_id>/` based on `mode`:
1. `full_package`:
1. `resume-tailored.md` (Section 1)
2. `cover-letter.md` (Section 2)
3. `keyword-report.md` (Section 3)
4. `ats-checklist.md` (Section 4)
5. `recruiter-summary.md` (Section 5)
6. `optimization-suggestions.md` (Section 6)
7. `short-answers.md` (optional role form support)
8. `claim_map.md`
9. `follow-up-seeds.md` (optional concise follow-up angles)
2. `resume_and_cover`:
1. `resume-tailored.md` (Section 1)
2. `cover-letter.md` (Section 2)
3. `claim_map.md`
3. `revise`:
1. Rewrite only the scope in `revision_request.scope`
2. Do not regenerate unaffected files

## Generation Workflow
1. Validate `applications/<job_id>/input.json` against `schemas/application-input.schema.json`.
2. Parse JD from `job.job_description` and extract:
1. Responsibilities
2. Required skills/tools
3. Success signals (metrics, outcomes, scale)
4. Keywords/phrases to mirror
3. Map JD to canonical resume dataset and select:
1. 2 to 4 most relevant roles/projects
2. 6 to 10 strongest proof points
4. Rewrite bullets to match JD language without inflating scope and order highest-relevance bullets first.
5. Produce outputs based on mode:
1. `full_package` -> Sections 1 to 6
2. `resume_and_cover` -> Sections 1 to 2
3. `revise` -> only requested scope
6. Add or update `claim_map.md` mapping each substantive claim to canonical evidence.
7. Run QC before finalizing files:
1. No banned phrases from `constraints.banned_phrases`
2. No invented metrics/dates/titles/tools
3. ATS-safe Markdown formatting
4. Founder-friendly, direct tone
8. Generate one to two optional follow-up seed messages that are:
1. personalized to company and role
2. grounded in one concrete proof point
3. value-led instead of generic interest

## Style Rules
1. Prefer concrete outcomes over adjectives.
2. Keep tone professional and direct.
3. Avoid generic filler and repeated phrasing.
4. Match role language without copying job text verbatim.

## Cover Letter Voice Contract
1. Write with grounded confidence and clear operator thinking.
2. Sound intelligent but unpretentious; warm without softness; direct without harshness.
3. Keep a slightly self-aware tone; allow at most one understated wry line.
4. Mix short declarative sentences with one longer synthesis sentence per paragraph.
5. Keep paragraphs tight and purposeful; avoid winding structure and stacked adjectives.
6. Start with a sharp role/company observation, not generic application language.
7. Anchor paragraph 1 in specific company or role context and explicit alignment.
8. Use 3 to 5 paragraphs with this structure:
1. Paragraph 1: specific company insight + alignment
2. Paragraph 2: why company/mission in operator language
3. Paragraph 3: why candidate with 2 to 3 concrete examples from canonical dataset
4. Optional paragraph 4: operating style, systems thinking, technical fluency
5. Final paragraph: simple confident close + invite conversation
9. Emphasize systems, structure, alignment, and execution under ambiguity.
10. Show technical-adjacent fluency by translating complexity into clarity.
11. End with a simple ask and contact info.
12. Rotate close options lightly while keeping tone consistent:
1. If it's helpful, I'd be glad to share how I'd approach the first 30 days.
2. If this is the kind of operator-storyteller hybrid you're looking for, I'd love to talk.
3. Happy to walk through how I'd structure this work in the first month.
13. Ban these phrases:
1. I'm excited
2. I'm passionate
3. fast-paced environment
4. hit the ground running
5. world-class
6. thought leader
7. leverage
8. synergy
9. sits at the intersection of
10. scrappy
14. Run final self-check before output:
1. remove any generic sentence that could fit any candidate
2. replace vague nouns with concrete specifics
3. include at least one sentence that reflects systems thinking
4. ensure natural spoken cadence
5. verify no invented metrics

## Personal Themes To Weave Subtly
1. Clarity reduces waste.
2. Alignment prevents friction.
3. Responsible technology matters.
4. Messaging is infrastructure, not decoration.
5. Execution matters more than aesthetics.

## Identity Anchor
1. Present candidate as a technically fluent storyteller who builds systems that keep teams aligned.
2. Position candidate as a bridge between engineers, founders, and customers.
3. Do not quote the identity anchor verbatim.

## Safety Rules
1. Do not fabricate metrics, tools, employers, or dates.
2. If a requirement is not met, frame it as adjacent experience plus learning plan.
3. If information is missing, insert `[[NEEDS_INPUT]]` placeholder.
