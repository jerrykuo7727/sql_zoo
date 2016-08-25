# Tutorial 7: More JOIN operations

# Question 1

SELECT id, title FROM movie
 WHERE yr = 1962;

# Question 2

SELECT yr FROM movie
 WHERE title = 'Citizen Kane';

# Question 3

SELECT id, title, yr FROM movie
 WHERE title LIKE '%Star Trek%'
ORDER BY yr;

# Question 4

SELECT title FROM movie
 WHERE id IN (11768, 11955, 21191);

# Question 5

SELECT id FROM actor
 WHERE name = 'Glenn Close';

# Question 6

SELECT id FROM movie
 WHERE title = 'Casablanca';

# Question 7

SELECT name FROM actor
  JOIN casting on id = actorid
 WHERE movieid = 11768;

# Question 8

SELECT actor.name FROM casting
  JOIN movie ON movieid = movie.id
  JOIN actor ON actorid = actor.id
WHERE movie.title = 'Alien';

# Question 9

SELECT movie.title FROM casting
  JOIN movie ON movieid = movie.id
  JOIN actor ON actorid = actor.id
WHERE actor.name = 'Harrison Ford';

# Question 10

SELECT movie.title FROM casting
  JOIN movie ON movieid = movie.id
  JOIN actor ON actorid = actor.id
WHERE actor.name = 'Harrison Ford'
  AND ord != 1;

# Question 11

SELECT title, name FROM casting
  JOIN movie ON movieid = movie.id
  JOIN actor ON actorid = actor.id
WHERE ord = 1 AND yr = 1962;

# Question 12

SELECT yr, COUNT(title) FROM casting
  JOIN movie ON movieid = movie.id
  JOIN actor ON actorid = actor.id
WHERE actor.name = 'John Travolta'
GROUP BY yr HAVING COUNT(title) > 2;

# Question 13

SELECT title, name FROM casting
  JOIN movie ON movieid = movie.id
  JOIN actor ON actorid = actor.id
WHERE movie.id IN (SELECT movieid FROM casting
    JOIN movie ON movieid = movie.id
    JOIN actor ON actorid = actor.id
    WHERE actor.name = 'Julie Andrews')
   AND ord = 1;

# Question 14

SELECT name FROM casting
  JOIN movie ON movieid = movie.id
  JOIN actor ON actorid = actor.id
GROUP BY name
HAVING SUM(CASE WHEN ord = 1 THEN 1 ELSE 0 END) >= 30
ORDER BY name;

# Question 15

SELECT title, COUNT(actorid) FROM casting
  JOIN movie ON movieid = movie.id
WHERE yr = 1978
GROUP BY title
ORDER BY 2 DESC;

# Question 16

SELECT name FROM casting
  JOIN actor on actorid = actor.id
 WHERE movieid IN (SELECT movieid FROM casting
     JOIN actor ON actorid = actor.id
    WHERE name = 'Art Garfunkel')
   AND name != 'Art Garfunkel';

# Quiz

1. C E C B D
6. C B