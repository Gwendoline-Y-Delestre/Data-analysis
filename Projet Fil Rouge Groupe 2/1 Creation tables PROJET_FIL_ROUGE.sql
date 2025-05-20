/*------------------------------------------------------------
-- Table: Victime_de_la_fraude
------------------------------------------------------------*/

CREATE TABLE Victime_de_la_fraude (
    id_victime      INT IDENTITY(1,1) NOT NULL,
    ssn             VARCHAR(50) NOT NULL,
    cc_num          VARCHAR(50) NOT NULL,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    gender          VARCHAR(50) NOT NULL,
    job             VARCHAR(50) NOT NULL,
    dob             DATE NOT NULL,
    acct_num        VARCHAR(50) NOT NULL,
    CONSTRAINT Victime_de_la_fraude_PK PRIMARY KEY (id_victime)
);

/*------------------------------------------------------------
-- Table: Localisation
------------------------------------------------------------*/
CREATE TABLE Localisation (
    id_localisation INT IDENTITY(1,1) NOT NULL,
    city            VARCHAR(50) NOT NULL,
    us_state        VARCHAR(50) NOT NULL,
    zip             INT NOT NULL,
    city_pop        INT NOT NULL,
    CONSTRAINT Localisation_PK PRIMARY KEY (id_localisation)
);

/*------------------------------------------------------------
-- Table: Temps
------------------------------------------------------------*/
CREATE TABLE Temps (
    id_temps     INT IDENTITY(1,1) NOT NULL,
    trans_date   DATE NOT NULL,
    trans_time   TIME NOT NULL,
    unix_time    INT NOT NULL,
    CONSTRAINT Temps_PK PRIMARY KEY (id_temps)
);

/*------------------------------------------------------------
-- Table: Marchand
------------------------------------------------------------*/
CREATE TABLE Marchand (
    id_merchant  INT IDENTITY(1,1) NOT NULL,
    merchant     VARCHAR(50) NOT NULL,
    category     VARCHAR(50) NOT NULL,
    CONSTRAINT Marchand_PK PRIMARY KEY (id_merchant)
);

/*------------------------------------------------------------
-- Table: Transactions
------------------------------------------------------------*/
CREATE TABLE Transactions (
    trans_num        VARCHAR(50) NOT NULL,
    amount           DECIMAL(10,2) NOT NULL, 
    is_fraud         BIT NOT NULL,
    id_victime       INT NOT NULL,
    id_localisation  INT NOT NULL,
    id_temps         INT NOT NULL,
    id_merchant      INT NOT NULL,
    CONSTRAINT Transactions_PK PRIMARY KEY (trans_num),
    CONSTRAINT Transactions_Victime_FK FOREIGN KEY (id_victime) REFERENCES Victime_de_la_fraude(id_victime),
    CONSTRAINT Transactions_Localisation_FK FOREIGN KEY (id_localisation) REFERENCES Localisation(id_localisation),
    CONSTRAINT Transactions_Temps_FK FOREIGN KEY (id_temps) REFERENCES Temps(id_temps),
    CONSTRAINT Transactions_Marchand_FK FOREIGN KEY (id_merchant) REFERENCES Marchand(id_merchant)
);