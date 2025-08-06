USE AIT_1A;

-- LEVEL (MEDIUM) 

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    ManagerID INT NULL  
);

INSERT INTO Employee (EmpID, EmpName, Department, ManagerID)
VALUES
(1, 'Alice', 'HR', NULL),        
(2, 'Bob', 'Finance', 1),
(3, 'Charlie', 'IT', 1),
(4, 'David', 'Finance', 2)

SELECT * FROM Employee;

--SELF JOIN : LEFT/ RIGHT

SELECT E1.EmpName AS [Employee Name], E2.EmpName AS [Manager Name],
	E1.Department AS [Employee Dept], E2.Department AS [Manager Dept]
FROM
Employee AS E1
LEFT OUTER JOIN
Employee AS E2
ON
E1.ManagerID = E2.EmpID;

-- LEVEL (MEDIUM) 

    CREATE TABLE Year_tbl (
      ID INT,
      YEAR INT,
      NPV INT
  );


  -- Insert data into Year_tbl
  INSERT INTO Year_tbl (ID, YEAR, NPV)
  VALUES
  (1, 2018, 100),
  (7, 2020, 30),
  (13, 2019, 40),
  (1, 2019, 113),
  (2, 2008, 121),
  (3, 2009, 12),
  (11, 2020, 99),
  (7, 2019, 0);
    CREATE TABLE Queries (
      ID INT,
      YEAR INT
  );

  -- Insert data into Queries
  INSERT INTO Queries (ID, YEAR)
  VALUES
  (1, 2019),
  (2, 2008),
  (3, 2009),
  (7, 2018),
  (7, 2019),
  (7, 2020),
  (13, 2019);

SELECT Q.ID, Q.YEAR, ISNULL(Y.NPV,0)  --IFNULL(Y.NPV,0) --WORKBENCH USERS
FROM Queries AS Q
LEFT OUTER JOIN
YEAR_TBL AS Y
ON
Q.ID = Y.ID
AND Q.YEAR= Y.YEAR;
