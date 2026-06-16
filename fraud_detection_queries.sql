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

-- blocked cards activity
SELECT 
    c.full_name,
    c.city,
    ca.card_number,
    ca.card_type,
    ca.card_status,
    ca.expiry_date,
    ca.credit_limit
FROM cards ca
JOIN customers c
ON ca.customer_id = c.customer_id
WHERE ca.card_status = 'Blocked' 
OR ca.card_status = 'Expired'
ORDER BY ca.card_status ASC;

-- blacklisted customers report
SELECT 
    c.full_name,
    c.city,
    b.reason,
    b.blacklisted_by,
    b.blacklist_date,
    b.status AS blacklist_status,
    b.remarks
FROM blacklist b
JOIN customers c
ON b.customer_id = c.customer_id
WHERE b.status = 'Active'
ORDER BY b.blacklist_date DESC;

-- high risk score customers
SELECT 
    c.full_name,
    c.city,
    r.score,
    r.risk_category,
    r.reason,
    r.calculated_by,
    r.score_date
FROM risk_scores r
JOIN customers c
ON r.customer_id = c.customer_id
WHERE r.risk_category IN ('High', 'Critical')
ORDER BY r.score DESC;

-- unread fraud notifications
SELECT 
    c.full_name,
    c.city,
    n.notification_type,
    n.message,
    n.status,
    n.sent_at,
    n.read_status
FROM notifications n
JOIN customers c
ON n.customer_id = c.customer_id
WHERE n.read_status = 'Unread'
AND n.status = 'Sent'
ORDER BY n.sent_at DESC;

show tables;
truncate notifications;

-- critical investigation report
SELECT 
    c.full_name,
    c.city,
    i.assigned_to,
    i.investigation_status,
    i.priority,
    i.started_date,
    i.findings,
    i.action_taken
FROM investigation i
JOIN customers c
ON i.customer_id = c.customer_id
WHERE i.priority = 'Critical'
AND i.investigation_status != 'Closed'
ORDER BY i.started_date DESC;

-- suspicious devices report
SELECT 
    c.full_name,
    c.city,
    d.device_name,
    d.device_type,
    d.operating_system,
    d.ip_address,
    d.location,
    d.status AS device_status,
    d.last_used
FROM devices d
JOIN customers c
ON d.customer_id = c.customer_id
WHERE d.status IN ('Suspicious', 'Blocked')
ORDER BY d.status ASC;

-- above average transaction amount
SELECT 
    c.full_name,
    c.city,
    t.transaction_type,
    t.amount,
    t.location,
    t.transaction_date,
    (SELECT AVG(amount) 
     FROM transactions) AS average_amount
FROM transactions t
JOIN customers c
ON t.account_id = c.customer_id
WHERE t.amount > (SELECT AVG(amount) 
                  FROM transactions)
ORDER BY t.amount DESC;

-- customers with most fraud alerts
SELECT 
    c.full_name,
    c.city,
    COUNT(f.alert_id) AS total_alerts,
    (SELECT COUNT(alert_id) 
     FROM fraud_alerts) AS total_alerts_in_system
FROM fraud_alerts f
JOIN customers c
ON f.customer_id = c.customer_id
WHERE f.customer_id IN 
    (SELECT customer_id 
     FROM fraud_alerts 
     GROUP BY customer_id 
     HAVING COUNT(alert_id) > 1)
GROUP BY c.full_name, c.city
ORDER BY total_alerts DESC;

-- search customers by city using like
SELECT 
    c.full_name,
    c.city,
    c.phone,
    c.email,
    COUNT(f.alert_id) AS total_fraud_alerts,
    SUM(CASE WHEN f.risk_level = 'High' 
        THEN 1 ELSE 0 END) AS high_risk_alerts
FROM customers c
LEFT JOIN fraud_alerts f
ON c.customer_id = f.customer_id
WHERE c.city LIKE 'M%'
GROUP BY c.full_name, c.city, 
c.phone, c.email
ORDER BY total_fraud_alerts DESC;

-- suspicious transactions by location using like 
SELECT 
    c.full_name,
    t.transaction_type,
    t.amount,
    t.location,
    t.transaction_date,
    t.status,
    (SELECT AVG(amount) 
     FROM transactions) AS avg_amount
FROM transactions t
JOIN customers c
ON t.account_id = c.customer_id
WHERE t.location LIKE '%a%'
AND t.amount > (SELECT AVG(amount) 
                FROM transactions)
ORDER BY t.amount DESC;

-- customers worse than average risk score
SELECT 
    c.full_name,
    c.city,
    r.score,
    r.risk_category,
    r.reason,
    r.score_date,
    (SELECT AVG(score) 
     FROM risk_scores) AS average_score
FROM risk_scores r
JOIN customers c
ON r.customer_id = c.customer_id
WHERE r.score > (SELECT AVG(score) 
                 FROM risk_scores)
AND r.risk_category LIKE '%igh%'
ORDER BY r.score DESC;

-- all fraud related to mumbai
SELECT 
    c.full_name,
    c.city AS customer_city,
    t.transaction_type,
    t.amount,
    t.location AS transaction_location,
    t.transaction_date,
    f.alert_type,
    f.risk_level
FROM transactions t
JOIN customers c
ON t.account_id = c.customer_id
LEFT JOIN fraud_alerts f
ON c.customer_id = f.customer_id
WHERE t.location LIKE '%Mumbai%'
OR c.city LIKE '%Mumbai%'
OR f.alert_description LIKE '%Mumbai%'
ORDER BY t.amount DESC;

