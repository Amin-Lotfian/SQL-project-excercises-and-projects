/** 
 in this situation we will connect these two tables with "skill_id" because that is 
 both a foreign key and primary key and its better than the "skills" which is just a simple column.
 also we changed group by from "skills" to "skill_id"
 
 also we want to integrate these two tables so we deleted "limits" and "order by"
 and we also assimilated the "where" clauses.
 
 BUT Notice that except the "skill_id" we should not have any other common coloumns.
 And because of that, we deleted the "skills_dim.skills" from the second table so that we
 will have it just in the first table.
 **/


with Skill_demand AS (
    SELECT count (*) as count2,
        skills_dim.skill_id,
        skills_dim.skills
    From job_postings_fact
        INNER JOIN job_postings_fact on job_posting_fact.job_id = skills_job_dim.job_id
        INNER JOIN SKILL_DIM ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE JOB_POSTINGS_FACT.job_work_from_home = TRUE
        AND JOB_POSTINGS_FACT.job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP by skills_dim.skill_id -- ORDER BY COUNT2 DESC
        -- LIMIT 5
),
average_salaryyyy AS (
    SELECT ROUND(AVG(salary_year_avg), 0) as AVGGG,
        skills_dim.skill_id,
        --  skills_dim.skills
    From job_postings_fact
        INNER JOIN job_postings_fact on job_posting_fact.job_id = skills_job_dim.job_id
        INNER JOIN SKILL_DIM ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE JOB_POSTINGS_FACT.job_work_from_home = TRUE
        AND JOB_POSTINGS_FACT.job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP by skills_dim.skill_id -- ORDER BY AVGGG DESC
        -- LIMIT 25
)
SELECT skill_demand.skill_id,
    skill_demand.skills,
    count2,
    AVGGG
FROM skill_demand
    INNER JOIN average_salaryyyy ON skill_demand.skill_id = average_salaryyyy.skill_id
where demand_count > 10
ORDER BY AVGGG DESC,
    count2 DESC
LIMIT 25;



/** NOW WE GONNA REWRITE THIS IN A FASTER AND OPTIMIZER WAY: **/
select skills_dim.skill_id,
    skills_dim.skills,
    Count(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) as AVGGG
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE JOB_POSTINGS_FACT.job_work_from_home = TRUE
    AND JOB_POSTINGS_FACT.job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id
    /** OR skills_job_dim.skill_id because thats inner join
     and it doesnt matter which one we write**/
HAVING Count(skills_job_dim.job_id) > 10
ORDER BY AVGGG DESC,
    count2 DESC
LIMIT 25;
