-- Use database
USE mydatabase;

-- Create table
CREATE TABLE customers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(20),
  address TEXT
);

-- Insert data
INSERT INTO customers (name, email, phone, address)
VALUES
  ('John Doe', 'john@example.com', '123-456-7890', '123 Main St'),
  ('Jane Doe', 'jane@example.com', '987-654-3210', '456 Elm St'),
  ('Bob Smith', 'bob@example.com', '555-123-4567', '789 Oak St');

-- Create another table
CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT,
  order_date DATE,
  total DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Insert data
INSERT INTO orders (customer_id, order_date, total)
VALUES
  (1, '2022-01-01', 600.00),
  (1, '2022-01-15', 200.00),
  (2, '2022-02-01', 50.00);

-- Query data
SELECT * FROM customers;
SELECT * FROM orders;
