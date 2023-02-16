CREATE DATABASE rollcall;
use rollcall;

CREATE TABLE users (
user_id INT NOT NULL AUTO_INCREMENT,
firstname VARCHAR(150),
lastname VARCHAR(150),
email VARCHAR(150),
password VARCHAR(255),
phone VARCHAR(15),
image VARCHAR(150),
created DATE,
updated DATE,
login TIME,
logout TIME,
isInstructor BOOLEAN NOT NULL DEFAULT "1",
PRIMARY KEY (user_id)
);
ALTER TABLE users AUTO_INCREMENT=1000110;
-- ALTER TABLE users MODIFY isInstructor BOOLEAN NOT NULL DEFAULT true;

CREATE TABLE program (
program_id INT NOT NULL AUTO_INCREMENT,
user_id INT NOT NULL,
theme varchar(150),
description VARCHAR(255),
image VARCHAR(150),
startDate DATE,
startTime TIME,
endDate DATE,
endTime TIME,
PRIMARY KEY (program_id), 
FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE);

-- Student Table
CREATE TABLE students (
student_id INT NOT NULL AUTO_INCREMENT,
user_id INT NOT NULL,
createdby VARCHAR(150),
firstname VARCHAR(150),
lastname VARCHAR(150),
image VARCHAR(150),
PRIMARY KEY (student_id),
FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE students AUTO_INCREMENT=2023000;

-- Participation Table
CREATE TABLE participation (
participation_id INT NOT NULL AUTO_INCREMENT,
student_id INT NOT NULL,
program_id INT NOT NULL,
checkin TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
checkout TIMESTAMP,
remarks VARCHAR(500),
PRIMARY KEY (participation_id),
FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (program_id) REFERENCES program(program_id) ON DELETE CASCADE ON UPDATE CASCADE
);

