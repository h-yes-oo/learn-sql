--UPDATE 테이블명 SET 칼럼 = 값
UPDATE Salary SET Salary = Salary + 100;
--특정 행만 UPDATE
UPDATE Salary SET Salary = Salary + 100 WHERE Id=2;
--UPDATE WITH CASE
UPDATE Salary 
SET sex = CASE 
            WHEN sex = 'm' THEN 'f' 
            ELSE 'm' 
        END;
--테이블 전체 DELETE FROM 테이블명
DELETE FROM Salary
--특정 행만 DELETE FROM 테이블명 
DELETE FROM Salary WHERE id=2 
