-- Create a table as following

CREATE TABLE stu_info(
stu_id SMALLINT AUTO_INCREMENT PRIMARY KEY,
stu_name VARCHAR(40) NOT NULL,
birthplace VARCHAR(40) NOT NULL,
totalscore TINYINT NOT NULL DEFAULT 0,
major VARCHAR(40) NOT NULL,
sex CHAR(1) NOT NULL
);

-- Insert several information

INSERT INTO stu_info VALUES
(001, 'alex', 'guangzhou', 50, 'CST', 'M'),
(002, 'bill', 'dongguan', 50, 'CST', 'F'),
(003, 'cici', 'beijing', 50, 'CST', 'F'),
(004, 'dan', 'shanghai', 50, 'CST', 'M'),
(005, 'ellen', 'tianjin', 50, 'CST', 'M'),
(006, 'frank', 'guangzhou', 50, 'CST', 'M'),
(007, 'gigi', 'shanghai', 50, 'CST', 'F'),
(008, 'harry', 'luoyang', 50, 'CST', 'M'),
(009, 'ian', 'beijing', 50, 'CST', 'M'),
(010, 'jerry', 'xiamen', 50, 'CST', 'F');


-- Add a reference table for some attributes

  -- Create a new table birth_place as a reference index of birthplace 

  CREATE TABLE birth_place(
  birthplace_id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  birthplace VARCHAR(40) NOT NULL,
  );

  INSERT birth_place(birthplace)
  SELECT DISTINCT birthplace
  FROM stu_info;
  
  UPDATE stu_info INNER JOIN birth_place 
  ON birth_place.birthplace = stu_info.birthplace 
  SET stu_info.birthplace = birth_place.birthplace_id;

  -- Create a new table major as a reference index of major

  CREATE TABLE major(
  major_id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  major VARCHAR(40) NOT NULL,
  );

  INSERT major(major)
  SELECT DISTINCT major
  FROM stu_info;
  
  UPDATE stu_info INNER JOIN major
  ON major.major = stu_info.major
  SET stu_info.major = major.major_id;

-- Practice inner join/outer join

-- Practice how to join with multiple tables
