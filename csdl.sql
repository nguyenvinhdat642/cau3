-- Create Customers table
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) NOT NULL
);

-- Create Products table
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customers(CustomerID),
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50) NOT NULL
);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID INT REFERENCES Orders(OrderID),
    ProductID INT REFERENCES Products(ProductID),
    Quantity INT NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL
);

-- Create DeliveryStaff table
CREATE TABLE DeliveryStaff (
    StaffID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    CurrentLocation VARCHAR(100)
);

-- Create Assignments table
CREATE TABLE Assignments (
    AssignmentID SERIAL PRIMARY KEY,
    OrderID INT REFERENCES Orders(OrderID),
    StaffID INT REFERENCES DeliveryStaff(StaffID),
    Status VARCHAR(50) NOT NULL
);
