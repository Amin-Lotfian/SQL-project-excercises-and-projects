
WITH remote_job_skills AS (-- CTE DEFINITION STARTS HERE
        SELECT
            skill_id,
            COUNT (*) AS skill_count
        FROM
            skills_job_dim
        inner JOIN job_postings_fact on job_posting_fact.job_id = skills_job_dim.job_id
        where 
            JOB_POSTINGS_FACT.job_work_from_home = TRUE AND
            JOB_POSTINGS_FACT.job_title_short = 'Data Analyst'
        GROUP BY 
            skill_id
)

        SELECT
            skills_dim.skill_id,
            skills_dim.skill_name,
            skill_count
        FROM 
            remote_job_skills
        INNER JOIN SKILL_DIM ON skills_dim.skill_id = remote_job_skills.skill_id
        ORDER BY
            Skill_count DESC

/* THE EASIER WAY with faster operation */

SELECT
    count (*) as count2,
    skills_dim.skill_name,
    skills_dim.skill_id
From 
    job_postings_fact
INNER JOIN job_postings_fact on job_posting_fact.job_id = skills_job_dim.job_id
INNER JOIN SKILL_DIM ON skills_dim.skill_id = skills_job_dim.skill_id

WHERE 
        JOB_POSTINGS_FACT.job_work_from_home = TRUE AND
        JOB_POSTINGS_FACT.job_title_short = 'Data Analyst'
GROUP by skills_dim.skill_name

ORDER BY COUNT2 DESC

