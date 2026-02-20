---
name: job-research-ingest
description: Discover and normalize job postings into structured records for downstream scoring and drafting. Use when building or updating a pipeline that gathers roles from job boards, company pages, referrals, or recruiter messages and needs consistent fields, source attribution, and freshness checks.
---

# Job Research Ingest

Normalize every discovered role into a single JSON record under `data/jobs/`.

## Output Contract
Write one file per role as `data/jobs/<job_id>.json` with fields:

```json
{
  "job_id": "company-role-location-date",
  "company": "",
  "role": "",
  "location": "",
  "employment_type": "",
  "salary_range": "",
  "required_years": "",
  "must_have_skills": [],
  "nice_to_have_skills": [],
  "summary": "",
  "source_url": "",
  "retrieved_at": "",
  "deadline": "",
  "status": "new"
}
```

## Workflow
1. Gather roles only from approved or trusted sources.
2. Extract structured fields and preserve ambiguous details in `summary`.
3. Add `source_url` and ISO-8601 `retrieved_at` for every record.
4. Generate deterministic `job_id` and prevent duplicates.
5. Set `status` to `new` after successful normalization.

## Quality Rules
1. Do not infer missing requirements; leave unknown fields empty.
2. Keep text concise and factual.
3. Reject records without a valid source URL.
4. Mark stale postings clearly if retrieval is old or listing is closed.

