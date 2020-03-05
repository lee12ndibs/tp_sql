-- ===============================================================================
-------- Universit� Sorbonne Paris Nord , Institut Gali�e
-------- Masters Informatique, Ing�nieurs
-------- Exploration Informatique des Donn�es et D�cisionnel
-- ===============================================================================
-------- La Data ; The Data
-------- La Donn�e est le monde du futur ; Les donn�es et le monde de l'avenir
-------- The Data is the world of the future ;  The Data and the future's world
-- ===============================================================================
-------- DATA -->>> 
-------- Bases de Donn�es Avanc�es = Advanced Databases (BDA)
-------- Entrep�ts de Donn�es = Data Warehouses (DWH, EDON)
-------- Lacs de Donn�es = Data Lakes
-------- Big Data, Dark Data, Open Data, Master Data... 
-- ===============================================================================

-------- Directeur :  Dr. M. Faouzi Boufar�s
-------- Enseignant-Chercheur Responsable      

-------- Page Web : http://www.lipn.univ-paris13.fr/~boufares

-- ================================================================================
--  Nom du Cas       :  Exemples  de manipulations des donn�es sous oracle
--  Nom de SGBD      :  ORACLE                   
--  Date de cr�ation :  F�vrier 2020 
--  Auteur           :  Faouzi BOUFARES, Universit� Sorbonne Paris Nord    
-- ================================================================================

PROMPT ****************************************************************************
PROMPT *                                                                          *
PROMPT *      FICHE A : Les donn�es de Base sur Les Bases de Donn�es              *
PROMPT *      FICHE A : D�marrer avec le SGBD Oracle                              *
PROMPT *      FICHE A : Exercices A.1, A.2, A.3 et A.4 ; MFB 1, 2, 3, et 4        *
PROMPT *                                                                          *
PROMPT ****************************************************************************
PROMPT

-- ================================================================================
-- ================================================================================
PROMPT 
PROMPT ************************** Exercice A.1 MFB 1 ******************************
PROMPT

PROMPT *********************** Test de quelques commandes SQL et SQL PLUS *********
PROMPT

-- ================================================================================
PROMPT permet d initialiser le FORMAT de la date
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY' ;
-- ================================================================================

PROMPT ***************** Affichade de la Date d aujourd hui ***********************
SELECT SYSDATE FROM DUAL;

REM *******************************************************************************
PROMPT Quel est le nom de votre jour de naissance ?
SELECT TO_CHAR(TO_DATE('17-09-1958', 'DD-MM-YYYY'),'DAY') JOURNAISSANCE FROM DUAL;
SELECT TO_CHAR(TO_DATE('22-11-1969', 'DD-MM-YYYY'),'DAY') JOURNAISSANCE FROM DUAL;
SELECT TO_CHAR(TO_DATE('16-10-1996', 'DD-MM-YYYY'),'DAY') JOURNAISSANCE FROM DUAL;
SELECT TO_CHAR(TO_DATE('19-06-2001', 'DD-MM-YYYY'),'DAY') JOURNAISSANCE FROM DUAL;
SELECT TO_CHAR(TO_DATE('14-01-2011', 'DD-MM-YYYY'),'DAY') JOURNAISSANCE FROM DUAL;
SELECT TO_CHAR(TO_DATE('24-02-2020', 'DD-MM-YYYY'),'DAY') JOURNAISSANCE FROM DUAL;

-- ??? Et vous quel est le nom de votre jour de naissance jj-mm-aaaa ?
-- ??? SELECT TO_CHAR(TO_DATE('jj-mm-aaaa ???', 'DD-MM-YYYY'),'DAY') JOURNAISSANCE FROM DUAL;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

REM *******************************************************************************
REM *******************************************************************************
PROMPT *******************  Exemples de fonctions tr�s utiles ORACLE **************

--==== ****************************************************************************
PROMPT
PROMPT ***** Fonction RPAD *****
PROMPT
-- Concatenation de la premiere chaine "soleil" avec la seconde "bla"
-- de telle maniere a ce qu on concatene la seconde chaine jusqu a
-- obtenir le nombre de lettre desire "17"
SELECT RPAD('Soleil',17,'bla') "RPAD exemple" FROM DUAL;
PROMPT
PAUSE Tapez sur Enter...

/*
RPAD exemple
-----------------
Soleilblablablabl

*/
--==== ****************************************************************************
PROMPT
PROMPT ***** Fonction LPAD *****
PROMPT
-- Idem que precedemment sauf que la seconde chaine est mise en tete
-- et on la concatene a "DESS EID" pour qu au final on ait 15 lettres
SELECT LPAD('Master EID2',15,'*.') "LPAD exemple" FROM DUAL;
/*LPAD exemple
---------------
*.*.Master EID2*/

PROMPT
PAUSE Tapez sur Enter...

--==== ****************************************************************************
PROMPT
PROMPT ***** Fonction SUBSTR *****
PROMPT
-- on prend a partir du 6eme caractere de la chaine les 3 suivants
-- caracteres
SELECT SUBSTR('Master EID2',6,3) "SUBSTR exemple" FROM DUAL;
/*SUB
---
r E
*/
-- on prend a partir du 6eme caractere
-- en fait on ne prend pas les 5 premiers
SELECT SUBSTR('ABCDEFGHIJ',-5,4) "SUBSTR exemple" FROM DUAL;
PROMPT
PAUSE Tapez sur Enter...

--==== ****************************************************************************
PROMPT
PROMPT ***** Fonction TO_CHAR *****
-- date et heure au moment ou on fait la requete
SELECT TO_CHAR (SYSDATE, 'MM-DD-YYYY HH24:MI:SS') "Now" FROM DUAL;
PROMPT
PAUSE Tapez sur Enter...

--==== ****************************************************************************
PROMPT
PROMPT ***** Fonction LENGTH *****
PROMPT
-- longueur de la chaine
SELECT LENGTH('BIG DATA') "Longueur en caract�res" FROM DUAL;
/*
Longueur en caract???res
------------------------
		       8*/

PROMPT
PAUSE Tapez sur Enter...

--==== ****************************************************************************
PROMPT
PROMPT ***** Fonction ROUND *****
PROMPT
-- arrondi le chiffre donne a x chiffre(s) apres la virgule ici "x=1" 
-- pour la premiere fonction  
SELECT ROUND(17.0958,1) "ROUND exemple" FROM DUAL;

ROUND exemple
-------------
	 17.1

-- et ensuite "x=2"
SELECT ROUND(17.58,2) "ROUND exemple" FROM DUAL;
PROMPT
PAUSE Tapez sur Enter...

--==== ****************************************************************************
PROMPT
PROMPT ***** Fonction TRUNC *****
PROMPT
-- on tronque le chiffre donne a x chiffre(s) apres la virgule ici "x=1"
-- pour la premiere fonction
SELECT TRUNC(1958.0917,1) "TRUNC exemple" FROM DUAL;
-- et ensuite "x=2"
SELECT TRUNC(1958.0917,2) "TRUNC exemple" FROM DUAL;
PROMPT
PAUSE Tapez sur Enter...

--==== ****************************************************************************
PROMPT
PROMPT ***** Fonctions ROUND ET TO_DATE *****
PROMPT
-- arrondi a l annee superieure en mettant le jour et le mois a 1
SELECT ROUND(TO_DATE('17-09-2020'), 'YEAR') "New Year" FROM DUAL;
PROMPT
PAUSE Tapez sur Enter...

--==== ****************************************************************************
PROMPT
PROMPT ***** Fonction EXTRACT *****
PROMPT
-- extrait l annee actuelle
SELECT EXTRACT(YEAR FROM SYSDATE) FROM DUAL;
/*EXTRACT(YEARFROMSYSDATE)
------------------------
		    2020
*/
PROMPT
PAUSE Tapez sur Enter...

--==== ****************************************************************************
PROMPT
PROMPT ***** Fonction ADD_MONTHS *****
PROMPT
-- ajout de 7 mois a la date actuelle
SELECT ADD_MONTHS(SYSDATE,7) FROM DUAL;
/*ADD_MONTH
---------
03-OCT-20
*/
PROMPT
PAUSE Tapez sur Enter...

--==== ****************************************************************************
PROMPT
PROMPT ***** Fonctions TRUNC ET MONTHS_BETWEEN ******
PROMPT
-- calcule le nombre de mois entre la date actuelle et celle passee en parametre
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE('19-06-2001'))) AS AGEBB FROM DUAL;
PROMPT
PAUSE Tapez sur Enter...

--==== ****************************************************************************
PROMPT
PROMPT ***** Fonctions TO_NUMBER ET TO_CHAR *****
PROMPT
-- transFORMATion de la chaine de caracteres annee recuperee par SYSDATE, en nombre
SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))FROM DUAL;
PROMPT
PAUSE Tapez sur Enter...


-- ================================================================================
-- ================================================================================
PROMPT 
PROMPT ************************** Exercice A.2 MFB 2 ******************************
PROMPT

PROMPT ***************** Suppression de la table ETUDIANTS si elle existe *********
DROP TABLE ETUDIANTS;
PROMPT
PROMPT ***************** Creation de la table ETUDIANT.e.S ************************
PROMPT
-- ATTENTION La d�finition ci-dessous n'est pas normalisee -->>> A �viter
CREATE TABLE ETUDIANTS(
    NUMERO            NUMBER(4)       NOT NULL,
    NOM               VARCHAR2(25)    NOT NULL,
    PRENOM            VARCHAR2(25)    NOT NULL,
    DATENAISSANCE     DATE            NOT NULL,
    POIDS             NUMBER,
    ANNEE             NUMBER,
    CONSTRAINT PK_ETUDIANT            PRIMARY KEY(NUMERO));
	
PROMPT
PROMPT ************* Insertion de donnees dans la table ETUDIANT.e.S **************
PROMPT
-- ATTENTION � la liste des attributs :
-- 1 : (NUMERO, NOM, PRENOM, DATENAISSANCE, POIDS, ANNEE) 
-- 2 : (ANNEE, NOM, NUMERO, PRENOM, DATENAISSANCE, POIDS)
-- 3 : Pas de liste, ce qui veut dire TOUS les attributs dans le bon ordre
-- 4 : (DATENAISSANCE, POIDS, ANNEE, NUMERO, NOM, PRENOM)
INSERT INTO ETUDIANTS (NUMERO, NOM, PRENOM, DATENAISSANCE, POIDS, ANNEE) 
VALUES (71, 'Traifor', 'Benoit', '10-12-1978', 77, 1);

INSERT INTO ETUDIANTS (ANNEE, NOM, NUMERO, PRENOM, DATENAISSANCE, POIDS) 
VALUES (1, 'Genial', 72, 'Clement', '10-04-1978', 72);

INSERT INTO ETUDIANTS VALUES (73, 'Paris', 'Adam', '28-06-1974', 72, 2);

INSERT INTO ETUDIANTS (DATENAISSANCE, POIDS, ANNEE, NUMERO, NOM, PRENOM) 
VALUES ('20-09-1977', 72, NULL, 74, 'Paris', 'Clemence');

PROMPT
PAUSE Tapez sur Enter...
PROMPT


REM *******************************************************************************
REM *******************************************************************************
PROMPT *******************  Exemples de fonctions tr�s utiles ORACLE **************

--==== ****************************************************************************
PROMPT
PROMPT ***** Fonction DECODE *****
PROMPT
-- Dans la table ETUDIANTS, colonne annee, substitue : 
-- respectivement les 1 et 2 par Premiere et Seconde ;
-- Si d autres valeurs existent alors afficher "Valeur differente de 1 et de 2 !!" 
SELECT DECODE(ANNEE, 1, 'Premi�re', 2, 'Seconde', 'Valeur diff�rente de 1 et de 2 !!') 
AS ANETUDE FROM ETUDIANTS;
/*
ANETUDE
-----------------------------------
Premi�re
Premi�re
Seconde
Valeur diff�rente de 1 et de 2 !!
*/
PROMPT
PAUSE Tapez sur Enter...

--==== ****************************************************************************
PROMPT
PROMPT ***** Fonction UPPER *****
PROMPT
-- Permet de mettre en majuscule les noms dans la table ETUDIANTS
SELECT UPPER(NOM) FROM ETUDIANTS;
PROMPT
PAUSE Tapez sur Enter...

--==== ****************************************************************************
PROMPT
PROMPT ***** Fonction LOWER *****
PROMPT
-- Permet de mettre en minuscule les noms dans la table ETUDIANTS
SELECT LOWER(NOM) FROM ETUDIANTS;
PROMPT
PAUSE Tapez sur Enter...

--==== ****************************************************************************
PROMPT
PROMPT ***** Fonction NVL *****
PROMPT
PROMPT Ces requetes ne fonctionnent pas car NVL attend au deuxieme champ
PROMPT le meme type que celui du premier champ, c est-a-dire un nombre ici
-- Cette requete ne fonctionne pas car NVL attend au deuxieme champ
-- le meme type que celui du premier champ, c'est-�-dire un nombre
SELECT NVL(ANNEE, 'Valeur NON renseign�e') FROM ETUDIANTS;
PROMPT
-- Cette requete ne fonctionne pas car NVL attend au deuxieme champ
-- le meme type que celui du premier champ, c'est-�-dire un nombre
SELECT NVL(ANNEE, 'Valeur NON renseign�e') AS AN_ETUDE FROM ETUDIANTS;
--==== ****************************************************************************
--==== ----------------------------------------------------------------------------
PROMPT
PROMPT requetes corrigees par rapport aux deux precedentes
-- CORRECTION DE CES REQUETES
-- Dans la table ETUDIANTS, on prend toutes les annees des ETUDIANTS
-- et si elle n'est pas renseignee alors on ecrit que "valeur non renseignee"
SELECT NVL(ANNEE, -1) FROM ETUDIANTS;
PROMPT 

/*NVL(ANNEE,-1)
-------------
	    1
	    1
	    2
	   -1
*/
-- Renomme la colonne a l affichage des resultats
SELECT NVL(ANNEE, -1) AS AN_ETUDE FROM ETUDIANTS;

-----------------------------------------------------------------------------

-- ================================================================================
-- ================================================================================
PROMPT 
PROMPT ************************** Exercice A.3 MFB 3 ******************************
PROMPT

PROMPT ***************** Suppression de la table ETUDIANTS si elle existe *********
DROP TABLE ETUDIANTS;
PROMPT
PROMPT ***************** Creation de la table ETUDIANT.e.S ************************
PROMPT
PROMPT modification de la table ETUDIANTS
-- ATTENTION La d�finition ci-dessous n'est pas normalisee -->>> A �viter
PROMPT Changement de l attribut ANNEE(NUMBER) en ANNEE(VARCHAR2(10)) 
PROMPT et les tests des fonctions
PROMPT
CREATE TABLE ETUDIANTS(
    NUMERO            NUMBER(4)       NOT NULL,
    NOM    	      VARCHAR2(25)    NOT NULL,
    PRENOM            VARCHAR2(25)    NOT NULL,
    DATENAISSANCE     DATE            NOT NULL,
    POIDS             NUMBER,
    ANNEE             VARCHAR2(10),
    CONSTRAINT PK_ETUDIANT    PRIMARY KEY(NUMERO));
	
PROMPT
PROMPT ************* Insertion de donnees dans la table ETUDIANT.e.S **************
PROMPT
    
INSERT INTO ETUDIANTS (NUMERO, NOM, PRENOM, DATENAISSANCE, POIDS, ANNEE) 
VALUES (71, 'Traifor', 'Beno�t', '10-12-1978', 77, 1);

INSERT INTO ETUDIANTS (ANNEE, NOM, NUMERO, PRENOM, DATENAISSANCE, POIDS) 
VALUES (1, 'Genial', 72, 'Clement', '10-04-1978', 72);

INSERT INTO ETUDIANTS VALUES (73, 'Paris', 'Adam', '28-06-1974', 72, 2);

INSERT INTO ETUDIANTS (DATENAISSANCE, POIDS, ANNEE, NUMERO, NOM, PRENOM) 
VALUES ('20-09-1977', 72, NULL, 74, 'Paris', 'Clemence');


PROMPT
PAUSE Tapez sur Enter...
PROMPT

REM *******************************************************************************
REM *******************************************************************************
PROMPT *******************  Exemples de fonctions tr�s utiles ORACLE **************

SELECT DECODE(ANNEE, 1, 'Premi�re', 2, 'Seconde', 'Valeur diff�rente de 1 et de 2 !!') 
AS ANETUDE FROM ELEVES;    

SELECT NVL(ANNEE, -1) FROM ETUDIANTS;

SELECT NVL(ANNEE, -1), ANNEE AS AN_ETUDE FROM ETUDIANTS;
/*NVL(ANNEE, AN_ETUDE
---------- ----------
1	   1
1	   1
2	   2
-1
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ************************** Gestion de l affichage **************************
PROMPT

--SET PAGE 1000
SET LINE 1000
TTITLE ON
TTITLE CENTER ' Liste des �tudiants' skip 1 -
      LEFT  '======================================================================' skip 0

COLUMN NUMERO HEADING 'NUMERO|' FORMAT 999
COLUMN NOM HEADING 'NOM|' FORMAT A8
COLUMN PRENOM HEADING 'PRENOM|' FORMAT A8
COLUMN DATENAISSANCE HEADING 'DATE|NAISSANCE|' FORMAT A10
COLUMN POIDS HEADING 'POIDS|' FORMAT 999
COLUMN ANNEE HEADING 'ANNEE|' FORMAT 999

SELECT * FROM ETUDIANTS;
TTITLE OFF

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT Affichage avec le prenom et le nom sur une seule colonne (concat�nation)
PROMPT

SET PAGES 1000
SET LINE 1000
TTITLE ON
TTITLE CENTER ' Liste des �tudiants' skip 1 -
      LEFT  '=====================================================================================' skip 0
SELECT NUMERO, NOM || ' ' || PRENOM AS NOM__PRENOM, DATENAISSANCE, POIDS, ANNEE FROM ETUDIANTS;
TTITLE OFF
/*

    NUMERO NOM__PRENOM					       DATENAIS      POIDS ANNEE
---------- --------------------------------------------------- -------- ---------- ----------
	71 Traifor Beno�t				       10/12/78 	77 1
	72 Genial Clement				       10/04/78 	72 1
	73 Paris Adam					       28/06/74 	72 2
	74 Paris Clemence				       20/09/77 	72
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT affichage avec la premiere lettre du prenom en majuscule puis suivi d un point,
PROMPT d un espace et le nom en majuscule sur une seule colonne 
PROMPT

SET PAGES 1000
SET LINE 1000
TTITLE ON
TTITLE CENTER ' Liste des �tudiants' skip 1 -
      LEFT  '=====================================================================================' skip 0
SELECT NUMERO, UPPER(SUBSTR(PRENOM, 1, 1)) || '. ' || UPPER(NOM) AS PRENOM__NOM, 
      DATENAISSANCE, POIDS, ANNEE FROM ETUDIANTS;
TTITLE OFF
/*SELECT NUMERO, UPPER(SUBSTR(PRENOM, 1, 1)) || '. ' || UPPER(NOM) AS PRENOM__NOM, 
      DATENAISSANCE, POIDS, ANNEE FROM ETUDIANTS;*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT

-- ================================================================================
-- ================================================================================
PROMPT 
PROMPT ************************** Exercice A.4 MFB 4 ******************************
PROMPT

PROMPT ************* Tests des commandes "Systeme" oracle *************************
PROMPT

REM ************  Exemples de manipulations du dictionnaire d ORACLE ***************
REM ********************************************************************************
REM ********************************************************************************

PROMPT *********  Exemples de manipulations du dictionnaire d oracle ORACLE ********
PROMPT
PROMPT Attention les noms des objets oracle sont en majuscule !
-- Affiche l utilisateur actuellement connecte sous ce compte
SHOW USER ;
/*USER est "M2EID_34"*/

TTITLE 'La liste des utilisateurs oracle est :'
-- montre tous les comptes utilisateurs qui existent
SELECT * FROM all_users;
/*
USERNAME			  USER_ID CREATED
------------------------------ ---------- --------
SYS					0 15/08/09
SYSTEM					5 15/08/09
OUTLN					9 15/08/09
DIP				       14 15/08/09
ORACLE_OCM			       21 15/08/09
DBSNMP				       30 15/08/09
APPQOSSYS			       31 15/08/09
WMSYS				       32 15/08/09
XS$NULL 		       2147483638 15/08/09
.....
*/
PAUSE

-- donne toutes les tables creees dans la session actuelle
DESC user_tables ;
SELECT table_name FROM user_tables;
PAUSE

