-- Create Database
CREATE DATABASE fraud_detection;
USE fraud_detection;

-- Table 1: Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    city VARCHAR(50),
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO customers (full_name, email, phone, city, date_of_birth) VALUES
('Amit Sharma', 'amit@gmail.com', '9876543210', 'Mumbai', '1990-05-15'),
('Priya Singh', 'priya@gmail.com', '9876543211', 'Delhi', '1992-08-22'),
('Rahul Verma', 'rahul@gmail.com', '9876543212', 'Chennai', '1988-03-10'),
('Sneha Patel', 'sneha@gmail.com', '9876543213', 'Pune', '1995-11-30'),
('Karan Mehta', 'karan@gmail.com', '9876543214', 'Bangalore', '1993-07-18'),
('Divya Nair', 'divya@gmail.com', '9876543215', 'Hyderabad', '1991-02-25'),
('Vijay Kumar', 'vijay@gmail.com', '9876543216', 'Kolkata', '1987-09-14'),
('Ananya Roy', 'ananya@gmail.com', '9876543217', 'Jaipur', '1996-04-05'),
('Suresh Iyer', 'suresh@gmail.com', '9876543218', 'Mumbai', '1985-12-20'),
('Meena Joshi', 'meena@gmail.com', '9876543219', 'Delhi', '1994-06-08'),
('Ravi Tiwari', 'ravi@gmail.com', '9876543220', 'Chennai', '1989-01-17'),
('Pooja Gupta', 'pooja@gmail.com', '9876543221', 'Pune', '1997-10-12'),
('Arun Das', 'arun@gmail.com', '9876543222', 'Bangalore', '1986-03-28'),
('Kavya Reddy', 'kavya@gmail.com', '9876543223', 'Hyderabad', '1998-07-03'),
('Nikhil Jain', 'nikhil@gmail.com', '9876543224', 'Kolkata', '1992-11-19'),
('Sita Pillai', 'sita@gmail.com', '9876543225', 'Jaipur', '1990-08-07'),
('Manoj Yadav', 'manoj@gmail.com', '9876543226', 'Mumbai', '1984-05-22'),
('Deepa Bose', 'deepa@gmail.com', '9876543227', 'Delhi', '1995-02-14'),
('Arjun Menon', 'arjun@gmail.com', '9876543228', 'Chennai', '1993-09-30'),
('Lakshmi Nair', 'lakshmi@gmail.com', '9876543229', 'Pune', '1988-12-11'),
('Rohit Saxena', 'rohit@gmail.com', '9876543230', 'Bangalore', '1996-06-25'),
('Sunita Pandey', 'sunita@gmail.com', '9876543231', 'Hyderabad', '1991-04-16'),
('Harish Nair', 'harish@gmail.com', '9876543232', 'Mumbai', '1991-03-12'),
('Preethi Raj', 'preethi@gmail.com', '9876543233', 'Chennai', '1993-07-25'),
('Sanjay Gupta', 'sanjay@gmail.com', '9876543234', 'Delhi', '1988-11-08'),
('Nisha Sharma', 'nisha@gmail.com', '9876543235', 'Pune', '1995-04-19'),
('Vikram Singh', 'vikram@gmail.com', '9876543236', 'Bangalore', '1990-09-30'),
('Asha Menon', 'asha@gmail.com', '9876543237', 'Hyderabad', '1987-06-14'),
('Rajesh Iyer', 'rajesh@gmail.com', '9876543238', 'Kolkata', '1994-01-22'),
('Swathi Pillai', 'swathi@gmail.com', '9876543239', 'Jaipur', '1996-08-05'),
('Karthik Das', 'karthik@gmail.com', '9876543240', 'Mumbai', '1992-12-17'),
('Lavanya Bose', 'lavanya@gmail.com', '9876543241', 'Delhi', '1989-05-28'),
('Mohan Reddy', 'mohan@gmail.com', '9876543242', 'Chennai', '1997-02-09'),
('Padma Joshi', 'padma@gmail.com', '9876543243', 'Pune', '1991-10-31'),
('Sunil Tiwari', 'sunil@gmail.com', '9876543244', 'Bangalore', '1986-07-16'),
('Geetha Nair', 'geetha@gmail.com', '9876543245', 'Hyderabad', '1993-03-04'),
('Aditya Kumar', 'aditya@gmail.com', '9876543246', 'Kolkata', '1998-11-20'),
('Revathi Rao', 'revathi@gmail.com', '9876543247', 'Jaipur', '1990-06-11'),
('Pranav Jain', 'pranav@gmail.com', '9876543248', 'Mumbai', '1995-09-23'),
('Chitra Menon', 'chitra@gmail.com', '9876543249', 'Delhi', '1988-04-07'),
('Ganesh Pillai', 'ganesh@gmail.com', '9876543250', 'Chennai', '1992-01-15'),
('Sindhu Verma', 'sindhu@gmail.com', '9876543251', 'Pune', '1996-08-29'),
('Balamurugan S', 'bala@gmail.com', '9876543252', 'Bangalore', '1987-05-18'),
('Kavitha Nair', 'kavitha@gmail.com', '9876543253', 'Hyderabad', '1994-12-03'),
('Dinesh Sharma', 'dinesh@gmail.com', '9876543254', 'Kolkata', '1991-07-27'),
('Mythili Raj', 'mythili@gmail.com', '9876543255', 'Jaipur', '1997-03-14'),
('Venkat Iyer', 'venkat@gmail.com', '9876543256', 'Mumbai', '1989-10-06'),
('Saranya Das', 'saranya@gmail.com', '9876543257', 'Delhi', '1993-06-21'),
('Prakash Nair', 'prakash@gmail.com', '9876543258', 'Chennai', '1985-02-28'),
('Anitha Reddy', 'anitha@gmail.com', '9876543259', 'Pune', '1996-09-10'),
('Suresh Menon', 'suresh2@gmail.com', '9876543260', 'Bangalore', '1990-04-24'),
('Radha Krishnan', 'radha@gmail.com', '9876543261', 'Hyderabad', '1988-11-15');
select count(*)from customers;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE fraud_alerts;
TRUNCATE TABLE login_logs;
TRUNCATE TABLE transactions;
TRUNCATE TABLE accounts;
TRUNCATE TABLE customers;
SET FOREIGN_KEY_CHECKS = 1;

