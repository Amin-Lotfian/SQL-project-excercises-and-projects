SELECT
COUNT (JOB_ID) AS JOB_POSTED_COUNT,
EXTRACT(MONTH FROM JOB_POSTED_DATE) AS DATE2,

FROM 
job_postings_fact

WHERE
job_title_short = 'DATA ANALYST'

GROUP BY 
DATE2

ORDER BY
JOB_POSTED_COUNT DESC;
