create database Ecommerce;

use Ecommerce;

CREATE TABLE products (
  ProductID INT PRIMARY KEY,
  Product VARCHAR(50),
  Category VARCHAR(50),
  Price DECIMAL(10,2)
);

INSERT INTO products (ProductID, Product, Category, Price) VALUES
(101, 'Bottle', 'Accessories', 10),
(102, 'Tire', 'Accessories', 15),
(103, 'Socks', 'Clothing', 20),
(104, 'Caps', 'Clothing', 25),
(105, 'Gloves', 'Clothing', 30),
(106, 'Helmet', 'Accessories', 40),
(107, 'Backpack', 'Accessories', 55),
(108, 'Jacket', 'Clothing', 60),
(109, 'Shoes', 'Clothing', 75),
(110, 'Watch', 'Accessories', 120),
(111, 'Shirt', 'Clothing', 35),
(112, 'Jeans', 'Clothing', 80),
(113, 'Water Filter', 'Accessories', 50),
(114, 'Sunglasses', 'Accessories', 95),
(115, 'Handbag', 'Accessories', 70);

CREATE VIEW V_product AS
SELECT productid, product, category from products;

select productid, product, category from V_product;

CREATE TABLE orders (
  OrderID INT,
  ProductID INT,
  CustomerID INT,
  SalesPersonID INT,
  OrderDate DATE,
  ShipDate DATE,
  OrderStatus VARCHAR(50),
  ShipAddress VARCHAR(100),
  BillAddress VARCHAR(100),
  Quantity INT,
  Sales DECIMAL(10,2),
  CreationTime TIME
);

INSERT INTO orders 
(OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime)
VALUES
(1, 101, 2, 3, STR_TO_DATE('01-01-2025', '%d-%m-%Y'), STR_TO_DATE('05-01-2025', '%d-%m-%Y'), 'Delivered', '9833 Mt. Dias Blv.', '1226 Shoe St.', 1, 10, '34:56:00'),
(2, 102, 3, 3, STR_TO_DATE('05-01-2025', '%d-%m-%Y'), STR_TO_DATE('10-01-2025', '%d-%m-%Y'), 'Shipped', '250 Race Court', NULL, 1, 15, '22:04:00'),
(3, 101, 1, 5, STR_TO_DATE('10-01-2025', '%d-%m-%Y'), STR_TO_DATE('25-01-2025', '%d-%m-%Y'), 'Delivered', '8157 W. Book', '8157 W. Book', 2, 20, '24:08:00'),
(4, 105, 1, 3, STR_TO_DATE('20-01-2025', '%d-%m-%Y'), STR_TO_DATE('25-01-2025', '%d-%m-%Y'), 'Shipped', '5724 Victory Lane', NULL, 2, 60, '50:33:00'),
(5, 104, 2, 5, STR_TO_DATE('01-02-2025', '%d-%m-%Y'), STR_TO_DATE('05-02-2025', '%d-%m-%Y'), 'Delivered', NULL, NULL, 1, 25, '02:41:00'),
(6, 104, 3, 5, STR_TO_DATE('05-02-2025', '%d-%m-%Y'), STR_TO_DATE('10-02-2025', '%d-%m-%Y'), 'Delivered', '1792 Belmont Rd.', NULL, 2, 50, '34:57:00'),
(7, 102, 1, 1, STR_TO_DATE('15-02-2025', '%d-%m-%Y'), STR_TO_DATE('27-02-2025', '%d-%m-%Y'), 'Delivered', '136 Balboa Court', NULL, 2, 30, '22:01:00'),
(8, 101, 4, 3, STR_TO_DATE('18-02-2025', '%d-%m-%Y'), STR_TO_DATE('27-02-2025', '%d-%m-%Y'), 'Shipped', '2947 Vine Lane', '4311 Clay Rd', 3, 90, '45:22:00'),
(9, 101, 2, 3, STR_TO_DATE('10-03-2025', '%d-%m-%Y'), STR_TO_DATE('15-03-2025', '%d-%m-%Y'), 'Shipped', '3768 Door Way', NULL, 2, 20, '59:04:00'),
(10, 102, 3, 5, STR_TO_DATE('15-03-2025', '%d-%m-%Y'), STR_TO_DATE('20-03-2025', '%d-%m-%Y'), 'Shipped', NULL, NULL, 0, 60, '25:15:00');

select * from orders;


create view v_delivery as 
select * from orders where orderstatus = 'Delivered';

select * from v_delivery;

use company;

select * from employees;


create database employee;

use employee;

CREATE TABLE employees (
    EmpId INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE NOT NULL,
    DeptID INT NOT NULL,
    Salary INT NOT NULL
);

INSERT INTO employees (EmpId, Name, Email, DeptID, Salary) VALUES
(2, 'Lakshmi Seshasai', 'lakshmiseshasai@example.com', 101, 35000),
(3, 'Venkatesh', 'venkatesh@example.com', 102, 40000),
(4, 'Rohit', 'rohit@example.com', 103, 38000),
(5, 'Anusha', 'anusha@example.com', 101, 42000),
(6, 'Mahesh', 'mahesh@example.com', 104, 45000),
(7, 'Sravani', 'sravani@example.com', 102, 37000),
(8, 'Kiran', 'kiran@example.com', 105, 46000),
(9, 'Sandeep', 'sandeep@example.com', 103, 39000),
(10, 'Harika', 'harika@example.com', 104, 41000),
(11, 'Teja', 'teja@example.com', 105, 48000);

