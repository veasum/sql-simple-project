SELECT
    c.full_name,
    a.balance
FROM clients c
JOIN accounts a
ON c.id = a.client_id;


SELECT
    transaction_type,
    COUNT(*) as operations,
    SUM(amount) as total
FROM transactions
GROUP BY transaction_type;


WITH totals AS (
    SELECT
        account_id,
        SUM(amount) as total
    FROM transactions
    GROUP BY account_id
)

SELECT *
FROM totals;


SELECT
    account_id,
    amount,
    created_at,
    SUM(amount) OVER (
        PARTITION BY account_id
        ORDER BY created_at
    ) AS running_total
FROM transactions;


SELECT
    c.full_name,
    SUM(ABS(t.amount)) AS turnover,
    RANK() OVER (
        ORDER BY SUM(ABS(t.amount)) DESC
    ) AS rank
FROM clients c
JOIN accounts a
    ON c.id = a.client_id
JOIN transactions t
    ON a.id = t.account_id
GROUP BY c.full_name;

SELECT
    account_id,
    amount,
    created_at,
    LAG(amount) OVER (
        PARTITION BY account_id
        ORDER BY created_at
    ) as previous_transaction
FROM transactions;

CREATE INDEX idx_transactions_account_created
ON transactions(account_id, created_at);


EXPLAIN ANALYZE
SELECT *
FROM transactions
WHERE account_id = 1;


EXPLAIN ANALYZE
SELECT *
FROM transactions
WHERE account_id = 1
ORDER BY created_at DESC
LIMIT 10;


EXPLAIN ANALYZE
SELECT
    account_id,
    COUNT(*) AS operations_count,
    SUM(amount) AS turnover
FROM transactions
WHERE account_id = 1
GROUP BY account_id;
