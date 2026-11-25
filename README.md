# KYC Database with SQL

A relational database for **KYC (Know Your Customer)** and customer risk monitoring. It has a full schema, an ER diagram, fake data and 10 example SQL queries.

## What is inside
| File | What it does |
|---|---|
| `er_diagram.md` | ER diagram (Mermaid) + relational model |
| `schema.sql` | Creates 5 tables with primary keys, foreign keys and CHECK rules |
| `seed.sql` | Fake data for 10 customers |
| `queries.sql` | 10 useful queries |
| `run_demo.py` | Builds the database and runs all queries |

## Tables
`risk_level`, `customer`, `document`, `kyc_check`, `transaction_record`
(see the diagram in [er_diagram.md](er_diagram.md))

## Example queries
- High-risk customers
- Expired documents and documents that expire in 90 days
- Failed and pending KYC checks
- Customers with no checks at all
- Total transactions per customer
- Possible "structuring" (many transactions just under 10,000 EUR)
- Customers who need a new review

## Tools
SQLite, SQL, Python 3 (only to run the demo; no extra packages needed)

## How to run
```bash
python run_demo.py
```
Or use SQLite directly:
```bash
sqlite3 kyc.db < schema.sql
sqlite3 kyc.db < seed.sql
sqlite3 kyc.db < queries.sql
```

## What I practised
- ER modelling and normalisation
- Primary keys, foreign keys, CHECK constraints
- JOIN, LEFT JOIN, GROUP BY, HAVING, date functions

## Important
All data is **fake**.
