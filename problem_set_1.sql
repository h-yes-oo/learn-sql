/*1 Big Countries
특정 조건의 row 만 선택할때에는 WHERE을 이용한다
*/
SELECT name, population, area
FROM World
WHERE area > 3000000 OR population > 25000000
/*2 Not Boring Movies
홀수 번호의, 지루하지 않은 영화들을 평점이 높은 순서로 출력
*/
SELECT *
FROM cinema
WHERE MOD(id,2) = 1 AND description <> 'boring'
ORDER BY rating DESC
/*3 Duplicate Emails
중복된 이메일만 출력
연산의 결과물을 출력해줄 필요가 없으니 SELECT에서 지워준다
*/
SELECT Email
FROM Person
GROUP BY EMAIL
HAVING COUNT(*) >= 2
/*4 Combine Two Tables
주소 정보가 없는 Person도 모두 출력
*/
SELECT FirstName, LastName, City, State
FROM Person
    LEFT JOIN Address ON Person.PersonId = Address.PersonId