-- KYC Database: example queries (SQLite)
-- Each query starts with a name line: -- Q<number>: <title>

-- Q1: All HIGH risk customers
SELECT c.customer_id, c.full_name, c.country, c.job_type
FROM customer c
JOIN risk_level r ON r.risk_level_id = c.risk_level_id
WHERE r.level_name = 'HIGH';

-- Q2: Customers with an expired document
SELECT c.full_name, d.document_type, d.expiry_date
FROM document d
JOIN customer c ON c.customer_id = d.customer_id
WHERE d.expiry_date < DATE('now')
ORDER BY d.expiry_date;

-- Q3: Documents that expire in the next 90 days
SELECT c.full_name, d.document_type, d.expiry_date
FROM document d
JOIN customer c ON c.customer_id = d.customer_id
WHERE d.expiry_date BETWEEN DATE('now') AND DATE('now','+90 days')
ORDER BY d.expiry_date;

-- Q4: Customers with a FAILED check
SELECT c.full_name, k.check_type, k.check_date
FROM kyc_check k
JOIN customer c ON c.customer_id = k.customer_id
WHERE k.result = 'FAIL';

-- Q5: Customers with PENDING checks (work to do)
SELECT c.full_name, k.check_type, k.check_date
FROM kyc_check k
JOIN customer c ON c.customer_id = k.customer_id
WHERE k.result = 'PENDING';

-- Q6: Customers with NO checks at all
SELECT c.customer_id, c.full_name
FROM customer c
LEFT JOIN kyc_check k ON k.customer_id = c.customer_id
WHERE k.check_id IS NULL;

-- Q7: Number of customers per risk level
SELECT r.level_name, COUNT(*) AS customers
FROM customer c
JOIN risk_level r ON r.risk_level_id = c.risk_level_id
GROUP BY r.level_name
ORDER BY r.risk_level_id DESC;

-- Q8: Total transactions per customer (biggest first)
SELECT c.full_name, COUNT(t.transaction_id) AS tx_count, ROUND(SUM(t.amount_eur),2) AS total_eur
FROM customer c
JOIN transaction_record t ON t.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_eur DESC;

-- Q9: Possible structuring: 3 or more transactions between 9,000 and 9,999 EUR
SELECT c.full_name, COUNT(*) AS suspicious_tx
FROM transaction_record t
JOIN customer c ON c.customer_id = t.customer_id
WHERE t.amount_eur BETWEEN 9000 AND 9999
GROUP BY c.customer_id
HAVING COUNT(*) >= 3;

-- Q10: Customers who need a review (last check is older than their review period)
SELECT c.full_name, r.level_name, MAX(k.check_date) AS last_check,
       CAST((julianday('now') - julianday(MAX(k.check_date))) / 30 AS INTEGER) AS months_since_check,
       r.review_months
FROM customer c
JOIN risk_level r ON r.risk_level_id = c.risk_level_id
JOIN kyc_check k ON k.customer_id = c.customer_id
GROUP BY c.customer_id
HAVING months_since_check > r.review_months
ORDER BY months_since_check DESC;
