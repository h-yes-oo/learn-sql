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
/*8 삼각형의 종류
CASE 절에서는 우선순위가 높은 조건부터 위쪽에 적어준다
*/
SELECT CASE
            WHEN A=B AND B=C THEN 'Equilateral'
            WHEN A >= (B+C) OR B >= (A+C) OR C >= (A+B) THEN 'Not A Triangle'
            WHEN A=B OR B=C OR C=A THEN 'Isosceles'
            ELSE 'Scalene'
        END AS 'type'
FROM TRIANGLES
/*9 row는 부서별, column으로는 월별 수입 합계를 보고 싶을 때에
완전히 맞는 개념은 아니지만, SELECT는 column과, GROUP BY는 row와 연관이 있다고 본다
*/
SELECT id, 
    SUM(CASE WHEN month = "Jan" THEN revenue ELSE Null END) AS "Jan_Revenue",
    SUM(CASE WHEN month = "Feb" THEN revenue ELSE Null END) AS "Feb_Revenue",
    SUM(CASE WHEN month = "Mar" THEN revenue ELSE Null END) AS "Mar_Revenue",
    SUM(CASE WHEN month = "Apr" THEN revenue ELSE Null END) AS "Apr_Revenue",
    SUM(CASE WHEN month = "May" THEN revenue ELSE Null END) AS "May_Revenue",
    SUM(CASE WHEN month = "Jun" THEN revenue ELSE Null END) AS "Jun_Revenue",
    SUM(CASE WHEN month = "Jul" THEN revenue ELSE Null END) AS "Jul_Revenue",
    SUM(CASE WHEN month = "Aug" THEN revenue ELSE Null END) AS "Aug_Revenue",
    SUM(CASE WHEN month = "Sep" THEN revenue ELSE Null END) AS "Sep_Revenue",
    SUM(CASE WHEN month = "Oct" THEN revenue ELSE Null END) AS "Oct_Revenue",
    SUM(CASE WHEN month = "Nov" THEN revenue ELSE Null END) AS "Nov_Revenue",
    SUM(CASE WHEN month = "Dec" THEN revenue ELSE Null END) AS "Dec_Revenue"
FROM Department
GROUP BY id