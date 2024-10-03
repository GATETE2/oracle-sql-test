
--- CREATION OF TABLES 

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(255)
);

CREATE TABLE Fuel (
    FuelID INT PRIMARY KEY,
    Type VARCHAR(50),
    PricePerLiter DECIMAL(5,2)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50)
);

CREATE TABLE Sale (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    FuelID INT,
    Quantity DECIMAL(10,2),
    SaleDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (FuelID) REFERENCES Fuel(FuelID)
);


-- INSERTING VALUES IN TABLES
 -- Inserting values in customer table

INSERT INTO Customer (CustomerID, Name, ContactInfo) 
VALUES 
(1, 'John Doe', '555-1234'),
(2, 'Alice Johnson', '555-5678'),
(3, 'Michael Brown', '555-4321'),
(4, 'Emily Davis', '555-8765'),
(5, 'David Wilson', '555-3456');

-- Inserting values in Fueltable

INSERT INTO Fuel (FuelID, Type, PricePerLiter) 
VALUES 
(1, 'Diesel', 1.20),
(2, 'Gasoline', 1.50),
(3, 'Premium Gasoline', 1.80),
(4, 'Kerosene', 1.10),
(5, 'Propane', 2.00);

--Inserting values in Employeetable

INSERT INTO Employee (EmployeeID, Name, Role) 
VALUES 
(1, 'Jane Smith', 'Cashier'),
(2, 'Mark Johnson', 'Manager'),
(3, 'Sara Lee', 'Technician'),
(4, 'Robert Green', 'Security'),
(5, 'Laura White', 'Accountant');


--Inserting values in Saletable


INSERT INTO Sale (SaleID, CustomerID, EmployeeID, FuelID, Quantity, SaleDate) 
VALUES 
(1, 1, 1, 1, 50, TO_DATE('2024-09-29', 'YYYY-MM-DD')),
(2, 2, 2, 2, 30, TO_DATE('2024-09-30', 'YYYY-MM-DD')),
(3, 3, 3, 3, 40, TO_DATE('2024-09-28', 'YYYY-MM-DD')),
(4, 4, 4, 4, 20, TO_DATE('2024-09-27', 'YYYY-MM-DD')),
(5, 5, 5, 5, 60, TO_DATE('2024-09-26', 'YYYY-MM-DD'));


---------------------------------------------------------DDL (Data Definition Language) Operations--------------------------
 DDL (Data Definition Language) Operations
DDL commands are used to define or modify database structures.
CREATE TABLE FuelPriceHistory (
    PriceHistoryID NUMBER(38) PRIMARY KEY,
    FuelID NUMBER(38),
    OldPricePerLiter NUMBER(10, 2),
    NewPricePerLiter NUMBER(10, 2),
    ChangeDate DATE,
    FOREIGN KEY (FuelID) REFERENCES Fuel(FuelID)
);




--------------------------------------------------------------Insert, Update, and Delete Data (DML - Data Manipulation Language)----------------------------

--Insert Data:
INSERT INTO Customer (CustomerID, Name, ContactInfo) VALUES (1, 'John Doe', '555-1234');
INSERT INTO Fuel (FuelID, Type, PricePerLiter) VALUES (1, 'Diesel', 1.20);
INSERT INTO Employee (EmployeeID, Name, Role) VALUES (1, 'Jane Smith', 'Cashier');
INSERT INTO Sale (SaleID, CustomerID, EmployeeID, FuelID, Quantity, SaleDate) 
VALUES (1, 1, 1, 1, 50, TO_DATE('2024-09-29', 'YYYY-MM-DD'));

--Update Data:
UPDATE Customer SET ContactInfo = '555-5678' WHERE CustomerID = 1;

--Delete Data:
DELETE FROM Sale WHERE SaleID = 1;


-------------------------------------------------------------DCL (Data Control Language) Operations----------------------------------------
DCL (Data Control Language) Operations

Grant Privileges
To grant select permission on the Sale table to a user (for example, user123):

GRANT SELECT ON Sale TO user123
To revoke select permission from the same user:

REVOKE SELECT ON Sale FROM user123;


------------------------------------------------------------TCL (Transaction Control Language) Operations-------------------------------------
TCL (Transaction Control Language) Operations
TCL commands manage the changes made by DML statements.

Commit
To save the changes made:


COMMIT;
Rollback
To undo the last changes if needed:


ROLLBACK;


---------------------------------------------INNER JOIN ------------------------------

SELECT 
    s.SaleID, 
    c.Name AS CustomerName, 
    e.Name AS EmployeeName, 
    f.Type AS FuelType, 
    s.Quantity, 
    s.SaleDate 
FROM 
    Sale s
INNER JOIN 
    Customer c ON s.CustomerID = c.CustomerID
INNER JOIN 
    Employee e ON s.EmployeeID = e.EmployeeID
INNER JOIN 
    Fuel f ON s.FuelID = f.FuelID;


-------------------------------------------LEFT JOIN--------------------------------

SELECT 
    s.SaleID, 
    c.Name AS CustomerName, 
    e.EmployeeName AS EmployeeName, 
    f.Type AS FuelType, 
    s.Quantity, 
    s.SaleDate 
FROM 
    Sale s
LEFT JOIN 
    Customer c ON s.CustomerID = c.CustomerID
LEFT JOIN 
    Employee e ON s.EmployeeID = e.EmployeeID
LEFT JOIN 
    Fuel f ON s.FuelID = f.FuelID;


----------------------------------------SUBQUERY EXAMPLE------------------------------

SELECT * 
FROM Employee 
WHERE EmployeeID IN (
    SELECT EmployeeID 
    FROM Sale 
    GROUP BY EmployeeID 
    HAVING SUM(Quantity) > 100
);

-----------------------------------------SUBQUERY EXAMPLE 2------------------------------


SELECT * FROM Sale 
WHERE CustomerID IN (
    SELECT CustomerID 
    FROM Sale 
    WHERE Quantity > 40
);



----------------------------------
1. Basic SQL Commands
SELECT Command

--SELECT * FROM Customer;

--INSERT INTO Customer (CustomerID, Name, ContactInfo) 
VALUES (6, 'Sophia Turner', '555-6789');

--UPDATE Customer 
SET ContactInfo = '555-9999' 
WHERE CustomerID = 1; -- Update John Doe's contact info

--DELETE FROM Customer 
WHERE CustomerID = 6; -- Delete Sophia Turner











