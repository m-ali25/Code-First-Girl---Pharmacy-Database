-- Creating Pharmacy database
CREATE DATABASE pharmacy;

USE pharmacy;

-- Table containing information on Drugs supplied within the Pharmacy
CREATE TABLE Drugs (
    DrugID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Manufacturer VARCHAR(255),
    QuantityInStock INT,
    Price DECIMAL(10, 2)
);

-- Inserting data into Drugs table such as name, manufacture, quantity and price
INSERT INTO Drugs (DrugID, Name, Manufacturer, QuantityInStock, Price)
VALUES
  (1, 'Paracetamol', 'Bayer', 150, 0.99),
  (2, 'Ibuprofen', 'Bayer', 100, 0.44),
  (3, 'Aspirin', 'Bayer', 110, 3.99),
  (4, 'Amoxicillin', 'Accord', 30, 12.25),
  (5, 'Sumatriptan', 'Pizer', 25, 15.50),
  (6, 'Naproxen', 'GSK', 56, 9.99),
  (7, 'Pseudoephedrine', 'Novartis', 78, 5.45),
  (8, 'Atorvastatin', 'Merck', 35, 19.99),
  (9, 'Metformin', 'Accord', 22, 20.00),
  (10, 'Ventrolin', 'GSK', 14, 14.49),
  (11, 'Codeine', 'Merck', 47, 22.73),
  (12, 'Morphine', 'Pizer', 59, 16.28),
  (13, 'Bisacodyl', 'Novartis', 82, 7.75),
  (14, 'Cetirizine', 'Bayer', 20, 11.55),
  (15, 'Lansoprazol', 'Bayer', 11, 12.89),
  (16, 'Fluconazole', 'Accord', 3, 9.99),
  (17, 'Hydrocortisone', 'GSK', 26, 22.27),
  (18, 'Insulin', 'Pfizer', 5, 186.00),
  (19, 'Ketoconazole', 'Merck', 18, 15.00),
  (20, 'Loperamide', 'Accord', 62, 5.50);
  
-- Table containing information on suppliers
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ContactPerson VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

-- Inserting data into Suppliers table such as Name, person to contact and their phone number
INSERT INTO Suppliers (SupplierID, Name, ContactPerson, PhoneNumber)
VALUES
  (1, 'Bayer Pharmaceuticals', 'John Doe', '12345678901'),
  (2, 'Accord Healthcare', 'Jane Smith', '74658274637'),
  (3, 'Pfizer Inc.', 'Bob Johnson', '47364823648'),
  (4, 'GSK plc', 'Alice Brown', '36583758395'),
  (5, 'Novartis Pharma', 'Charlie White', '26483957275'),
  (6, 'Merck Distributors', 'David Anderson', '27463789756');

