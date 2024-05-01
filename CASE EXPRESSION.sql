SELECT
    COUNT (job_id) as numberـofـjobs,
    case 
        when job_location = 'anywhere' then 'REMOTE'
        WHEN job_location = 'New York, NY' THEN 'LOCAL'
        ELSE 'ONSITE'
    END AS location_category
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
Group BY
    location_category;


    