-- Table 2: Accounts
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    account_type ENUM('Savings', 'Current', 'Salary') NOT NULL,
    balance DECIMAL(10,2) DEFAULT 0.00,
    status ENUM('Active', 'Inactive', 'Blocked') DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO accounts (customer_id, account_number, account_type, balance, status) VALUES
(1, 'ACC1001', 'Savings', 25000.00, 'Active'),
(2, 'ACC1002', 'Current', 50000.00, 'Active'),
(3, 'ACC1003', 'Savings', 15000.00, 'Active'),
(4, 'ACC1004', 'Salary', 35000.00, 'Active'),
(5, 'ACC1005', 'Savings', 8000.00, 'Active'),
(6, 'ACC1006', 'Current', 120000.00, 'Active'),
(7, 'ACC1007', 'Savings', 5000.00, 'Inactive'),
(8, 'ACC1008', 'Salary', 45000.00, 'Active'),
(9, 'ACC1009', 'Savings', 75000.00, 'Active'),
(10, 'ACC1010', 'Current', 9000.00, 'Blocked'),
(11, 'ACC1011', 'Savings', 32000.00, 'Active'),
(12, 'ACC1012', 'Salary', 18000.00, 'Active'),
(13, 'ACC1013', 'Current', 62000.00, 'Active'),
(14, 'ACC1014', 'Savings', 11000.00, 'Active'),
(15, 'ACC1015', 'Salary', 29000.00, 'Inactive'),
(16, 'ACC1016', 'Savings', 43000.00, 'Active'),
(17, 'ACC1017', 'Current', 87000.00, 'Active'),
(18, 'ACC1018', 'Savings', 6000.00, 'Active'),
(19, 'ACC1019', 'Salary', 54000.00, 'Active'),
(20, 'ACC1020', 'Savings', 21000.00, 'Blocked'),
(21, 'ACC1021', 'Current', 39000.00, 'Active'),
(22, 'ACC1022', 'Savings', 14000.00, 'Active');

