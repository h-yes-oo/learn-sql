--개수 세기
SELECT COUNT(Price) FROM Products
--DISTINCT 키워드 이용하여 개수 세기 (중복된 것 제외하고 유니크한 것들만 세기)
SELECT COUNT(DISTINCT SupplierID) FROM Products
--총합 SUM
SELECT SUM(Price) FROM Products
--평균 : NULL인 값은 데이터 개수로도 치지 않음
SELECT AVG(Price) FROM Products
--평균 : NULL인 값을 0으로 처리하고 싶다면 ??! 
SELECT SUM(Price)/COUNT(*) FROM Products
--최소 최대값
SELECT MIN(Price), MAX(Price) FROM Products
--GROUP BY 그룹을 지어서 요약값을 확인하고 싶은 경우
SELECT SupplierID, AVG(Price) 
FROM Products
GROUP BY SupplierID
--GROUP BY 에서 원하는 조건의 요약값만 확인하고 싶다면
SELECT SupplierID
     , Categoryid
     , AVG(Price) AS avg_price
FROM Products
GROUP BY SupplierID, Categoryid
HAVING avg_price > 20
--case when else end as
SELECT CASE
			WHEN categoryid = 1 AND SupplierID = 1 THEN '음료'
            WHEN categoryid = 2 THEN '조미료'
            ELSE '기타'
      END AS 'categoryName', *
FROM Products
--새로운 카테고리별 평균 가격 GROUP BY -> 카테고리별 평균 가격을 하나의 column에서 row 별로 보여줄 때
SELECT CASE 
			WHEN categoryid = 1 THEN '음료'
            WHEN categoryid = 2 THEN '조미료'
            ELSE '기타'
      END AS new_category
      , AVG(Price)
FROM Products
GROUP BY new_category
--CASE를 활용한 테이블 피봇 -> 카테고리별 평균 가격을 각각의 column으로 보여줄 때
SELECT AVG(
		CASE 
			WHEN categoryid = 1 THEN price 
            ELSE NULL
       END) AS categoryid1_price,
       AVG(CASE WHEN categoryid = 2 THEN price ELSE NULL END) AS categoryid2_price,
       AVG(CASE WHEN categoryid = 3 THEN price ELSE NULL END) AS categoryid3_price
FROM products
--INNER JOIN ON
SELECT * 
FROM Orders
	INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
    INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID

--LEFT JOIN ON : 한번도 주문한 적이 없는 고객들도 출력
SELECT * 
FROM Customers
	LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
-- 한번도 주문한 적 없는 고객들만 출력한다면 ??
SELECT * 
FROM Customers
	LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE orderID IS NULL
--날짜 더하고 빼기
SELECT DATE_SUB(NOW(), INTERVAL 1 SECOND)
SELECT DATE_ADD(NOW(), INTERVAL 2 DAY)