Select * from employees;

-- 1) Create a view showing ProductID, Product, Category from products table.
-- Assumption: table `products(ProductID, Product, Category, Price, ...)`
CREATE OR REPLACE VIEW v_products_basic AS
SELECT ProductID, Product, Category
FROM products;


-- 2) Create a view that shows only delivered orders (OrderStatus = 'Delivered').
-- Assumption: table `orders(OrderID, CustomerID, OrderDate, OrderStatus, ShipAddress, BillAddress, ...)`
CREATE OR REPLACE VIEW v_orders_delivered AS
SELECT *
FROM orders
WHERE OrderStatus = 'Delivered';


-- 3) Create a view that displays employees whose salary > 60000.
-- Assumption: table `employees(EmpId, Name, Email, DeptID, Salary, ManagerId, ...)`
CREATE OR REPLACE VIEW v_high_paid_employees AS
SELECT EmpId, Name, Email, DeptID, Salary, ManagerId
FROM employees
WHERE Salary > 60000;


-- 4) Create a view showing customer names and score only.
-- Assumption: table `customers(CustomerID, Name, Score, Email, ...)`
CREATE OR REPLACE VIEW v_customers_name_score AS
SELECT CustomerID, Name, Score
FROM customers;


-- 5) Create a view that shows products whose price > 20.
-- Assumption: `products(ProductID, Product, Category, Price)`
CREATE OR REPLACE VIEW v_products_price_gt_20 AS
SELECT ProductID, Product, Category, Price
FROM products
WHERE Price > 20;


-- 6) Create a view showing orders with Product Name & Customer Name.
-- Assumptions:
--   orders(OrderID, CustomerID, OrderDate, ...) 
--   order_items(OrderItemID, OrderID, ProductID, Quantity, Price)
--   products(ProductID, Product)
--   customers(CustomerID, Name)
CREATE OR REPLACE VIEW v_orders_product_customer AS
SELECT
  o.OrderID,
  c.CustomerID,
  c.Name AS CustomerName,
  oi.ProductID,
  p.Product AS ProductName,
  oi.Quantity,
  oi.Price AS ItemPrice,
  o.OrderDate
FROM orders o
JOIN order_items oi ON o.OrderID = oi.OrderID
JOIN products p ON oi.ProductID = p.ProductID
JOIN customers c ON o.CustomerID = c.CustomerID;


-- 7) Create a view showing employee name, salary, and manager name.
-- Assumption: employees.ManagerId is an EmpId of the manager (self-reference)
CREATE OR REPLACE VIEW v_employee_with_manager AS
SELECT
  e.EmpId,
  e.Name AS EmployeeName,
  e.Salary,
  m.EmpId   AS ManagerEmpId,
  m.Name    AS ManagerName
FROM employees e
LEFT JOIN employees m ON e.ManagerId = m.EmpId;


-- 8) Create a view showing product-wise total quantity ordered.
-- Assumptions:
--   order_items(OrderItemID, OrderID, ProductID, Quantity)
--   products(ProductID, Product)
CREATE OR REPLACE VIEW v_product_total_quantity AS
SELECT
  p.ProductID,
  p.Product,
  COALESCE(SUM(oi.Quantity), 0) AS TotalQuantityOrdered
FROM products p
LEFT JOIN order_items oi ON p.ProductID = oi.ProductID
GROUP BY p.ProductID, p.Product
ORDER BY TotalQuantityOrdered DESC;


-- 9) Create a view showing all orders where ShipAddress IS NULL OR BillAddress IS NULL.
-- Assumption: orders(OrderID, CustomerID, ShipAddress, BillAddress, OrderStatus, ...)
CREATE OR REPLACE VIEW v_orders_missing_address AS
SELECT *
FROM orders
WHERE ShipAddress IS NULL
   OR BillAddress IS NULL;


-- 10) Create a view combining current orders & archived orders with an extra column OrderSource.
-- Assumptions:
--   current_orders(OrderID, CustomerID, OrderDate, OrderStatus, ShipAddress, BillAddress, ...)
--   archived_orders(OrderID, CustomerID, OrderDate, OrderStatus, ShipAddress, BillAddress, ...)
-- The view includes OrderSource = 'Current' or 'Archived'.
CREATE OR REPLACE VIEW v_all_orders_with_source AS
SELECT
  OrderID,
  CustomerID,
  OrderDate,
  OrderStatus,
  ShipAddress,
  BillAddress,
  'Current' AS OrderSource
FROM current_orders
UNION ALL
SELECT
  OrderID,
  CustomerID,
  OrderDate,
  OrderStatus,
  ShipAddress,
  BillAddress,
  'Archived' AS OrderSource
FROM archived_orders;
