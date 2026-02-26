SELECT client_id
FROM client
WHERE district_id = "1"
ORDER BY client_id
LIMIT 5;

SELECT client_id
FROM client
WHERE district_id = "72"
ORDER BY client_id DESC
LIMIT 1;

SELECT client_id
FROM client
WHERE district_id = "72"
ORDER BY client_id DESC
LIMIT 1;

SELECT status
FROM loan
GROUP BY status
ORDER BY status ASC;

SELECT loan_id
FROM loan
WHERE payments >= (SELECT max(payments) FROM loan);

SELECT account_id, amount
FROM loan
ORDER BY account_id ASC
LIMIT 5;

SELECT account_id
FROM loan
WHERE duration = 60
ORDER BY amount ASC
LIMIT 5;

SELECT DISTINCT k_symbol
FROM `order`
ORDER BY k_symbol;

SELECT order_id
FROM `order`
WHERE account_id = 34;

SELECT DISTINCT account_id
FROM `order`
WHERE order_id BETWEEN 29540 AND 29560;

SELECT amount
FROM `order`
WHERE account_to = 30067122;

SELECT trans_id, date, type, amount
FROM trans
WHERE account_ID = 793
ORDER BY date DESC, trans_id DESC
LIMIT 10;

SELECT district_id, COUNT(client_id)
FROM client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id ASC;

SELECT district_id, COUNT(client_id)
FROM client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id ASC;

SELECT date, COUNT(account_id)
FROM loan
WHERE date < 930907
GROUP BY date
ORDER BY date DESC;

SELECT date, duration, COUNT(*) AS cantidad_prestamos
FROM loan
WHERE date BETWEEN 971201 AND 971231
GROUP BY date, duration
ORDER BY date ASC, duration ASC;

SELECT account_id, type, SUM(amount) AS monto_total
FROM trans
WHERE account_id = 396
GROUP BY type
ORDER BY type; 








