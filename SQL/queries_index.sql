CREATE INDEX idx_transactions_client
ON "Transactions" ("client_id");

CREATE INDEX idx_transactions_date
ON "Transactions" ("date_transaction");

CREATE INDEX idx_transactions_agence
ON "Transactions" ("agence_id");