-- renomme le nom de la colonne et SELECTionne la table_name de user_tables
TTITLE 'La liste des tables cr��es est :'
COLUMN table_name HEADING Nom_de_l_utilisateur;
SELECT table_name FROM user_tables;
PAUSE
/*
TABLE_NAME
------------------------------
MATCHVAL
BDACM
BDDBLP
BIBLIOGRAPHIE
DATASOURCE
ELEVES
ALLER_RETOUR
TABLE_TEMPS1
TABLE_TEMPS2
TABLE_TEMPS3
UTILISATEUR
ETUDIANTS
PERSONNES
PRODUITS
NOMENCLATURE
NOMEN
ROUTE
CLIENTS
COMMANDES
ARTICLES
DETAILCOM
MAGASINS
VILPAYS
TABCLI
FILE_DEP

25 lignes s�lectionn�es.*/

-- affichage de 30 ligne avant de passer a la page suivante
COLUMN object_name FORMAT A30
SET PAGES 30
TTITLE 'La liste des objet et le type est:'
SELECT object_name, object_type FROM user_objects ORDER BY object_type;
PAUSE
/*
Mar. Mars  03																										       page    1
																											   La liste des objet et le type est:

OBJECT_NAME															 OBJECT_TYPE
-------------------------------------------------------------------------------------------------------------------------------- -------------------
FUN_NBELTNULL															 FUNCTION
PK_ARTICLES															 INDEX
PK_PERSONNES															 INDEX
PK_PRODUITS															 INDEX
PK_ROUTE															 INDEX
MATCHVAL_PK															 INDEX
PK_MAGASINS															 INDEX
PK_NOMENCLATURE 														 INDEX
PK_CLIENTS															 INDEX
PK_COMMANDES															 INDEX
PK_DETAILCOM															 INDEX
PK_ELEVES															 INDEX
PK_ETUDIANT															 INDEX
SYS_C001417372															 INDEX
SYS_C001417371															 INDEX
DUPLIQUE															 PROCEDURE
NBMOTS_DISTINCT 														 PROCEDURE
*/

-- permet de recuperer une valeur entree par l utilisateur
-- et d effectuer les traitements necessaires
desc user_constraints;
COLUMN constraint_name FORMAT a30
TTITLE 'La liste des contraintes cr��es est:'
SELECT constraint_name FROM user_constraints WHERE table_name='&matable';
/*
SELECT constraint_name FROM user_constraints WHERE table_name='&matable';
Entrez une valeur pour matable : ETUDIANTS
ancien	 1 : SELECT constraint_name FROM user_constraints WHERE table_name='&matable'
nouveau   1 : SELECT constraint_name FROM user_constraints WHERE table_name='ETUDIANTS'

Mar. Mars  03																										       page    1
																											   La liste des objet et le type est:

CONSTRAINT_NAME
------------------------------
SYS_C001422169
SYS_C001422170
SYS_C001422171
SYS_C001422172
PK_ETUDIANT
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ******* Changement des contraintes et tests des commandes oracle ******
PROMPT

PROMPT ****************** Suppression de la table ETUDIANTS ******************
PROMPT
DROP TABLE ETUDIANTS;

PROMPT ******************** Creation de la table ETUDIANTS *******************
PROMPT
-- ATTENTION La d�finition ci-dessous n'est pas normalisee -->>> A �viter
CREATE TABLE ETUDIANTS(
    NUMERO            NUMBER(4)       NOT NULL,
    NOM               VARCHAR2(25)    NOT NULL,
    PRENOM            VARCHAR2(25)    NOT NULL,
    DATENAISSANCE     DATE            NOT NULL,
    POIDS             NUMBER,
    ANNEE             NUMBER,
    CONSTRAINT PK_ETUDIANT    PRIMARY KEY(NUMERO));
    
TTITLE 'La liste des contraintes cr��es est pour la table etudiants :'
SELECT constraint_name FROM user_constraints WHERE table_name='etudiants';
PROMPT
PAUSE Tapez sur Enter...
PROMPT
TTITLE 'La liste des contraintes cr��es est pour la table ETUDIANTS :'
SELECT constraint_name FROM user_constraints WHERE table_name='ETUDIANTS';
PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ********************* Suppression de la table ETUDIANTS ***************
PROMPT
DROP TABLE ETUDIANTS;
PROMPT ********************** Creation de la table ETUDIANTS *****************
PROMPT
-- ATTENTION La d�finition ci-dessous est normalisee -->>> A utiliser
CREATE TABLE ETUDIANTS
(
    NUMERO            NUMBER(4),
    NOM               VARCHAR2(25),
    PRENOM            VARCHAR2(25),
    DATENAISSANCE     DATE,
    POIDS             NUMBER,
    ANNEE             NUMBER,
    CONSTRAINT PK_ETUDIANT                  PRIMARY KEY(NUMERO),
    CONSTRAINT CK_ETUDIANT_ANNEE            CHECK(ANNEE BETWEEN 1 AND 2),
    CONSTRAINT NN_ETUDIANT_NOM              CHECK(NOM IS NOT NULL),
    CONSTRAINT NN_ETUDIANT_PRENOM           CHECK(PRENOM IS NOT NULL),
    CONSTRAINT NN_ETUDIANT_DATENAISSANCE    CHECK(DATENAISSANCE IS NOT NULL)
  );

  
TTITLE 'La liste des contraintes cr��es est pour la table ETUDIANTS :'
SELECT constraint_name FROM user_constraints WHERE table_name='ETUDIANTS';

-- ou pour ajouter les contraintes dans la seconde table etudiants
ALTER TABLE ETUDIANTS ADD CONSTRAINT CK_ETUDIANTS_ANNEE CHECK (ANNEE BETWEEN 1 AND 2);
ALTER TABLE ETUDIANTS ADD CONSTRAINT NN_ETUDIANTS_NOM CHECK (NOM IS NOT NULL);
ALTER TABLE ETUDIANTS ADD CONSTRAINT NN_ETUDIANTS_PRENOM CHECK (PRENOM IS NOT NULL);
ALTER TABLE ETUDIANTS ADD CONSTRAINT NN_ETUDIANTS_DATNAISSANCE CHECK (DATENAISSANCE IS NOT NULL);

TTITLE 'La liste des contraintes cr��es est pour la table ETUDIANTS :'
SELECT constraint_name FROM user_constraints WHERE table_name='ETUDIANTS';
/*
Mer. Mars  04							       page    1
       La liste des contraintes cr��es est pour la table ETUDIANTS :

CONSTRAINT_NAME
------------------------------
CK_ETUDIANT_ANNEE
NN_ETUDIANT_NOM
NN_ETUDIANT_PRENOM
NN_ETUDIANT_DATENAISSANCE
PK_ETUDIANT
CK_ETUDIANTS_ANNEE
NN_ETUDIANTS_NOM
NN_ETUDIANTS_PRENOM
NN_ETUDIANTS_DATNAISSANCE
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT

        
PROMPT ****** Y-a-t-il des index sur la table ETUDIANTS ????????????????????? ******
PROMPT
SELECT INDEX_NAME , INDEX_TYPE , TABLE_OWNER , TABLE_NAME  FROM USER_indexes ORDER BY 1;  


PROMPT ************ Jointure des tables all_tables et all_constraints **********
PROMPT
SELECT    t.TABLE_NAME
FROM      all_tables t, all_constraints c
WHERE     t.owner = c.owner AND t.TABLE_NAME = c.TABLE_NAME;
/* 279*/
PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *************************** Test de timing ******************************
PROMPT
SET TIMING ON
    SELECT    t.TABLE_NAME
    FROM      all_tables t, all_constraints c
    WHERE     t.owner = c.owner AND t.TABLE_NAME = c.TABLE_NAME;
SET TIMING OFF
PROMPT
PAUSE Tapez sur Enter...
PROMPT

SET TIMING ON
    SELECT    t.TABLE_NAME
    FROM      all_constraints c, all_tables t
    WHERE     c.TABLE_NAME = t.TABLE_NAME AND c.owner = t.owner;
SET TIMING OFF
PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT ****************************************************************************
PROMPT *                                                                          *
PROMPT *      FICHE B : Exemple de la Base de Donn�es appel�e BD EColE            *
PROMPT *      FICHE B : D�marrer avec le SGBD Oracle et SQL                       *
PROMPT *      FICHE B : Exercices B.1, B.2, B.3 et B.4 MFB 1, 2, 3, et 4          *
PROMPT *                                                                          *
PROMPT ****************************************************************************
PROMPT
PROMPT ************************* Exercice B.1: BD ECOLE ***************************
PROMPT
PROMPT
PROMPT *************** Destruction des tables de la BD ecole **********************
PROMPT

DROP TABLE ACTIVITES_PRATIQUEES ;
DROP TABLE CHARGE ;
DROP TABLE RESULTATS ;
DROP TABLE ACTIVITES ;
DROP TABLE PROFESSEURS ;
DROP TABLE COURS ;
DROP TABLE ELEVES ;
DROP TABLE AGGLOMERATION ;

-- ======================================================================
PROMPT ******* Initialisation du type date*******
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY' ;
-- ======================================================================

PROMPT
PROMPT **************** Cr�ation des tables de la BD ELEVE **************
PROMPT

-- ======================================================================
PROMPT ******************** Table : ELEVES ******************************                                            
-- ======================================================================
PROMPT

