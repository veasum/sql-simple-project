INSERT INTO clients(full_name)
VALUES
('John Smith'),
('Alice Johnson'),
('Michael Brown');

INSERT INTO accounts(client_id, balance, currency)
VALUES
(1, 15000, 'USD'),
(2, 7200, 'USD'),
(3, 40000, 'EUR');

INSERT INTO cards(account_id, card_number, status)
VALUES
(1, '1111222233334444', 'ACTIVE'),
(2, '5555666677778888', 'ACTIVE'),
(3, '9999000011112222', 'BLOCKED');

INSERT INTO transactions(account_id, amount, transaction_type, created_at)
VALUES
(1, 500, 'DEPOSIT', now() - interval '2 days'),
(1, -120, 'PURCHASE', now() - interval '1 day'),
(1, -50, 'PURCHASE', now()),

(2, 1000, 'DEPOSIT', now() - interval '5 days'),
(2, -700, 'PURCHASE', now() - interval '1 day'),

(3, 10000, 'DEPOSIT', now() - interval '10 days'),
(3, -5000, 'TRANSFER', now());