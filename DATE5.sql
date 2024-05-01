create table january_jobs as 
    select *
    from job_postings_fact
    where extract(month from job_posted_date) = 1;
