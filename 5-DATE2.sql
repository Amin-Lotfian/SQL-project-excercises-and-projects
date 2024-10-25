
/* the coloumn JOB_POSTED_DATE is 'time stamp' and we want to remove the time and
make the coloumn as 'date' */

SELECT
JOB_TITLE_SHORT AS TITLE,
JOB_LOCATION AS LOCATION1,
JOB_POSTED_DATE::DATE AS DATE1

FROM job_postings_fact;
