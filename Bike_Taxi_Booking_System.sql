--Step 1: Database Creation

CREATE DATABASE BikeTaxiBooking;
USE BikeTaxiBooking;

--Step 2: Create the Riders Table
CREATE TABLE Riders (
    RiderID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    VehicleNumber VARCHAR(20) UNIQUE NOT NULL,
    City VARCHAR(50) NOT NULL
);

--Step 3: Create the Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    WalletBalance DECIMAL(10,2) DEFAULT 0.00
);

--Step 4: Create the Rides Table
CREATE TABLE Rides (
    RideID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    RiderID INT NOT NULL,
    PickupLocation VARCHAR(100) NOT NULL,
    DropLocation VARCHAR(100) NOT NULL,
    Fare DECIMAL(10,2) NOT NULL CHECK (Fare >= 0),
    RideDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status ENUM('Booked', 'Ongoing', 'Completed', 'Cancelled') DEFAULT 'Booked',

    CONSTRAINT fk_customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    CONSTRAINT fk_rider FOREIGN KEY (RiderID) REFERENCES Riders(RiderID) ON DELETE CASCADE
);

--Step 5: Verify Relationships and Constraints
DESCRIBE Riders;
DESCRIBE Customers;
DESCRIBE Rides;

--Step 6: Insert Sample Records
-- Insert Riders
INSERT INTO Riders (Name, Phone, VehicleNumber, City)
VALUES 
('Venkatesh Pamudurti', '9876543210', 'AP09AB1234', 'Guntur'),
('Lakshmi Sesha Sai', '9876501234', 'AP09BC5678', 'Vijayawada');

-- Insert Customers
INSERT INTO Customers (Name, Phone, WalletBalance)
VALUES 
('Venkatesh Pamudurti', '9998887776', 500.00),
('Lakshmi Sesha Sai', '8887776665', 250.00);

-- Insert Rides
INSERT INTO Rides (CustomerID, RiderID, PickupLocation, DropLocation, Fare, Status)
VALUES
(1, 1, 'Guntur Bus Stand', 'Railway Station', 120.00, 'Completed'),
(2, 2, 'Benz Circle', 'Bus Station', 90.00, 'Booked');

--Step 7: Sample Queries for Validation
-- 1. View all rides with customer and rider details
SELECT 
    R.RideID, 
    C.Name AS CustomerName,
    Rd.Name AS RiderName,
    R.PickupLocation, R.DropLocation, R.Fare, R.Status
FROM Rides R
JOIN Customers C ON R.CustomerID = C.CustomerID
JOIN Riders Rd ON R.RiderID = Rd.RiderID;

-- 2. Show all completed rides
SELECT * FROM Rides WHERE Status = 'Completed';

-- 3. Total rides handled by each rider
SELECT RiderID, COUNT(*) AS TotalRides
FROM Rides
GROUP BY RiderID;
