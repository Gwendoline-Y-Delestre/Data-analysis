use PROJET_FIL_ROUGE

CREATE TABLE Temp_CSV (
    ssn VARCHAR(50),
    cc_num varchar(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    zip INT,
    city_pop INT,
    job VARCHAR(50),
    dob DATE,
    acct_num varchar(50),
    trans_num VARCHAR(50),
    trans_date DATE,
    trans_time TIME,
    unix_time INT,
    category VARCHAR(50),
    amt DECIMAL(10,2),
    is_fraud BIT,
    merchant VARCHAR(50)
);


BULK INSERT Temp_CSV
FROM 'D:\Download\cc_fraud_detection.csv' -- changer le chemin
WITH (
     FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A', 
    TABLOCK
);

select distinct ssn from Temp_CSV;