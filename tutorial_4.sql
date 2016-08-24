# Tutorial 4: SELECT within SELECT

# Question 1

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

# Question 2

SELECT name FROM world
 WHERE continent = 'Europe' AND gdp/population >
  (SELECT gdp/population FROM world WHERE name = 'United Kingdom');

# Question 3

SELECT name, continent FROM world
 WHERE continent IN
  (SELECT DISTINCT continent FROM world
    WHERE name IN ('Argentina', 'Australia'))
ORDER BY name;

# Question 4

SELECT name, population FROM world
 WHERE population >
    (SELECT population FROM world
      WHERE name = 'Canada') 
   AND population <
    (SELECT population FROM world
      WHERE name = 'Poland');

# Question 5

SELECT name, CONCAT(ROUND(100 * population /
  (SELECT population FROM world WHERE name = 'Germany')
     , 0), '%') FROM world WHERE continent = 'Europe';

# Question 6

SELECT name FROM world
 WHERE gdp > ALL(SELECT gdp FROM world 
    WHERE continent = 'Europe' AND gdp > 0);

# Question 7

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent = x.continent
          AND area > 0);

# Question 8

SELECT DISTINCT continent,
  (SELECT name FROM world y
    WHERE y.continent = x.continent
   ORDER BY name LIMIT 1)
  FROM world x ORDER BY continent;

# Question 9

SELECT name, continent, population FROM world
 WHERE continent NOT IN (SELECT continent FROM world
    WHERE population > 25000000 GROUP BY continent);

# Question 10

SELECT name, continent FROM world x
 WHERE population > ALL(SELECT population * 3 FROM world y 
    WHERE x.continent = y.continent AND x.name <> y.name);

# Quiz

1. C B A D B
6. B B