-- auto update fraud alert status
DELIMITER //

CREATE TRIGGER update_fraud_status
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    DECLARE trans_count INT;
    DECLARE location_count INT;
    
    -- Count transactions for this account
    SELECT COUNT(*) INTO trans_count
    FROM transactions
    WHERE account_id = NEW.account_id
    AND transaction_date >= NOW() - INTERVAL 1 HOUR;
    
    -- Count different locations
    SELECT COUNT(DISTINCT location) INTO location_count
    FROM transactions
    WHERE account_id = NEW.account_id
    AND transaction_date >= NOW() - INTERVAL 1 HOUR;
    
    -- If suspicious automatically insert fraud alert
    IF trans_count >= 3 AND location_count >= 2 THEN
        INSERT INTO fraud_alerts 
        (customer_id, account_id, alert_type, 
         alert_description, risk_level, status)
        SELECT 
            a.customer_id,
            NEW.account_id,
            'Multiple Locations',
            'Auto detected: Multiple transactions from different locations',
            'High',
            'Open'
        FROM accounts a
        WHERE a.account_id = NEW.account_id;
    END IF;
END //

DELIMITER ;

-- auto blacklist high risk customer
DELIMITER //

CREATE TRIGGER auto_blacklist_customer
AFTER INSERT ON fraud_alerts
FOR EACH ROW
BEGIN
    DECLARE alert_count INT;
    DECLARE already_blacklisted INT;
    
    -- Count high risk alerts for this customer
    SELECT COUNT(*) INTO alert_count
    FROM fraud_alerts
    WHERE customer_id = NEW.customer_id
    AND risk_level = 'High';
    
    -- Check if already blacklisted
    SELECT COUNT(*) INTO already_blacklisted
    FROM blacklist
    WHERE customer_id = NEW.customer_id
    AND status = 'Active';
    
    -- If 2 or more high risk alerts
    -- and not already blacklisted
    -- automatically add to blacklist!
    IF alert_count >= 2 
    AND already_blacklisted = 0 THEN
        INSERT INTO blacklist
        (customer_id, reason, 
         blacklisted_by, status, remarks)
        VALUES
        (NEW.customer_id,
         'Auto blacklisted: Multiple high risk alerts detected',
         'System',
         'Active',
         'Automatically blacklisted by fraud detection system');
    END IF;
END //

DELIMITER ;
show triggers;

DELIMITER //

CREATE PROCEDURE GetCustomerFraudReport
(IN p_customer_id INT)
BEGIN
    -- Section 1: Customer Basic Details
    SELECT 
        c.customer_id,
        c.full_name,
        c.email,
        c.phone,
        c.city
    FROM customers c
    WHERE c.customer_id = p_customer_id;
    
    -- Section 2: Account Details
    SELECT 
        a.account_number,
        a.account_type,
        a.balance,
        a.status AS account_status
    FROM accounts a
    WHERE a.customer_id = p_customer_id;
    
    -- Section 3: Transaction Summary
    SELECT 
        COUNT(*) AS total_transactions,
        SUM(amount) AS total_amount,
        MAX(amount) AS highest_transaction,
        AVG(amount) AS average_transaction
    FROM transactions t
    JOIN accounts a
    ON t.account_id = a.account_id
    WHERE a.customer_id = p_customer_id;
    
    -- Section 4: Fraud Alerts
    SELECT 
        alert_type,
        risk_level,
        alert_description,
        status AS alert_status,
        alert_date
    FROM fraud_alerts
    WHERE customer_id = p_customer_id
    ORDER BY alert_date DESC;
    
    -- Section 5: Risk Score
    SELECT 
        score,
        risk_category,
        reason,
        score_date
    FROM risk_scores
    WHERE customer_id = p_customer_id
    ORDER BY score_date DESC
    LIMIT 1;

DELIMITER ;

CALL Getcustomerfraudreport(1);

-- window functions RANK()
SELECT 
    c.full_name,
    c.city,
    t.transaction_type,
    t.amount,
    t.location,
    t.transaction_date,
    RANK() OVER (
        ORDER BY t.amount DESC
    ) AS transaction_rank
FROM transactions t
JOIN customers c
ON t.account_id = c.customer_id
ORDER BY transaction_rank;

-- window functions LAG()

SELECT 
    c.full_name,
    t.account_id,
    t.amount,
    t.location,
    t.transaction_date,
    LAG(t.amount) OVER (
        PARTITION BY t.account_id
        ORDER BY t.transaction_date
    ) AS previous_amount,
    t.amount - LAG(t.amount) OVER (
        PARTITION BY t.account_id
        ORDER BY t.transaction_date
    ) AS amount_difference
FROM transactions t
JOIN customers c
ON t.account_id = c.customer_id
ORDER BY t.account_id, t.transaction_date; 

-- window functions SUM() OVER()

SELECT 
    c.full_name,
    t.account_id,
    t.transaction_type,
    t.amount,
    t.location,
    t.transaction_date,
    SUM(t.amount) OVER (
        PARTITION BY t.account_id
        ORDER BY t.transaction_date
    ) AS running_total,
    SUM(t.amount) OVER (
        PARTITION BY t.account_id
    ) AS account_total
FROM transactions t
JOIN customers c
ON t.account_id = c.customer_id
ORDER BY t.account_id, t.transaction_date;




