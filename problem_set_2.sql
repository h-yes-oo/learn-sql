/*1*/
SELECT SUM(POPULATION)
FROM CITY
GROUP BY COUNTRYCODE
HAVING COUNTRYCODE = 'JPN'
/*2*/
SELECT ROUND(SUM(LAT_N),2) as lat, ROUND(SUM(LONG_W),2) as lon
FROM STATION
/*3*/
SELECT ROUND(ABS(MIN(LAT_N)-MAX(LAT_N))+ABS(MIN(LONG_W)-MAX(LONG_W)),4)
FROM STATION;
/*4*/
SELECT C.company_code, 
        C.founder, 
        Count(DISTINCT LM.lead_manager_code), 
        Count(DISTINCT SM.senior_manager_code), 
        Count(DISTINCT M.manager_code), 
        Count(DISTINCT E.employee_code)
FROM Company AS C
    LEFT JOIN Lead_Manager AS LM ON C.company_code = LM.company_code
    LEFT JOIN Senior_Manager AS SM ON LM.lead_manager_code = SM.lead_manager_code
    LEFT JOIN Manager AS M ON SM.senior_manager_code = M.senior_manager_code
    LEFT JOIN Employee AS E ON M.manager_code = E.manager_code
GROUP BY C.company_code, C.founder
ORDER BY C.company_code ASC