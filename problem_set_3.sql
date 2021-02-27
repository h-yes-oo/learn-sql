--1
SELECT MAX(POPULATION)-MIN(POPULATION) FROM CITY;
--2 either의 의미 !! 
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) NOT IN ('A','E','I','O','U')
OR RIGHT(CITY,1) NOT IN ('A','E','I','O','U')
--3
SELECT TRUNCATE(SUM(LAT_N),4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;
--4
SELECT H.hacker_id, H.name
FROM Hackers AS H
    INNER JOIN Submissions AS S ON H.hacker_id = S.hacker_id
    INNER JOIN Challenges AS C ON S.challenge_id = C.challenge_id
    INNER JOIN Difficulty AS D ON D.difficulty_level = C.difficulty_level
WHERE S.score = D.score
GROUP BY H.hacker_id, H.name
HAVING COUNT(DISTINCT C.challenge_id) > 1
ORDER BY COUNT(DISTINCT C.challenge_id) DESC, H.hacker_id ASC