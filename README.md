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

**PROCEDURE:**
1. Télécharger le fichier prix_carburant_quotidien.csv depuis data.gouv.fr, limité le nombres de lignes de données à 30 000 lignes.
2. Creer les comptes DBT Cloud et Snowflake, ajouter les paramètre pour qu'il se communique ensemble
3. Creer database, schema et stage dans le compte Snowflake
4. Charger les donnees de fichier prix_carburant_quotidien.csv en stage
5. Creer un table cible RAW_PRIX_FULL et copier tous les données de stage à la table RAW_PRIX_FULL
6. Dans dbt, verifier la connexion entre dbt et snowflake utiliser un fichier profiles.yml.
7. Dans dbt,  créer un fichier src_carburants.yml. C’est ce qui permet de faire du "Lineage" (suivre d'où vient la donnée).
8. Dans dbt, créer la modèle SQL (stg_prix_carburants.sql) pour: nettoyer les données (renommer les colonnes, convertir les types des données, gérer les types de date) pour que tous les données soient prets à utiliser
9. Dans dbt, créer  une table finale (fct_prix_moyens_par_region.sql) qui calcule, le prix moyen du Gazole par département ou par ville.

**Voici quelques captures d'écran de la construction du projet**

**Snowflake settings**

<img width="1587" height="891" alt="image" src="https://github.com/user-attachments/assets/cc14e16c-69c8-48e1-8e65-f57b2a6ed75b" />
**Account details:**
<img width="1408" height="881" alt="image" src="https://github.com/user-attachments/assets/6b0f2482-4f43-4436-bcd2-f166d8037014" />
<img width="866" height="602" alt="image" src="https://github.com/user-attachments/assets/7b75ef8b-6ee8-4dd1-9fae-60d2d0673272" />
**File format:**
<img width="1686" height="878" alt="image" src="https://github.com/user-attachments/assets/d640ebe5-3f10-43a4-b4f5-8926007b6840" />
**Users & roles**
<img width="1909" height="763" alt="image" src="https://github.com/user-attachments/assets/188172fd-ecdf-4741-b0de-5d40da992df3" />
**SnowFlake_Warehouses**
<img width="1866" height="544" alt="image" src="https://github.com/user-attachments/assets/2674768c-a819-460b-a070-2eb9fcf99cc0" />
<img width="1621" height="240" alt="image" src="https://github.com/user-attachments/assets/b48cd95c-7115-439a-9e97-18cb5414fb5f" />
**Snowflake and dbt connection**
<img width="1628" height="870" alt="image" src="https://github.com/user-attachments/assets/ae0f12f4-48e6-4307-af81-3e2cb2b61676" />

**DBT setting**
<img width="2378" height="1076" alt="image" src="https://github.com/user-attachments/assets/619694c4-ea74-477d-b21b-dd278e3386a9" />
**Le succès des Tests **
<img width="1085" height="753" alt="image" src="https://github.com/user-attachments/assets/4559c194-89de-40cf-b945-fdf1510b7b36" />

**Le résultat sur Snowflake **
<img width="1696" height="776" alt="image" src="https://github.com/user-attachments/assets/975ab263-f291-4adc-a3e6-0137120c99bb" />
<img width="2394" height="1148" alt="image" src="https://github.com/user-attachments/assets/6d2128b7-d6a4-41e2-99c5-adfafcb5b880" />


**LINEAGE sur dbt**
<img width="2394" height="1073" alt="image" src="https://github.com/user-attachments/assets/75ea8051-b266-47bd-a087-86d662f2537a" />











