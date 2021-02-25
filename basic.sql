/*보고 싶은 데이터 꺼내오기*/
SELECT CustomerName, Address FROM Customers LIMIT 10;
--비교 연산자와 논리연산자
SELECT * 
FROM Customers
WHERE CustomerName < "B" AND Country = 'Germany'
;
--like와 wildcard % : 패턴을 가지고 데이터를 찾고 싶을 때에 ! 단, 찾고 싶은 키워드가 명확한 경우 like 보다 = 가 훨씬 빠르다
SELECT * 
FROM Customers
WHERE country LIKE '%rm%'
;
--IN
SELECT * 
FROM Customers
WHERE country IN ('Germany', 'France')
;
--BETWEEN
SELECT * 
FROM Customers
WHERE CustomerID BETWEEN 3 and 10
;
--IS NULL
SELECT * 
FROM Customers
WHERE CustomerID IS NULL
;
--like와 한글자 와일드카드 _ : 찾고 싶은 문자의 개수를 알고 있을때에
SELECT * 
FROM Customers
WHERE country LIKE 'B_____'
;
--like 심화 - 두자리 수의 퍼센트 할인을 받는 경우를 찾고 싶을때에
SELECT *
FROM Customers
WHERE discount LIKE '__\%'

--ORDER BY - DESC : descending , ASC: ascending
SELECT * 
FROM Customers
WHERE country LIKE 'G%'
ORDER BY customerid DESC
;

--상위 몇 개만 보고 싶을 때에는 LIMIT 를 이용
SELECT *
FROM Products
WHERE price >= 20
ORDER BY price DESC
LIMIT 2
;

--중복방지
SELECT DISTINCT 

--문자열 자르기 & 두가지 기준으로 정렬
SELECT name FROM students
WHERE marks > 75
ORDER BY RIGHT(name,3) ASC, id ASC

/* 문자열 자르는 함수
LEFT(string, length)
RIGHT(string, length)
SUBSTR(string, start_position, length)
*/

--반올림
SELECT ROUND(long_w,4) FROM station
WHERE lat_n < 137.2345
ORDER BY lat_n DESC
LIMIT 1;

/*
CEIL() 올림
FLOOR() 내림
ROUND(원래수, n) 소수 n째 자리까지 보이도록 반올림
*/