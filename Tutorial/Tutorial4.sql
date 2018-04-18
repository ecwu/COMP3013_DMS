-- Create a table as following

CREATE TABLE stu_info(
stu_id SMALLINT AUTO_INCREMENT,
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
  birthplace VARCHAR(40) NOT NULL,
  );

  INSERT birth_place(birthplace)
  SELECT DISTINCT birthplace
  FROM stu_info;

  -- Create a new table major as a reference index of major

  CREATE TABLE major(
  major VARCHAR(40) NOT NULL,
  );

  INSERT major(major)
  SELECT DISTINCT major
  FROM stu_info;

-- Practice inner join/outer join

-- Practice how to join with multiple tables
