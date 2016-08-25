# Tutorial 8: Using Null

# Question 1

SELECT name FROM teacher
 WHERE dept IS NULL;

# Question 2

SELECT teacher.name, dept.name
  FROM teacher INNER JOIN dept
    ON (teacher.dept = dept.id);

# Question 3

SELECT teacher.name, dept.name
  FROM teacher LEFT JOIN dept
    ON (teacher.dept = dept.id);

# Question 4

SELECT teacher.name, dept.name
  FROM teacher RIGHT JOIN dept
    ON (teacher.dept = dept.id);

# Question 5

SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher;

# Question 6

SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept ON teacher.dept = dept.id;

# Question 7

SELECT COUNT(name), COUNT(mobile) FROM teacher;

# Question 8

SELECT dept.name, COUNT(teacher.name)
FROM teacher RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;

# Question 9

SELECT name, CASE WHEN dept IN (1, 2) THEN 'Sci'
                  ELSE 'Art' END FROM teacher;

# Question 10

SELECT name, CASE WHEN dept IN (1, 2) THEN 'Sci'
                  WHEN dept = 3 THEN 'Art'
                  ELSE 'None' END FROM teacher;

# Quiz

1. E C E B A
6. A

# Tutorial 8+: Numeric Examples

# Question 1

SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question = 'Q01'
   AND institution = 'Edinburgh Napier University'
   AND subject = '(8) Computer Science';

# Question 2

SELECT institution, subject
  FROM nss
 WHERE question = 'Q15'
   AND score >= 100;

# Question 3

SELECT institution, score
  FROM nss
 WHERE question = 'Q15'
   AND subject = '(8) Computer Science'
   AND score < 50;

# Question 4

SELECT subject, SUM(response)
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(8) Computer Science',
                   '(H) Creative Arts and Design')
GROUP BY subject;

# Question 5

SELECT subject, SUM(response * A_STRONGLY_AGREE / 100)
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(8) Computer Science',
                   '(H) Creative Arts and Design')
GROUP BY subject;

# Question 6

SELECT subject, ROUND(SUM(response * A_STRONGLY_AGREE) / SUM(response), 0)
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(8) Computer Science',
                   '(H) Creative Arts and Design')
GROUP BY subject;

# Question 7

SELECT institution, ROUND(SUM(response * score) / SUM(response), 0)
  FROM nss
 WHERE question='Q22'
   AND institution LIKE '%Manchester%'
GROUP BY institution;

# Question 8

SELECT institution,SUM(sample),
  SUM(CASE WHEN subject = '(8) Computer Science' THEN sample
       ELSE 0 END) AS comp
  FROM nss
 WHERE question='Q01'
   AND institution LIKE '%Manchester%'
GROUP BY institution;