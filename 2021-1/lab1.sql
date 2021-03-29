--4
SELECT DISTINCT S.ID, C.title, C.credits
FROM student AS S
LEFT JOIN takes AS T ON S.ID = T.ID
LEFT JOIN section AS SE ON T.sec_id = SE.sec_id AND T.course_id = SE.course_id AND T.semester = SE.semester AND T.year = SE.year
LEFT JOIN course AS C ON SE.course_id = C.course_id
ORDER BY S.ID ASC, C.title ASC;

--5

--6
SELECT S.ID, C.title, C.credits
FROM student AS S
LEFT JOIN takes AS T ON S.ID = T.ID
LEFT JOIN section AS SE ON T.sec_id = SE.sec_id AND T.course_id = SE.course_id AND T.semester = SE.semester AND T.year = SE.year
LEFT JOIN course AS C ON SE.course_id = C.course_id
ORDER BY S.ID ASC, C.title ASC;

--7
SELECT c1.building, c1.room_number, c1.capacity
FROM classroom AS c1, (SELECT building, MAX(capacity) AS max_cap FROM classroom GROUP BY building) AS c2
ORDER BY c1.building ASC;

--8
SELECT C.ID, C.name
FROM instructor AS C, (SELECT dept_name, MIN(salary) AS min_sal FROM instructor Group By dept_name) AS B
WHERE C.dept_name = 'Comp. Sci.' AND B.dept_name = 'Biology' AND C.salary < B.min_sal
ORDER BY C.ID ASC;

--9
SELECT SUM(budget/12) AS 'ans'
FROM department
WHERE dept_name LIKE '%a%';

--10
SELECT T.grade, COUNT(S.ID) AS 'ans'
FROM student AS S, takes AS T
WHERE S.ID = T.ID AND T.course_id = 'CS-101'
GROUP BY T.grade
ORDER BY T.grade ASC;

--11
SELECT ABS(T.tot_cred - A.tot_cred) AS 'ans'
FROM student AS T, student AS A
WHERE A.name = 'Aoi' AND T.name = 'Tanaka';