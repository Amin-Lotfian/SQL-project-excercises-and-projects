CREATE TABLE JOB_APLIED (
    JOB_ID INT,
    APPLICATION_SENT_DATE DATE, 
    CUSTOM_RESUME BOOLEAN,
    RESUME_FILE_NAME VARCHAR(255),
    COVER_LETTER_SENT BOOLEAN,
    COVER_LETTER_FILE_NAME VARCHAR(255),
    status VARCHAR(50)
);

Select *
FROM job_appplied


insert into job_aplied
            (
    JOB_ID,
    APPLICATION_SENT_DATE, 
    CUSTOM_RESUME,
    RESUME_FILE_NAME,
    COVER_LETTER_SENT,
    COVER_LETTER_FILE_NAME,
    status)
VALUES      (1,
             '2024-02-01',
             true,
             'resume_01.pdf',
             true,
             'cover_letter_01.pdf',
             'submitted'
             );



ALTER TABLE job_aplied
ADD CONTACT VARCHAR(50);
Select *
FROM job_aplied;



UPDATE job_aplied
SET CONTACT = 'FLASK'
WHERE JOB_ID = 1;
Select *
FROM job_aplied;



ALTER TABLE job_aplied
RENAME COLUMN CONTACT TO CONTACT_NAME;
Select *
FROM job_aplied;



ALTER TABLE job_aplied
ALTER COLUMN CONTACT_NAME TYPE TEXT;



ALTER TABLE job_aplied
DROP COLUMN CONTACT_NAME ;


DROP TABLE job_applied;
