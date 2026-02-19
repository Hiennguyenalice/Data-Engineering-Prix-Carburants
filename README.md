# Data-Engineering-Prix-Carburants
# ⛽ Pipeline Data Engineering : Prix des Carburants

## 📖 Description
Ce projet automatise le traitement des données Open Data des prix des carburants en France. 
L'objectif est de transformer des données brutes hétérogènes en indicateurs fiables pour l'analyse.

## 🏗️ Architecture (Architecture Médaillon)
* **Bronze (Raw) :** Ingestion de fichiers CSV (plus de 20 colonnes brutes) dans Snowflake.
* **Silver (Staging) :** Nettoyage, renommage (C1 -> ID, etc.), et typage des données avec dbt.
* **Gold (Marts) :** Agrégation métier des prix moyens par type de carburant et zone (POP).

## 🛠️ Stack Technique
* **Entrepôt :** Snowflake
* **Transformation :** dbt Cloud
* **Langage :** SQL (Snowflake Dialect)

## 🛡️ Qualité des Données & Robustesse
Pour ce projet, j'ai mis en place des mécanismes de défense :
* **Filtres SQL :** Utilisation de `TRY_TO_DECIMAL` pour éviter les erreurs de format et filtrage des valeurs `NULL`.
* **Tests Automatisés :** Tests de non-nullité et d'intégrité sur les colonnes clés via dbt.

## 📊 Visualisation du Pipeline (Lineage)
![alt text](image-1.png)