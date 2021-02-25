--1
SELECT * 
FROM city
WHERE population > 100000 AND countrycode = 'USA'

--2
SELECT * FROM city
WHERE id=1661

--3 도시 이름이 모음으로 시작하는 도시만 찾기 + 중복 없이
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'a%' 
OR CITY LIKE 'e%' 
OR CITY LIKE 'i%' 
OR CITY LIKE 'o%' 
OR CITY LIKE 'u%'

--4 모음으로 시작하지도, 끝나지도 않는 도시만 찾기 + 중복 없이
SELECT DISTINCT city
FROM station
WHERE city NOT LIKE 'a%' 
AND CITY NOT LIKE 'e%' 
AND CITY NOT LIKE 'i%' 
AND CITY NOT LIKE 'o%' 
AND CITY NOT LIKE 'u%' 
AND CITY NOT LIKE '%a' 
AND CITY NOT LIKE '%e' 
AND CITY NOT LIKE '%i' 
AND CITY NOT LIKE '%o' 
AND CITY NOT LIKE '%u';

