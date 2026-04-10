CREATE VIEW vue_transactions_complete AS
SELECT 
    t.transaction_id,
    c.client_id,
    c.score_credit_client,
    c.categorie_risque,
    s.segment_client,
    cp.compte_id,
    a.nom_agence,
    p.nom_produit,
    t.date_transaction,
    tm.annee,
    tm.mois,
    tm.trimestre,
    t.montant,
    t.montant_eur,
    t.type_operation,
    t.statut,
    t.rejet
FROM "transactions" t
JOIN "clients" c ON t.client_id = c.client_id
JOIN "segments" s ON c.segment_id = s.segment_id
JOIN "comptes" cp ON t.compte_id = cp.compte_id
JOIN "agences" a ON t.agence_id = a.agence_id
JOIN "produits" p ON t.produit_id = p.produit_id
JOIN "temps" tm ON t.date_transaction = tm.date_transaction;




CREATE VIEW vue_kpi_agence AS
SELECT 
    a.nom_agence,
    COUNT(t.transaction_id) AS nb_transactions,
    AVG(t.montant) AS montant_moyen,
    SUM(t.montant) AS total_montant,
    AVG(CASE WHEN t.rejet = TRUE THEN 1 ELSE 0 END) AS taux_rejet
FROM "transactions" t
JOIN "agences" a ON t.agence_id = a.agence_id
GROUP BY a.nom_agence;

CREATE VIEW vue_client_stats AS
SELECT 
    c.client_id,
    COUNT(t.transaction_id) AS nb_transactions,
    AVG(t.montant) AS montant_moyen,
    SUM(t.montant) AS total_montant
FROM "clients" c
LEFT JOIN "transactions" t ON c.client_id = t.client_id
GROUP BY c.client_id;