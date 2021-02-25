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