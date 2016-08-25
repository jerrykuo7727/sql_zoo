# Tutorial 9: Self join

# Question 1

SELECT COUNT(*) FROM stops;

# Question 2

SELECT id FROM stops
WHERE name = 'Craiglockhart';

# Question 3

SELECT id, name FROM stops
  JOIN route ON id = stop
WHERE num = '4'
  AND company = 'LRT';

# Question 4

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

# Question 5

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company = b.company AND a.num = b.num)
WHERE a.stop = 53 AND b.stop = 149;

# Question 6

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
  AND stopb.name='London Road';

# Question 7

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  a.company=b.company AND a.num=b.num
WHERE a.stop=115 AND b.stop=137;

# Question 8

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
    a.company=b.company AND a.num=b.num
  JOIN stops stopa ON stopa.id=a.stop
  JOIN stops stopb ON stopb.id=b.stop
WHERE stopa.name='Craiglockhart'
  AND stopb.name='Tollcross';

# Question 9

SELECT DISTINCT stopb.name, a.company, a.num
FROM route a JOIN route b ON
    a.company=b.company AND a.num=b.num
  JOIN stops stopa ON stopa.id=a.stop
  JOIN stops stopb ON stopb.id=b.stop
WHERE stopa.name='Craiglockhart';

# Question 10

SELECT DISTINCT a.num, a.company, stopb.name , c.num,  c.company
FROM (route a JOIN route b ON (a.company = b.company AND a.num = b.num))
JOIN (route c JOIN route d ON (c.company = d.company AND c.num = d.num))
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
JOIN stops stopc ON (c.stop = stopc.id)
JOIN stops stopd ON (d.stop = stopd.id)
WHERE stopa.name = 'Craiglockhart'
  AND stopd.name = 'Sighthill'
  AND stopb.name = stopc.name
ORDER BY LENGTH(a.num), b.num, stopb.id, LENGTH(c.num), d.num;

# Quiz

1. C E D