create table ELEVES
(
    NUM_ELEVE       NUMBER (4),
    NOM             VARCHAR2(25),
    PRENOM          VARCHAR2(25),
    DATE_NAISSANCE  DATE,
    POIDS           NUMBER,
    ANNEE           NUMBER,
    CONSTRAINT PK_ELEVES           PRIMARY KEY(NUM_ELEVE),
    CONSTRAINT NN_ELEVE_NOM        CHECK(NOM IS NOT NULL),
    CONSTRAINT NN_ELEVE_PRENOM     CHECK(PRENOM IS NOT NULL)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

-- =======================================================================
PROMPT ******************** Table : COURS ********************************                                          
-- =======================================================================
PROMPT

create table COURS
(
    NUM_COURS       NUMBER(2),
    NOM             VARCHAR2(20),
    NBHEURES        NUMBER(2),
    ANNEE           NUMBER(1),
    CONSTRAINT PK_COURS            PRIMARY KEY(NUM_COURS),
    CONSTRAINT NN_COURS_NOM        CHECK(NOM IS NOT NULL)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

-- =======================================================================
PROMPT ******************* Table : PROFESSEURS ***************************                                      
-- =======================================================================
PROMPT

create table PROFESSEURS
(
    NUM_PROF        NUMBER(4),
    NOM             VARCHAR2(25),
    SPECIALITE      VARCHAR2(20),
    DATE_ENTREE     DATE,
    DER_PROM        DATE,
    SALAIRE_BASE    NUMBER,
    SALAIRE_ACTUEL  NUMBER,
    CONSTRAINT PK_PROFESSEURS         PRIMARY KEY(NUM_PROF),
    CONSTRAINT NN_PROFESSEURS_NOM     CHECK(NOM IS NOT NULL)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

-- =======================================================================
PROMPT ******************** Table : ACTIVITES ****************************                                        
-- =======================================================================
PROMPT

create table ACTIVITES
(
    NIVEAU          NUMBER(1),
    NOM             VARCHAR2(20),
    EQUIPE          VARCHAR2(32),
    CONSTRAINT PK_ACTIVITES        PRIMARY KEY(NIVEAU, NOM)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

-- =======================================================================
PROMPT ********************* Table : RESULTATS ***************************                                        
-- =======================================================================
PROMPT

create table RESULTATS
(
    NUM_ELEVE       NUMBER(4),
    NUM_COURS       NUMBER(4),
    POINTS          NUMBER,
    CONSTRAINT PK_RESULTATS                     PRIMARY KEY(NUM_ELEVE, NUM_COURS),
    CONSTRAINT FK_RESULTATS_NUM_ELEVE_ELEVES    FOREIGN KEY(NUM_ELEVE)
                            REFERENCES ELEVES (NUM_ELEVE),
    CONSTRAINT FK_RESULTATS_NUM_COURS_COURS     FOREIGN KEY(NUM_COURS)
                            REFERENCES COURS (NUM_COURS)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

-- =======================================================================
PROMPT ********************* Table : CHARGE ******************************                                          
-- =======================================================================
PROMPT

create table CHARGE
(
    NUM_PROF       NUMBER(4) NOT NULL,
    NUM_COURS      NUMBER(4) NOT NULL,
    CONSTRAINT PK_CHARGE                    PRIMARY KEY(NUM_COURS, NUM_PROF),
    CONSTRAINt FK_CHARGE_NUM_COURS_COURS    FOREIGN KEY(NUM_COURS)
                              REFERENCES COURS (NUM_COURS),
    CONSTRAINT FK_CHARGE_NUM_PROF_PROFS     FOREIGN KEY(NUM_PROF)
							  REFERENCES PROFESSEURS (NUM_PROF)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

-- =======================================================================
PROMPT ****************** Table : ACTIVITES_PRATIQUEES *******************                            
-- =======================================================================
PROMPT

create table ACTIVITES_PRATIQUEES
(
    NUM_ELEVE       NUMBER(4),
    NIVEAU          NUMBER(1),
    NOM             VARCHAR2(20),
    CONSTRAINT PK_ACTIVITES_PRATIQUEES         PRIMARY KEY(NUM_ELEVE, NIVEAU, NOM),
    CONSTRAINT FK_ACTPRAT_NUM_ELEVE_ELEVES     FOREIGN KEY(NUM_ELEVE)
                        REFERENCES ELEVES (NUM_ELEVE),
    CONSTRAINT FK_ACTPRAT_NOM_NIVEAU_ACT       FOREIGN KEY(NOM, NIVEAU)
                        REFERENCES ACTIVITES (NOM, NIVEAU)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT


REM ***********************************************************************
PROMPT ************************ Creation des donnees **********************
REM ***********************************************************************
PROMPT

SELECT 'Creation des donnees' FROM DUAL;
SELECT 'Tapez sur RETURN 'FROM DUAL;
PAUSE


Insert into eleves (Num_eleve, nom, prenom, date_naissance, Poids, annee)
Values (1, 'Brisefer', 'Benoit', '10-12-1978', 35,1) ;

Insert into eleves (Num_eleve, nom, prenom, date_naissance, Poids, annee)
Values (2, 'G�nial', 'Olivier', '10-04-1978', 42, 1) ;

Insert into eleves (num_eleve, nom, prenom, date_naissance, Poids, annee)
Values (3, 'Jourdan', 'Gil', '28-06-1974', 72, 2) ;

Insert into eleves (num_eleve, nom, prenom, date_naissance, Poids, annee)
Values (4, 'Spring', 'Jerry', '16-02-1974', 78, 2) ;

Insert into eleves (num_eleve, nom, prenom, date_naissance, Poids, annee)
Values (5, 'Tsuno', 'Yoko', '29-10-1977', 45, 1) ;

Insert into eleves (num_eleve, nom, prenom, date_naissance, Poids, annee)
Values (6, 'Lebut', 'Marc', '29-04-1974', 75,2) ;

Insert into eleves (num_eleve, nom, prenom, date_naissance, Poids, annee)
Values (7, 'Lagaffe', 'Gaston', '08-04-1975', 61,1) ;

Insert into eleves (num_eleve, nom, prenom, date_naissance, Poids, annee)
Values (8, 'Dubois', 'Robin', '20-04-1976', 60, 2) ;

Insert into eleves (num_eleve, nom, prenom, date_naissance, Poids, annee)
Values (9, 'Walth�ry', 'Natacha', '07-09-1977', 59,1) ;

Insert into eleves (num_eleve, nom, prenom, date_naissance, Poids, annee)
Values (10, 'Danny', 'Buck', '15-02-1973', 82, 2) ;

COMMIT;

Insert into cours (Num_cours, Nom, Nbheures, annee)
Values (1, 'R�seau', 15, 1);

Insert into cours (Num_cours, Nom, Nbheures, annee)
Values (2, 'Sgbd', 30, 1) ;

Insert into cours (Num_cours, Nom, Nbheures, annee)
Values (3, 'Programmation', 15,1) ;

Insert into cours (Num_cours, Nom, Nbheures, annee)
Values (4, 'Sgbd', 30,2 ) ;

Insert into cours (Num_cours, Nom, Nbheures, annee)
Values (5, 'Analyse', 60,2) ;

COMMIT;

Insert into PROFESSEURS (Num_prof, nom , specialite, Date_entree, Der_prom, Salaire_base, Salaire_actuel)
Values(1, 'Bottle', 'po�sie', '01-10-1970', '01-10-1988', 2000000, 2600000) ;

Insert into PROFESSEURS (Num_prof, nom , specialite, Date_entree, Der_prom, Salaire_base, Salaire_actuel)
Values(2, 'Bolenov', 'r�seau', '15-11-1968', '01-10-1998', 1900000, 2468000) ;

Insert into PROFESSEURS (Num_prof, nom , specialite, Date_entree, Der_prom, Salaire_base, Salaire_actuel)
Values(3, 'Tonilaclasse', 'poo', '01-10-1979', '01-01-1989', 1900000, 2360000) ;

Insert into PROFESSEURS (Num_prof, nom , specialite, Date_entree, Der_prom, Salaire_base, Salaire_actuel)
Values(4, 'Pastecnov', 'sql', '01-10-1975', '', 2500000, 2500000) ;

Insert into PROFESSEURS (Num_prof, nom , specialite, Date_entree, Der_prom, Salaire_base, Salaire_actuel)
Values(5, 'SELECTor', 'sql', '15-10-1982', '01-10-1988', 1900000, 1900000) ;

Insert into PROFESSEURS (Num_prof, nom , specialite, Date_entree, Der_prom, Salaire_base, Salaire_actuel)
Values(6, 'Vilplusplus', 'poo', '25-04-1990', '05-06-1994', 1900000, 2200000) ;

Insert into PROFESSEURS (Num_prof, nom , specialite, Date_entree, Der_prom, Salaire_base, Salaire_actuel)
Values(7, 'Francesca', '', '01-10-1975', '11-01-1998', 2000000, 3200000) ;

Insert into PROFESSEURS (Num_prof, nom , specialite, Date_entree, Der_prom, Salaire_base, Salaire_actuel)
Values(8, 'Pucette', 'sql', '06-12-1988', '29-02-1996', 2000000, 2500000) ;

COMMIT;

Insert into CHARGE (Num_prof, Num_cours) Values(1,1) ;

Insert into CHARGE (Num_prof, Num_cours) Values(1,4) ;

Insert into CHARGE (Num_prof, Num_cours) Values(2,1) ;

Insert into CHARGE (Num_prof, Num_cours) Values(3,2) ;

Insert into CHARGE (Num_prof, Num_cours) Values(3,4) ;

Insert into CHARGE (Num_prof, Num_cours) Values(3,5) ;

Insert into CHARGE (Num_prof, Num_cours) Values(4,2) ;

Insert into CHARGE (Num_prof, Num_cours) Values(7,4) ;

Insert into CHARGE (Num_prof, Num_cours) Values(8,1) ;

Insert into CHARGE (Num_prof, Num_cours) Values(8,2) ;

Insert into CHARGE (Num_prof, Num_cours) Values(8,3) ;

Insert into CHARGE (Num_prof, Num_cours) Values(8,4) ;

Insert into CHARGE (Num_prof, Num_cours) Values(8,5) ;

COMMIT;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(1,1, 15 ) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(1,2 ,10.5 ) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(1, 4, 8) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(1, 5, 20) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(2, 1, 13.5) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(2, 2, 12) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(2, 4, 11) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(2, 5, 1.5) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(3, 1, 14) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(3, 2, 15) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(3, 4, 16) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(3, 5, 20) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(4, 1, 16.5) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(4, 2, 14) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(4, 4, 11) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(4, 5, 8) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(5, 1, 5) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(5, 2, 6.5) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(5, 4, 13) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(5, 5, 13) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(6, 1, 15) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(6, 2, 3.5) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(6, 4, 16) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(6, 5, 5) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(7, 1, 2.5) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(7, 2, 18) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(7, 4, 11) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(7, 5, 10) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(8, 1, 16) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(8, 2, 0) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(8, 4, 6) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(8, 5, 11.5) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(9, 1, 20) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(9, 2, 20) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(9, 4, 14) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(9, 5, 9.5) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(10, 1, 3) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(10, 2, 12.5) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(10, 4, 0) ;

Insert into RESULTATS (Num_eleve, Num_cours, points)
Values(10, 5, 16) ;

Insert into ACTIVITES (Niveau, Nom, equipe)
Values(1,'Mini foot','Amc Indus') ;

Insert into ACTIVITES (Niveau, Nom, equipe) 
values (1,'Surf','Les planchistes ...') ;


Insert into ACTIVITES (Niveau, Nom, equipe)
Values(2,'Tennis','Ace Club') ;

Insert into ACTIVITES (Niveau, Nom, equipe)
Values(3,'Tennis','Ace Club') ;

Insert into ACTIVITES (Niveau, Nom, equipe)
Values(1,'Volley ball', 'Avs80') ;

Insert into ACTIVITES (Niveau, Nom, equipe)
Values(2,'Mini foot', 'Les as du ballon') ;

Insert into ACTIVITES (Niveau, Nom, equipe)
Values(2,'Volley ball', 'smash') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (1, 1, 'Mini foot') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (1, 1, 'Surf') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (1, 1, 'Volley ball') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (1, 2, 'Tennis') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (2, 1, 'Mini foot') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (2, 2, 'Tennis') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (3, 2, 'Mini foot') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (3, 2, 'Tennis') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (3, 2, 'Volley ball') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (4, 1, 'Surf') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (4, 2, 'Mini foot') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (5, 1, 'Mini foot') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (5, 1, 'Surf') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (5, 1, 'Volley ball') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (8, 1, 'Mini foot') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (8, 1, 'Volley ball') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (8, 2, 'Volley ball') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (9, 1, 'Mini foot') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (9, 2, 'Volley ball') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (10, 1, 'Mini foot') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (10, 2, 'Tennis') ;

Insert into ACTIVITES_PRATIQUEES (Num_eleve, Niveau, Nom)
Values (10, 2, 'Volley ball') ;

REM **************************************************************************
REM ****************** Validation de la transaction **************************
COMMIT;
REM **************************************************************************
PROMPT

PROMPT
PAUSE Tapez sur Enter...
PROMPT **************** Affichage des tables de BD ECOLE *********************
PROMPT

SELECT * FROM ELEVES ;


SELECT * FROM PROFESSEURS ;
SELECT * FROM COURS ;
SELECT * FROM ACTIVITES ;
SELECT * FROM CHARGE ;
SELECT * FROM RESULTATS ;
SELECT * FROM ACTIVITES_PRATIQUEES ;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ********************** Affichage des tables ***************************
PROMPT

TTITLE 'LES ELEVES :'
COLUMN NOM FORMAT A10
COLUMN PRENOM FORMAT A10
SELECT * FROM ELEVES ;
/*
SQL> SELECT * FROM ELEVES ;

 NUM_ELEVE NOM			     PRENOM		       DATE_NAISS      POIDS	  ANNEE
---------- ------------------------- ------------------------- ---------- ---------- ----------
	 1 Brisefer		     Benoit		       10-12-1978	  35	      1
	 2 G???nial		     Olivier		       10-04-1978	  42	      1
	 3 Jourdan		     Gil		       28-06-1974	  72	      2
	 4 Spring		     Jerry		       16-02-1974	  78	      2
	 5 Tsuno		     Yoko		       29-10-1977	  45	      1
	 6 Lebut		     Marc		       29-04-1974	  75	      2
	 7 Lagaffe		     Gaston		       08-04-1975	  61	      1
	 8 Dubois		     Robin		       20-04-1976	  60	      2
	 9 Walth???ry		     Natacha		       07-09-1977	  59	      1
	10 Danny		     Buck		       15-02-1973	  82	      2

10 rows selected.*/

TTITLE 'LES PROFESSEURS :'
COLUMN NOM FORMAT A15
SELECT * FROM PROFESSEURS ;
/*
  NUM_PROF NOM		   SPECIALITE		DATE_ENTRE DER_PROM   SALAIRE_BASE SALAIRE_ACTUEL
---------- --------------- -------------------- ---------- ---------- ------------ --------------
	 1 Bottle	   po???sie		01-10-1970 01-10-1988	   2000000	  2600000
	 2 Bolenov	   r???seau		15-11-1968 01-10-1998	   1900000	  2468000
	 3 Tonilaclasse    poo			01-10-1979 01-01-1989	   1900000	  2360000
	 4 Pastecnov	   sql			01-10-1975		   2500000	  2500000
	 5 SELECTor	   sql			15-10-1982 01-10-1988	   1900000	  1900000
	 6 Vilplusplus	   poo			25-04-1990 05-06-1994	   1900000	  2200000
	 7 Francesca				01-10-1975 11-01-1998	   2000000	  3200000
	 8 Pucette	   sql			06-12-1988 29-02-1996	   2000000	  2500000

*/

TTITLE 'LES COURS :'
COLUMN NOM FORMAT A15
SELECT * FROM COURS ;
/*
 NUM_COURS NOM		     NBHEURES	   ANNEE
---------- --------------- ---------- ----------
	 1 R???seau		   15	       1
	 2 Sgbd 		   30	       1
	 3 Programmation	   15	       1
	 4 Sgbd 		   30	       2
	 5 Analyse		   60	       2

*/

TTITLE 'LES ACTIVITES :'
SELECT * FROM ACTIVITES ;
/*
    NIVEAU NOM		   EQUIPE
---------- --------------- --------------------------------
	 1 Mini foot	   Amc Indus
	 1 Surf 	   Les planchistes ...
	 2 Tennis	   Ace Club
	 3 Tennis	   Ace Club
	 1 Volley ball	   Avs80
	 2 Mini foot	   Les as du ballon
	 2 Volley ball	   smash

7 rows selected.
*/


TTITLE 'LES CHARGES :'
SELECT * FROM CHARGE ;
/*
  NUM_PROF  NUM_COURS
---------- ----------
	 1	    1
	 1	    4
	 2	    1
	 3	    2
	 3	    4
	 3	    5
	 4	    2
	 7	    4
	 8	    1
	 8	    2
	 8	    3
	 8	    4
	 8	    5
*/

TTITLE 'LES RESULTATS :'
SELECT * FROM RESULTATS ;

/*
Wed Mar 04																										       page    1
																											LES RESULTATS :

 NUM_ELEVE  NUM_COURS	  POINTS
---------- ---------- ----------
	 1	    1	      15
	 1	    2	    10.5
	 1	    4	       8
	 1	    5	      20
	 2	    1	    13.5
	 2	    2	      12
	 2	    4	      11
	 2	    5	     1.5
	 3	    1	      14
	 3	    2	      15
	 3	    4	      16
	 3	    5	      20
	 4	    1	    16.5
	 4	    2	      14
	 4	    4	      11
	 4	    5	       8
	 5	    1	       5
	 5	    2	     6.5
	 5	    4	      13
	 5	    5	      13
	 6	    1	      15
	 6	    2	     3.5
	 6	    4	      16
	 6	    5	       5
	 7	    1	     2.5
	 7	    2	      18
	 7	    4	      11
	 7	    5	      10
	 8	    1	      16
	 8	    2	       0
	 8	    4	       6
	 8	    5	    11.5
	 9	    1	      20
	 9	    2	      20
	 9	    4	      14
	 9	    5	     9.5
	10	    1	       3
	10	    2	    12.5
	10	    4	       0
	10	    5	      16

40 rows selected.
*/

TTITLE 'LES ACTIVITES PRATIQUEES:'
SELECT * FROM ACTIVITES_PRATIQUEES ;
/*
  LES ACTIVITES PRATIQUEES:

 NUM_ELEVE     NIVEAU NOM
---------- ---------- ---------------
	 1	    1 Mini foot
	 1	    1 Surf
	 1	    1 Volley ball
	 1	    2 Tennis
	 2	    1 Mini foot
	 2	    2 Tennis
	 3	    2 Mini foot
	 3	    2 Tennis
	 3	    2 Volley ball
	 4	    1 Surf
	 4	    2 Mini foot
	 5	    1 Mini foot
	 5	    1 Surf
	 5	    1 Volley ball
	 8	    1 Mini foot
	 8	    1 Volley ball
	 8	    2 Volley ball
	 9	    1 Mini foot
	 9	    2 Volley ball
	10	    1 Mini foot
	10	    2 Tennis
	10	    2 Volley ball
*/
TTITLE OFF;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

REM *************************************************************************

PROMPT ******************** Test des fonctions Oracle ***********************
PROMPT

SELECT DECODE(ANNEE, 1, 'Premi�re', 2, 'Seconde', 'Valeur diff�rente de 1 et de 2 !!')  AS ANETUDE FROM ELEVES;

-- Permet de mettre en majuscule les noms de la table ETUDIANTS
SELECT UPPER(NOM) FROM ELEVES;

-- Permet de mettre en minuscule les noms de la table ETUDIANTS
SELECT LOWER(NOM) FROM ELEVES;

-- Dans la table PROFESSEURS, on prend toutes la specialite des PROFESSEURS
-- et si elle n'est pas renseignee alors on ecrit que "valeur non renseignee"
SELECT NVL(SPECIALITE, 'Valeur NON renseign�e') FROM PROFESSEURS;

-- Renomme la colonne a l affichage des resultats
SELECT NVL(SPECIALITE, 'Valeur NON renseign�e') AS SPEC_PROF FROM PROFESSEURS;

REM **************************************************************************
PROMPT
PROMPT ********************** Affichage de la table ELEVES *******************
PROMPT

PAUSE
SELECT * FROM ELEVES ;
PAUSE
DESC ELEVES;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ***************** Ajout des attributs CodePostal et Ville *************
PROMPT

-- Modification de la structure de la table ELEVES en ajoutant les attributs
-- CodePostal et Ville
ALTER TABLE ELEVES
ADD (
    CODEPOSTAL    NUMBER(5),
    VILLE         VARCHAR(20)
);
    
-- Ajout d'une contrainte sur l attribut CodePostal
ALTER TABLE ELEVES
ADD CONSTRAINT CK_ELEVES_CODEPOSTAL    CHECK(CODEPOSTAl BETWEEN 00000 AND 99999);


DESC ELEVES;

COLUMN NOM          FORMAT A10
COLUMN PRENOM       FORMAT A10
COLUMN VILLE        FORMAT A10
COLUMN POIDS        FORMAT 99
COLUMN ANNEE        FORMAT 9

SELECT * FROM ELEVES ;

REM **************************************************************************

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ************** Mise a jour des adresses de la table ELEVES ************
PROMPT

UPDATE ELEVES
SET CODEPOSTAL = 93800
WHERE NUM_ELEVE = 1;

UPDATE ELEVES
SET VILLE = 'EPINAY / seine'
WHERE NUM_ELEVE = 1;

UPDATE ELEVES
SET CODEPOSTAL = 75013
WHERE NUM_ELEVE = 2;

UPDATE ELEVES
SET VILLE = 'paris'
WHERE NUM_ELEVE = 2;

UPDATE ELEVES
SET CODEPOSTAL = 93800
WHERE NUM_ELEVE = 5;

UPDATE ELEVES
SET VILLE = 'EPINAY SUR SEINE'
WHERE NUM_ELEVE = 5;

UPDATE ELEVES
SET CODEPOSTAL = 91000
WHERE NUM_ELEVE = 7;

UPDATE ELEVES
SET VILLE = 'EPINAY SUR ORGE'
WHERE NUM_ELEVE = 7;

REM **************************************************************************
REM ****************** Validation de la transaction **************************
COMMIT;

REM **************************************************************************
REM ****************** Abandon de la transaction **************************
-- ROLLBACK;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

-- Affichage de la table en question
COLUMN NOM    FORMAT A10
COLUMN PRENOM    FORMAT A10

SELECT * FROM ELEVES ;

PAUSE
REM *************************************************************************

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ******************** Creation de la table AGGLOMERATION **************
PROMPT

CREATE TABLE AGGLOMERATION 
(
    CODEPOSTAL NUMBER(5),
    VILLE VARCHAR(20), 
    CONSTRAINT PK_AGGLOMERATION        PRIMARY KEY(CODEPOSTAL),
    CONSTRAINT CK_AGGLOMERATION_VILLE    CHECK (VILLE = UPPER(VILLE)) 
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ************ Insertion des donnees  de la table AGGLOMERATION *********
PROMPT

INSERT INTO AGGLOMERATION VALUES (75001, 'PARIS');
INSERT INTO AGGLOMERATION VALUES (75013, 'PARIS');
INSERT INTO AGGLOMERATION VALUES (93800, 'EPINAY SUR SEINE');
INSERT INTO AGGLOMERATION VALUES (93430, 'Villetaneuse');
INSERT INTO AGGLOMERATION VALUES (91000, 'EPINAY SUR ORGE');

REM **************************************************************************
REM ****************** Validation de la transaction **************************
COMMIT;

COLUMN CODEPOSTAL    FORMAT 99999
COLUMN VILLE        FORMAT A20

SELECT * FROM AGGLOMERATION;
PAUSE

REM **************************************************************************

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ***** Le contenu de l attribut VILLE sera mis en majuscule *****
PROMPT
COLUMN VILLE    FORMAT A30

SELECT UPPER(VILLE) FROM ELEVES;

PROMPT
PAUSE Tapez sur Enter...
PROMPT



REM NETTOYAGE DE LA TABLE ELEVE
PROMPT ******************** Mise a jour de la table ELEVES ********************
PROMPT

UPDATE    ELEVES
SET       VILLE = (SELECT VILLE FROM AGGLOMERATION 
          WHERE ELEVES.CODEPOSTAL = AGGLOMERATION.CODEPOSTAL);

REM **************************************************************************
REM ****************** Validation de la transaction **************************
COMMIT;

COLUMN NOM          FORMAT A10
COLUMN PRENOM       FORMAT A10
COLUMN VILLE        FORMAT A10
COLUMN POIDS        FORMAT 99
COLUMN ANNEE        FORMAT 9
COLUMN CODEPOSTAL   FORMAT 99999

SELECT * FROM ELEVES ;
PAUSE


REM ****************************************************************************
REM ****************************************************************************
REM ****************************************************************************
REM ****************************************************************************
REM ****************************************************************************

PROMPT
PAUSE Tapez sur Enter...
PROMPT

SET TIMING ON

PROMPT **************************** Les requetes *******************************
PROMPT
TTITLE CENTER 'Requete N 1 : nom, pr�nom et date de naissance de tous les �l�ves' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 1. Obtenir la liste des noms, pr�noms et date de naissance de tous les �l�ves.
SELECT nom, prenom, date_naissance  
FROM  eleves ;
/*
																											   LES ACTIVITES PRATIQUEES:

NOM	   PRENOM     DAT*E_NAISS
---------- ---------- ----------
Brisefer   Benoit     10-12-1978
G???nial   Olivier    10-04-1978
Jourdan    Gil	      28-06-1974
Spring	   Jerry      16-02-1974
Tsuno	   Yoko       29-10-1977
Lebut	   Marc       29-04-1974
Lagaffe    Gaston     08-04-1975
Dubois	   Robin      20-04-1976
Walth???ry Natacha    07-09-1977
Danny	   Buck       15-02-1973

10 rows selected.
*/
PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 2: renseignement sur toutes les activites'skip 1 -
      LEFT  '==================================================================================' skip 0
REM 2. Obtenir tous les renseignements sur toutes les activit�s
SELECT *      
FROM  activites ;

/*
  LES ACTIVITES PRATIQUEES:

    NIVEAU NOM	      EQUIPE
---------- ---------- --------------------------------
	 1 Mini foot  Amc Indus
	 1 Surf       Les planchistes ...
	 2 Tennis     Ace Club
	 3 Tennis     Ace Club
	 1 Volley ball Avs80
	   

	 2 Mini foot  Les as du ballon
	 2 Volley ball smash
	   
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 3: sp�cialites des professeurs' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 3. Obtenir la liste des sp�cialit�s des professeurs
SELECT DISTINCT specialite  FROM  professeurs ;
/*SPECIALITE
--------------------
poo

po???sie
r???seau
sql
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 4: nom et prenom des eleves pesant moins de 45 kg et en 1e ou 2e annee' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 4. Obtenir le nom et le pr�nom des �l�ves pesant moins de 45 kilos et inscrits
REM    en 1�re ann�e ou des �l�ves inscrits en 2�me ann�e
SELECT nom, prenom FROM  eleves WHERE  (poids < 45 AND annee = 1) OR annee = 2 ;
/*  LES ACTIVITES PRATIQUEES:

NOM	   PRENOM
---------- ----------
Brisefer   Benoit
G???nial   Olivier
Jourdan    Gil
Spring	   Jerry
Lebut	   Marc
Dubois	   Robin
Danny	   Buck

7 rows selected.
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 5: nom des eleves dont le poids est compris entre 60 et 80 kg' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 5. Obtenir le nom des �l�ves dont le poids est compris entre 60 et 80 kilos
SELECT nom FROM  eleves WHERE  poids BETWEEN 60 AND 80;
/*
  LES ACTIVITES PRATIQUEES:

NOM
----------
Jourdan
Spring
Lebut
Lagaffe
Dubois
*/


PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 6: nom des professeurs dont la specialite est poesie ou sql' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 6. Obtenir le nom des professeurs dont la sp�cialit� est 'po�sie' ou 'sql'
SELECT nom FROM  professeurs WHERE  specialite IN ( 'pos�sie', 'sql') ;
/*
  LES ACTIVITES PRATIQUEES:

  NUM_PROF NOM	      SPECIALITE	   DATE_ENTRE DER_PROM	 SALAIRE_BASE SALAIRE_ACTUEL
---------- ---------- -------------------- ---------- ---------- ------------ --------------
	 1 Bottle     po???sie		   01-10-1970 01-10-1988      2000000	     2600000
	 2 Bolenov    r???seau		   15-11-1968 01-10-1998      1900000	     2468000
	 3 Tonilaclas poo		   01-10-1979 01-01-1989      1900000	     2360000
	   se

	 4 Pastecnov  sql		   01-10-1975		      2500000	     2500000
	 5 SELECTor   sql		   15-10-1982 01-10-1988      1900000	     1900000
	 6 Vilplusplu poo		   25-04-1990 05-06-1994      1900000	     2200000
	   s

	 7 Francesca			   01-10-1975 11-01-1998      2000000	     3200000
	 8 Pucette    sql		   06-12-1988 29-02-1996      2000000	     2500000
*/


PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 7: nom des eleves qui commence par un L' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 7. Obtenir le nom des �l�ves dont le nom commence par 'L'
SELECT nom FROM  eleves WHERE  nom LIKE'L%' ;
/*
																											   LES ACTIVITES PRATIQUEES:

NOM
----------
Lebut
Lagaffe
*/



PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 8: nom de professeurs dont la specialite est inconnu' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 8. Obtenir le nom des professeurs dont la sp�cialit� est inconnue
SELECT nom FROM  professeurs WHERE  specialite IS NULL ;
/*
NOM
----------
Francesca*/


PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER'Requete N 9: nom et prenom des eleves pesant moins de 45 kg et en 1ere anneee' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 9. Obtenir les nom et pr�nom des �l�ves pesant moins de 45 kilos et inscrits en 1�re ann�e.
SELECT nom, prenom FROM  eleves WHERE  poids < 45 INTERSECT  SELECT nom, prenom  FROM  eleves WHERE  annee  = 1 ;
/*

PROMPT
  LES ACTIVITES PRATIQUEES:

NOM	   PRENOM
---------- ----------
Brisefer   Benoit
G???nial   Olivier
*/

TTITLE CENTER 'Requete N 9' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT nom, prenom
FROM  eleves
WHERE  poids < 45 AND annee  = 1 ;

PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 10: le nom et la specialite de chaque professeurs' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 10. Obtenir pour chaque professeur, son nom et sa sp�cialit�. 
REM 10. Si cette derni�re est inconnue, on souhaite afficher la chaine de caract�res : '****'
SELECT nom, specialite 
FROM  professeurs
WHERE  specialite IS NOT NULL
UNION 
SELECT nom, '****'
FROM  professeurs
WHERE  specialite IS NULL ;

/*
NOM	   SPECIALITE
---------- --------------------
Bolenov    r???seau
Bottle	   po???sie
Francesca  ****
Pastecnov  sql
Pucette    sql
SELECTor   sql
Tonilaclas poo
se

Vilplusplu poo
s

*/
PROMPT

TTITLE CENTER 'Requete N 10' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT nom, NVL(specialite, '****') AS specialite FROM  professeurs ;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


REM ****************************************************************************
REM ****************************************************************************


TTITLE CENTER 'Requete N 11: noms et prenoms des eleves qui pratiquent du surf au niveau 1' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 11. Quels sont les noms et pr�noms des �l�ves qui pratiquent du surf au niveau 1
SELECT eleves.nom, eleves.prenom
FROM  eleves, activites_pratiquees
WHERE  eleves.num_eleve         = activites_pratiquees.num_eleve
AND    niveau                 = 1  
AND    LOWER(activites_pratiquees.nom)    = 'surf' ;
/*
NOM	   PRENOM
---------- ----------
Brisefer   Benoit
Spring	   Jerry
Tsuno	   Yoko*/

PROMPT

TTITLE CENTER 'Requete N 11' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT nom, prenom
FROM  eleves
WHERE  num_eleve IN
    (SELECT num_eleve 
    FROM    activites_pratiquees
    WHERE  niveau       = 1 
    AND    LOWER(nom) = 'surf') ;

PROMPT

TTITLE CENTER 'Requete N 11' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT nom, prenom
FROM  eleves
WHERE  num_eleve = ANY
    (SELECT num_eleve 
    FROM  activites_pratiquees
    WHERE  niveau       = 1 
    AND    LOWER(nom) = 'surf') ;
    
PROMPT

TTITLE CENTER 'Requete N 11' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT nom, prenom
FROM  eleves
WHERE  EXISTS
    (SELECT * 
    FROM  activites_pratiquees
    WHERE  niveau          = 1 
    AND    LOWER(nom)      = 'surf'
    AND    eleves.num_eleve = activites_pratiquees.num_eleve) ;

PROMPT

TTITLE CENTER 'Requete N 11' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT nom, prenom    
FROM  eleves
WHERE  0 <
    (SELECT COUNT(*) 
    FROM activites_pratiquees
    WHERE niveau           = 1 
    AND LOWER(nom)      = 'surf'
    AND eleves.num_eleve = activites_pratiquees.num_eleve) ;

    
PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 12: nom des eleves de l equipe AMC INDUS' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 12. Obtenir le nom des �l�ves de l �quipe AMC INDUS
SELECT eleves.nom
FROM  eleves, activites_pratiquees ap, activites
WHERE  eleves.num_eleve        = ap.num_eleve
AND    ap.niveau           = activites.niveau
AND    ap.nom               = activites.nom
AND    UPPER(activites.equipe) = 'AMC INDUS' ;

/*
NOM
----------
Brisefer
G???nial
Tsuno
Dubois
Walth???ry
Danny

6 rows selected.
*/


PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 13: paires des noms de professeurs qui ont la m�me specialite' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 13. Obtenir les paires de noms de professeurs qui ont la m�me sp�cialit�.
SELECT x.nom, y.nom
FROM  professeurs x, professeurs y
WHERE  x.specialite = y.specialite
AND    x.nom        < y.nom ;
/*
NOM	   NOM
---------- ----------
Pucette    SELECTor
Pastecnov  SELECTor
Tonilaclas Vilplusplu
se	   s

Pastecnov  Pucette
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 14: nom, salaire mensuel et augmentation mensuelle depuis le salaire ' skip 1 -
      CENTER 'de base et cela pour chaque specialite' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 14. Pour chaque sp�cialiste sql, on demande d obtenir son nom, son salaire mensuel et
REM        son augmentation mensuelle depuis son salaire de base.
SELECT nom, salaire_actuel / 12, 'delta = ', (salaire_actuel-salaire_base) / 12
FROM  professeurs
WHERE  specialite = 'sql' ;

/*
NOM	   SALAIRE_ACTUEL/12 'DELTA=' (SALAIRE_ACTUEL-SALAIRE_BASE)/12
---------- ----------------- -------- --------------------------------
Pastecnov	  208333.333 delta =				     0
SELECTor	  158333.333 delta =				     0
Pucette 	  208333.333 delta =			    41666.6667
*/
PROMPT

TTITLE CENTER 'Requete N 14' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT nom, salaire_actuel / 12 AS SalR_Act,(salaire_actuel-salaire_base) / 12 AS Delta
FROM  professeurs
WHERE  LOWER(specialite) = 'sql' ;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


TITLE CENTER 'Requete N 15: nom des professeurs dont l augmentation relative au salaire de base depasse 25%' skip 1 -
      LEFT  '==================================================================================' skip 0
sREM 15. Obtenir le nom des professeurs dont l augmentation relative au salaire de base 
REM 15. d�passe 25%
SELECT nom
FROM  professeurs
WHERE  (salaire_actuel - salaire_base) / salaire_base > 0.25 ;

/*
NOM
----------
Bottle
Bolenov
Francesca*/


PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 16: les points de Tsuno obtenus dans chaque cours sur 100 au lieu de 20' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 16. afficher les points de Tsuno obtenus dans chaque cours sur 100 plut�t que sur 20
SELECT cours.nom, points*5
FROM  resultats, eleves, cours
WHERE  eleves.num_eleve    = resultats.num_eleve
AND    resultats.num_cours = cours.num_cours
AND    eleves.nom          = 'Tsuno' ;
/*

NOM	     POINTS*5
---------- ----------
R???seau	   25
Sgbd		 32.5
Sgbd		   65
Analyse 	   65
*/


PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 17: poids moyen des eleves de 1ere annee' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 17. obtenir le poids moyen des �l�ves de 1�re ann�e
SELECT AVG(poids)
FROM  eleves
WHERE  annee = 1;
/*
AVG(POIDS)
----------
      48.4
      */



PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 18: total des points de l eleve n�3' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 18. obtenir le total des points de l �l�ve num�ro 3.
SELECT sum (points)
FROM  resultats
WHERE  num_eleve = 3 ;
/*
SUM(POINTS)
-----------
	 65
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 19: plus petit et plus grande cote de l eleve Brisefer' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 19. Obtenir la plus petite et la plus grande cote de l �l�ve Brisefer.
SELECT min(points), max(points)
FROM  resultats, eleves
WHERE  eleves.num_eleve = resultats.num_eleve
AND    nom              = 'Brisefer';
/*
Requete N 19: plus petit et plus grande cote de l eleve Brisefer
==================================================================================
MIN(POINTS) MAX(POINTS)
----------- -----------
	  8	     20
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 20: nombre d eleves en 2eme annee' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 20. Obtenir le nombre d �l�ves inscrits en deuxi�me ann�e.
SELECT count (*)
FROM  eleves
WHERE  annee = 2 ;

/*
  COUNT(*)
----------
	 5
*/
REM****************************************************************************
REM****************************************************************************


PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 21: augmentation mensuelle moyenne des salaires des professeurs de sql' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 21. Quelle est l augmentation mensuelle moyenne des salaires des professeurs de sql ?
SELECT AVG((salaire_actuel - salaire_base) /12)
FROM  professeurs
WHERE  specialite = 'sql' ;
/*
AVG((SALAIRE_ACTUEL-SALAIRE_BASE)/12)
-------------------------------------
			   13888.8889
*/


PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 22: annee de la derniere promotion du professeur Pucette' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 22. Obtenir l ann�e de la derni�re promotion de professeur Pucette
SELECT extract (YEAR FROM der_prom) AS DERNPROMO
FROM  professeurs
WHERE  nom = 'Pucette' ;
/*
 DERNPROMO
----------
      1996
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 23: date d embauche, date de derniere promotion et le nombre d annee' skip 1 -
      CENTER 'ecoulees entre les 2 dates pour chaque professeurs' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 23. Pour chaque professeur, afficher sa date d embauche, sa date de derni�re promotion 
REM 23. ainsi que le nombre d ann�es �coul�es entre ces deux dates.
SELECT nom, der_prom, date_entree,(der_prom - date_entree) AS YEAR_FAUX
FROM  Professeurs ;

/*
NOM	   DER_PROM   DATE_ENTRE  YEAR_FAUX
---------- ---------- ---------- ----------
Bottle	   01-10-1988 01-10-1970       6575
Bolenov    01-10-1998 15-11-1968      10912
Tonilaclas 01-01-1989 01-10-1979       3380
se

Pastecnov	      01-10-1975
SELECTor   01-10-1988 15-10-1982       2178
Vilplusplu 05-06-1994 25-04-1990       1502
s

Francesca  11-01-1998 01-10-1975       8138
Pucette    29-02-1996 06-12-1988       2641
*/

PROMPT

TTITLE CENTER 'Requete N 23' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT nom, der_prom, date_entree, 
    to_NUMBER(TO_CHAR(der_prom, 'YYYY')) - to_NUMBER(TO_CHAR(date_entree, 'YYYY')) NBR_ANNEES
FROM  Professeurs ;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 24: age moyen des eleves en annee' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 24. afficher l �ge moyen des �l�ves. Cet �ge moyen sera exprim� en ann�e
SELECT AVG ( EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM date_naissance) )
FROM  eleves;

/*
AVG(EXTRACT(YEARFROMSYSDATE)-EXTRACT(YEARFROMDATE_NAISSANCE))
-------------------------------------------------------------
							 44.4
*/

PROMPT

TTITLE CENTER 'Requete N 24' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT AVG(TRUNC(MONTHS_BETWEEN(SYSDATE,date_naissance)/12))
FROM  eleves;
    

PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 25: nom des professeurs o� s est ecoule plus de 50 mois entre' skip 1 -
      CENTER 'l embauche et la derniere promotion' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 25. afficher le nom des professeurs pour lesquels il s est �coul� plus de 50 mois 
REM 25. entre l embauche et la derni�re promotion.
SELECT nom, MONTHS_BETWEEN (der_prom, date_entree)
FROM  professeurs
WHERE  MONTHS_BETWEEN (der_prom, date_entree) > 50 ;
/*
NOM	   MONTHS_BETWEEN(DER_PROM,DATE_ENTREE)
---------- ------------------------------------
Bottle					    216
Bolenov 			     358.548387
Tonilaclas				    111
se

SELECTor			     71.5483871
Francesca			     267.322581
Pucette 			     86.7419355

6 rows selected.
*/


PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 26: liste des eleves qui auront au moins 24 ans dans moins de 4 mois' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 26. obtenir la liste des eleves qui auront au moins 24 ans dans moins de 4 mois
SELECT    NUM_ELEVE, NOM, PRENOM, date_naissance
FROM    ELEVES
WHERE    TRUNC(MONTHS_BETWEEN(SYSDATE, date_naissance)) + 4 >= (24*12);
/*
 NUM_ELEVE NOM	      PRENOM	 DATE_NAISS
---------- ---------- ---------- ----------
	 1 Brisefer   Benoit	 10-12-1978
	 2 G???nial   Olivier	 10-04-1978
	 3 Jourdan    Gil	 28-06-1974
	 4 Spring     Jerry	 16-02-1974
	 5 Tsuno      Yoko	 29-10-1977
	 6 Lebut      Marc	 29-04-1974
	 7 Lagaffe    Gaston	 08-04-1975
	 8 Dubois     Robin	 20-04-1976
	 9 Walth???ry Natacha	 07-09-1977
	10 Danny      Buck	 15-02-1973

10 rows selected.
*/
PROMPT

TTITLE CENTER 'Requete N 26' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT    NUM_ELEVE, NOM, PRENOM, date_naissance
FROM    ELEVES
WHERE    TRUNC(MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 4), TO_DATE(date_naissance))) >= (24*12);

PROMPT

TTITLE CENTER 'Requete N 26' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT    NUM_ELEVE, NOM, PRENOM, date_naissance,
    EXTRACT(YEAR FROM ADD_MONTHS(SYSDATE, 4)), EXTRACT(YEAR FROM date_naissance)
FROM    ELEVES
WHERE    (EXTRACT(YEAR FROM ADD_MONTHS(SYSDATE, 4)) - EXTRACT(YEAR FROM date_naissance)) >= 24;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 27: liste des eleves classes par annee et par ordre alphabetique' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 27. obtenir une liste des eleves classes par annee et par ordre alphabetique
SELECT    ANNEE, NUM_ELEVE, NOM, PRENOM  
FROM    ELEVES
ORDER BY ANNEE, NOM;

/*
ANNEE  NUM_ELEVE NOM	    PRENOM
----- ---------- ---------- ----------
    1	       1 Brisefer   Benoit
    1	       2 G???nial   Olivier
    1	       7 Lagaffe    Gaston
    1	       5 Tsuno	    Yoko
    1	       9 Walth???ry Natacha
    2	      10 Danny	    Buck
    2	       8 Dubois     Robin
    2	       3 Jourdan    Gil
    2	       6 Lebut	    Marc
    2	       4 Spring     Jerry

10 rows selected.
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT
        

TTITLE CENTER 'Requete N 28: les points de Tsuno en ordre decroissant obtenus dans chaque cours' skip 1 -
      CENTER 'sur 100 au lieu de 20' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 28. afficher en ordre decroissant les points de Tsuno obtenus dans chaque cours
REM        sur 100 plutot que sur 20
SELECT    c.NUM_COURS as NUM_COURS, c.NOM as NOM_COURS, (r.POINTS * 5) as POINTS
FROM    ELEVES e, RESULTATS r, COURS c
WHERE    e.NOM         = 'Tsuno'
AND    e.NUM_ELEVE     = r.NUM_ELEVE
AND    r.NUM_COURS    = c.NUM_COURS;
/*
 NUM_COURS NOM_COURS		    POINTS
---------- -------------------- ----------
	 1 R???seau			25
	 2 Sgbd 		      32.5
	 4 Sgbd 			65
	 5 Analyse			65
*/

PROMPT

TTITLE CENTER 'Requete N 28' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT num_cours, (POINTS * 5) as POINTS
FROM  resultats
WHERE  num_eleve IN
    (SELECT num_eleve 
    FROM    eleves
    WHERE  nom = 'Tsuno')
AND    num_cours IN
    (SELECT num_cours
    FROM cours);

PROMPT

TTITLE CENTER 'Requete N 28' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT num_cours, (points * 5) as POINTS
FROM  resultats
WHERE  num_eleve = ANY
    (SELECT num_eleve 
    FROM  eleves
    WHERE  nom  = 'Tsuno' )
AND    num_cours = ANY
    (SELECT num_cours
    FROM cours);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

        
TTITLE CENTER 'Requete N 29: nom et moyenne de chaque eleves de 1ere annee' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 29. obtenir pour chaque eleves de 1ere annee son nom et sa moyenne
SELECT    distinct e.nom, e.prenom, AVG(r.points) as moyenne 
FROM    eleves e, resultats r
WHERE    e.num_eleve     = r.num_eleve
AND    e.annee        = 1
GROUP BY nom, prenom;
/*
NOM	   PRENOM	 MOYENNE
---------- ---------- ----------
Brisefer   Benoit	  13.375
Walth???ry Natacha	  15.875
Lagaffe    Gaston	  10.375
G???nial   Olivier	     9.5
Tsuno	   Yoko 	   9.375
*/

PROMPT

TTITLE CENTER 'Requete N 29' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT num_eleve, AVG(POINTS) as Moyenne
FROM  resultats
WHERE  num_eleve IN
    (SELECT num_eleve 
    FROM    eleves
    WHERE    annee = 1)
GROUP BY num_eleve;

PROMPT

TTITLE CENTER 'Requete N 29' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT    e.num_eleve, e.nom, e.prenom, R.moyenne
FROM    eleves e,
    (SELECT num_eleve, AVG(points) as moyenne
    FROM resultats 
    GROUP BY num_eleve) R
WHERE     e.annee = 1
AND    e.num_eleve = R.num_eleve;


PROMPT
PAUSE Tapez sur Enter...
PROMPT

        
TTITLE CENTER 'Requete N 30: moyenne des points de chaque eleves de 1ere annee dont le total' skip 1 -
      CENTER 'est superieur a 40' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 30. obtenir la moyenne des points de chaque eleves de 1ere annee dont le total des points
REM        est superieur a 40
SELECT    distinct e.nom, e.prenom, sum(r.points) as somme 
FROM    eleves e, resultats r
WHERE    e.num_eleve     = r.num_eleve
AND    e.annee        = 1
GROUP BY nom, prenom
HAVING     sum(r.points) > 40;
/*
NOM	   PRENOM	   SOMME
---------- ---------- ----------
Brisefer   Benoit	    53.5
Walth???ry Natacha	    63.5
Lagaffe    Gaston	    41.5
*/

PROMPT

TTITLE CENTER 'Requete N 30' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT    e.num_eleve, e.nom, e.prenom, R.somme
FROM    eleves e,
    (SELECT num_eleve, sum(points) as somme
    FROM resultats 
    GROUP BY num_eleve
    HAVING sum(points) > 40) R
WHERE     e.annee = 1
AND    e.num_eleve = R.num_eleve;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


REM ****************************************************************************
REM ****************************************************************************


TTITLE CENTER 'Requete N 31: maximum parmi les totaux de chaque eleve' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 31. obtenir le maximum parmi les totaux de chaque eleve
SELECT    r.num_eleve, e.nom, e.prenom
FROM    resultats r, eleves e
WHERE    e.num_eleve = r.num_eleve
GROUP BY r.num_eleve, e.nom, e.prenom 
HAVING sum(points) = (SELECT max(sum(points))
    FROM    resultats
    GROUP BY num_eleve);
    
    
PROMPT
PAUSE Tapez sur Enter...
PROMPT

        
TTITLE CENTER 'Requete N 32: nom des eleves qui jouent dans l equipe AMC INDUS' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 32. obtenir le nom des eleves qui jouent dans l equipe AMC INDUS
SELECT    e.num_eleve, e.nom, e.prenom
FROM    eleves e, activites_pratiquees ap, activites a
WHERE    ap.num_eleve    = e.num_eleve
AND    ap.nom        = a.nom
AND    a.equipe    = 'Amc Indus';    
/*
 NUM_ELEVE NOM	      PRENOM
---------- ---------- ----------
	 1 Brisefer   Benoit
	 2 G???nial   Olivier
	 3 Jourdan    Gil
	 4 Spring     Jerry
	 5 Tsuno      Yoko
	 8 Dubois     Robin
	 9 Walth???ry Natacha
	10 Danny      Buck

8 rows selected.
*/

PROMPT

TTITLE CENTER 'Requete N 32' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT num_eleve, nom, prenom
FROM  eleves
WHERE  num_eleve IN
    (SELECT num_eleve 
    FROM    activites_pratiquees
    WHERE  nom IN
        (SELECT nom
        FROM activites
        WHERE equipe = 'Amc Indus'));

        
PROMPT
PAUSE Tapez sur Enter...
PROMPT

        
TTITLE CENTER 'Requete N 33: eleves de 1ere annee dont la moyenne est superieure a la moyenne' skip 1 -
      CENTER 'de la 1ere annee' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 33. quels sont les eleves de 1ere annee dont la moyenne est superieur a la moyenne
REM        de la 1ere annee?
SELECT    e.nom, e.prenom, AVG(r.points) as moyenne 
FROM    eleves e, resultats r
WHERE    e.num_eleve     = r.num_eleve
AND    e.annee        = 1
GROUP BY nom, prenom
HAVING    AVG(r.points) > (SELECT    AVG(points)
                    FROM    resultats
                    WHERE    num_eleve IN (SELECT    num_eleve
                          FROM    eleves
                              WHERE    annee = 1));
/*
NOM	   PRENOM	 MOYENNE
---------- ---------- ----------
Brisefer   Benoit	  13.375
Walth???ry Natacha	  15.875
*/
                          
PROMPT

TTITLE CENTER 'Requete N 33' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT num_eleve, AVG(POINTS) as Moyenne
FROM  resultats
WHERE  num_eleve IN
    (SELECT num_eleve 
    FROM    eleves
    WHERE    annee = 1)
GROUP BY num_eleve
HAVING    AVG(points) > (SELECT    AVG(points)
                    FROM    resultats
                    WHERE    num_eleve IN (SELECT    num_eleve
                          FROM    eleves
                              WHERE    annee = 1));


PROMPT
PAUSE Tapez sur Enter...
PROMPT

        
TTITLE CENTER 'Requete N 34: le nom et le poids des eleves de 1ere annee plus lourds que' skip 1 -
      CENTER 'n importe quel eleve de 2eme annee' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 34. obtenir le nom et le poids des eleves de 1ere annee plus lours que n importe quel eleve
REM        de 2eme annee
SELECT nom, prenom, poids
FROM  eleves
WHERE  annee = 2
AND    poids > (SELECT    MAX(poids)
        FROM    eleves
        WHERE    annee = 1);

/*
No row selected 
*/



PROMPT

TTITLE CENTER 'Requete N 34' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT nom, prenom, poids
FROM  eleves
WHERE  annee = 1
AND    poids > ALL(SELECT poids
          FROM eleves
          WHERE annee = 2);


PROMPT
PAUSE Tapez sur Enter...
PROMPT

        
TTITLE CENTER 'Requete N 35: le nom et le poids des eleves de 1ere annee plus lours qu un eleve' skip 1 -
      CENTER 'quelconque de 2eme annee' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 35. obtenir le nom et le poids des eleves de 1ere annee plus lours qu un eleve quelconque
REM        de 2eme annee
SELECT nom, prenom, poids
FROM  eleves
WHERE  annee = 1
AND    poids > (SELECT    MIN(poids)
        FROM    eleves
        WHERE    annee = 2);
/*

NOM	   PRENOM     POIDS
---------- ---------- -----
Lagaffe    Gaston	 61
*/


PROMPT

TTITLE CENTER 'Requete N 35' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT nom, prenom, poids
FROM  eleves
WHERE  annee = 1
AND    poids > ANY(SELECT poids
          FROM eleves
          WHERE annee = 2);

          
PROMPT
PAUSE Tapez sur Enter...
PROMPT

        
TTITLE CENTER 'Requete N 36: le nom, le poids et l annee des eleves dont le poids est superieur' skip 1 -
      CENTER 'au poids moyen des eleve etant dans la m�me annee d etudes' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 36. obtenir le nom, le poids et l annee des eleves dont le poids est superieur au poids moyen
REM        des eleve etant dans la m�me annee d etudes
SELECT    nom, prenom, poids
FROM      eleves e1
WHERE  poids > (SELECT AVG(poids)
        FROM eleves e2
        WHERE e1.annee = e2.annee);
    
/*NOM	   PRENOM     POIDS
---------- ---------- -----
Spring	   Jerry	 78
Lebut	   Marc 	 75
Lagaffe    Gaston	 61
Walth???ry Natacha	 59
Danny	   Buck 	 82
*/
PROMPT
PAUSE Tapez sur Enter...
PROMPT

        
TTITLE CENTER 'Requete N 37: le nom des professeurs qui ne donnent pas le cours numero 1' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 37. obtenir le nom des professeurs qui ne donnent pas le cours numero 1
SELECT num_prof, nom
FROM  professeurs
WHERE  num_prof NOT IN (SELECT    num_prof
            FROM    charge
            WHERE    num_cours = 1
            GROUP BY num_prof);

/*
  NUM_PROF NOM
---------- ----------
	 5 SELECTor
	 3 Tonilaclas
	   se

	 6 Vilplusplu
	   s

	 7 Francesca
	 4 Pastecnov
*/
PROMPT

TTITLE CENTER 'Requete N 37' skip 1 -
      LEFT  '==================================================================================' skip 0
SELECT    p.num_prof, p.nom
FROM    professeurs p
WHERE    NOT EXISTS    (SELECT num_prof
                  FROM    charge    
                  WHERE    num_prof = p.num_prof
                  AND    num_cours = 1);

            
PROMPT
PAUSE Tapez sur Enter...
PROMPT

        
TTITLE CENTER 'Requete N 38: le nom des eleves de 1ere annee qui ont obtenu plus de 60% et qui jouent au tennis' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 38. obtenir le nom des eleves de 1ere annee qui ont obtenu plus de 60% et
REM        qui jouent au tennis
SELECT    e.nom, a.nom, AVG(r.points) as moyenne
FROM    eleves e, resultats r, activites a, activites_pratiquees ap
WHERE    a.nom = 'Tennis'
AND    e.annee        = 1
AND    e.num_eleve    = r.num_eleve
AND    e.num_eleve    = ap.num_eleve
AND    a.nom        = ap.nom
GROUP BY e.nom, a.nom
HAVING    AVG(r.points) > 0.6*20;
/*
NOM	   NOM		 MOYENNE
---------- ---------- ----------
Brisefer   Tennis	  13.375
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'Requete N 39: le numero et le nom des professeurs qui prennent en charge tous les cours de 2eme annee' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 39. professeurs qui prennent en charge tous les cours de 2eme annee; 
REM        on demande le numero et le nom
SELECT num_prof, nom
FROM  professeurs
WHERE  NOT EXISTS
      (SELECT *
      FROM cours
          WHERE annee = 2 
      AND NOT EXISTS
        (SELECT *
        FROM    charge
        WHERE    professeurs.num_prof = charge.num_prof 
        AND    charge.num_cours = cours.num_cours));
/*
  NUM_PROF NOM
---------- ----------
	 3 Tonilaclas
	   se

	 8 Pucette
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT

        
TTITLE CENTER 'Requete N 40: le numero et le nom des eleves qui pratiquent toutes les activites' skip 1 -        
      LEFT  '==================================================================================' skip 0
REM 40. eleves qui pratiquent toutes les activites;
REM        on demande le numero et le nom
SELECT    e.num_eleve, e.nom, e.prenom
FROM    eleves e
WHERE    NOT EXISTS
                (SELECT *
                  FROM    activites a
              WHERE NOT EXISTS
                                (SELECT *
                                FROM    activites_pratiquees ap
                                WHERE    ap.num_eleve    = e.num_eleve
                                AND    a.nom        = ap.nom));
/*
 NUM_ELEVE NOM	      PRENOM
---------- ---------- ----------
	 1 Brisefer   Benoit

*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT


REM ****************************************************************************
REM ****************************************************************************


PROMPT ****** requetes supplementaire ******

TTITLE CENTER 'Requete N 41: le nom, la specialite, le nom des cours et le nombre d heure des' skip 1 -
      CENTER 'professeurs pris en charge pour la 1ere annee' skip 1 -         
      LEFT  '==================================================================================' skip 0
REM 41. Tous les noms des professeurs avec leurs specialites, le nom des cours, 
REM        le nombre d heure pris en charge pour la 1ere annee
SELECT p.nom, p.specialite, c.nom, c.nbHeures, c.annee
FROM  professeurs p, cours c, charge ch
WHERE  ch.num_prof  = p.num_prof 
AND    ch.num_cours = c.num_cours;
/*
NOM	   SPECIALITE		NOM	     NBHEURES ANNEE
---------- -------------------- ---------- ---------- -----
Bottle	   po???sie		R???seau	   15	  1
Bolenov    r???seau		R???seau	   15	  1
Pucette    sql			R???seau	   15	  1
Tonilaclas poo			Sgbd		   30	  1
se

Pastecnov  sql			Sgbd		   30	  1
Pucette    sql			Sgbd		   30	  1
Pucette    sql			Programmat	   15	  1
				ion

Bottle	   po???sie		Sgbd		   30	  2
Tonilaclas poo			Sgbd		   30	  2
se

Francesca			Sgbd		   30	  2
Pucette    sql			Sgbd		   30	  2
Tonilaclas poo			Analyse 	   60	  2
se

Pucette    sql			Analyse 	   60	  2
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT

        
TTITLE CENTER 'Requete N 42: Cumul du nombre d heures de cours superieur a 70 heures par' skip 1 -
      CENTER 'professeurs qui font la specialite base de donnees' skip 1 -
      LEFT  '==================================================================================' skip 0
REM 42. Cumul du nombre d heures de cours superieur a 70 heures par professeurs qui font 
REM        la specialite base de donnees 
SELECT  sum(nbheures) AS somme_heure, p.nom
FROM    professeurs p, cours c, charge ch
WHERE    ch. num_prof = p.num_prof 
AND      ch.num_cours = c.num_cours
AND      p.specialite = 'Sgbd'
GROUP BY p.nom
HAVING  sum(nbheures)>70;
/*
no rows selected
*/

SET TIMING OFF


PROMPT
PAUSE Tapez sur Enter...
PROMPT

        
PROMPT ****** Creation des index sur la table ELEVES et sur la colonne NOM ******
PROMPT

/*
INDEX_NAME		       INDEX_TYPE		   TABLE_OWNER			  TABLE_NAME
------------------------------ --------------------------- ------------------------------ ------------------------------
IDX_ETUD_NOM		       NORMAL			   LEE12			  ETUDIANTS
MATCHVAL_PK		       NORMAL			   LEE12			  MATCHVAL
PK_ACTIVITES		       NORMAL			   LEE12			  ACTIVITES
PK_ACTIVITES_PRATIQUEES        NORMAL			   LEE12			  ACTIVITES_PRATIQUEES
PK_AGGLOMERATION	       NORMAL			   LEE12			  AGGLOMERATION
PK_ARTICLES		       NORMAL			   LEE12			  ARTICLES
PK_CHARGE		       NORMAL			   LEE12			  CHARGE
PK_CLIENTS		       NORMAL			   LEE12			  CLIENTS
PK_COMMANDES		       NORMAL			   LEE12			  COMMANDES
PK_COURS		       NORMAL			   LEE12			  COURS
PK_DETAILCOM		       NORMAL			   LEE12			  DETAILCOM
PK_ELEVES		       NORMAL			   LEE12			  ELEVES
PK_ETUDIANT		       NORMAL			   LEE12			  ETUDIANTS
PK_MAGASINS		       NORMAL			   LEE12			  MAGASINS
PK_PERSONNES		       NORMAL			   LEE12			  PERSONNES
PK_PROFESSEURS		       NORMAL			   LEE12			  PROFESSEURS
PK_RESULTATS		       NORMAL			   LEE12			  RESULTATS
SYS_C007072		       NORMAL			   LEE12			  BDACM
SYS_C007073		       NORMAL			   LEE12			  BDDBLP

19 rows selected.
*/

PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT ****************************************************************************
PROMPT *                                                                          *
PROMPT *      FICHE C : Structure de donn�es arborescente                         *
PROMPT *      Structure de donn�es arborescente                                   *
PROMPT *      Cas C1:  Arbre g�n�alogique    Ah ! Les g�n�alogistes               *   
PROMPT *                                                                          *
PROMPT ****************************************************************************
PROMPT
PROMPT
PROMPT
PROMPT


-- =====================================================================
PROMPT **************** Initialisation du type date ********************
REM le FORMAT de la date :
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY' ;
-- =====================================================================

PROMPT
PROMPT **************** Suppression de la table PERSONNES ************** 
PROMPT
DROP TABLE PERSONNES;

PROMPT
PROMPT ***************** Creation de la table PERSONNES ****************
PROMPT
create table PERSONNES
(
    NUMERO         NUMBER(7),
    NOM            varchar(15),
    PRENOM         varchar(15),
    DATENAISSANCE  date,
    SEXE           char(1),    
    PERE           NUMBER(7),
    MERE           NUMBER(7),
    constraint PK_PERSONNES                 primary key (NUMERO),
    constraint FK_PERSONNES_PERE_PERSONNES  foreign key(PERE) references PERSONNES,
    constraint FK_PERSONNES_MERE_PERSONNES  foreign key(MERE) references PERSONNES,
    constraint CK_SEXE_PERSONNES            CHECK (SEXE in ('M', 'F'))
);

SELECT 'Insertion_des_donn�es' FROM DUAL;
PROMPT
PAUSE Tapez sur Enter...
PROMPT

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE)
values (99,'LEBON','CLEMENT', '01-01-1895', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE)
values (88,'HONNEUR','CLEMENCE', '01-01-1900', 'F');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE)
values (1,'LEBON','MICHEL','04-08-1920','M', 99, 88);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE)
values (15,'LEBON','GABRIEL','04-08-1936','M', 99, 88);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE)
values (98,'CLEMENT','JEAN-BAPTISTE', '01-01-1890', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE)
values (87,'GABRIEL','EVE', '01-01-1892', 'F');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE)
values (2,'CLEMENT','EVE','13-11-1928','F', 98, 87);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE)
values (22,'CLEMENT','JEAN-BAPTISTE','13-11-1910','M', 98);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE)
values (3,'LEBON','CLEMENT','17-09-1958', 'M', 1, 2);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE)
values (33,'LEBON','ROSE','16-06-1951', 'F', 1, 2);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE)
values (34,'CLEMENT','RAOUL','01-01-1941', 'M', 22);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE)
values (55,'CLEMENT','MARIE','13-08-1978', 'F', 33, 34);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE)
values (56,'MEDECIN','LINA','22-02-2002', 'F', 55);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE)
values (77,'PARIS','LOUIS','20-03-1924', 'M');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE)
values (78,'GATEAU','EVELYNE','20-03-1936', 'F');

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE)
values (4,'PARIS','INES','22-11-1969', 'F', 77, 78);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE)
values (76,'PARIS','AMELIA','20-10-1958', 'F', 77, 78);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, MERE)
values (75,'AMMAR','GABRIEL','20-10-1987', 'M', 76);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE)
values (5,'LEBON','CLEMENCE','19-06-2001', 'F', 3, 4);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE)
values (6,'LEBON','ADAM','19-06-2001', 'M', 3, 4);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE)
values (7,'LEBON','FRANCOIS','22-02-1954', 'M', 1, 2);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE)
values (9,'LEBON','FRANCOISE','01-09-1963', 'F', 15);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE)
values (8,'LEBON','MICHEL','05-09-1987', 'M', 7, 9);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE)
values (10,'LEBON','AIME','24-05-1993', 'M', 7, 9);

