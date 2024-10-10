use jensi;
CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);
CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    JobTitle VARCHAR(45),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);
CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
INSERT INTO Company (CompanyID, CompanyName, Street, City, State, Zip) VALUES
(1, 'Urban Outfitters, Inc.', '5000 S Broad St', 'Philadelphia', 'PA', '19112');

INSERT INTO Contact (ContactID, CompanyID, FirstName, LastName, Street, City, State, Zip, IsMain, Email, Phone) VALUES
(1, 1, 'John', 'Doe', '5000 S Broad St', 'Philadelphia', 'PA', '19112', TRUE, 'johndoe@example.com', '215-555-1234');

INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary, HireDate, JobTitle, Email,Phone) VALUES
(1, 'Lesley', 'Bland', 60000.00, '2019-05-15', 'Manager', 'lesley.bland@marketco.com','1235478966');

INSERT INTO ContactEmployee (ContactEmployeeID, ContactID, EmployeeID, ContactDate, Description) VALUES
(1, 1, 1, '2023-03-12', 'Contacted for project discussion');

SELECT * FROM Company;
SELECT * FROM Contact;
SELECT * FROM Employee;
SELECT * FROM ContactEmployee;

/*4.In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800*/
 UPDATE Employee 
SET Phone = '215-555-8800' 
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

/*5.In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters” .*/
UPDATE Company 
SET CompanyName = 'Urban Outfitters' 
WHERE CompanyName = 'Urban Outfitters, Inc.';

/*6.In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee (one statement).*/
DELETE FROM ContactEmployee 
WHERE ContactID = (SELECT ContactID FROM Contact WHERE FirstName = 'Dianne' AND LastName = 'Connor')
  AND EmployeeID = (SELECT EmployeeID FROM Employee WHERE FirstName = 'Jack' AND LastName = 'Lee');
  
/*7.Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). 
Run the SQL SELECT query in MySQL Workbench. Copy the results below as well. */
SELECT e.FirstName, e.LastName
FROM Employee e
JOIN ContactEmployee ce ON e.EmployeeID = ce.EmployeeID
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Company co ON c.CompanyID = co.CompanyID
WHERE co.CompanyName = 'Toll Brothers';

/*8.What is the significance of “%” and “_” operators in the LIKE statement?  
  ANS=>
  % matches any sequence of characters (0 or more).
_ matches exactly one character.
Example:
LIKE 'A%' matches any string that starts with 'A'.
LIKE '_b%' matches strings where the second letter is 'b' 

9.Explain normalization in the context of databases. 
 Normalization is the process of organizing data to minimize redundancy and improve data integrity. It involves dividing large tables into smaller ones and defining relationships between them. The main goals are to eliminate redundant data and ensure that data dependencies are logical. The most common normal forms are:

1NF (First Normal Form): Ensures that the table has no repeating groups or arrays.
2NF (Second Normal Form): Ensures that all non-key columns are fully dependent on the primary key.
3NF (Third Normal Form): Ensures that no transitive dependencies exist.

10. What does a join in MySQL mean?
 A JOIN in MySQL is used to combine rows from two or more tables, based on a related column between them. Common types of JOINs include:

INNER JOIN: Returns rows that have matching values in both tables.
LEFT JOIN (or LEFT OUTER JOIN): Returns all rows from the left table and matched rows from the right table.
RIGHT JOIN (or RIGHT OUTER JOIN): Returns all rows from the right table and matched rows from the left table.
FULL JOIN: Returns all rows when there is a match in either table.

11.What do you understand about DDL, DCL, and DML in MySQL?
 DDL (Data Definition Language): Deals with schema and database structure (e.g., CREATE, ALTER, DROP).
DML (Data Manipulation Language): Deals with data manipulation (e.g., INSERT, UPDATE, DELETE).
DCL (Data Control Language): Deals with rights and permissions (e.g., GRANT, REVOKE).

12.What is the role of the MySQL JOIN clause in a query, and what are some 
common types of joins? 
The MySQL JOIN clause is used to retrieve data from multiple tables based on a related column. The most common types of JOINs are:

INNER JOIN: Fetches records that have matching values in both tables.
LEFT JOIN: Fetches all records from the left table and matching records from the right table.
RIGHT JOIN: Fetches all records from the right table and matching records from the left table.

*/
*/



