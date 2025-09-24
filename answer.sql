CREATE DATABASE ecommerce_platform;
USE ecommerce_platform; 
-- Create categories table

CREATE TABLE categories (
    category_id INT PRIMARY KEY ,
    category_name VARCHAR(30) NOT NULL
);

INSERT INTO categories (category_id ,category_name)
 VALUES
( 1, 'Electronics'),
(2, 'Books'),
(3, 'Clothing'),
(4, 'Home & Kitchen'),
(5, 'Sports'),
(6, 'Toys'),
(7, 'Beauty'),
(8, 'Automotive'),
(9, 'Garden'),
(10,'Health');

-- Create customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY ,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    phone VARCHAR(30),
    address VARCHAR(30)
);

-- Insert sample data into customers
INSERT INTO customers (first_name, last_name, email, phone, address) VALUES
('John', 'james', 'john.james@gmail.com', '1234567890', '123 Elm St'),
('Jane', 'Smith', 'jane.smith@gmail.com', '2345678901', '456 Oak St'),
('Alice', 'Johnson', 'alice.johnson@gmail.com', '3456789012', '789 Pine St'),
('Bob', 'Brown', 'bob.brown@gmail.com', '4567890123', '321 Maple St'),
('Carol', 'Davis', 'carol.davis@gmail.com', '5678901234', '654 Cedar St'),
('David', 'Wilson', 'david.wilson@gmail.com', '6789012345', '987 Birch St'),
('Eve', 'Miller', 'eve.miller@gmail.com', '7890123456', '159 Spruce St'),
('Frank', 'Moore', 'frank.moore@gmail.com', '8901234567', '753 Walnut St'),
('Grace', 'Taylor', 'grace.taylor@gmail.com', '9012345678', '852 Chestnut St'),
('Hank', 'Anderson', 'hank.anderson@gmail.com', '0123456789', '951 Poplar St');
-- Create products table

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(30) NOT NULL,
    description VARCHAR(30),
    price REAL NOT NULL,
    stock INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Insert sample data into products
INSERT INTO products (product_name, description, price, stock, category_id) VALUES
('Smartphone', 'Latest model smartphone', 699.99, 50, 1),
('Laptop', 'High performance laptop', 1199.99, 30, 1),
('Novel', 'Bestselling fiction novel', 19.99, 100, 2),
('T-shirt', 'Cotton t-shirt', 14.99, 200, 3),
('Blender', 'Kitchen blender', 49.99, 40, 4),
('Football', 'Official size football', 29.99, 60, 5),
('Doll', 'Children's toy doll', 24.99, 80, 6),
('Lipstick', 'Red lipstick', 9.99, 120, 7),
('Car Vacuum', 'Portable car vacuum cleaner', 39.99, 25, 8),
('Garden Hose', 'Flexible garden hose', 34.99, 35, 9);

-- Create users table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    password_hash VARCHAR(30) NOT NULL,
    role VARCHAR(30) NOT NULL
);

-- Insert sample data into users
INSERT INTO users (username, password_hash, role) VALUES
('admin', 'hash1', 'admin'),
('staff1', 'hash2', 'staff'),
('staff2', 'hash3', 'staff'),
('manager', 'hash4', 'manager'),
('support', 'hash5', 'support'),
('sales1', 'hash6', 'sales'),
('sales2', 'hash7', 'sales'),
('warehouse', 'hash8', 'warehouse'),
('delivery', 'hash9', 'delivery'),
('accounting', 'hash10', 'accounting');

-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME NOT NULL,
    status VARCHAR(30) NOT NULL,
    total REAL NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- Insert sample data into orders
INSERT INTO orders (customer_id, order_date, status, total) VALUES
(1, '2024-06-01 10:00:00', 'Completed', 719.98),
(2, '2024-06-02 11:30:00', 'Pending', 34.98),
(3, '2024-06-03 09:15:00', 'Shipped', 1199.99),
(4, '2024-06-04 14:45:00', 'Completed', 49.99),
(5, '2024-06-05 16:20:00', 'Cancelled', 29.99),
(6, '2024-06-06 12:10:00', 'Completed', 24.99),
(7, '2024-06-07 13:50:00', 'Pending', 9.99),
(8, '2024-06-08 15:05:00', 'Completed', 39.99),
(9, '2024-06-09 17:30:00', 'Shipped', 34.99),
(10, '2024-06-10 18:40:00', 'Completed', 14.99);
-- Create order_items table

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price REAL NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample data into order_items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 699.99),
(1, 3, 1, 19.99),
(2, 4, 2, 14.99),
(3, 2, 1, 1199.99),
(4, 5, 1, 49.99),
(5, 6, 1, 29.99),
(6, 7, 1, 24.99),
(7, 8, 1, 9.99),
(8, 9, 1, 39.99),
(9, 10, 1, 34.99);

-- Create loyalty_profiles table
CREATE TABLE loyalty_profiles (
    loyalty_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    points INT NOT NULL,
    tier VARCHAR(30) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert sample data into loyalty_profiles
INSERT INTO loyalty_profiles (customer_id, points, tier) VALUES
(1, 120, 'Silver'),
(2, 80, 'Bronze'),
(3, 200, 'Gold'),
(4, 50, 'Bronze'),
(5, 30, 'Bronze'),
(6, 60, 'Bronze'),
(7, 90, 'Silver'),
(8, 40, 'Bronze'),
(9, 150, 'Silver'),
(10, 300, 'Gold');

-- Create reviews table
CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    customer_id INT,
    rating INT NOT NULL,
    comment VARCHAR(60),
    review_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert sample data into reviews
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Excellent smartphone, very fast!', '2024-06-02'),
(2, 3, 4, 'Great laptop, but a bit expensive.', '2024-06-04'),
(3, 2, 5, 'Loved the novel, highly recommend.', '2024-06-05'),
(4, 4, 3, 'T-shirt is comfortable but shrinks.', '2024-06-06'),
(5, 5, 4, 'Blender works well for smoothies.', '2024-06-07'),
(6, 6, 2, 'Football lost air quickly.', '2024-06-08'),
(7, 7, 5, 'My daughter loves the doll!', '2024-06-09'),
(8, 8, 4, 'Nice color lipstick.', '2024-06-10'),
(9, 9, 3, 'Car vacuum is okay for small messes.', '2024-06-11'),
(10, 10, 5, 'Garden hose is very flexible and durable.', '2024-06-12');