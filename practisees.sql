use practise;

show tables;

-- Create first table: ml (Master List)
CREATE TABLE ml (
    ml_id INT PRIMARY KEY,
    name VARCHAR(50),
    course VARCHAR(30),
    joining_date DATE
);

-- Create second table: test (related to ml)
CREATE TABLE test (
    test_id INT PRIMARY KEY,
    ml_id INT,
    subject VARCHAR(50),
    marks INT,
    test_date DATE,
    FOREIGN KEY (ml_id) REFERENCES ml(ml_id)
);

-- Insert sample data into ml
INSERT INTO ml VALUES
(1, 'Tushar', 'Data Science', '2024-01-10'),
(2, 'Aman', 'AI & ML', '2024-03-05'),
(3, 'Riya', 'Cyber Security', '2024-02-18'),
(4, 'Vivek', 'Data Science', '2024-01-20'),
(5, 'Neha', 'AI & ML', '2024-03-15');

-- Insert sample data into test (10 rows)
INSERT INTO test VALUES
(101, 1, 'SQL', 88, '2024-06-10'),
(102, 1, 'Python', 92, '2024-06-15'),
(103, 2, 'Machine Learning', 78, '2024-06-12'),
(104, 3, 'Networking', 84, '2024-06-18'),
(105, 4, 'Statistics', 75, '2024-06-20'),
(106, 2, 'Deep Learning', 81, '2024-06-25'),
(107, 3, 'Cyber Laws', 89, '2024-06-28'),
(108, 4, 'Data Visualization', 73, '2024-07-02'),
(109, 5, 'AI Fundamentals', 90, '2024-07-06'),
(110, 5, 'Python', 87, '2024-07-10');





describe ml;
select * from ml;


describe test;
select * from test;


select * from ml inner join test on ml.ml_id = test.ml_id where ml.ml_id = 1;




--  SQL Practice Set
-- INNER JOIN

-- Write a query to show student name, subject, and marks for all students who appeared in tests.

select m.name,t.subject,t.marks from ml m join test t on m.ml_id = t.ml_id  where test_id is not null;  -- unecessary not null logic

-- Show only those students whose marks are greater than 85 using INNER JOIN.

select m.name , t.marks from ml m join test t on m.ml_id = t.ml_id where marks > 85;

-- LEFT JOIN

-- Display all students with their subject and marks. For students with no test, show NULL.

 select m.name,t.subject,t.marks from ml m left join test t using(ml_id);

-- Show names of students who have not given any test using LEFT JOIN.

select m.name,t.subject,t.marks from ml m left join test t using(ml_id) where test_id is null;

-- RIGHT JOIN

-- Display all test records with related student names using RIGHT JOIN.

select * from ml right join test using(ml_id) ;

-- Find tests where student name is missing (if any).

select * from ml right join test using(ml_id) where name is null;

-- FULL JOIN (or FULL OUTER JOIN)

-- Combine all records from both tables where match exists or not.

-- Show all students + all tests and highlight unmatched rows.

-- (If your DB doesn’t support FULL JOIN → mention, I’ll adjust)

-- CROSS JOIN

-- Show every possible combination of student name and subject.

select * from ml cross join test;

-- Count total number of combinations returned.

select count(* from ml cross join test);

-- NATURAL JOIN

-- Show test details with names using NATURAL JOIN.

-- Show student name + marks sorted by marks DESC using NATURAL JOIN.

-- OUTER JOIN (concept total)

-- Show all test records and student names using FULL OUTER JOIN.

-- Show who has given tests and who has not with OUTER JOIN.

					# Operators (=, >, <, BETWEEN, IN)

-- Get students who scored between 80 and 90.

select * from ml join test using(ml_id) where marks between 80 and 90; 

-- Show records where subject is IN ('Python','SQL','Networking').

select * from ml join test using(ml_id) where subject in ('python','sql','networking');

                      # LIKE / NOT LIKE

-- Show all students whose name starts with 'R'.

select * from ml where name like 'R%';

-- Show subjects that do not contain the letter 'n'.

select * from test where subject not like '%n%';

                        # DISTINCT

-- Show unique course names from ml.

select distinct course from ml;

-- Show unique subjects from test.

select distinct subject from test;

                          # VIEW

-- Create a view that stores name, subject, and marks.

create view store as (select m.name,t.subject,t.marks from ml m join test t using(ml_id));

-- Select all data from the created view where marks > 85.

select * from store where marks > 85;

                         # GROUP BY + HAVING

-- Count how many tests each student has given.

select m.name,count(test_id) as Total_test from ml m join test t using(ml_id) group by m.name; 

select * from test;

-- Show students who have given more than 1 test.

select m.name,count(test_id) as Total_test from ml m join test t using(ml_id) group by m.name having Total_test > 1;

                              # SUBQUERY

-- Show student details who got the highest marks.

select * from ml join test using(ml_id) where marks = (select max(marks) from test); 


select max(marks) from test;

-- List subjects for which marks are above average marks.

select name ,subject, marks from ml join test using(ml_id) where marks > (select avg(marks) from test);

select avg(marks) from test;

                       # WINDOW FUNCTIONS

-- Show student name, subject, marks, and a rank based on marks.

select name,subject, rank() over (order by marks DESC) as Rank_of_marks from ml join test using(ml_id);

-- Show total marks of each student using Window SUM().

select name,subject, sum(marks) over (partition by name) as Total_marks from ml join test using(ml_id);

						# CTE (WITH)

-- Use a CTE to find average marks and display tests above average.



-- Use CTE to display number of tests per student.



						# STORED PROCEDURE

-- Create a procedure to fetch test details by student id.

-- Create a procedure that displays students with marks above 80.

-- TRIGGER

Create a trigger on test table that logs insert into audit table.

Create a trigger to prevent inserting marks more than 100.

