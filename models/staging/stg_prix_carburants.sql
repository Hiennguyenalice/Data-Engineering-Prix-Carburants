WITH raw_data AS (
    SELECT * FROM {{ source('source_prix_carburants', 'RAW_PRIX_FULL') }}
)



--id;Code postal;pop;adresse;ville;horaires;rupture;fermeture;geom;Mise � jour des prix;prix_id;Prix;Carburant;
SELECT
    -- Conversion de l'ID en entier
    C1::int AS station_id,
    
    -- Le code postal reste souvent en texte (pour garder le '0' au début)
    C2 AS code_postal,
    
    -- Type de zone (urbaine/rurale)
    C3 AS pop,
    
    -- Nom du carburant (Gazole, E10, etc.)
    C13 AS nom_carburant,
    
    -- Conversion du prix : on divise par 1000 car l'Open Data est en millimes
    -- On utilise TRY_TO_DECIMAL pour éviter les erreurs si une ligne est corrompue
    (TRY_TO_DECIMAL(C12))::decimal(10,3) AS prix_litre,
    
    -- Conversion de la date (qui est en string) vers un format TIMESTAMP
    TRY_TO_TIMESTAMP(C10) AS date_mise_a_jour

FROM raw_data
-- Très important : on ignore la première ligne si c'est l'en-tête du CSV
WHERE C1 != 'id' -- Ignore l'en-tête
  AND C1 IS NOT NULL -- Ignore les lignes totalement vides
  AND C12 IS NOT NULL       -- FILTRE : Supprime les prix vides
  AND TRY_TO_DECIMAL(C12) > 0 -- FILTRE : Garde uniquement les prix valides
  AND C13 IS NOT NULL  -- FILTRE : Supprime les lignes sans nom de carburant
