--1 캘리포니아의 도시들의 인구 평균 구하기
SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California'
--2 캘리포니아의 도시들의 총 인구수 구하기
SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California'
--3 인구가 100,000이 넘는 도시의 수 구하기
SELECT COUNT(*)
FROM CITY
WHERE POPULATION > 100000
--4 모든 도시의 인구 평균을 정수로 내림하기
SELECT FLOOR(AVG(POPULATION))
FROM CITY
--5 모든 도시의 최대 인구와 최소 인구의 차이 구하기
SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY
--6 모든 도시의 수와 유니크한 도시의 수의 차이 구하기
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION
/* 7 : AS로 새로운 칼럼 만들기 !!
1. salary * month = earnings
2. 몇 명이 그만큼 벌었는지 계산하기
3. earnings 중 가장 큰 값 가져온다
*/
SELECT salary*months AS earnings, COUNT(*)
FROM Employee
GROUP BY earnings
ORDER BY earnings DESC
LIMIT 1
;