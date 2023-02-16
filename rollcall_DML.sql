use rollcall;
SELECT * FROM users order by user_id desc;

use rollcall;
UPDATE users SET phone='0-000-000-0000' WHERE phone=NULL;
ALTER TABLE users DROP COLUMN phone;
ALTER TABLE users ADD COLUMN phone VARCHAR(25) NOT NULL;
ALTER TABLE participaction ADD COLUMN remarks VARCHAR(255);
RENAME TABLE participaction TO participation;
SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE participation MODIFY COLUMN checkout TIME;
SET FOREIGN_KEY_CHECKS=1;
ALTER TABLE students ADD COLUMN createdby VARCHAR(80);

INSERT INTO users (firstname, lastname, image) VALUES("rose", "flower", "roseflower.jpg");

SET FOREIGN_KEY_CHECKS=0;
INSERT INTO students (user_id, firstname, lastname, image) VALUES(1000113,"rose", "flower", "image1.jpg");


UPDATE users SET firstname="Now", lastname="Now" WHERE email="now@now.com";
SELECT * FROM users;

INSERT INTO program (user_id, theme, description, start) VALUES(1000113,"Capstone", "Finallies Description", "2023/02/18");

DELETE FROM participation WHERE participation_id=1;

UPDATE users SET phone="(763)221-2077" WHERE user_id=1000120;

SELECT s.firstname,s.lastname,s.image,p.checkIn,p.checkout,p.remarks 
FROM students s, participation p 
WHERE s.student_id=p.student_id;
UPDATE students SET image="image1.jpg" WHERE student_id > 1;

SELECT s.student_id, s.image, s.firstname, s.lastname, s.createdby, s.user_id as studentUser,
u.user_id, u.email,u.firstname,u.lastname, u.phone, 
p.checkIn, p.checkout, p.remarks, p.program_id
FROM ((students s 
LEFT JOIN users u ON s.user_id=u.user_id)
LEFT JOIN participation p ON s.student_id=p.student_id)
WHERE s.createdby='now@now.com'
ORDER BY s.student_id DESC;

SELECT u.user_id, u.firstname, u.lastname, u.email, u.phone, u.created, u.updated, u.login, u.isInstructor,
pr.user_id, pr.program_id, pr.theme, pr.description, pr.startDate, pr.endDate, pr.startTime, pr.endTime
FROM users u, program pr
WHERE pr.user_id=u.user_id
AND u.email="my@email.com"
AND u.isInstructor=0;

SELECT * FROM students ORDER BY student_id DESC;
SELECT * FROM participation ORDER BY checkin DESC;
SELECT * FROM program ORDER BY program_id DESC;
SELECT * FROM users ORDER BY user_id DESC;

ALTER TABLE program RENAME COLUMN start TO startDate;
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM program WHERE program_id <=2;
SET FOREIGN_KEY_CHECKS=1;

-- Use group by program_id having program_id = selection at the top of page used to print theme info.

/* Handling Foreign Key Constraints

alter table child_table_name
  modify constraint fk_name
  foreign key (child_column_name)
  references parent_table_name (parent_column_name) on delete cascade;

How to check on delete cascade in MySQL?
We can find this information by querying from the referential_constraints in the information_schema database as follows:
USE information_schema;
SELECT table_name FROM referential_constraints
WHERE constraint_schema = 'database_name'
AND referenced_table_name = 'parent_table'
AND delete_rule = 'CASCADE';
*/

SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME
       FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
       WHERE REFERENCED_TABLE_SCHEMA IS NOT NULL;
       
-- First Drop the Foreign Key constraint      
ALTER TABLE participation DROP FOREIGN KEY participation_ibfk_1; 
-- Add Cascade on update and delete  
ALTER TABLE participation 
ADD CONSTRAINT participation_ibfk_1 FOREIGN KEY (student_id) REFERENCES students(student_id) 
ON DELETE CASCADE ON UPDATE CASCADE;

SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE program DROP FOREIGN KEY program_ibfk_1;
SET FOREIGN_KEY_CHECKS=1;

ALTER TABLE program 
ADD CONSTRAINT program_ibfk_1 FOREIGN KEY (user_id) REFERENCES users(user_id) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- verify punches
SELECT s.firstname, s.lastname, s.student_id, 
p.participation_id, p.checkIn, p.checkout, p.student_id, p.program_id, p.remarks
FROM students s, participation p
WHERE s.student_id=p.student_id AND s.lastname='resultsetcheck'
ORDER BY p.checkIn DESC;
UPDATE participation SET remarks="There is a way that seems right unto a man but the end there of leads to destruction. Never man spake like thhis. I'm the way the truth and the life, no one comes to the Father except through me. When the spirit of truth shall come. He will guide you into all Truth." WHERE participation_id=71;

SELECT u.user_id, u.firstname, u.lastname,u.isInstructor,
pr.user_id, pr.program_id
FROM users u, program pr 
WHERE u.user_id=pr.user_id 
AND u.isInstructor=0
GROUP BY u.user_id, u.firstname, u.lastname,u.isInstructor,pr.user_id, pr.program_id;

USE information_schema;
SELECT TABLE_NAME, CONSTRAINT_NAME, UPDATE_RULE, DELETE_RULE, REFERENCED_TABLE_NAME 
FROM REFERENTIAL_CONSTRAINTS 
WHERE CONSTRAINT_SCHEMA='rollcall';


SELECT s.student_id, s.image, s.firstname, s.lastname, s.createdby, s.user_id as studentUser,
u.user_id, u.email,u.firstname,u.lastname, u.phone, 
p.checkIn, p.checkout, p.remarks, p.program_id
FROM ((students s 
LEFT JOIN users u ON s.user_id=u.user_id)
LEFT JOIN participation p ON s.student_id=p.student_id);

DELETE FROM program WHERE program_id=37;

SELECT u.user_id, u.firstname, u.lastname, u.email, u.phone, u.created, u.updated, u.login, u.isInstructor, 
pr.user_id, pr.program_id, pr.theme, pr.description, pr.startDate, pr.endDate, pr.startTime, pr.endTime 
FROM users u, program pr 
WHERE u.user_id=pr.user_id 
AND u.isInstructor=0;