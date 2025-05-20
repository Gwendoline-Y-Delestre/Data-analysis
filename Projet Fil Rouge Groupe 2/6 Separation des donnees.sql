-- Insérer les victimes 
INSERT INTO Victimes (victime, ssn, cc_num, first_name, last_name, gender, job, dob, acct_num)
SELECT DISTINCT t.id_victime, t.ssn, t.cc_num, t.first_name, t.last_name, t.gender, t.job, t.dob, t.acct_num 
FROM Temp_BDD t; --30437

-- Insérer les localisations 
INSERT INTO Locations (country, city, us_state, zip, city_pop)
SELECT DISTINCT country, city, us_state, zip, city_pop
FROM Temp_BDD; --943

-- Insérer les informations temporelles 
INSERT INTO Temps (trans_date, trans_time, unix_time)
SELECT DISTINCT trans_date, trans_time, unix_time
FROM Temp_BDD; --2939340

-- Insérer les marchands
INSERT INTO Marchands (id_marchand_null, merchant, category, merchant_country)
SELECT DISTINCT
    CASE 
        WHEN id_merchant IS NULL THEN 'UNKNOWN' 
        ELSE id_merchant 
    END AS id_marchand,
    merchant,
    category,
    merchant_country
FROM Temp_BDD; -- 187904

select count(*) from Temp_BDD -- 3344959

select count(*) from Temp_BDD where id_merchant = 'UNKNOWN' -- 133999

-- insertion transation 
WITH RankedTransactions AS (
    SELECT 
        t.trans_num, 
        t.amount, 
        t.is_fraud, 
        v.id_victim, 
        l.id_location, 
        tp.id_time, 
        m.id_marchand, 
        t.trans_type,
        ROW_NUMBER() OVER (PARTITION BY t.trans_num ORDER BY tp.id_time) AS row_num
    FROM Temp_BDD t
    JOIN Victimes v ON t.id_victime = v.victime
    JOIN Locations l ON t.city = l.city AND t.us_state = l.us_state AND t.country = l.country 
    JOIN Temps tp 
    ON t.trans_date = tp.trans_date 
    AND t.trans_time = tp.trans_time 
    AND (t.unix_time = tp.unix_time OR (t.unix_time IS NULL AND tp.unix_time IS NULL))
    LEFT JOIN Marchands m ON t.merchant = m.merchant AND t.category = m.category
)
INSERT INTO Transactions (trans_num, amount, is_fraud, id_victim, id_location, id_time, id_marchand, trans_type)
SELECT trans_num, amount, is_fraud, id_victim, id_location, id_time, id_marchand, trans_type
FROM RankedTransactions
WHERE row_num = 1; -- On garde seulement la première ligne pour chaque transaction 

-- Verification que tout est bien lié comme il faut 
select * from Temp_BDD where trans_num = '0000000a6674531f4f2ce29891e4ecb0'

select * from Victimes v join Transactions t on v.id_victim = t.id_victim
join Temps tp on tp.id_time= t.id_time
left join Marchands m on t.id_marchand = m.id_marchand
left join Locations l on l.id_location = t.id_location
where trans_num = '0000000a6674531f4f2ce29891e4ecb0'

select * from Temp_BDD where trans_num = '000009b841d4844a4d752dd769ad8784'

select * from Victimes v join Transactions t on v.id_victim = t.id_victim
join Temps tp on tp.id_time = t.id_time
left join Marchands m on t.id_marchand = m.id_marchand
left join Locations l on l.id_location = t.id_location
where trans_num = '000009b841d4844a4d752dd769ad8784'