insert into PERSONNES(NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE)
values (11,'LEBON','ALEXANDRE','16-07-1994', 'M', 7, 9);

commit;

TTITLE 'Les personnes'
set pages 100
SELECT * FROM PERSONNES ORDER BY DATENAISSANCE;
PAUSE

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *********  Recherche des ascendants dans une arborescence ***********
PROMPT
SELECT 'Recherche_des_anc�tres_d_une_personne' FROM DUAL;

REM
REM Premi�re fa�on avec les clauses d Oracle :
REM      SELECT ... FROM ...
REM      CONNECT BY PRIOR colonne op�rateur colonne
REM      CONNECT BY colonne op�rateur PRIOR colonne
REM      START WITH
REM      LEVEL


PROMPT
PROMPT *****************************************************************
PROMPT  
PROMPT Demande � l utilisateur d entrer le numero le numero de la
PROMPT personne que l on souhaite suivre.
PROMPT
PROMPT *****************************************************************
PROMPT
accept num prompt 'Entrez le numero de la personne a suivre : '; 

TTITLE 'Les anc�tres (P�re, M�re, Grand-P�re, Grand-M�re, Arri�re GP-GM ...) de  : 6'
create or replace view ancetres as
(
SELECT    distinct NUMERO, NOM, PRENOM, DATENAISSANCE 
FROM      PERSONNES
connect by prior PERE = NUMERO or prior MERE = NUMERO
start with NUMERO    = &num 
);

