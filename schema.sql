-- KYC Database: schema (SQLite)
-- 5 tables: customer, document, risk_level, kyc_check, transaction_record

PRAGMA foreign_keys = ON;

CREATE TABLE risk_level (
    risk_level_id INTEGER PRIMARY KEY,
    level_name    TEXT NOT NULL UNIQUE,          -- LOW, MEDIUM, HIGH
    review_months INTEGER NOT NULL               -- how often we must review the customer
);

CREATE TABLE customer (
    customer_id   INTEGER PRIMARY KEY,
    full_name     TEXT NOT NULL,
    date_of_birth DATE NOT NULL,
    email         TEXT,
    country       TEXT NOT NULL,
    job_type      TEXT,
    risk_level_id INTEGER NOT NULL,
    created_at    DATE NOT NULL,
    FOREIGN KEY (risk_level_id) REFERENCES risk_level(risk_level_id)
);

CREATE TABLE document (
    document_id     INTEGER PRIMARY KEY,
    customer_id     INTEGER NOT NULL,
    document_type   TEXT NOT NULL CHECK (document_type IN ('PASSPORT','ID_CARD','RESIDENCE_PERMIT')),
    document_number TEXT NOT NULL,
    expiry_date     DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE kyc_check (
    check_id    INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    check_type  TEXT NOT NULL CHECK (check_type IN ('ID_VERIFICATION','SANCTIONS_SCREENING','ADDRESS_PROOF')),
    result      TEXT NOT NULL CHECK (result IN ('PASS','FAIL','PENDING')),
    check_date  DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE transaction_record (
    transaction_id INTEGER PRIMARY KEY,
    customer_id    INTEGER NOT NULL,
    amount_eur     REAL NOT NULL,
    tx_date        DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