-- Table 3: Transactions
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    transaction_type ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    location VARCHAR(100),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Success', 'Failed', 'Pending') DEFAULT 'Success',
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
INSERT INTO transactions (account_id, transaction_type, amount, location, transaction_date, status) VALUES
(1, 'Deposit', 5000.00, 'Mumbai', '2026-06-01 09:00:00', 'Success'),
(1, 'Withdrawal', 45000.00, 'Delhi', '2026-06-01 09:05:00', 'Success'),
(1, 'Withdrawal', 38000.00, 'Chennai', '2026-06-01 09:07:00', 'Success'),
(2, 'Deposit', 10000.00, 'Pune', '2026-06-01 10:00:00', 'Success'),
(3, 'Withdrawal', 2000.00, 'Mumbai', '2026-06-02 11:00:00', 'Success'),
(4, 'Transfer', 75000.00, 'Bangalore', '2026-06-02 11:05:00', 'Success'),
(4, 'Transfer', 60000.00, 'Hyderabad', '2026-06-02 11:08:00', 'Success'),
(5, 'Deposit', 3000.00, 'Kolkata', '2026-06-02 12:00:00', 'Success'),
(6, 'Withdrawal', 500.00, 'Jaipur', '2026-06-03 09:00:00', 'Success'),
(7, 'Deposit', 1000.00, 'Mumbai', '2026-06-03 10:00:00', 'Failed'),
(8, 'Withdrawal', 92000.00, 'Delhi', '2026-06-03 10:02:00', 'Success'),
(8, 'Withdrawal', 88000.00, 'Chennai', '2026-06-03 10:04:00', 'Success'),
(9, 'Transfer', 4000.00, 'Pune', '2026-06-03 11:00:00', 'Success'),
(10, 'Deposit', 6000.00, 'Bangalore', '2026-06-04 09:00:00', 'Failed'),
(11, 'Withdrawal', 55000.00, 'Hyderabad', '2026-06-04 09:03:00', 'Success'),
(11, 'Withdrawal', 48000.00, 'Kolkata', '2026-06-04 09:06:00', 'Success'),
(12, 'Deposit', 2000.00, 'Jaipur', '2026-06-04 10:00:00', 'Success'),
(13, 'Transfer', 15000.00, 'Mumbai', '2026-06-05 09:00:00', 'Success'),
(14, 'Withdrawal', 700.00, 'Delhi', '2026-06-05 10:00:00', 'Success'),
(15, 'Deposit', 8000.00, 'Chennai', '2026-06-05 11:00:00', 'Pending'),
(16, 'Withdrawal', 67000.00, 'Pune', '2026-06-05 11:02:00', 'Success'),
(16, 'Withdrawal', 71000.00, 'Bangalore', '2026-06-05 11:04:00', 'Success');

-- Table 4: Login Logs
CREATE TABLE login_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(50),
    location VARCHAR(100),
    status ENUM('Success', 'Failed') DEFAULT 'Success',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO login_logs (customer_id, login_time, ip_address, location, status) VALUES
(1, '2026-06-01 08:55:00', '192.168.1.1', 'Mumbai', 'Success'),
(1, '2026-06-01 08:56:00', '192.168.1.2', 'Delhi', 'Failed'),
(1, '2026-06-01 08:57:00', '192.168.1.3', 'Chennai', 'Failed'),
(1, '2026-06-01 08:58:00', '192.168.1.4', 'Kolkata', 'Failed'),
(1, '2026-06-01 08:59:00', '192.168.1.5', 'Pune', 'Success'),
(2, '2026-06-01 09:00:00', '192.168.2.1', 'Delhi', 'Success'),
(3, '2026-06-02 10:00:00', '192.168.3.1', 'Chennai', 'Success'),
(4, '2026-06-02 10:02:00', '192.168.4.1', 'Bangalore', 'Failed'),
(4, '2026-06-02 10:03:00', '192.168.4.2', 'Hyderabad', 'Failed'),
(4, '2026-06-02 10:04:00', '192.168.4.3', 'Mumbai', 'Success'),
(5, '2026-06-02 11:00:00', '192.168.5.1', 'Kolkata', 'Success'),
(6, '2026-06-03 09:00:00', '192.168.6.1', 'Jaipur', 'Success'),
(7, '2026-06-03 09:05:00', '192.168.7.1', 'Mumbai', 'Failed'),
(7, '2026-06-03 09:06:00', '192.168.7.2', 'Delhi', 'Failed'),
(7, '2026-06-03 09:07:00', '192.168.7.3', 'Chennai', 'Failed'),
(7, '2026-06-03 09:08:00', '192.168.7.4', 'Pune', 'Success'),
(8, '2026-06-03 10:00:00', '192.168.8.1', 'Bangalore', 'Success'),
(9, '2026-06-04 09:00:00', '192.168.9.1', 'Hyderabad', 'Success'),
(10, '2026-06-04 10:00:00', '192.168.10.1', 'Kolkata', 'Failed'),
(10, '2026-06-04 10:01:00', '192.168.10.2', 'Jaipur', 'Failed'),
(10, '2026-06-04 10:02:00', '192.168.10.3', 'Mumbai', 'Failed'),
(10, '2026-06-04 10:03:00', '192.168.10.4', 'Delhi', 'Success');

