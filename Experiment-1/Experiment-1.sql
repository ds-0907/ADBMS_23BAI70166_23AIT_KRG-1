CREATE DATABASE AIT_1A;
USE AIT_1A;

-- Easy Level Problem Solution: Author-Book Relationship Using Joins and Basic SQL Operations

CREATE TABLE TBL_AUTHOR
(
	AUTHOR_ID INT PRIMARY KEY,
	AUTHOR_NAME VARCHAR(MAX),
	COUNTRY VARCHAR(MAX)
);

CREATE TABLE TBL_BOOKS
(	
	BOOK_ID INT PRIMARY KEY,
	BOOK_TITLE VARCHAR(MAX),
	AUTHOR_ID INT,
	FOREIGN KEY (AUTHOR_ID) REFERENCES TBL_AUTHOR(AUTHOR_ID)
);

INSERT INTO TBL_AUTHOR (AUTHOR_ID, AUTHOR_NAME, COUNTRY) VALUES
(1, 'Ernest Hemingway', 'United States'),
(2, 'Franz Kafka', 'Czech Republic'),
(3, 'Khaled Hosseini', 'Afghanistan'),
(4, 'Margaret Atwood', 'Canada'),
(5, 'Orhan Pamuk', 'Turkey'),
(6, 'Albert Camus', 'France');

INSERT INTO TBL_BOOKS (BOOK_ID, BOOK_TITLE, AUTHOR_ID) VALUES
(1, 'The Old Man and the Sea', 1),
(2, 'The Metamorphosis', 2),
(3, 'The Kite Runner', 3),
(4, 'The Handmaid''s Tale', 4),
(5, 'Snow', 5),
(6, 'The Stranger', 6);

SELECT B.BOOK_TITLE AS [Book Title], A.AUTHOR_NAME AS [Author Name], A.COUNTRY AS [Country]
FROM TBL_BOOKS AS B
INNER JOIN
TBL_AUTHOR AS A
ON
B.AUTHOR_ID = A.AUTHOR_ID;


-- Medium Level Problem Solution : Department-Course Subquery and Access Control

CREATE TABLE TBL_DEPARTMENT 
(
	DEPARTMENT_ID INT PRIMARY KEY,
	DEPARTMENT_NAME VARCHAR(100) NOT NULL
);

CREATE TABLE TBL_COURSE 
(
	COURSE_ID INT PRIMARY KEY,
	COURSE_NAME VARCHAR(100) NOT NULL,
	DEPARTMENT_ID INT,
	FOREIGN KEY (DEPARTMENT_ID) REFERENCES TBL_DEPARTMENT(DEPARTMENT_ID)
);

INSERT INTO TBL_DEPARTMENT (DEPARTMENT_ID, DEPARTMENT_NAME) VALUES
(1, 'Electrical Engineering'),
(2, 'Mechanical Engineering'),
(3, 'Civil Engineering'),
(4, 'Biology'),
(5, 'Economics');

INSERT INTO TBL_COURSE (COURSE_ID, COURSE_NAME, DEPARTMENT_ID) VALUES
(1, 'Circuit Analysis', 1),
(2, 'Digital Signal Processing', 1),
(3, 'Power Systems', 1),
(4, 'Thermodynamics', 2),
(5, 'Fluid Mechanics', 2),
(6, 'Structural Analysis', 3),
(7, 'Geotechnical Engineering', 3),
(8, 'Genetics', 4),
(9, 'Microbiology', 4),
(10, 'Macroeconomics', 5),
(11, 'International Trade', 5);


--Subquery used to filter and retrieve only those departments that offer more than two courses.

SELECT D.DEPARTMENT_NAME, (
SELECT COUNT(*) FROM TBL_COURSE C
WHERE C.DEPARTMENT_ID = D.DEPARTMENT_ID) AS COURSECOUNT
FROM TBL_DEPARTMENT D;

SELECT DEPARTMENT_NAME
FROM TBL_DEPARTMENT D
WHERE 
(
    SELECT COUNT(*) FROM TBL_COURSE C
	WHERE C.DEPARTMENT_ID = D.DEPARTMENT_ID
) >= 2;

--Granted SELECT-only access on the courses table to a specific user.

CREATE LOGIN TEST_LOGIN_DEVANSH
WITH PASSWORD = 'LOGIN@321';

CREATE USER TEST_LOGIN_DEVANSH
FOR LOGIN TEST_LOGIN_DEVANSH;

EXECUTE AS USER = 'TEST_USER_DEVANSH';

GRANT SELECT ON TBL_COURSE TO TEST_LOGIN_DEVANSH;
