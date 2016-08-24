# Tutorial 2: SELECT from WORLD

# Question 1

SELECT name, continent, population FROM world;

# Question 2

SELECT name FROM world
 WHERE population > 200000000;

# Question 3

SELECT name, gdp/population AS 'per capita GDP'
  FROM world WHERE population > 200000000;

# Question 4

SELECT name, population/1000000 AS 'population in millions'
  FROM world WHERE continent = 'South America';

# Question 5

SELECT name, population FROM world
 WHERE name IN ('France', 'Germany', 'Italy');

# Question 6

SELECT name FROM world
 WHERE name LIKE 'United%';

# Question 7

SELECT name, population, area FROM world
 WHERE area > 3000000 OR population > 250000000;

# Question 8

SELECT name, population, area FROM world
 WHERE area > 3000000 XOR population > 250000000;

# Question 9

SELECT name,
  ROUND(population / 1000000, 2) AS 'population in millions',
  ROUND( gdp / 1000000000, 2) AS 'gdp in billions'
FROM world WHERE continent = 'South America';

# Question 10

SELECT name, ROUND(gdp / population, -3) AS 'per-capita gdp'
  FROM world WHERE gdp > 1000000000000;

# Question 11

SELECT name,
  CASE WHEN continent = 'Oceania' THEN 'Australasia'
       ELSE continent END AS 'continent'
  FROM world WHERE name LIKE 'N%';

# Question 12

SELECT name,
  CASE WHEN continent IN ('Europe', 'Asia') THEN 'Eurasia'
       WHEN continent IN ('North America', 'South America', 'Caribbean') THEN 'America'
       ELSE continent END AS 'continent' FROM world
 WHERE name LIKE 'A%' OR name LIKE 'B%';

# Question 13

SELECT name, continent AS 'original continent',
  CASE WHEN continent = 'Oceania' THEN 'Australasia'
       WHEN continent = 'Eurasia' OR name = 'Turkey' THEN 'Europe/Asia'
       WHEN continent = 'Caribbean' AND name LIKE 'B%' THEN 'North America'
       WHEN continent = 'Caribbean' THEN 'South America'
       ELSE continent END AS 'new continent' FROM world
ORDER BY name ASC;

# Quiz

1. E D B D B
6. D C 