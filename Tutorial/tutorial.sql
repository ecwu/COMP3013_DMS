 -- Find the oldest 3 students according to score;

SELECT * FROM users GROUP BY name, score ORDER BY age DESC LIMIT 1, 3;

 -- Create another 'topStu' to store the top 3 students' name and score;

CREATE TABLE topStu (name VARCHAR(20), score TINYINT UNSIGNED);
INSERT topStu(name) SELECT name FROM users WHERE (SELECT * FROM users ORDER BY score DESC LIMIT 1, 3) GROUP BY score;


 -- Search for the average score for students whose name is the same, order by name alphabetically;
