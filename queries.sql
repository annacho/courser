# query 1
SELECT * from subjects 
WHERE subjects_name like ‘Computer%’;
# result: 
-- Computer Science
-- Computer Engineering

# query 2
SELECT * from subjects 
WHERE subjects_name like ‘%Science’;
# result: 
-- Computer Science
-- Political Science
-- Biological Science

# query 3
SELECT * FROM courses 
INNER JOIN professors ON courses.professor_id = professors.id 
WHERE professors.name = "James Allison"
# result: 
-- 1, 

# query 4
SELECT * FROM courses
INNER JOIN professors ON courses.professor_id = professors.id
INNER JOIN subjects ON professors.subject_id = subjects.id 
WHERE subjects.courses_offered > 50
ORDER BY subjects.courses_offered DESC

# query 5
SELECT * FROM courses
INNER JOIN professors ON courses.professor_id = professors.id
INNER JOIN subjects ON professors.subject_id = subjects.id 
WHERE subjects.courses_offered > 50
ORDER BY subjects.courses_offered DESC
GROUP BY professor_id