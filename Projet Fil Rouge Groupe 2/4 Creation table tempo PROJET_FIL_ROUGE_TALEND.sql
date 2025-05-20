create database PROJET_FIL_ROUGE_TALEND;
use PROJET_FIL_ROUGE_TALEND;

-- si probleme pour inserer avec talend en utilisant bulk
-- GRANT ADMINISTER BULK OPERATIONS TO [nom_utilisateur];

-- table temporaire 
CREATE TABLE Temp_BDD (
	trans_num VARCHAR(50),
	amount DECIMAL(10,2),
	is_fraud INTEGER,
	id_victime VARCHAR(50),
	ssn VARCHAR(50),
    cc_num varchar(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(50),
	job VARCHAR(50),
	dob DATE,
	acct_num varchar(50),
	id_localisation VARCHAR(50),
    city VARCHAR(50),
    us_state VARCHAR(50),
	country VARCHAR(50),
    zip INT,
    city_pop INT,
	id_temps VARCHAR(50),    
    trans_date DATE,
    trans_time TIME,
    unix_time INT,
	id_merchant VARCHAR(50),
	merchant VARCHAR(50),
    category VARCHAR(50),
	merchant_country VARCHAR(50),
    trans_type VARCHAR(50),
);

-- select TOP(5) * from Temp_BDD
-- drop table Temp_BDD
-- select COUNT(trans_num) from Temp_BDD -- 3344959