REM pour ne pas afficher la personne demand�e :
REM minus
REM SELECT NUMERO, NOM, PRENOM, DATENAISSANCE FROM PERSONNES
REM WHERE NUMERO=&num

PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE 'Les anc�tres (P�re, M�re, Grand-P�re, Grand-M�re, Arri�re GP-GM ...) de  : 6'
create or replace view ancetres as
(
SELECT    distinct NUMERO, NOM, PRENOM, DATENAISSANCE 
FROM      PERSONNES
connect by prior PERE = NUMERO or prior MERE = NUMERO
start with NUMERO    = 6
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT


SELECT * FROM ancetres ORDER BY DATENAISSANCE desc;
PAUSE

PROMPT ******************* Suppression de la vue ancetres ****************
PROMPT
drop view ancetres;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ******************************************************************
PROMPT ******  Recherche des ascendants dans une arborescence ***********
PROMPT ******************************************************************
PROMPT

REM
REM Deuxi�me fa�on avec les auto-jointures et les vues :
SELECT 'Recherche_des_anc�tres_d_une_personne' FROM DUAL;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT ***************************** Vue du pere ************************
PROMPT


TTITLE 'Le p�re'
SELECT * FROM LE_PERE;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ***************************** Vue du grand pere *****************
PROMPT
create or replace view LE_GRANDPERE (NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE) as (
    SELECT P2.NUMERO, P2.NOM, P2.PRENOM, P2.DATENAISSANCE, P2.SEXE, P2.PERE
    FROM  PERSONNES P2, LE_PERE P1
    WHERE  P1.PERE = P2.NUMERO
); 


TTITLE 'Le grand-p�re'
SELECT * FROM LE_GRANDPERE;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT ********************* Vue de l arriere grand pere *****************
PROMPT
create or replace view LE_ARR_GPERE (NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE) as (
    SELECT P2.NUMERO, P2.NOM, P2.PRENOM, P2.DATENAISSANCE, P2.SEXE, P2.PERE
    FROM  PERSONNES P2, LE_GRANDPERE P1
    WHERE  P1.PERE = P2.NUMERO
); 

TTITLE 'L arri�re grand-p�re'
SELECT * FROM LE_ARR_GPERE;

PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT ********************* Affichage des ascendants *********************
PROMPT
TTITLE 'Les ascendants de la personne sont :'
SELECT * FROM LE_PERE
union
SELECT * FROM LE_GRANDPERE
union
SELECT * FROM LE_ARR_GPERE;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT *******************************************************************
PROMPT ******  Recherche des descendants dans une arborescence ***********
PROMPT *******************************************************************
PROMPT
SELECT 'Recherche_des_descendants_d_une_personne' FROM DUAL;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE 'Les descendants de  : '
PROMPT ********************* Vue des descendants *************************
PROMPT
create or replace view descendants as
(
    SELECT    distinct NUMERO, NOM, PRENOM, DATENAISSANCE 
    FROM      PERSONNES
    connect by PERE = prior NUMERO or MERE = prior NUMERO
    start with NUMERO = &num
);

PROMPT ******************* Affichage des descendants ********************
PROMPT
SELECT * FROM descendants ORDER BY DATENAISSANCE;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ******************** Suppression de la vue ***********************
PROMPT
drop view descendants;

PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT *******************************************************************
PROMPT ****************  Recherche des fr�res et soeurs    ***************
PROMPT *******************************************************************
PROMPT
SELECT 'Recherche_des_freres_et_soeurs_d_une_personne' FROM DUAL;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE 'Les freres et soeurs de  : '
PROMPT ********************* Vue des freres et soeurs ********************
PROMPT
create or replace view freres_et_soeurs as
(
    (SELECT    distinct NUMERO, NOM, PRENOM, DATENAISSANCE 
    FROM      PERSONNES
    WHERE      MERE in (SELECT MERE
                FROM  PERSONNES
                WHERE  NUMERO = &num)
    and      PERE in (SELECT PERE
                FROM  PERSONNES
                WHERE  NUMERO = &num))
    minus
    (SELECT NUMERO, NOM, PRENOM, DATENAISSANCE FROM PERSONNES WHERE numero=&num)
);


PROMPT
PROMPT ****************** Affichage des freres et soeurs *****************
PROMPT
SELECT * FROM freres_et_soeurs ORDER BY DATENAISSANCE;


PROMPT ****** suppression de la vue *****
drop view freres_et_soeurs;


PROMPT
PAUSE Tapez sur Enter...
PROMPT

create or replace view freres_et_soeurs as
(
    (SELECT    distinct NUMERO, NOM, PRENOM, DATENAISSANCE 
    FROM      PERSONNES
    WHERE      MERE in (SELECT MERE
                FROM  PERSONNES
                WHERE  NUMERO = &num)
    and      PERE in (SELECT PERE
                FROM  PERSONNES
                WHERE  NUMERO = &num))
    minus
    (SELECT NUMERO, NOM, PRENOM, DATENAISSANCE FROM PERSONNES WHERE numero=&num)
);

PROMPT ******************* Vue des freres et soeurs BIS ******************
PROMPT
create or replace view freres_et_soeurs as
(
    (SELECT    distinct NUMERO, NOM, PRENOM, DATENAISSANCE
    FROM      PERSONNES
    WHERE      level = 2
    connect by PERE = prior NUMERO or MERE = prior NUMERO
    start with NUMERO in ( SELECT NUMERO
                  FROM LE_PARENT))
    minus
    (SELECT NUMERO, NOM, PRENOM, DATENAISSANCE FROM PERSONNES WHERE numero=&num)
);


PROMPT
PROMPT *************** Affichage des freres et soeurs BIS *****************
PROMPT
SELECT * FROM freres_et_soeurs ORDER BY DATENAISSANCE;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT *******************************************************************
PROMPT ******  Recherche des cousins et cousines    **********************
PROMPT *******************************************************************
PROMPT

PROMPT
PROMPT **************** Vue des cousins et cousines **********************
PROMPT

PROMPT ************************** Vue des parents ************************
PROMPT
create or replace view LES_PARENTS (NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE) as (
    SELECT P2.NUMERO, P2.NOM, P2.PRENOM, P2.DATENAISSANCE, P2.SEXE, P2.PERE, P2.MERE
    FROM  PERSONNES P1, PERSONNES P2
    WHERE  (P1.PERE  = P2.NUMERO
    or    P1.MERE  = P2.NUMERO) 
    and    P1.NUMERO = &num
); 


PROMPT ************* Vue des fr�res et soeurs des parents ****************
PROMPT
create or replace view FRERES_ET_SOEURS_DES_PARENTS (NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE) as
(
    (SELECT    distinct NUMERO, NOM, PRENOM, DATENAISSANCE, SEXE, PERE, MERE 
    FROM      PERSONNES
    WHERE      MERE in (SELECT MERE
                FROM  LES_PARENTS)
    or      PERE in (SELECT PERE
                FROM  LES_PARENTS))
    minus
    (SELECT * FROM LES_PARENTS)
);


TTITLE 'Les cousins et cousines de  : '
PROMPT ****** Vue des enfants des fr�res et soeurs des parents ***********
PROMPT
create or replace view cousins_et_cousines (NUMERO, NOM, PRENOM, DATENAISSANCE) as
(
    (SELECT    distinct NUMERO, NOM, PRENOM, DATENAISSANCE 
    FROM      PERSONNES
    WHERE      MERE in (SELECT NUMERO
                FROM  FRERES_ET_SOEURS_DES_PARENTS)
    or      PERE in (SELECT NUMERO
                FROM  FRERES_ET_SOEURS_DES_PARENTS))
    minus
    (SELECT NUMERO, NOM, PRENOM, DATENAISSANCE FROM PERSONNES WHERE numero in(SELECT NUMERO FROM freres_et_soeurs)
    union
    SELECT NUMERO, NOM, PRENOM, DATENAISSANCE FROM PERSONNES WHERE numero=&num
    )
);


PROMPT
PROMPT *************** Affichage des cousins et cousines *****************
PROMPT
SELECT * FROM cousins_et_cousines ORDER BY DATENAISSANCE;


PROMPT ****** suppression de la vue *****
drop view cousins_et_cousines;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT
PROMPT **************** Vue des cousins et cousines BIS ******************
PROMPT

PROMPT *************** Creation d une vue Grand_Parents *******************
PROMPT
create or replace view Grand_Parents as
(
    SELECT    NUMERO 
    FROM      PERSONNES
    WHERE      level = 3
    connect by prior PERE = NUMERO or prior MERE = NUMERO
    start with NUMERO = &num
);


TTITLE 'Les cousins et cousines BIS de  : '
PROMPT **************** Vue des cousins et cousines BIS *******************
create or replace view cousins_et_cousines as
(
    (SELECT    distinct NUMERO, NOM, PRENOM, DATENAISSANCE 
    FROM      PERSONNES
    WHERE      level = 3
    connect by PERE = prior NUMERO or MERE = prior NUMERO
    start with NUMERO in ( SELECT NUMERO
                  FROM Grand_Parents))
    minus
    (SELECT NUMERO, NOM, PRENOM, DATENAISSANCE FROM PERSONNES WHERE numero in(SELECT NUMERO FROM freres_et_soeurs)
    union
    SELECT NUMERO, NOM, PRENOM, DATENAISSANCE FROM PERSONNES WHERE numero=&num
    )
);


PROMPT
PROMPT ************* Affichage des cousins et cousines BIS ***************
PROMPT
SELECT * FROM cousins_et_cousines ORDER BY DATENAISSANCE;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT ************************************************************************
PROMPT ******  Recherche des issus de germains (cousins de niveaux sup)   ******
PROMPT ************************************************************************
SELECT 'Recherche_des_cousins_et_cousines_germains_d_une_personne' FROM DUAL;
PAUSE


PROMPT *********** Vue des cousins et cousines issus de germains ***************
TTITLE 'Les cousins et cousines issus de germains de  : '
create or replace view cousinsCousines_issus_germains as
(
    (SELECT    distinct NUMERO, NOM, PRENOM, DATENAISSANCE 
    FROM    PERSONNES
    WHERE      MERE in (SELECT NUMERO
                FROM  cousins_et_cousines)
    or      PERE in (SELECT NUMERO
                FROM  cousins_et_cousines))
    minus
    (SELECT NUMERO, NOM, PRENOM, DATENAISSANCE FROM PERSONNES WHERE numero=&num)
);


PROMPT
PROMPT *********** Affichage des cousins et cousines issus de germains **********
PROMPT
SELECT * FROM cousinsCousines_issus_germains ORDER BY DATENAISSANCE;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT
PROMPT ************************ Suppression de la vue ****************************
PROMPT
drop view cousinsCousines_issus_germains;



PROMPT
PROMPT ********** Vue des cousins et cousines issus de germains BIS **************
PROMPT
TTITLE 'Les cousins et cousines issus de germains BIS de  : '
create or replace view cousinsCousines_issus_germains as
(
    (SELECT    distinct NUMERO, NOM, PRENOM, DATENAISSANCE 
    FROM      PERSONNES
    WHERE      level = 4
    connect by PERE = prior NUMERO or MERE = prior NUMERO
    start with NUMERO in ( SELECT NUMERO
                  FROM Grand_Parents))
    minus
    (SELECT NUMERO, NOM, PRENOM, DATENAISSANCE FROM PERSONNES WHERE numero=&num)
);

PROMPT
PROMPT *********** Affichage des cousins et cousines issus de germains **********
PROMPT
SELECT * FROM cousinsCousines_issus_germains ORDER BY DATENAISSANCE;

PROMPT
PAUSE Tapez sur Enter...
PROMPT



PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT ****************************************************************************
PROMPT *                                                                          *
PROMPT *      FICHE C : Structure de donn�es arborescente                         *
PROMPT *      Structure de donn�es arborescente                                   *
PROMPT *      Cas C2:  Arbre de Nomenclature Produits                             *   
PROMPT *                                                                          *
PROMPT ****************************************************************************
PROMPT
PROMPT
REM *******************************************************************************
REM *************** Les sportifs: fabrication de bicyclettes....*******************
REM *******************************************************************************

PROMPT ********** Suppression des tables NOMENCLATURE et PRODUITS ***************
PROMPT
DROP TABLE NOMENCLATURE;
DROP TABLE PRODUITS;

PROMPT ************ Creation des tables NOMENCLATURE et PRODUITS ****************
PROMPT
PROMPT **************************************************************************
PROMPT
PROMPT  Table: PRODUITS
PROMPT
PROMPT **************************************************************************
PROMPT
create table PRODUITS
(
    NUMERO       NUMBER(3),
    NOM          varchar(15),
    QSTOCK       NUMBER (5),
    constraint PK_PRODUITS            primary key (NUMERO),
    constraint CK_QSTOCK_PRODUITS     CHECK (QSTOCK >= 0)
);


PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *************************************************************************
PROMPT
PROMPT  Table: NOMENCLATURE
PROMPT
PROMPT *************************************************************************
PROMPT
create table NOMENCLATURE
(
    COMPOSER      NUMBER (3),
    COMPOSANT     NUMBER (3),
    QFABR         NUMBER (5),
    constraint    PK_NOMENCLATURE               primary key (COMPOSER, COMPOSANT),
    constraint    FK_NOMENCL_COMPOSER_PRODUITS  foreign key (COMPOSER) references PRODUITS,
    constraint    FK_NOMENCL_COMPOSANT_PRODUITS foreign key (COMPOSANT) references PRODUITS,
    constraint    CK_QFABR_NOMENCLATURE         check (QFABR >=0)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT **************************** Insertion des donnees **********************
PROMPT
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (1, 'VELO', 5);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (2, 'ROUE', 10);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (3, 'GUIDON', 7);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (4, 'GARDE BOUE', 5);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (5, 'CHAINE', 2);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (6, 'RAYON', 500);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (7, 'CHAMBRE_AIR', 5);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (8, 'SELLE', 5);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (9, 'TRICYCLE', 1);
insert into PRODUITS (NUMERO, NOM, QSTOCK) values (10, 'JANTE', 13);

insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (1, 2, 2);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (1, 3, 1);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (1, 4, 2);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (1, 5, 1);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (1, 8, 1);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (9, 2, 3);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (9, 3, 1);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (9, 4, 3);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (2, 6, 50);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (2, 10, 1);
insert into NOMENCLATURE (COMPOSER, COMPOSANT, QFABR) values (1, 7, 1);

COMMIT;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

TTITLE 'Les produits en stock :'
SELECT * FROM PRODUITS
ORDER BY QSTOCK;

TTITLE 'La composition des produits :'
SELECT * FROM NOMENCLATURE
ORDER BY COMPOSER, COMPOSANT;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ******************* Suppression de la table NOMEN ********************
PROMPT
DROP TABLE NOMEN;

PROMPT ******************** Creation de la table NOMEN **********************
PROMPT
create table NOMEN (PERE, FILS) as 
(
    SELECT P1.NOM, P2.NOM 
    FROM  PRODUITS P1, PRODUITS P2, NOMENCLATURE N
    WHERE  P1.NUMERO = N.COMPOSER 
    and    P2.NUMERO = N.COMPOSANT
);


SELECT * FROM NOMEN;


PROMPT
PAUSE Tapez sur Enter...
PROMPT

REM la jointure est interdite dans un connect by

COLUMN NOMENCLATURE FORMAT A15

SELECT    level NIVEAU, lpad(' ',2*level) || FILS NOMENCLATURE
FROM      NOMEN
connect by prior FILS = PERE
start with PERE = 'VELO';

PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT ****************************************************************************
PROMPT *                                                                          *
PROMPT *      FICHE C : Structure de donn�es de type graphe non orient�           *
PROMPT *      Structure de donn�es recursives de type Graphe non orient           *
PROMPT *      Cas C3:  Le plus court chemin dans un graphe                        *   
PROMPT *                                                                          *
PROMPT ****************************************************************************
PROMPT
PROMPT

PROMPT ************************ Suppression de la table ROUTE ******************
PROMPT
DROP TABLE ROUTE;

PROMPT ************************** Creation de la table ROUTE *******************
PROMPT
create table ROUTE
(
    VILLEDEP      varchar (15),
    VILLEARR      varchar (15),
    DISTANCE      NUMBER (5),
    constraint    PK_ROUTE             primary key (VILLEDEP, VILLEARR),
    constraint    CK_ROUTE_DISTANCE    check (distance >= 0)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT **************************** Insertion des donnees *********************
PROMPT
insert into ROUTE values ('PARIS', 'LILLE', 200);
insert into ROUTE values ('PARIS', 'NANTES', 500);
insert into ROUTE values ('PARIS', 'STRASBOURG', 500);
insert into ROUTE values ('PARIS', 'BORDEAUX', 700);
insert into ROUTE values ('PARIS', 'LYON', 400);
insert into ROUTE values ('PARIS', 'MARSEILLE', 800);
insert into ROUTE values ('LILLE', 'NANTES', 500);
insert into ROUTE values ('LILLE', 'STRASBOURG', 500);
insert into ROUTE values ('STRASBOURG', 'LYON', 300);
insert into ROUTE values ('NANTES', 'BORDEAUX', 300);
insert into ROUTE values ('LYON', 'MARSEILLE', 300);

COMMIT;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ************************* Affichage de la table ROUTE ******************
PROMPT
TTITLE 'Affichage de la table Route';
SELECT * FROM ROUTE;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT ******************************* Les requetes ***************************
PROMPT

PROMPT ************************************************************************
PROMPT
PROMPT IL faut creer plusieurs vues pour permettre de realiser celle du plus
PROMPT cours chemin.
PROMPT
PROMPT ************************************************************************
PROMPT


PROMPT ************** Creation d une vue des chemins RETOUR *******************
PROMPT 
drop view RETOUR;

create or replace view RETOUR (VILLEDEP, VILLEARR, DISTANCE) as
    (SELECT    VILLEARR, VILLEDEP, DISTANCE
    FROM    ROUTE);
    
PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ************ Creation d une table des chemins ALLER_RETOUR *************
PROMPT
DROP TABLE ALLER_RETOUR;

create table ALLER_RETOUR (VILLEDEP, VILLEARR, DISTANCE) as
    (SELECT *
    FROM ROUTE
    union
    SELECT *
    FROM RETOUR);

    
PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ***** Creation d une table Table_temps1 qui permet des escales vides ****
PROMPT

DROP TABLE Table_temps1;

create table Table_temps1
(
    X1    varchar(15),
    X2     varchar(15),
    X3    varchar(15)
);

insert into Table_temps1 values(' ',' ',' ');

PROMPT ***************** Creation d une view Chemin0_Large *********************
PROMPT
drop view CHEMIN0_LARGE;

Create or replace view Chemin0_Large(VD, E1, E2, E3, VA,D) as
    (SELECT r1.villedep, r2.X1, r2.X2, r2.X3, r1.villearr, r1.distance
    FROM ALLER_RETOUR r1, Table_temps1 r2);
    
PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *********** Creation d une vue des chemins avec une escale *************
PROMPT
drop view CHEMIN_ESCALE1;

create or replace view chemin_escale1 (Depart, Escale, Arrivee, Distance) as
    (SELECT r1.villedep, r1.villearr, r2.villearr, r1.distance + r2.distance
    FROM ALLER_RETOUR r1, ALLER_RETOUR r2
    WHERE r1.villearr =  r2.villedep
    and  r1.villedep   
    <> r2.villedep
    and  r1.villedep <> r2.villearr);

    
PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT ***** Creation d une table Table_temps2 qui permet des escales vides ****
PROMPT
DROP TABLE Table_temps2;

create table Table_temps2
(
    X1    varchar(15),
    X2    varchar(15)
);

insert into Table_temps2 values(' ',' ');

PROMPT ***************** Creation d une view Chemin1_Large *********************
PROMPT
drop view CHEMIN1_LARGE;

Create or replace view Chemin1_Large(VD, E1, E2, E3, VA,D) as
    (SELECT Chemin_escale1.Depart,Chemin_escale1.Escale, Table_temps2.X1, Table_temps2.X2,
        Chemin_escale1.Arrivee, Chemin_escale1.Distance
    FROM  Chemin_escale1, Table_temps2 
    WHERE  Chemin_escale1.Depart <> Chemin_escale1.Escale
    and    Chemin_escale1.Escale <> Chemin_escale1.Arrivee);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ********** Creation d une vue des chemins avec deux escales ***********
PROMPT
drop view CHEMIN_ESCALE2;

create or replace view chemin_escale2 (Depart, Escale1, Escale2, Arrivee, Distance) as
    (SELECT r1.Depart, r1.escale, r1.Arrivee, r2.villearr, r1.distance + r2.distance
    FROM  Chemin_escale1 r1, ALLER_RETOUR r2
    WHERE r1.Arrivee =  r2.villedep);
  
PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ***** Creation d une table Table_temps3 qui permet des escales vides ****
PROMPT
DROP TABLE Table_temps3;

create table Table_temps3
(
    X1    varchar(15)
);


insert into Table_temps3 values(' ');


PROMPT ***************** Creation d une view Chemin2_Large *********************
PROMPT
drop view CHEMIN2_LARGE;

Create or replace view Chemin2_Large(VD, E1, E2, E3, VA,D) as
    (SELECT Chemin_escale2.Depart, Chemin_escale2.Escale1, Chemin_escale2.Escale2, Table_temps3.X1,
        Chemin_escale2.Arrivee, Chemin_escale2.Distance
    FROM  Chemin_escale2, Table_temps3 
    WHERE  Chemin_escale2.Depart  <> Chemin_escale2.Escale1
    and    Chemin_escale2.Depart  <> Chemin_escale2.Escale2
    and    Chemin_escale2.Escale1 <> Chemin_escale2.Escale2
    and    Chemin_escale2.Depart  <> Chemin_escale2.Arrivee
    and    Chemin_escale2.Escale1 <> Chemin_escale2.Arrivee);


    
PROMPT ********** Creation d une vue des chemins avec trois escales **********
PROMPT
drop view CHEMIN3_LARGE;

Create or replace view Chemin3_Large(VD, E1, E2, E3, VA,D) as
    (SELECT r1.Depart,r1.Escale1, r1.Escale2, r1.Arrivee, r2.villearr,
        r1.Distance + r2.Distance
    FROM  Chemin_escale2 r1, aller_retour r2 
    WHERE  r1.Arrivee = r2.villedep
    and    r1.Depart  <> r1.Escale1
    and    r1.Depart  <> r1.Escale2
    and    r1.Escale1 <> r1.Escale2
    and    r1.Depart  <> r1.Arrivee
    and    r1.Escale2 <> r1.Arrivee
    and    r1.Arrivee <> r2.villearr
    and    r1.Escale1 <> r1.Arrivee);

    
PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT **************** Creation d une vue Aller_Retour_Large ******************
PROMPT
drop view ALER_RETOUR_LARGE;

Create or replace view Aler_Retour_Large (VD, E1, E2, E3, VA, D) as
    (SELECT *
    FROM Chemin0_Large
    union
    SELECT *
    FROM Chemin1_Large
    union
    SELECT *
    FROM Chemin2_Large
    union
    SELECT *
    FROM Chemin3_Large
    );
    
    
PROMPT **************** Affichage de la vue Aller_Retour_Large ******************
PROMPT
set pages 100
COLUMN VD    FORMAT A13
COLUMN E1    FORMAT A13
COLUMN E2    FORMAT A13
COLUMN E3    FORMAT A13
COLUMN VA    FORMAT A13
COLUMN D     FORMAT 99999
    
TTITLE 'Affichage des Aller Retour Large';
SELECT * FROM Aler_Retour_Large;
    
PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *********** Tous les chemins de la ville  VD � la ville VA: *************
PROMPT
drop view tous_les_chemins;

create or replace view tous_les_chemins as
    (SELECT *
    FROM Aler_Retour_Large
    WHERE upper(vd) = '&vd'
    and  upper(va) = '&va');

    
PROMPT ****************** SELECTion de tous les chemins *************************
PROMPT
TTITLE 'Affichage de tous les chemins';
SELECT * FROM tous_les_chemins;


PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'requete n�1: Le plus court chemin d une ville a une autre' skip 1 -
      LEFT '==========================================================' skip 1
SELECT *
FROM  tous_les_chemins
WHERE  d = ( SELECT min(d)
        FROM tous_les_chemins);

        
PROMPT
PAUSE Tapez sur Enter...
PROMPT


TTITLE CENTER 'requete n�2: Toutes les villes qui se trouvent a un rayon de k km d une ville donnees' skip 1 -
      LEFT '========================================================================================' skip 1

PROMPT
PROMPT *****************************************************************
PROMPT  
PROMPT Demande � l utilisateur d entrer le nom d une ville et le nombre
PROMPT de km souhait� entre cette ville et d autres villes. 
PROMPT
PROMPT *****************************************************************
PROMPT
accept ville prompt 'Entrez le nom d une ville        : '; 
accept k prompt 'Entrez un rayon de k km souhaite : '; 

SELECT    VILLEDEP, VILLEARR, DISTANCE
FROM    ROUTE
WHERE    VILLEDEP = '&ville'
and    DISTANCE <= &k;

PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT ****************************************************************************
PROMPT *                                                                          *
PROMPT *      FICHE D : Creation des tables pour la BD GesComDW                   *
PROMPT *      FICHE D : Initiation aux entrep�ts de donn�es (Data WareHouse)      *
PROMPT *                                                                          *
PROMPT ****************************************************************************
PROMPT
PROMPT
-- =====================================================================
PROMPT ***************** Initialisation du type date *******************
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY' ;
-- =====================================================================
PROMPT *****************************************************************
PROMPT
PROMPT Table Articles
PROMPT
PROMPT *****************************************************************
PROMPT
DROP TABLE Articles;

create table Articles
(
    NUMART        INTEGER,
    NOMART        CHAR(20),
    PUART         NUMBER(7,2),      
    constraint PK_Articles primary key (NUMART)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *****************************************************************
PROMPT
PROMPT Table Magasins
PROMPT 
PROMPT *****************************************************************
PROMPT
DROP TABLE Magasins;

create table Magasins
(
    NUMMAG        INTEGER,
    NOMMAG        CHAR(30),
    TELMAG        CHAR(15),
    ADRNUMMAG     VARCHAR2(10),
    ADRRUEMAG     VARCHAR2(50),
    ADRCPMAG      VARCHAR2(10),
    ADRVILLEMAG   VARCHAR2(50),
    ADRPAYSMAG    VARCHAR2(50),      
    constraint    PK_Magasins primary key (NUMMAG)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *****************************************************************
PROMPT
PROMPT Table Temps
PROMPT
PROMPT *****************************************************************
PROMPT

DROP TABLE Temps;

Create table Temps
(
    IDTEMPS        INTEGER,
    DATEHEURET     DATE,
    ANNEET         INTEGER,
    MOIST          INTEGER,
    JOURT          INTEGER,
    constraint PK_Temps primary key (IDTEMPS)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *****************************************************************
PROMPT
PROMPT Table Clients
PROMPT
PROMPT *****************************************************************
PROMPT

DROP TABLE Clients;

Create table Clients
(
    NUMCLI        INTEGER,
    NOMCLI        CHAR(20),
    TELCLI        CHAR(15),
    ADRNUMCLI     VARCHAR2(10),
    ADRRUECLI     VARCHAR2(50),
    ADRCPCLI      VARCHAR2(10),
    ADRVILLECLI   VARCHAR2(50),
    ADRPAYSCLI    VARCHAR2(50),      
    constraint PK_Clients primary key (NUMCLI)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *****************************************************************
PROMPT
PROMPT Table VENTES
PROMPT
PROMPT *****************************************************************
PROMPT

DROP TABLE Ventes;

create table Ventes 
( 
    NUMVENTE      INTEGER,
    NUMART        INTEGER,
    IDTEMPS       INTEGER,
    NUMCLI        INTEGER,
    MONTANTVENTE  NUMBER(20,4),
    NUMMAG        INTEGER,
    constraint PK_Ventes primary key (NUMVENTE),
    constraint FK_Ventes_NUMART_Articles foreign key  (NUMART)   references  Articles (NUMART),
    constraint FK_Ventes_NUMMAG_Magasins foreign key  (NUMMAG)   references  Magasins (NUMMAG),
    constraint FK_Ventes_IDTEMPS_Temps  foreign key  (IDTEMPS)   references  Temps    (IDTEMPS),
    constraint FK_Ventes_NUMCLI_Clients  foreign key  (NUMCLI)   references  Clients  (NUMCLI)    
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ****************************************************************
PROMPT
PROMPT Table VentArt
PROMPT
PROMPT ****************************************************************
PROMPT
DROP TABLE VentArt;

create table VentArt
(
    NUMART        INTEGER,
    NUMVENTE      INTEGER,
    constraint PK_VentArt primary key (NUMART, NUMVENTE),
    constraint FK_VentArt_NUMART_Articles foreign key  (NUMART)     references  Articles (NUMART),
    constraint FK_VentArt_NUMVENTE_Ventes foreign key  (NUMVENTE)   references  Ventes  (NUMVENTE)
);
    
PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ****************************************************************
PROMPT
PROMPT Table VentMag
PROMPT
PROMPT ****************************************************************
PROMPT
DROP TABLE VentMag;

create table VentMag
(
    NUMMAG        INTEGER,
    NUMVENTE      INTEGER,
    constraint PK_VentMag primary key (NUMMAG, NUMVENTE),
    constraint FK_VentMag_NUMMAG_Magasins foreign key  (NUMMAG)     references  Magasins (NUMMAG),
    constraint FK_VentMag_NUMVENTE_Ventes foreign key  (NUMVENTE)   references  Ventes  (NUMVENTE)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ****************************************************************
PROMPT
PROMPT Table VentTps
PROMPT
PROMPT ****************************************************************
PROMPT
DROP TABLE VentTps;

create table VentTps
(
    IDTEMPS        INTEGER,
    NUMVENTE       INTEGER,
    constraint PK_VentTps primary key (IDTEMPS, NUMVENTE),
    constraint FK_VentTps_IDTEMPS_Temps  foreign key  (IDTEMPS)   references  Temps  (IDTEMPS),
    constraint FK_VentTps_NUMVENTE_Ventes foreign key  (NUMVENTE) references  Ventes (NUMVENTE)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ****************************************************************
PROMPT
PROMPT Table VentCli
PROMPT
PROMPT ****************************************************************
PROMPT
DROP TABLE VentCli;

create table VentCli
(
    NUMCLI        INTEGER,
    NUMVENTE      INTEGER,
    constraint PK_VentCli primary key(NUMCLI, NUMVENTE),
    constraint FK_VentCli_NUMCLI_Clients  foreign key  (NUMCLI)    references Clients (NUMCLI),
    constraint FK_VentCli_NUMVENTE_Ventes foreign key  (NUMVENTE)   references Ventes  (NUMVENTE)
);



PROMPT ************** EXERCICE 1: Les schemas en etoiles ***************
PROMPT
PROMPT

PROMPT *****************************************************************
PROMPT
PROMPT Lancement du script sql:
PROMPT
PROMPT *****************************************************************
PROMPT


-- =====================================================================
set page 1000
set long 2000

col NOMCLI       FORMAT A10
col TELCLI       FORMAT A10
col ADRNUMCLI    FORMAT A5
col ADRRUECLI    FORMAT A10
col ADRCPCLI     FORMAT A5
col ADRVILLECLI  FORMAT A10
col ADRPAYSCLI   FORMAT A10

col NOMART       FORMAT A10

col NOMMAG       FORMAT A10
col TELMAG       FORMAT A10
col ADRNUMMAG    FORMAT A5
col ADRRUEMAG    FORMAT A10
col ADRCPMAG     FORMAT A5
col ADRVILLEMAG  FORMAT A10
col ADRPAYSMAG   FORMAT A10

TTITLE 'Liste des clients' skip 1
SELECT * FROM clients;

TTITLE 'Liste des magasins' skip 1
SELECT * FROM magasins;


TTITLE 'Liste des articles' skip 1
SELECT * FROM articles;


TTITLE 'Liste des ventes' skip 1
SELECT * FROM ventes;


TTITLE 'Liste des temps' skip 1
SELECT * FROM temps;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *****************************************************************
PROMPT ************************** Les requetes *************************
PROMPT *****************************************************************
PROMPT



PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT ****************************************************************************
PROMPT *                                                                          *
PROMPT *      FICHE E : Initiation Langage proc�dural d oracle      PL/SQL        *
PROMPT *                                                                          *
PROMPT ****************************************************************************
PROMPT
PROMPT

REM **********PL/SQL****************************************************

PROMPT *****************************************************************
PROMPT
PROMPT Calcul du factoriel d un nombre > 0
PROMPT
PROMPT *****************************************************************
PROMPT

PROMPT ************* Suppression de la table resultfacto ****************
PROMPT
DROP TABLE resultfacto;
PROMPT
PROMPT ************** Creation de la table resultfacto *****************
PROMPT
create table resultfacto (n NUMBER, factoriel_n NUMBER);

PROMPT
PAUSE Tapez sur Enter...
PROMPT
REM apres avoir lanc� sous sql les commandes prompt et accept pour entrer une valeur
accept n prompt 'Entrez le nombre : '; 
--================================== Bloc PL/SQL
declare
    resultat NUMBER := 1;
begin
    for i in 1..&n loop
        resultat := resultat * i;
    end loop;
    insert into resultfacto values (&n, resultat);
end;
/
--================================== Bloc PL/SQL
PROMPT 
PAUSE Tapez sur Enter...
PROMPT
SELECT * FROM resultfacto;
PROMPT 
PAUSE Tapez sur Enter...
PROMPT

REM ***********PL/SQL***************************************************
PROMPT *****************************************************************
PROMPT
PROMPT vider la table 
PROMPT
PROMPT *****************************************************************
PROMPT
delete resultfacto;
--================================== Bloc PL/SQL
declare
    resultat    NUMBER;
    bornemax    NUMBER := 20;
begin
    for j in 1..bornemax loop
        resultat := 1;
        for i in 1..j loop
            resultat := resultat *i;
        end loop;
        insert into resultfacto values (j, resultat);
    end loop;
end;
/
--================================== Bloc PL/SQL
PROMPT 
PAUSE Tapez sur Enter...
PROMPT
SELECT * FROM resultfacto;
PROMPT 
PAUSE Tapez sur Enter...
PROMPT
REM ***********PL/SQL***************************************************
PROMPT *****************************************************************
PROMPT
PROMPT Afficher la ligne n=5 de cette table
PROMPT
PROMPT *****************************************************************
PROMPT
--== Commande n�cessaire pour l'affichage
REM --cette commande est obligatoire pour dbms output fonctionne
set serveroutput on
--================================== Bloc PL/SQL
declare
    v_n    NUMBER;
    v_fact    NUMBER;
begin
    SELECT n, factoriel_n into v_n, v_fact 
    FROM resultfacto 
    WHERE n=5;
    dbms_output.put_line ('La factorielle de '|| v_n || ' est egale a: ' || v_fact);
end;
/
--================================== Bloc PL/SQL
PROMPT 
PAUSE Tapez sur Enter...
PROMPT

REM ***********PL/SQL****************************************************
PROMPT ******************************************************************
PROMPT
PROMPT Afficher les lignes paires parmi les 10 premieres lignes de 
PROMPT cette table
PROMPT
PROMPT ******************************************************************
PROMPT
REM --cette commande est obligatoire pour dbms output fonctionne
set serveroutput on
--================================== Bloc PL/SQL
declare
    v_n       NUMBER;
    v_fact    NUMBER;
begin
    for i in 1..10 loop
        if i=2 or i=4 or i=6 or i=8 or i=10 then
            SELECT n, factoriel_n into v_n, v_fact
            FROM  resultfacto
            WHERE  n=i;
            dbms_output.put_line ('La factorielle de ' || v_n || ' est egale a: ' || v_fact);
        end if;
    end loop;
end;
/
--================================== Bloc PL/SQL
PROMPT 
PAUSE Tapez sur Enter...
PROMPT


REM ***********PL/SQL***************************************************
PROMPT *****************************************************************
PROMPT
PROMPT Generer de gros volumes de donnees
PROMPT Creer 100 clients a Paris 
PROMPT
PROMPT *****************************************************************
PROMPT
--================================== Bloc PL/SQL
begin
    for i in 100..200 loop
        insert into clients (numcli, nomcli, adrvillecli)
        values ( i, 'MFB Traifor', 'Paris');
    end loop;
end;
/
--================================== Bloc PL/SQL
PROMPT 
PAUSE Tapez sur Enter...
PROMPT

REM ***********PL/SQL***************************************************
PROMPT *****************************************************************
PROMPT
PROMPT procedure d insertion de nouveaux clients
PROMPT
PROMPT *****************************************************************
PROMPT
--================================== Proc�dure PL/SQL
create or replace procedure nouveaucli (num NUMBER, nom char, ville char) is
    begin
        insert into clients (numcli, nomcli, adrvillecli)
        values (num, nom, ville);
end;
/
--================================== Proc�dure PL/SQL
PROMPT 
PAUSE Tapez sur Enter...
PROMPT
--================================== Appel/Ex�cution de Proc�dure PL/SQL
execute nouveaucli (77, 'LeNouveau', 'Labas');
SELECT * FROM clients;

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

REM ***********PL/SQL***************************************************
PROMPT *****************************************************************
PROMPT
PROMPT Procedure d insertion de nouveaux clients
PROMPT
PROMPT *****************************************************************
PROMPT
--================================== Proc�dure PL/SQL
create or replace procedure nouveaucl is 
begin
    nouveaucli (8, 'Baba', 'Ici');
end;
/
--================================== Proc�dure PL/SQL
PROMPT 
PAUSE Tapez sur Enter...
PROMPT

execute nouveaucl;
SELECT * FROM clients;

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

REM **********PL/SQL****************************************************
PROMPT *****************************************************************
PROMPT
PROMPT Procedure  moyvmag et fonction moyventes
PROMPT
PROMPT *****************************************************************
PROMPT
create or replace package pkventes as
    procedure moyvmag;
    function moyventes (numag in NUMBER) return NUMBER;
end pkventes;
/

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

create or replace package body pkventes is
procedure moyvmag is
    v_m NUMBER;

begin
    for v_numag in 1..3 loop
        v_m := moyventes(v_numag);
        dbms_output.put_line ('La moyenne des ventes du magasin ' || 
                    v_numag || ' est egale a: ' || v_m);
    end loop;
end;    


function moyventes (numag in NUMBER) return NUMBER as
    moyenne NUMBER;

begin
    SELECT AVG(montantvente) into moyenne
    FROM ventes 
    WHERE nummag = numag;
    return (moyenne);
end;
end pkventes;
/

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

exec pkventes.moyvmag;

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

REM ***********PL/SQL***************************************************
PROMPT *****************************************************************
PROMPT
PROMPT fonction moyventes2 et procedure moyvmag2
PROMPT
PROMPT *****************************************************************
PROMPT
create or replace function moyventes2 (numag in NUMBER) return NUMBER as
    moyenne NUMBER;

begin
    SELECT AVG(montantvente) into moyenne
    FROM  ventes 
    WHERE  nummag = numag;
    return (moyenne);
end;
/

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

create or replace procedure moyvmag2 (numag NUMBER) is
    v_n NUMBER;

begin
    v_n := moyventes2 (numag);
    dbms_output.put_line ('La moyenne des ventes du magasin ' || 
                numag || ' est egale a: ' || v_n);
end;
/

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

execute moyvmag2(3);

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

REM ***********PL/SQL***************************************************
PROMPT *****************************************************************
PROMPT
PROMPT Augmenter de 10% le prix unitaire des articles dont le prix 
PROMPT actuel est < 800
PROMPT
PROMPT *****************************************************************
PROMPT
begin
    for prixachanger in 
        (SELECT numart FROM articles WHERE puart < 800) loop
        update articles 
        set    puart = puart * 1.1    
        WHERE  prixachanger.numart = articles.numart;
    end loop;
    -- attention a cette commande
    commit;
end;
/

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

REM **********PL/SQL****************************************************
PROMPT *****************************************************************
PROMPT
PROMPT procedure Wanted_CLI
PROMPT
PROMPT *****************************************************************
PROMPT
create or replace procedure Wanted_CLI (n in NUMBER) is
    num NUMBER;

begin
    SELECT NUMCLI into num
    FROM  CLIENTS 
    WHERE  numcli = n;
    exception
        when no_data_found then dbms_output.put_line ('Le client ' ||
            n || ' n existe pas !!!');
end;
/

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

set serveroutput on
execute Wanted_CLI(3);
execute Wanted_CLI(33);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

REM ************PL/SQL**************************************************
PROMPT *****************************************************************
PROMPT
PROMPT procedure Cherche_CLI
PROMPT
PROMPT *****************************************************************
PROMPT
create or replace procedure Cherche_CLI (n in NUMBER) is
    nbr NUMBER;

begin
    SELECT count(*) into nbr
    FROM  Clients
    WHERE  NUMCLI = n;
    if nbr = 1 then
        dbms_output.out_line('Le client '||n||' existe');
    else
        dbms_output.out_line('Le client '||n||' n existe pas !!!');
    end if;
end;
/

PROMPT
PAUSE Tapez sur Enter...
PROMPT

set serveroutput on
execute Cherche_CLI(3);
execute Cherche_CLI(33);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

REM ************PL/SQL**************************************************
PROMPT *****************************************************************
PROMPT
PROMPT Changement d un numero de tel d un magasin donne
PROMPT
PROMPT *****************************************************************
PROMPT
create or replace procedure ChTelMag (numag in NUMBER, tel in char) is

begin
    update magasins
    set    telmag  = tel
    WHERE  nummag = numag; 
end ChTelMag;
/

PROMPT
PAUSE Tapez sur Enter...
PROMPT

execute ChTelMag(4, '73226002');

PROMPT
PAUSE Tapez sur Enter...
PROMPT

REM ***********PL/SQL***************************************************
PROMPT *****************************************************************
PROMPT
PROMPT Table seqnocli
PROMPT
PROMPT *****************************************************************
PROMPT
PROMPT *************** Suppression de la table seqnocli ****************
PROMPT
drop sequence seqnocli;

PROMPT
PROMPT *************** Creation de la table seqnocli *******************
PROMPT
create sequence seqnocli
    increment by 1
    start with 7000
    maxvalue 7777
    nocycle;
    SELECT seqnocli.nextval FROM DUAL;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *****************************************************************
PROMPT
PROMPT Procedure AjouteCli
PROMPT
PROMPT *****************************************************************
PROMPT
create or replace procedure AjouteCli (nom in char, tel in char) is
    num NUMBER;

begin
    SELECT seqnocli.nextval into num FROM DUAL;
    insert into clients (NUMCLI, NOMCLI, TELCLI, ADRPAYSCLI)
    values (num, nom, tel, 'France');
end;
/

PROMPT
PAUSE Tapez sur Enter...
PROMPT

execute AjouteCli ('Adam', '1');
set echo on
set PAUSE on
set verify off

accept nom char prompt 'Nom du Client> '
REM le nom doit etre saisie avec les quotes

accept tel char prompt 'Telephone> '
REM le telephone doit etre saisie avec les quotes

execute AjouteCli (&nom, &tel);

SELECT * FROM clients;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

REM *************PL/SQL*************************************************
PROMPT *****************************************************************
PROMPT
PROMPT fonction artpascher et procedure augmenter
PROMPT
PROMPT *****************************************************************
PROMPT
create or replace function artpascher (prixart NUMBER) return boolean is
    moyp real;

begin
    SELECT AVG(puart) into moyp
    FROM  articles;
    return (prixart < moyp);
end artpascher;
/

PROMPT
PAUSE Tapez sur Enter...
PROMPT

create or replace procedure augmenter (pays char) is
    cursor quelsart is
        SELECT distinct a.numart, a.puart
        FROM  articles a, ventes v, magasins m
        WHERE  a.numart    = v.numart
        and    v.nummag    = m.nummag
        and    m.adrpaysmag = pays;

begin
    for art in quelsart loop
        if artpascher (art.puart) then
            update articles
            set    puart  = puart * 1.5
            WHERE  numart = art.numart;
            commit;
        end if;
    end loop;
end augmenter;
/

PROMPT
PAUSE Tapez sur Enter...
PROMPT

execute augmenter ('France');
SELECT * FROM articles;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *****************************************************************
PROMPT 
PROMPT Creation d une vue Profs2000
PROMPT
PROMPT *****************************************************************
PROMPT
create or replace view Profs2000 as 
(
    SELECT NUM_PROF, NOM, SPECIALITE, DATE_ENTREE
    FROM  PROFESSEURS
    WHERE  DATE_ENTREE > '01-01-2000'
)
with CHECK option;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

grant SELECT on Profs2000 to public;

PROMPT
PAUSE Tapez sur Enter...
PROMPT

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY' ;

create materialized view Profs20000 as 
(
    SELECT NUM_PROF, NOM, SPECIALITE, DATE_ENTREE
    FROM  PROFESSEURS
    WHERE  DATE_ENTREE < '01-01-2000'
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

create snapshot Profs2000 as 
(
    SELECT NUM_PROF, NOM, SPECIALITE, DATE_ENTREE
    FROM  PROFESSEURS
    WHERE  DATE_ENTREE > '01-01-2000'
);


PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *****************************************************************
PROMPT 
PROMPT Traitement des contraintes 1:
PROMPT
PROMPT *****************************************************************
PROMPT

PROMPT ************** Suppression de la table fbexemple ****************    
PROMPT
DROP TABLE fbexemple;

PROMPT 
PROMPT ***************** Creation de la table fbexemple ****************
PROMPT
create table fbexemple 
(
    a NUMBER, 
    b varchar2(10)
);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ******************** Donnees de la table fbexemple **************
PROMPT
insert into fbexemple values (1, 'master2Proeid2');
insert into fbexemple values (2, 'dea ocia');
insert into fbexemple values (1, '???');

PROMPT 
PAUSE Tapez sur Enter ...
PROMPT

PROMPT ***************** Affichage de la table fbexemple *************** 
PROMPT
SELECT * FROM fbexemple;

PROMPT 
PAUSE Tapez sur Enter ...
PROMPT

PROMPT ************** Suppression de la table exceptions ***************
PROMPT
DROP TABLE exceptions;

PROMPT 
PAUSE Tapez sur Enter ...
PROMPT

PROMPT **************** Creation de la table exceptions ****************
PROMPT
create table exceptions
(
    row_id         rowid,
    owner         varchar2(20),
    table_name     varchar2(20),
    constraint     varchar2(20)
);

PROMPT 
PAUSE Tapez sur Enter ...
PROMPT

PROMPT ***************** Modification de la table fbexemple ************
PROMPT
ALTER TABLE fbexemple ADD CONSTRAINT PK_fbexemple primary key (a) exceptions into exceptions;

PROMPT 
PAUSE Tapez sur Enter ...
PROMPT

PROMPT ************************* Affichage *****************************
PROMPT
SELECT * FROM fbexemple;
SELECT * FROM exceptions;
insert into fbexemple values (2, 'master2');
SELECT * FROM exceptions;
SELECT * FROM fbexemple;


PROMPT 
PAUSE Tapez sur Enter ...
PROMPT

PROMPT *****************************************************************
PROMPT
PROMPT Traitement des contraintes 2:
PROMPT
PROMPT *****************************************************************
PROMPT

PROMPT ************** Suppression de la table fbexemple ****************
PROMPT
DROP TABLE fbexemple;

PROMPT 
PAUSE Tapez sur Enter ...
PROMPT

PROMPT ***************** Creation de la table fbexemple *****************
PROMPT
create table fbexemple
(
    a NUMBER,
    b varchar2(10),
    constraint PK_fbexemple primary key (a)
);

PROMPT 
PAUSE Tapez sur Enter ...
PROMPT

PROMPT **************** Donnees de la table fbexemple ******************
PROMPT
insert into fbexemple values (1, 'master2Proeid2');
insert into fbexemple values (2, 'dea ocia');
insert into fbexemple values (1, '???');

PROMPT 
PAUSE Tapez sur Enter ...
PROMPT

PROMPT ************************ Affichage ******************************
PROMPT 
SELECT * FROM fbexemple;
insert into fbexemple values (2, 'master2');
SELECT * FROM fbexemple;

PROMPT 
PAUSE Tapez sur Enter ...
PROMPT

PROMPT *****************************************************************
PROMPT
PROMPT Traitement des contraintes 3:
PROMPT
PROMPT *****************************************************************
PROMPT

PROMPT *************** Suppression de la table exceptions **************
PROMPT
DROP TABLE exceptions;

PROMPT 
PAUSE Tapez sur Enter ...
PROMPT

PROMPT ***************** Creation de la table exceptions ****************
PROMPT
create table exceptions
(
    row_id         rowid,
    owner         varchar2(20),
    table_name     varchar2(20),
    constraint     varchar2(20)
);

PROMPT 
PAUSE Tapez sur Enter ...
PROMPT

PROMPT ***************** Modification de la table clients **************
PROMPT
ALTER TABLE clients ADD CONSTRAINT CK_AdrVille_Clients CHECK (adrvillecli in('Paris', 'Nice'))
    exceptions into exceptions;

PROMPT 
PAUSE Tapez sur Enter ...
PROMPT

PROMPT ************************ Affichage ******************************
PROMPT
SELECT * FROM exceptions;

PROMPT 
PAUSE Tapez sur Enter ...
PROMPT
PROMPT

PROMPT *****************************************************************
PROMPT
PROMPT Date de naissance
PROMPT
PROMPT *****************************************************************
PROMPT
alter session set nls_date_FORMAT = 'DD-MM-YYYY';
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR (TO_DATE ('17-09-1958', 'DD-MM-YYYY'), 'DAY') JOURNAISSANCE FROM DUAL;
SELECT TO_CHAR (TO_DATE ('22-11-1969', 'DD-MM-YYYY'), 'DAY') JOURNAISSANCE FROM DUAL;
SELECT TO_CHAR (TO_DATE ('16-10-1996', 'DD-MM-YYYY'), 'DAY') JOURNAISSANCE FROM DUAL;
SELECT TO_CHAR (TO_DATE ('19-06-2001', 'DD-MM-YYYY'), 'DAY') JOURNAISSANCE FROM DUAL;

PROMPT
PAUSE Tapez sur Enter...
PROMPT


PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT
PROMPT **********************************************************
PROMPT *                                                        *
PROMPT *                   FICHE E                              *
PROMPT *                                                        *
PROMPT **********************************************************


PROMPT ******* 1. Les contraintes d integralites referentielles ********
PROMPT 
PROMPT

REM Pour l application "ecole", les contraintes d integralites
REM referentielles sont celles traduites par les cles etrangeres.

PROMPT ***************************** Exemple ***************************
PROMPT

--ALTER TABLE resultats
--    ADD CONSTRAINT FK_resultats_cours foreign key (num_cours)
--      references cours (num_cours);


PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *********** 2. Les contraintes rattachees a une table ***********
PROMPT

--ALTER TABLE nom_table
--      ADD CONSTRAINT nom_contrainte CHECK (regle_logique);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

REM ********************************************************************
REM Plage de valeurs (intervalle de valeurs):
REM ********************************************************************


REM ALTER TABLE nom_table
REM      ADD CONSTRAINT nom_contrainte CHECK (attribut BETWEEN v1 and v2);


REM ********************************************************************
REM Liste de valeurs:
REM ********************************************************************

REM ALTER TABLE nom_table
REM      ADD CONSTRAINT nom_contrainte CHECK (attribut in (v1, v2, ...,vn));

REM ********************************************************************
REM Contrainte horizontale (dans une meme tale):
REM ********************************************************************

REM ALTER TABLE nom_table
REM      ADD CONSTRAINT nom_contrainte CHECK (attribut1 operateur attribut2);

REM ********************************************************************
REM Contrainte verticale (dans une autre table):
REM ********************************************************************

REM ALTER TABLE nom_table
REM      ADD CONSTRAINT nom_contrainte 
REM          CHECK (attribut1 operateur requete_dans_une_autre_table); 
REM impossible!!!!
REM Cetype de contrainte necessite un declencheur (trigger)

PROMPT *****************************************************************
PROMPT
PROMPT Le type de contrainte, ci-dessous, n est pas admis dans Oracle!!!
PROMPT
PROMPT *****************************************************************
PROMPT

ALTER TABLE professeurs
      ADD CONSTRAINT dep_moy CHECK(
      salaire_actuel < 2* (SELECT  AVG(salaire_actuel)
                  FROM    professeurs
                  group by specialite
                  having  upper(specialite) = 'SQL')
                  );

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ******************************************************************
PROMPT
PROMPT Plages de valeurs:
PROMPT La note d un etudiant doit etre comprise entre 0 et 20
PROMPT
PROMPT ******************************************************************
PROMPT

ALTER TABLE resultats 
      ADD CONSTRAINT ck_resultats_points CHECK (points BETWEEN 0 and 20);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ******************************************************************
PROMPT
PROMPT Liste de valeur:
PROMPT Le sexe d un etudiant doit etre dans la liste suivante:
PROMPT 'm', 'M', 'f', 'F' ou  Null
PROMPT
PROMPT ******************************************************************
PROMPT
ALTER TABLE ELEVES
ADD (
    SEXE    varchar2(1)
);

ALTER TABLE  eleves
      ADD CONSTRAINT ck_sexe CHECK ( sexe in('m', 'M', 'f', 'F', Null));

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ******************************************************************
PROMPT
PROMPT Contrainte horizontale
PROMPT Le salaire de base doit etre inferieur au salaire actuel
PROMPT
PROMPT ******************************************************************
PROMPT

ALTER TABLE professeurs
      ADD CONSTRAINT ck_niveau_salaire CHECK (salaire_base <= salaire_actuel);

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *******************************************************************
PROMPT
PROMPT Contrainte verticale
PROMPT Le salaire d un professeur ne doit pas depasser le double de la 
PROMPT moyenne des salaires des enseignants de la meme specialite.
PROMPT
PROMPT *******************************************************************
PROMPT

ALTER TABLE professeurs
      ADD CONSTRAINT ck_dep_moy CHECK(
      salaire_actuel < 2* ( SELECT  AVG (salaire_actuel) as moy
                FROM    professeurs
                group by specialite;

PROMPT
PROMPT Remarque: Cette contrainte ne fonctionnera pas sans d�clencheur.
PROMPT
                
create or replace trigger dep_moy_prof
    before update of salaire_actuel on professeurs
    
    for each row
    when ((new.salaire_actuel > old.salaire_actuel) 
    and (old.specialite = new.specialite))
    
    declare
        salaire_moy exception;
    
    begin
        if (new.salaire_actuel != (2*AVG(salaire_actuel))) then
            raise salaire_moy;
        end if;
    exception
    when salaire_moy then
        raise_application_error (-20001, 'Le salaire est superieur au double de la moyenne!');
    end;
/
    
PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *************** 3. Les declencheurs (Triggers) ********************
PROMPT

PROMPT *******************************************************************
PROMPT
PROMPT Le salaire d un professeur ne peut pas diminuer
PROMPT
PROMPT *******************************************************************
PROMPT

create or replace trigger maj_salaire_professeur
    before update of salaire_actuel on professeurs

    for each row
    when (old.salaire_actuel >new.salaire_actuel)

    declare
        salaire_diminue exception;
    
    begin
        raise salaire_diminue;
    exception
    when salaire_diminue then
        raise_application_error (-20001, 'Le salaire ne peut diminuer !!!');
    end;
/


PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *******************************************************************
PROMPT
PROMPT Gestion automatique de la redondance (calculs statistiques)
PROMPT
PROMPT *******************************************************************
PROMPT

PROMPT ************** Creation de la table prof_specialite ***************
PROMPT
DROP TABLE prof_specialite;

create table prof_specialite
(
    specialite    varchar2(20),
    nb_professeurs    NUMBER
);

PROMPT ******    Creation d un trigger permettant de remplir et    ******
PROMPT ******    mettre � jour automatiquement cette table suite    ******
PROMPT ******    � chaque operation de MAJ (insertion, suppression, ******
PROMPT ******    modification) sur la table des professeurs      ******
PROMPT

CREATE OR REPLACE TRIGGER MAJ_NB_PROF
    AFTER INSERT OR DELETE OR UPDATE OF SPECIALITE ON PROFESSEURS

FOR EACH ROW 
BEGIN 
    IF    (inserting) THEN
            UPDATE PROF_SPECIALITE SET NB_PROFESSEURS =     NB_PROFESSEURS + 1
            WHERE  SPECIALITE  = :NEW.SPECIALITE;
    ELSIF (deleting)  THEN
        UPDATE PROF_SPECIALITE SET NB_PROFESSEURS = NB_PROFESSEURS - 1
            WHERE  SPECIALITE  = :OLD.SPECIALITE;
    ELSIF (updating)  THEN  
        UPDATE PROF_SPECIALITE SET NB_PROFESSEURS = NB_PROFESSEURS - 1
              WHERE  SPECIALITE  = :OLD.SPECIALITE; 
        UPDATE PROF_SPECIALITE SET NB_PROFESSEURS = NB_PROFESSEURS + 1
              WHERE  SPECIALITE  = :NEW.SPECIALITE;
    END IF;
END;
/


PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT ******************** Pour la specialite 'SQL' *********************
PROMPT
PROMPT Inserez une specialite dans la table prof_specialite:
PROMPT

insert into prof_specialite (specialite) values ('sql');

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Initialisez le nombre de professeurs tenant en compte des
PROMPT donnees creees avant l existance du trigger:
PROMPT

update prof_specialite
set nb_professeurs = (  SELECT count (*) 
            FROM  professeurs
            WHERE  upper(professeurs.specialite)    = 'SQL')
            WHERE  upper(prof_specialite.specialite) = 'SQL';

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Consultation du nombre de professeurs pour la specialite 'SQL':
PROMPT

SELECT *
FROM  prof_specialite;

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Inserez un nouveau professeur
PROMPT

insert into professeurs
values (9, 'BOUFARE', 'SQL', SYSDATE, SYSDATE, 2000000, 2000000);

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Verifiez de la MAJ du trigger
PROMPT Consulter le nombre de professeurs pour la specialite 'SQL':
PROMPT

SELECT *
FROM  prof_specialite;

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Remarque: il insert le professeur dans la table professeurs 
PROMPT          mais lorsque l on demande l affichage de la table
PROMPT          prof_specialite , il ne  comptabilise pas l ajout
PROMPT

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT ******************** Pour la specialite 'POO' *********************
PROMPT
PROMPT Inserez une specialite dans la table prof_specialite
PROMPT

insert into prof_specialite (specialite) values ('poo');

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Initialisez du nombre de professeurs tenant en compte des
PROMPT donnees creees avant l existance du trigger
PROMPT

update prof_specialite
set nb_professeurs = (  SELECT count (*) 
            FROM  professeurs
            WHERE  upper(professeurs.specialite)    = 'POO')
            WHERE  upper(prof_specialite.specialite) = 'POO';

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Consultez le nombre de professeurs pour la specialite 'POO'
PROMPT

SELECT *
FROM  prof_specialite;

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Inserez d un nouveau professeur
PROMPT

insert into professeurs
values (10, 'BOUFARE', 'POO', SYSDATE, SYSDATE, 2000000, 2000000);

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Verifiez de la MAJ du trigger
PROMPT Consultez le nombre de professeurs pour la specialite 'POO'
PROMPT

SELECT *
FROM  prof_specialite;

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Remarque: il insert le professeur dans la table professeurs 
PROMPT          mais lorsque l on demande l affichage de la table
PROMPT          prof_specialite , il ne  comptabilise pas l ajout
PROMPT

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT ******************** Pour la specialite 'poesie' *********************
PROMPT
PROMPT Inserez d une specialite dans la table prof_specialite
PROMPT

insert into prof_specialite (specialite) values ('poesie');

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Initialisez du nombre de professeurs tenant en compte des
PROMPT donnees creees avant l existance du trigger
PROMPT

update prof_specialite
set nb_professeurs = (  SELECT count (*) 
            FROM  professeurs
            WHERE  upper(professeurs.specialite)    = 'POESIE')
            WHERE  upper(prof_specialite.specialite) = 'POESIE';
            
    
            
PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Consultez le nombre de professeurs pour la specialite 'poesie'
PROMPT

SELECT *
FROM  prof_specialite;

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Inserez un nouveau professeur
PROMPT

insert into professeurs
values (11, 'BOUFARE', 'poesie', SYSDATE, SYSDATE, 2000000, 2000000);

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Verifiez de la MAJ du trigger
PROMPT Consultez le nombre de professeurs pour la specialite 'poesie'
PROMPT

SELECT *
FROM  prof_specialite;

PROMPT
PROMPT Remarque: Lorsque nous n avons pas de professeurs pour la sp�cialit� 
PROMPT en question et puis on insert un professeur dans cette specialit� alors
PROMPT l� nous obtenons une affectation dans la table professeurs.


PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT ******************** Pour la specialite 'reseau' *********************
PROMPT
PROMPT Inserez une specialite dans la table prof_specialite
PROMPT

insert into prof_specialite (specialite) values ('reseau');

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Initialisez le nombre de professeurs tenant en compte des
PROMPT donnees creees avant l existance du trigger
PROMPT

update prof_specialite
set nb_professeurs = (  SELECT count (*) 
            FROM  professeurs
            WHERE  upper(professeurs.specialite)    = 'RESEAU')
            WHERE  upper(prof_specialite.specialite) = 'RESEAU';

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Consultez le nombre de professeurs pour la specialite 'reseau'
PROMPT

SELECT *
FROM  prof_specialite;

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Inserez un nouveau professeur
PROMPT

insert into professeurs
values (12, 'BOUFARES', 'reseau', SYSDATE, SYSDATE, 2000000, 2000000);

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT Verifiez de la MAJ du trigger
PROMPT Consultez le nombre de professeurs pour la specialite 'reseau'
PROMPT

SELECT *
FROM  prof_specialite;

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT 
PROMPT M�me remarque que pour l option poesie.

PROMPT *******************************************************************
PROMPT
PROMPT Mise a jour en cascade (les contraintes referntielles)
PROMPT
PROMPT *******************************************************************
PROMPT

REM La mise a jour en cascade doit etre declenchee si l on veut:
REM     - supprimer dans une table un tuple reference par d autres tuples
REM      d autres tables; ou
REM    - modifier une cle primaire

create or replace trigger maj_cascade
    before delete or update of num_prof on professeurs

    for each row
    begin
        if updating then
            update charge 
            set    num_prof = :new.num_prof
            WHERE  num_prof = :old.num_prof;
        elsif deleting then
            delete FROM charge
            WHERE  num_prof = :old.num_prof;
        end if;
    end;
/

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

SELECT * FROM charge;

update professeurs
set num_prof = 80
WHERE rowid = ( SELECT rowid
        FROM  professeurs 
        WHERE  num_prof = 8
          );

SELECT * FROM charge;

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT *******************************************************************
PROMPT
PROMPT Securite: enregistrement des acces
PROMPT
PROMPT *******************************************************************
PROMPT

PROMPT ************* Creation de la table audit_resultats ****************
PROMPT
DROP TABLE audit_resultats;

create table audit_resultats
(
    utilisateur    varchar2(50),
    date_maj       date,
    desc_maj       varchar2(20),
    num_eleve      NUMBER(4)    not null,
    num_cours      NUMBER(4)    not null,
    points         NUMBER
);

PROMPT 
PAUSE Tapez sur Enter...
PROMPT

PROMPT ************* Creation du trigger trg_audit_resultats **************
PROMPT

create or replace trigger trg_audit_resultats
    before insert or delete or update on resultats
    for each row
    begin
        if inserting then
            insert into audit_resultats
            values (user, SYSDATE, 'insert', :new.num_eleve,
                :new.num_cours, :new.points);
        elsif deleting then
            insert into audit_resultats
            values (user, SYSDATE, 'delete', :old.num_eleve,
                :old.num_cours, :old.points);    
        elsif updating then
            insert into audit_resultats
            values (user, SYSDATE, 'nouveau', :new.num_eleve,
                :new.num_cours, :new.points);
        insert into audit_resultats
        values (user, SYSDATE, 'ancien', :old.num_eleve,
            :old.num_cours, :old.points);
        end if;
    end;
/

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT *******************************************************************
PROMPT
PROMPT Confidentialite
PROMPT
PROMPT *******************************************************************
PROMPT

PROMPT **** On souhaite que seul l utilisateur 'toto' puisse modifier ****
PROMPT **************** les salaires de plus de 20% **********************
PROMPT

create trigger modif_salaire
    after update of salaire_actuel on professeurs
    for each row
    declare
        modif_interdite exception;
    begin
        if user <> 'toto' 
          and :new.salaire_actuel > :old.salaire_actuel * 1.20 then
            raise modif_interdite;
        end if;
        exception
        when modif_interdite then
            raise_application_error(-20002, 'Modification interdite');
    end;
/

PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ****************************** Test *********************************
PROMPT
update professeurs
set salaire_actuel = 2500000
WHERE num_prof = 9;

PROMPT 
PAUSE Tapez sur Enter...
PROMPT



PROMPT ************************ 4. Les packages ****************************
PROMPT
PROMPT

REM Creation d une fonction fn_moyenne dans le package pck_ecole calculant
REM la moyenne d un etudiant passe en peremetre.

REM Creation d une procedure pr_resultat dans le package pck_ecole
REM permettant d afficher la moyenne de tous les eleves avec les mentions
REM adequates: echec, passable, assez bien, bien, tres bien.

PROMPT *********************************************************************
PROMPT
PROMPT Les packages
PROMPT
PROMPT *********************************************************************
PROMPT

create or replace package pck_ecole as
    procedure pr_resultat;
    function  fn_moyenne(p_num_eleve in NUMBER) return NUMBER;
end pck_ecole;
/

PROMPT
PAUSE Tapez sur Enter...
PROMPT
set serveroutput on

create or replace package body pck_ecole is
    -- creation de la procedure

    procedure pr_resultat is
        moy     NUMBER;
        mention varchar2(10);
        
        begin
            -- n oubliez pas "set serveroutput on" au niveau sqlplus
            DBMS_OUTPUT.Put_Line ('PRENOM              NOM
                          MOYENNE              MENTION');
            for e1 in (SELECT * FROM eleves) loop
                moy := fn_moyenne (e1.num_eleve);
                if moy >= 16 then
                    mention := 'Tres Bien';
                    else if moy >= 14 then
                        mention := 'Bien';
                        else if moy >= 12 then
                            mention := 'Assez Bien';
                            else if moy >= 10 then
                                mention := 'Passable';
                                else mention := 'Echec';
                            end if;
                        end if;
                    end if;
                end if;
                DBMS_OUTPUT.Put_Line(e1.prenom    ||'                '||
                            e1.nom||'              '||
                            TO_CHAR(moy) ||'              '||
                            mention);
            end loop;
        end;

    -- creation de la fonction

    function fn_moyenne (p_num_eleve in NUMBER) return NUMBER as
        moyenne NUMBER;

        begin
            SELECT AVG(points) into moyenne
            FROM  eleves, resultats
            WHERE  eleves.num_eleve = resultats.num_eleve
            and    eleves.num_eleve = p_num_eleve;
            return(moyenne);
        end;
    
    -- fin du package body

end pck_ecole;
/


PROMPT
PAUSE Tapez sur Enter...
PROMPT

PROMPT ******** 5. Modification des cardinalites du schema conceptuel *******
PROMPT
PROMPT
PROMPT **********************************************************************
PROMPT
PROMPT Developpement du bloc PL/SQL permettant de detectuer les anomalies 
PROMPT dans la BD
PROMPT
PROMPT **********************************************************************
PROMPT

PROMPT **** Cardinalit� du couple (Eleves, Activites_pratiquees) sera 1,n ****
PROMPT

PROMPT pour effectuer ces modifications, il faut utiliser des packages
PROMPT

create or replace package card_eleves_activites as
    function  fn_nb_activites_eleves(p_num_eleve in NUMBER) return NUMBER;
    procedure pr_activites_eleves;
end card_eleves_activites;
/

create or replace package body card_eleves_activites is        
    -- procedure permetttant de savoir si un eleve possede bien une activite au minimum
    procedure pr_activites_eleves is
        sum_activites_eleves NUMBER;
        
        begin
            for el in (SELECT * FROM eleves) loop
                sum_activites_eleves := fn_nb_activites_eleves(el.num_eleve);
                if (sum_activites_eleves = 1) then 
                    DBMS_OUTPUT.Put_Line (el.nom||'            '   ||el.prenom ||'          '|| 'l eleve ne possede pas plus d une activite!!!!!!!!!!!!');
                end if;
            end loop;
        end;
    -- function qui calcule le nombre d'activit�s pratiquees par eleves
    function fn_nb_activites_eleves(p_num_eleve in NUMBER) return NUMBER as
        nb_activites NUMBER;
        
        begin
            SELECT count (*) into nb_activites
            FROM  eleves, activites_pratiquees
            WHERE  eleves.num_eleve = activites_pratiquees.num_eleve
            and    eleves.num_eleve = p_num_eleve;
            return (nb_activites);
        end;
end card_eleves_activites;
/

PROMPT ******** Cardinalite du couple (Professeurs, charge) sera 2,5 *********        
PROMPT

create or replace package card_profs_charge as
    procedure pr_profs_charge;
    function  fn_profs_charge (p_num_profs in NUMBER) return NUMBER;
end card_profs_charge;
/

create or replace package body card_profs_charge is
    -- procedure
    procedure pr_profs_charge is
        nb_prof_charge NUMBER;
        
        begin
            for profs in (SELECT * FROM professeurs) loop
                nb_prof_charge := fn_profs_charge (profs.num_prof);
                if (nb_prof_charge <2 and nb_prof_charge >5) then
                    DBMS_OUTPUT.Put_Line 
					(profs.nom|| '              '|| 'le professeur ne rentre pas dans la cardinalite demand�e.');
                end if;
            end loop;
        end;
    -- function
    function fn_profs_charge (p_num_profs in NUMBER) return NUMBER as
        nb_charge NUMBER;
        
        begin
            SELECT count (*) into nb_charge
            FROM  professeurs, charge
            WHERE  professeurs.num_prof = charge.num_prof
            and    professeurs.num_prof = p_num_profs;
            return (nb_charge);
        end;
end card_profs_charge;
/
    

