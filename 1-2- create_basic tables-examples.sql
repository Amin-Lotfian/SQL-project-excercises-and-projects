CREATE TABLE job_applied(
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);
-----------------------------------
INSERT INTO job_applied (
        job_id,
        application_sent_date,
        custom_resume,
        resume_file_name,
        cover_letter_sent,
        cover_letter_file_name,
        statuS
    )
VALUES (
        1,
        '2024-02-01',
        true,
        'resume_01.pdf',
        true,
        'cover_letter_01.pdf',
        'submitted'
    ),
    (
        2,
        '2024-02-01',
        true,
        'resume_01.pdf',
        true,
        'cover_letter_01.pdf',
        'submitted'
    ),
    (
        3,
        '2024-02-01',
        true,
        'resume_01.pdf',
        true,
        'cover_letter_01.pdf',
        'submitted'
    ),
    (
        4,
        '2024-02-01',
        true,
        'resume_01.pdf',
        true,
        'cover_letter_01.pdf',
        'submitted'
    ),
    (
        5,
        '2024-02-01',
        true,
        'resume_01.pdf',
        true,
        'cover_letter_01.pdf',
        'submitted'
    );
--------------------------------
ALTER TABLE job_applied
ADD COLUMN contact VARCHAR(50);
/* ADD CONTACT VARCHAR(50); */
ALTER TABLE job_applied
    RENAME COLUMN job_id TO job_iii;
ALTER TABLE job_applied
ALTER COLUMN resume_file_name TYPE VARCHAR(100);
ALTER TABLE job_applied DROP COLUMN custom_resume;
-----------------------------------
ALTER TABLE job_applied
ALTER COLUMN resume_file_name
SET DEFAULT 'default_resume.pdf';
-- default values for new rows
ALTER TABLE job_applied
ALTER COLUMN resume_file_name DROP DEFAULT 'default_resume.pdf';
-------------------------------------
UPDATE job_applied
SET contact = 'John Doe'
WHERE job_iii = 1;
UPDATE job_applied
SET contact = 'John Doee'
WHERE job_iii = 2;
-------------------------------------------
SELECT *
FROM job_applied;
--------------------------------------------
DROP TABLE job_applied;
