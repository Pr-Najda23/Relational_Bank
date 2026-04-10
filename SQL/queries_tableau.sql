CREATE TABLE "Clients" (
  "client_id" int PRIMARY KEY,
  "score_credit_client" int,
  "segment_id" int,
  "categorie_risque" varchar
);

CREATE TABLE "Segments" (
  "segment_id" int PRIMARY KEY,
  "segment_client" varchar
);

CREATE TABLE "Comptes" (
  "compte_id" int PRIMARY KEY,
  "client_id" int,
  "solde_avant" float,
  "taux_interet" float
);

CREATE TABLE "Produits" (
  "produit_id" int PRIMARY KEY,
  "nom_produit" varchar
);

CREATE TABLE "Agences" (
  "agence_id" int PRIMARY KEY,
  "nom_agence" varchar
);

CREATE TABLE "Temps" (
  "date_transaction" date PRIMARY KEY,
  "annee" int,
  "mois" int,
  "trimestre" int,
  "jour_semaine" varchar
);

CREATE TABLE "Transactions" (
  "transaction_id" int PRIMARY KEY,
  "client_id" int,
  "compte_id" int,
  "agence_id" int,
  "produit_id" int,
  "date_transaction" date,
  "montant" float,
  "devise" varchar,
  "taux_change_eur" float,
  "montant_eur" float,
  "montant_eur_verifie" float,
  "montant_eur_match" boolean,
  "type_operation" varchar,
  "statut" varchar,
  "is_outlier_montant" boolean,
  "is_outlier_score" boolean,
  "is_anomaly" boolean,
  "montant_credit" float,
  "montant_debit" float,
  "rejet" boolean
);

ALTER TABLE "Clients" ADD FOREIGN KEY ("segment_id") REFERENCES "Segments" ("segment_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Comptes" ADD FOREIGN KEY ("client_id") REFERENCES "Clients" ("client_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Transactions" ADD FOREIGN KEY ("client_id") REFERENCES "Clients" ("client_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Transactions" ADD FOREIGN KEY ("compte_id") REFERENCES "Comptes" ("compte_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Transactions" ADD FOREIGN KEY ("agence_id") REFERENCES "Agences" ("agence_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Transactions" ADD FOREIGN KEY ("produit_id") REFERENCES "Produits" ("produit_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Transactions" ADD FOREIGN KEY ("date_transaction") REFERENCES "Temps" ("date_transaction") DEFERRABLE INITIALLY IMMEDIATE;
