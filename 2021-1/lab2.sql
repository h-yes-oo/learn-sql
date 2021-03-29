--1
SELECT mov_year
FROM movie
WHERE mov_title = 'American Beauty';

--2
SELECT mov_title
FROM movie
WHERE mov_year >= 2000
ORDER BY mov_title ASC;

--3
SELECT M.mov_title, M.mov_year, G.gen_title, D.dir_fname
FROM movie M
INNER JOIN movie_genres MG ON M.mov_id = MG.mov_id
INNER JOIN genres G ON MG.gen_id = G.gen_id
INNER JOIN movie_direction MD ON M.mov_id = MD.mov_id
INNER JOIN director D ON MD.dir_id = D.dir_id;

--4
SELECT G.gen_title, COUNT(M.mov_id), SUM(M.mov_time)
FROM genres AS G
INNER JOIN movie_genres AS MG ON G.gen_id = MG.gen_id
INNER JOIN movie AS M ON MG.mov_id = M.mov_id
GROUP BY G.gen_title
;

--5
SELECT A.act_fname, A.act_lname, M.mov_title, M.mov_year
FROM movie M
INNER JOIN movie_cast MC ON M.mov_id = MC.mov_id
INNER JOIN actor A ON MC.act_id = A.act_id
WHERE M.mov_year >= 1980 AND M.mov_year < 1990;

--6
SELECT M.mov_title, COUNT(R.rev_id)
FROM movie M
LEFT JOIN rating R ON M.mov_id = R.mov_id
GROUP BY M.mov_title
;
--7
SELECT M.mov_title, M.mov_year, D.dir_fname, D.dir_lname, A.act_fname, A.act_lname, MC.role
FROM movie AS M , 
    (SELECT MIN(mov_time) AS min_time FROM movie) AS S, 
    movie_direction AS MD, 
    director AS D, 
    movie_cast AS MC, 
    actor AS A 
WHERE S.min_time = M.mov_time 
    AND MD.mov_id = M.mov_id 
    AND D.dir_id = MD.dir_id 
    AND MC.mov_id = M.mov_id 
    AND MC.act_id = A.act_id;

--8 wrong answer
SELECT D.dir_fname, D.dir_lname, COUNT(A.act_id)
FROM director D
INNER JOIN movie_direction MD ON D.dir_id = MD.dir_id
INNER JOIN movie M ON MD.mov_id = M.mov_id
INNER JOIN movie_cast MC ON MC.mov_id = M.mov_id
INNER JOIN actor A ON A.act_id = MC.act_id
WHERE A.act_gender = 'F'
GROUP BY D.dir_id;

--8 
SELECT D.dir_fname, D.dir_lname, COUNT(DISTINCT A.act_id)
FROM director D
LEFT JOIN movie_direction MD ON D.dir_id = MD.dir_id
LEFT JOIN movie M ON MD.mov_id = M.mov_id
LEFT JOIN movie_cast MC ON MC.mov_id = M.mov_id
LEFT JOIN (SELECT act_id FROM actor WHERE act_gender = 'F') AS A ON A.act_id = MC.act_id
GROUP BY D.dir_id;