-- Table containing drug-supplier relationship
CREATE TABLE DrugSupplier (
    DrugID INT,
    SupplierID INT,
    PRIMARY KEY (DrugID, SupplierID),
    FOREIGN KEY (DrugID) REFERENCES Drugs(DrugID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Inserting data into DrugSupplier table, Showing the relationship between the drugs and the suppliers
INSERT INTO DrugSupplier (DrugID, SupplierID)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 2),
  (5, 3),
  (6, 4),
  (7, 5),
  (8, 6),
  (9, 2),
  (10, 4),
  (11, 6),
  (12, 3),
  (13, 5),
  (14, 1),
  (15, 1),
  (16, 2),
  (17, 4),
  (18, 3),
  (19, 6),
  (20, 2);
  
  -- Table containg customer's information 
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

-- Inserting data into Customers table such as name, email and phone number 
INSERT INTO Customers (CustomerID, Name, Email, PhoneNumber)
VALUES
  (1, 'John Smith', 'john.smith@email.com', '74859485748'),
  (2, 'Mary Johnson', 'mary.johnson@email.com', '83625194756'),
  (3, 'Robert Davis', 'robert.davis@email.com', '92517342906'),
  (4, 'Lisa Taylor', 'lisa.taylor@email.com', '53726184635'),
  (5, 'Ant Does', 'ant.does@email.com', '43526178965'),
  (6, 'Johnny Depp', 'johnny.depp@email.com', '82548163829'),
  (7, 'Angelina Jolie', 'angelina.jolie@email.com', '12345678901'),
  (8, 'Charlie Chaplin', 'charlie.chaplin@email.com', '62534178490'),
  (9, 'Dwayne Johnson', 'dwayne.johnson@email.com', '91992233445'),
  (10, 'Brad Pitt', 'brad.pitt@email.com', '19283746574'),
  (11, 'Julia Roberts', 'julia.roberts@email.com', '23456789012'),
  (12, 'Jim Carrey', 'jim.carrey@email.com', '34567890123'),
  (13, 'Liam Newman', 'liam.newman@email.com', '45678901234'),
  (14, 'Meryl Streep', 'meryl.streep@email.com', '56789012345'),
  (15, 'Bruce Lee', 'bruce.lee@email.com', '67890123456') ;
  
-- Table containing information of sales
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    SaleDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Inserting data into Sales table such as customer ID, date and amount of sale
INSERT INTO Sales (SaleID, CustomerID, SaleDate, TotalAmount)
VALUES
  (1, 1, '2024-01-15', 35.97),
  (2, 2, '2023-12-28', 45.50),
  (3, 3, '2023-12-22', 21.25),
  (4, 4, '2023-12-15', 33.75),
  (5, 5, '2023-11-20', 68.97),
  (6, 6, '2023-11-11', 18.15),
  (7, 7, '2023-11-02', 100.00),
  (8, 8, '2023-10-23', 15.50),
  (9, 9, '2023-10-19', 84.50),
  (10, 10, '2023-09-30', 120.00),
  (11, 11, '2023-09-16', 52.00),
  (12, 12, '2023-09-01', 33.99),
  (13, 13, '2023-08-22', 78.65),
  (14, 14, '2023-08-01', 22.00),
  (15, 15, '2023-08-01', 12.99) ;

-- Table cotaining information that links sales transactions, customers, sale date and total amount.
CREATE TABLE SaleItems (
    SaleID INT,
    DrugID INT,
    Quantity INT,
    Subtotal DECIMAL(10, 2),
    PRIMARY KEY (SaleID, DrugID),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (DrugID) REFERENCES Drugs(DrugID)
);

-- Inserting data into SaleItems table
INSERT INTO SaleItems (SaleID, DrugID, Quantity, Subtotal)
VALUES
(1, 3, 1, 5.97),
(1, 4, 2, 30.50),
(2, 1, 4, 23.96),
(2, 5, 3, 68.97),
(3, 2, 1, 12.50),
(4, 3, 3, 26.25),
(4, 5, 2, 45.98),
(4, 20, 5, 80.00),
(5, 1, 2, 11.98),
(5, 2, 1, 12.50),
(6, 18, 4, 55.00),
(7, 8, 6, 79.00),
(7, 9, 2, 10.00),
(8, 10, 1, 14.49);

-- Table for tracking inventory
CREATE TABLE Inventory (
    DrugID INT PRIMARY KEY,
    StockLevel INT,
    LastStockUpdate DATE,
    FOREIGN KEY (DrugID) REFERENCES Drugs(DrugID)
);

-- Inserting data into Inventory table
INSERT INTO Inventory (DrugID, StockLevel, LastStockUpdate)
VALUES
(1, 150, '2023-01-01'),
(2, 100, '2023-01-02'),
(3, 110, '2023-01-03'),
(4, 30, '2023-01-04'),
(5, 25, '2023-01-05'),
(6, 56, '2023-01-06'),
(7, 78, '2023-01-07'),
(8, 35, '2023-01-08'),
(9, 22, '2023-01-09'),
(10, 14, '2023-01-10'),
(11, 47, '2023-01-11'),
(12, 59, '2023-01-12'),
(13, 82, '2023-01-13'),
(14, 20, '2023-01-14'),
(15, 11, '2023-01-15'),
(16, 3, '2023-01-16'),
(17, 26, '2023-01-17'),
(18, 5, '2023-01-18'),
(19, 18, '2023-01-19'),
(20, 62, '2023-01-20');


-- Using join to create a view that combines multiple tables in a logical way
SELECT Drugs.*, Suppliers.Name AS SupplierName
FROM Drugs
INNER JOIN DrugSupplier ON Drugs.DrugID = DrugSupplier.DrugID
INNER JOIN Suppliers ON DrugSupplier.SupplierID = Suppliers.SupplierID;


-- Creating a stored function that can be applied to a query
DELIMITER //

CREATE FUNCTION CheckDiscountEligibility(
    p_total_purchase_amount DECIMAL(10, 2)
) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE is_eligible BOOLEAN;

    IF p_total_purchase_amount >= 100.00 THEN
        SET is_eligible = TRUE;
    ELSE
        SET is_eligible = FALSE;
    END IF;

    RETURN is_eligible;
END //

DELIMITER ;

SELECT CheckDiscountEligibility(120.50) AS EligibleForDiscount;


-- Query with a subquery to demonstrate how to extract data from the database for analysis 
SELECT 
    CustomerID,
    Name AS CustomerName,
    TotalPurchaseAmount
FROM
    (SELECT 
        s.CustomerID,
        c.Name,
        SUM(s.TotalAmount) AS TotalPurchaseAmount
    FROM 
        Sales s
    JOIN 
        Customers c ON s.CustomerID = c.CustomerID
    GROUP BY 
        s.CustomerID) AS CustomerPurchase
WHERE 
    TotalPurchaseAmount > (
        SELECT 
            AVG(TotalAmount) 
        FROM 
            Sales
    );
    
    
-- Createing a stored procedure 
DELIMITER //

CREATE PROCEDURE GetSalesForCustomer(IN p_CustomerID INT)
BEGIN
    SELECT *
    FROM Sales
    WHERE CustomerID = p_CustomerID;
END //

DELIMITER ;

CALL GetSalesForCustomer(1);


-- Createing a view that uses at least 3-4 base tables; prepare and demonstrate a query that uses the view to produce a 
-- logically arranged result set for analysis.
CREATE VIEW SalesSummary AS
SELECT
    s.SaleID,
    s.SaleDate,
    c.Name AS CustomerName,
    d.Name AS DrugName,
    si.Quantity,
    si.Subtotal
FROM
    Sales s
JOIN
    SaleItems si ON s.SaleID = si.SaleID
JOIN
    Customers c ON s.CustomerID = c.CustomerID
JOIN
    Drugs d ON si.DrugID = d.DrugID;
    
SELECT
    DrugName,
    SUM(Quantity) AS TotalQuantitySold
FROM
    SalesSummary
GROUP BY
    DrugName
ORDER BY
    TotalQuantitySold DESC;
    

-- Creating an event 
DELIMITER //

CREATE EVENT UpdateInventoryStatus
ON SCHEDULE
    EVERY 1 MONTH
    STARTS CURRENT_TIMESTAMP
DO
BEGIN
    UPDATE Inventory
    SET Status = 'Out of Stock'
    WHERE Quantity = 0;
END //

DELIMITER ;

SELECT * FROM Inventory;