-- Table 5: Fraud Alerts
CREATE TABLE fraud_alerts (
    alert_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    account_id INT,
    alert_type VARCHAR(100) NOT NULL,
    alert_description TEXT,
    risk_level ENUM('Low', 'Medium', 'High') DEFAULT 'Low',
    alert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Open', 'Investigating', 'Resolved') DEFAULT 'Open',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
INSERT INTO fraud_alerts (customer_id, account_id, alert_type, alert_description, risk_level, alert_date, status) VALUES
(1, 1, 'Multiple Locations', 'Transactions in Mumbai, Delhi, Chennai within 7 minutes', 'High', '2026-06-01 09:10:00', 'Open'),
(1, 1, 'Multiple Failed Logins', '3 failed logins from different cities', 'High', '2026-06-01 09:00:00', 'Investigating'),
(4, 4, 'Large Transfer', 'Two transfers above 60000 within 5 minutes', 'High', '2026-06-02 11:10:00', 'Open'),
(4, NULL, 'Suspicious Login', 'Failed logins from Bangalore and Hyderabad', 'Medium', '2026-06-02 10:05:00', 'Open'),
(7, 7, 'Multiple Failed Logins', '3 failed logins from different IPs', 'High', '2026-06-03 09:10:00', 'Investigating'),
(8, 8, 'Large Withdrawal', 'Two withdrawals above 88000 within 2 minutes', 'High', '2026-06-03 10:05:00', 'Open'),
(10, 10, 'Blocked Account Activity', 'Transaction attempted on blocked account', 'High', '2026-06-04 09:00:00', 'Resolved'),
(10, NULL, 'Multiple Failed Logins', '3 failed logins from different locations', 'High', '2026-06-04 10:04:00', 'Open'),
(11, 11, 'Multiple Locations', 'Two withdrawals from different cities in 3 minutes', 'High', '2026-06-04 09:10:00', 'Investigating'),
(16, 16, 'Multiple Locations', 'Two withdrawals from Pune and Bangalore in 2 minutes', 'High', '2026-06-05 11:05:00', 'Open'),
(2, 2, 'Large Deposit', 'Unusual large deposit of 50000', 'Medium', '2026-06-01 10:05:00', 'Resolved'),
(3, 3, 'Low Balance Withdrawal', 'Withdrawal attempted with low balance', 'Low', '2026-06-02 11:05:00', 'Resolved'),
(5, 5, 'Unusual Activity', 'Transaction from new location', 'Low', '2026-06-02 12:05:00', 'Resolved'),
(6, 6, 'Normal Check', 'Routine check on large balance account', 'Low', '2026-06-03 09:05:00', 'Resolved'),
(9, 9, 'Unusual Transfer', 'Transfer to unknown account', 'Medium', '2026-06-03 11:05:00', 'Investigating'),
(12, 12, 'New Device Login', 'Login from new IP address', 'Low', '2026-06-04 10:05:00', 'Resolved'),
(13, 13, 'Large Transfer', 'Transfer of 15000 to new account', 'Medium', '2026-06-05 09:05:00', 'Investigating'),
(14, 14, 'Unusual Time', 'Transaction at unusual hour', 'Low', '2026-06-05 10:05:00', 'Resolved'),
(15, 15, 'Pending Transaction', 'Transaction stuck in pending state', 'Low', '2026-06-05 11:05:00', 'Resolved'),
(17, 17, 'Large Balance', 'Unusually large balance movement', 'Medium', '2026-06-05 12:00:00', 'Open'),
(18, 18, 'Suspicious Login', 'Login from unknown location', 'Medium', '2026-06-05 12:05:00', 'Investigating'),
(20, 20, 'Blocked Account', 'Multiple attempts on blocked account', 'High', '2026-06-05 12:10:00', 'Open');

-- multiple location in short time
SELECT 
    c.full_name,
    t.account_id,
    COUNT(t.transaction_id) AS total_transactions,
    COUNT(DISTINCT t.location) AS different_locations,
    MIN(t.transaction_date) AS first_transaction,
    MAX(t.transaction_date) AS last_transaction
FROM transactions t
JOIN customers c 
ON t.account_id = c.customer_id
GROUP BY c.full_name, t.account_id
HAVING COUNT(DISTINCT t.location) > 1
ORDER BY different_locations DESC;

-- large amount transaction
SELECT 
    c.full_name,
    t.account_id,
    t.transaction_type,
    t.amount,
    t.location,
    t.transaction_date,
    t.status
FROM transactions t
JOIN customers c
ON t.account_id = c.customer_id
WHERE t.amount > 50000
ORDER BY t.amount DESC;

-- multiple failed logins
SELECT 
    c.full_name,
    l.customer_id,
    COUNT(l.log_id) AS total_attempts,
    SUM(CASE WHEN l.status = 'Failed' 
        THEN 1 ELSE 0 END) AS failed_attempts,
    COUNT(DISTINCT l.ip_address) AS different_devices,
    COUNT(DISTINCT l.location) AS different_locations,
    MIN(l.login_time) AS first_attempt,
    MAX(l.login_time) AS last_attempt
FROM login_logs l
JOIN customers c
ON l.customer_id = c.customer_id
GROUP BY c.full_name, l.customer_id
HAVING SUM(CASE WHEN l.status = 'Failed' 
    THEN 1 ELSE 0 END) >= 2
ORDER BY failed_attempts DESC;

-- blocked account activity
SELECT 
    c.full_name,
    a.account_number,
    a.account_type,
    a.status AS account_status,
    t.transaction_type,
    t.amount,
    t.location,
    t.transaction_date
FROM transactions t
JOIN accounts a
ON t.account_id = a.account_id
JOIN customers c
ON a.customer_id = c.customer_id
WHERE a.status = 'Blocked'
ORDER BY t.transaction_date DESC;

-- high risk alerts
SELECT 
    c.full_name,
    f.alert_type,
    f.alert_description,
    f.risk_level,
    f.alert_date,
    f.status AS alert_status
FROM fraud_alerts f
JOIN customers c
ON f.customer_id = c.customer_id
WHERE f.risk_level = 'High'
ORDER BY f.alert_date DESC;

-- customer wise fraud report
SELECT 
    c.full_name,
    c.city,
    COUNT(DISTINCT f.alert_id) AS total_alerts,
    SUM(CASE WHEN f.risk_level = 'High' 
        THEN 1 ELSE 0 END) AS high_risk_count,
    SUM(CASE WHEN f.risk_level = 'Medium' 
        THEN 1 ELSE 0 END) AS medium_risk_count,
    SUM(CASE WHEN f.risk_level = 'Low' 
        THEN 1 ELSE 0 END) AS low_risk_count,
    SUM(CASE WHEN f.status = 'Open' 
        THEN 1 ELSE 0 END) AS open_alerts,
    CASE 
        WHEN SUM(CASE WHEN f.risk_level = 'High' 
            THEN 1 ELSE 0 END) >= 2 
            THEN 'Extremely Suspicious'
        WHEN SUM(CASE WHEN f.risk_level = 'High' 
            THEN 1 ELSE 0 END) = 1 
            THEN 'Suspicious'
        ELSE 'Normal'
    END AS customer_risk_status
FROM fraud_alerts f
JOIN customers c
ON f.customer_id = c.customer_id
GROUP BY c.full_name, c.city
ORDER BY high_risk_count DESC;



