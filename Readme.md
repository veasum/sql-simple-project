SQL Banking Project
====================================

## Project Description

This project is a simple banking database system built with PostgreSQL and Docker.
The system simulates a basic banking structure with clients, accounts, cards, and transactions.

---

## Database Structure

### clients

Stores bank customers.
```
-id
-full_name
-created_at
```
### accounts

Stores bank accounts linked to clients.
```
-id
-client_id (FK → clients.id)
-balance
-currency
-created_at
```
### cards

Stores cards linked to accounts.
```
-id
-account_id (FK → accounts.id)
-card_number
-status
```
### transactions

Stores all financial operations.
```
-id
-account_id (FK → accounts.id)
-amount
-transaction_type
-created_at
```
---

## Access Database

pgAdmin:

http://localhost:5050

Credentials:

Email: admin@admin.com
Password: admin

Database connection:

Host: postgres
Port: 5432
User: admin
Password: admin
Database: bank


---

## Project Structure
```
sql-bank-project/
├── docker-compose.yml
├── README.md
└── sql/
    ├── 01-schema.sql
    ├── 02-seed.sql
    └── 03-queries.sql
```

---

## Developer Tools

* [VS Code](https://code.visualstudio.com/)
* [Git SCM](https://git-scm.com/downloads)
* [Docker](https://www.docker.com/)

---
