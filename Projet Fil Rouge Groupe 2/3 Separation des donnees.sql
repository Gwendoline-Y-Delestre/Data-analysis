INSERT INTO Victime_de_la_fraude (ssn, cc_num, first_name, last_name, gender, job, dob, acct_num)
SELECT DISTINCT ssn, cc_num, first_name, last_name, gender, job, dob, acct_num 
FROM Temp_CSV;

INSERT INTO Localisation (city, us_state, zip, city_pop)
SELECT DISTINCT city, state, zip, city_pop
FROM Temp_CSV;

INSERT INTO Temps (trans_date, trans_time, unix_time)
SELECT DISTINCT trans_date, trans_time, unix_time
FROM Temp_CSV;

INSERT INTO Marchand (merchant, category)
SELECT DISTINCT merchant, category
FROM Temp_CSV;


INSERT INTO Transactions (trans_num, amount, is_fraud, id_victime, id_localisation, id_temps, id_merchant)
SELECT 
    t.trans_num,
    t.amt,
    t.is_fraud,
    v.id_victime,
    l.id_localisation,
    tp.id_temps,
    m.id_merchant
FROM Temp_CSV t
JOIN Victime_de_la_fraude v ON t.ssn = v.ssn AND t.cc_num = v.cc_num
JOIN Localisation l ON t.city = l.city AND t.state = l.us_state AND t.zip = l.zip
JOIN Temps tp ON t.trans_date = tp.trans_date AND t.trans_time = tp.trans_time AND t.unix_time = tp.unix_time
JOIN Marchand m ON t.merchant = m.merchant AND t.category = m.category;
