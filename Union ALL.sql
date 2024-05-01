SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date::date,
    salary_year_average
FROM (
    select *
    From january_jobs
    UNION ALL
    select *
    From february_jobs
    UNION ALL
    select *
    From march_jobs
) AS quarter1_job_postings
WHERE
    salary_year_avg > 70000 AND
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC
    
