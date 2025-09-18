use joins1;

-- Create the SAILORS table
CREATE TABLE SAILORS (
    sid INT PRIMARY KEY,
    sname VARCHAR(50),
    rating INT,
    age DECIMAL(5, 2)
);

-- Insert data into the SAILORS table
INSERT INTO SAILORS (sid, sname, rating, age) VALUES
(22, 'Dustin', 7, 45),
(29, 'Brutus', 1, 33),
(31, 'Lubber', 8, 55.5),
(32, 'Andy', 8, 25.5),
(58, 'Rusty', 10, 35),
(64, 'Horatio', 7, 35),
(71, 'Zorba', 10, 16),
(74, 'Horatio', 9, 35),
(85, 'Art', 3, 25.5),
(95, 'Bob', 3, 63.5);

-- Create the RESERVES table
CREATE TABLE RESERVES (
    sid INT,
    bid INT,
    day DATE,
    FOREIGN KEY (sid) REFERENCES SAILORS(sid),
    FOREIGN KEY (bid) REFERENCES BOATS(bid)
);

-- Insert data into the RESERVES table
INSERT INTO RESERVES (sid, bid, day) VALUES
(22, 101, '1998-10-10'),
(22, 102, '1998-10-10'),
(22, 103, '1998-10-08'),
(22, 104, '1998-10-07'),
(31, 102, '1998-11-10'),
(31, 103, '1998-11-06'),
(31, 104, '1998-11-12'),
(64, 101, '1998-09-05'),
(64, 102, '1998-09-08'),
(74, 103, '1998-09-08');

-- Create the BOATS table
CREATE TABLE BOATS (
    bid INT PRIMARY KEY,
    bname VARCHAR(50),
    color VARCHAR(20)
);

-- Insert data into the BOATS table
INSERT INTO BOATS (bid, bname, color) VALUES
(101, 'Interlake', 'blue'),
(102, 'Interlake', 'red'),
(103, 'Clipper', 'green'),
(104, 'Marine', 'red');


select * from sailors;
select * from reserves;
select * from boats;

-- Question -1 Find the names of sailors who have reserved boat 103?

select sname,bid from sailors join reserves using(sid) where bid = 103; 

-- Question-2 Find the colors of boats reserved by Lubber?

select sname,bid,color from boats join reserves using(bid) join sailors using(sid) where sname = "lubber";

-- Question -3 Find the names of sailors who have reserved a red or a green boat?

select sname,bid,color from boats join reserves using(bid) join sailors using(sid) where color in ('red','green');

-- Question 4: Find the names of sailors who have reserved both boat 101 and boat 102.

select sname,sid,bid from sailors join reserves using(sid) where bid in ('101','102'); 

-- Question 5: Find the names of sailors who have never reserved a red boat.

select sname,color,bid from sailors join reserves using(sid) join boats using(bid) where color not in ('red');

-- Question 6: Find the sailors who are older than 30 years and have reserved a boat.

select sname,age,bid,sid from sailors join reserves using(sid) where age >30;

-- Question 7: Find the average age of sailors who have reserved a green boat.

select bid,sid,sname,age,color,(age+age+age)/3 as avg_is from sailors join reserves using(sid) join boats using(bid) where color like 'green';

-- Question 8: Find the sailor names along with the number of boats they have reserved.



-- Question 9: List the boat names that have never been reserved.

select * from reserves join boats using(bid) where sid is null;

-- Question 10: Find the names of sailors who have reserved at least two different boats on the same day.

select sname from sailors join reserves using(sid) where ;

-- Question 11: Find the sailors who have reserved boats more than three times.

select * from sailors join reserves using(sid) where sid > 3; -----------

-- Question 12: List all sailors and the total number of different days they have made reservations.



-- Question 13: Find the sailor with the highest rating.

select * from sailors order by rating desc limit 1;

-- Question 14: Find the sailor who is youngest but has reserved a boat.

select * from sailors s join reserves r on s.sid = r.sid order by age limit 1;

-- Question 15: Find the total number of reservations made for each boat.

