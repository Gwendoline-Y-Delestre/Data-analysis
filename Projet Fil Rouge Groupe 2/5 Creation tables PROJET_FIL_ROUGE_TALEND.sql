/*drop table Transactions
drop table Victimes
drop table Locations
drop table Temps
drop table Marchands*/

/*------------------------------------------------------------
-- Table: Victime_de_la_fraude
------------------------------------------------------------*/
CREATE TABLE Victimes (
    id_victim       INT IDENTITY(1,1) PRIMARY KEY,
	victime			VARCHAR(50),
    ssn             VARCHAR(50),
    cc_num          VARCHAR(50),
    first_name      VARCHAR(50),
    last_name       VARCHAR(50),
    gender          VARCHAR(50),
    job             VARCHAR(50),
    dob             DATE,
    acct_num        VARCHAR(50)
);

/*------------------------------------------------------------
-- Table: Localisation
------------------------------------------------------------*/
CREATE TABLE Locations (
    id_location     INT IDENTITY(1,1) PRIMARY KEY,
    country         VARCHAR(50),
    city            VARCHAR(50),
    us_state        VARCHAR(50),
    zip             INT,
    city_pop        INT
);

/*------------------------------------------------------------
-- Table: Temps
------------------------------------------------------------*/
CREATE TABLE Temps (
    id_time    INT IDENTITY(1,1) PRIMARY KEY,
    trans_date   DATE NOT NULL,
    trans_time   TIME NOT NULL,
    unix_time    INT
);

/*------------------------------------------------------------
-- Table: Marchand
------------------------------------------------------------*/
CREATE TABLE Marchands (
    id_marchand          INT IDENTITY(1,1) PRIMARY KEY,
	id_marchand_null	 VARCHAR(50),
    merchant             VARCHAR(50),
    category             VARCHAR(50),
    merchant_country     VARCHAR(50)
);

/*------------------------------------------------------------
-- Table: Transactions
------------------------------------------------------------*/
CREATE TABLE Transactions (
    trans_num        VARCHAR(50) PRIMARY KEY,
    amount           DECIMAL(10,2) NOT NULL, 
    is_fraud         BIT NOT NULL,
    id_victim        INT,
    id_location      INT,
    id_time          INT,
    id_marchand      INT,
    trans_type       VARCHAR(50),
    FOREIGN KEY (id_victim) REFERENCES Victimes(id_victim),
    FOREIGN KEY (id_location) REFERENCES Locations(id_location),
    FOREIGN KEY (id_time) REFERENCES Temps(id_time),
    FOREIGN KEY (id_marchand) REFERENCES Marchands(id_marchand)
);