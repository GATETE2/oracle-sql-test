

# Fuel Management System - SQL Database
## Problem Statement

This project involves the design and implementation of a Fuel Management System using an Oracle SQL database. The system is designed to streamline and automate the management of fuel sales, ensuring accurate and efficient tracking of daily operations at fuel stations. It provides a centralized repository for managing key aspects of the business, including customer information, employee roles and details, fuel inventory, sales transactions, and payment processing. The system is designed to:

## Record sales transactions with details of the customer, employee, and fuel type.
## Store employee roles and customer contact information.
## Track payment details for each sale.

### SQL Commands Executed


1. Table Creation (DDL):

Created four tables: Customer, Employee, Fuel, and Sale, each representing key entities in the system.
Defined primary keys for each table, establishing unique identification.
Set relationships between tables, such as linking sales to both customers and employees.

```sql
CREATE TABLE Customer (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    ContactInfo VARCHAR2(100)
);
```

```sql
CREATE TABLE Employee (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(100)
);
```
```sql
CREATE TABLE Fuel (
    FuelID NUMBER PRIMARY KEY,
    Type VARCHAR2(50),
    PricePerLiter NUMBER(5, 2)
);




CREATE TABLE Sale (
    SaleID NUMBER PRIMARY KEY,
    CustomerID NUMBER REFERENCES Customer(CustomerID),
    EmployeeID NUMBER REFERENCES Employee(EmployeeID),
    FuelID NUMBER REFERENCES Fuel(FuelID),
    Quantity NUMBER,
    SaleDate DATE
);


2. ----------------------------Data Manipulation (DML)----------------------

Inserted sample data into all four tables to populate the system

INSERT INTO Customer (CustomerID, Name, ContactInfo) 
VALUES (1, 'John Doe', '555-1234'), (2, 'Alice Johnson', '555-5678');

INSERT INTO Employee (EmployeeID, EmployeeName) 
VALUES (1, 'Jane Smith'), (2, 'Mark Johnson');

INSERT INTO Fuel (FuelID, Type, PricePerLiter) 
VALUES (1, 'Diesel', 1.20), (2, 'Gasoline', 1.50);

INSERT INTO Sale (SaleID, CustomerID, EmployeeID, FuelID, Quantity, SaleDate) 
VALUES (1, 1, 1, 1, 50, TO_DATE('2024-09-29', 'YYYY-MM-DD'));


3.----------Data Retrieval (SELECT):-----------------------------------------

Used various SELECT statements to retrieve related data across tables, including customer names, employee names, fuel types, and sale details.

SELECT 
    s.SaleID, 
    c.Name AS CustomerName, 
    e.EmployeeName AS EmployeeName, 
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

----------------------------------Subqueries and Joins:------------------------------------------


INNER JOIN 
    Fuel f ON s.FuelID = f.FuelID;
Demonstrated subqueries to find customers who purchased the most fuel.
Performed joins to display customer purchases with employee and fuel details.
SELECT Name 
FROM Customer 
WHERE CustomerID = (SELECT CustomerID 
                    FROM Sale 
                    WHERE Quantity = (SELECT MAX(Quantity) FROM Sale));

--------------------------------------------Transactions (TCL):----------------------------------------------

Performed commit and rollback operations to ensure consistency during data manipulation.

BEGIN TRANSACTION;
-- SQL operations
COMMIT;
-- In case of errors:
ROLLBACK;
---------------------------------------------Screenshots----------------------------------
## They are found within the files in the repository there are saved as png


-------------------------------------------Conceptual Diagram:--------------------------------
It is found within the files images saved as png kindly find it above.





A diagram illustrating the relationships between the Customer, Employee, Fuel, and Sale tables. THE PNG OF THE CONCEPTUAL DIAGRAM IS IN THE SCRENSHOOTS IMAGES SAVED AS PNG It describes the tables created and the Relationships between them. 


--------------------------------------SQL Queries and Results:----------------------------------------

Screenshot showing the execution of the SELECT query joining the Sale, Customer, Employee, and Fuel tables.
Screenshot showing data inserts into the Sale table.
Screenshot of a subquery example.
Explanations of Results and Transactions
Results:

The JOIN query output displayed the details of each sale, showing which customers bought fuel, handled by which employee, and the type of fuel purchased.
Transactions:

-----------The system supported smooth data transactions, with successful COMMIT operations ensuring all changes were saved permanently.
Any errors in data modification were addressed using ROLLBACK, restoring the data to a previous state.