# ER Diagram

GitHub shows this diagram automatically (Mermaid).

```mermaid
erDiagram
    RISK_LEVEL ||--o{ CUSTOMER : "has"
    CUSTOMER ||--o{ DOCUMENT : "owns"
    CUSTOMER ||--o{ KYC_CHECK : "has"
    CUSTOMER ||--o{ TRANSACTION_RECORD : "makes"

    RISK_LEVEL {
        int risk_level_id PK
        text level_name
        int review_months
    }
    CUSTOMER {
        int customer_id PK
        text full_name
        date date_of_birth
        text email
        text country
        text job_type
        int risk_level_id FK
        date created_at
    }
    DOCUMENT {
        int document_id PK
        int customer_id FK
        text document_type
        text document_number
        date expiry_date
    }
    KYC_CHECK {
        int check_id PK
        int customer_id FK
        text check_type
        text result
        date check_date
    }
    TRANSACTION_RECORD {
        int transaction_id PK
        int customer_id FK
        real amount_eur
        date tx_date
    }
```

## Relationships (in simple words)
- One risk level can belong to many customers. Each customer has one risk level.
- One customer can have many documents, many KYC checks and many transactions.

## Relational model
- RISK_LEVEL(**risk_level_id**, level_name, review_months)
- CUSTOMER(**customer_id**, full_name, date_of_birth, email, country, job_type, *risk_level_id*, created_at)
- DOCUMENT(**document_id**, *customer_id*, document_type, document_number, expiry_date)
- KYC_CHECK(**check_id**, *customer_id*, check_type, result, check_date)
- TRANSACTION_RECORD(**transaction_id**, *customer_id*, amount_eur, tx_date)

(**bold** = primary key, *italic* = foreign key)
