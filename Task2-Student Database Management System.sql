CREATE DATABASE student_database;
USE student_database;

CREATE TABLE student_table (
    Student_id INT PRIMARY KEY,
    Stu_name VARCHAR(100),
    Department VARCHAR(100),
    email_id VARCHAR(100),
    Phone_no NUMERIC(15, 0),
    Address TEXT,
    Date_of_birth DATE,
    Gender VARCHAR(10),
    Major VARCHAR(100),
    GPA NUMERIC(3, 2),
    Grade CHAR(1) CHECK (Grade IN ('A', 'B', 'C', 'D', 'E', 'F'))
);

-- Insert data --

INSERT INTO student_table 
(Student_id, Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES
(1, 'Shirlin Joseph', 'Computer Science', 'shirlin.j@gmail.com', 9790625079, 'ABS, Kanyakumari', '1995-06-22', 'Female', 'AI', 3.85, 'A'),

(2, 'Sharmi R', 'Electronics', 'sharmi.r@gmail.com', 9744425071, 'PKK, Chennai', '1994-05-20', 'Female', 'VLSI', 3.65, 'B'),

(3, 'Ancy Mathew', 'Information Tech', 'ancy.m@gmail.com', 9790655579, 'RRR, Chennai', '1995-04-10', 'Female', 'Networking', 3.75, 'A'),

(4, 'Dinesh K', 'Mechanical', 'dinesh.k@gmail.com', 9791115022, '22N, Chennai', '1995-12-27', 'Male', 'Automobile', 3.25, 'B'),

(5, 'Andrew J', 'Computer Science', 'andrew.j@gmail.com', 9790625654, 'TAN, Kanyakumari', '1995-11-29', 'Male', 'AI', 3.95, 'A'),

(6, 'Sneha Thomas', 'Electrical', 'sneha.t@gmail.com', 9781123456, 'MG Road, Bangalore', '1996-01-15', 'Female', 'Power Systems', 3.40, 'B'),

(7, 'Rahul Dev', 'Civil', 'rahul.dev@gmail.com', 9778899001, 'Hosur Road, Bengaluru', '1994-08-11', 'Male', 'Structural Engg', 3.10, 'C'),

(8, 'Meera S', 'Computer Science', 'meera.s@gmail.com', 9790012345, 'Anna Nagar, Chennai', '1995-03-05', 'Female', 'Data Science', 3.92, 'A'),

(9, 'Vikram V', 'Information Tech', 'vikram.v@gmail.com', 9790098765, 'KK Nagar, Chennai', '1993-12-30', 'Male', 'Cloud Computing', 3.55, 'B'),

(10, 'Priya M', 'Electronics', 'priya.m@gmail.com', 9786654321, 'Velachery, Chennai', '1996-09-25', 'Female', 'Embedded Systems', 3.70, 'A');

-- Retrieve All Students Sorted by Grade (Descending)--
SELECT * FROM student_table
ORDER BY Grade DESC;

-- Retrieve All Male Students--
SELECT *
FROM student_table
WHERE Gender = 'Male';

-- Students with GPA < 5.0--
SELECT *
FROM student_table
WHERE GPA < 5.0;

--- Update Email and Grade for a Specific Student--
UPDATE student_table
SET email_id = 'j.shirlin@gmail.com',
    Grade = 'B'
WHERE 
    Student_id = 1;
 
 ---- Students with Grade "B" – Show Name and Age--
 
SELECT Stu_name,
TIMESTAMPDIFF(YEAR, Date_of_birth, CURDATE()) AS Age
FROM student_table
WHERE Grade = 'B';

--- Average GPA by Department and Gender--

SELECT Department, Gender, AVG(GPA) AS Average_GPA
FROM student_table
GROUP BY Department, Gender;

--- Rename Table---
RENAME TABLE student_table TO student_info;

--- Student with the Highest GPA---

SELECT Stu_name, GPA
FROM student_info
ORDER BY GPA DESC
LIMIT 1;
    

