# SQL problem sets

```
Zhenghao Wu
1630003054
```

```
Relational Schema
Movie (mID, title, year, director) 
Reviewer (rID, name) 
Rating (rID, mID, stars, ratingDate) 
```



1. Find the titles of all movies directed by Steven Spielberg.

```mysql
SELECT DISTINCT title
FROM Movie 
WHERE director = 'Steven Spielberg';
```

2. Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order. 

```mysql
SELECT DISTINCT year
FROM Movie, Rating
WHERE Movie.mID = Rating.mID AND stars = 4 OR stars = 5
ORDER BY year;
```

3. Find the titles of all movies that have no ratings.

```mysql
SELECT DISTINCT title
FROM Movie
WHERE mID NOT IN(
    SELECT mID
    FROM Rating
);
```

4. Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date. 

```mysql
SELECT DISTINCT name
FROM Reviewer, Rating
WHERE Reviewer.rID = Rating.rID AND Rating.ratingDate IS NULL;
```

5. Write a query to return the ratings data in a more readable format: reviewer name, movie title, stars, and ratingDate. Also, sort the data, first by reviewer name, then by movie title, and lastly by number of stars.

```mysql
SELECT name, title, stars, ratingDate
FROM Movie NATURAL JOIN Rating NATURAL JOIN Reviewer
ORDER BY name, title, stars;
```

6. For all cases where the same reviewer rated the same movie twice and gave it a higher rating the second time, return the reviewer's name and the title of the movie. 


```mysql
SELECT name, title
FROM Movie INNER JOIN Rating AS R1 USING(mID)
INNER JOIN Rating AS R2 USING(rId)
INNER JOIN Reviewer USING(rId)
WHERE R1.mID = R2.mID AND R1.ratingDate < R2.ratingDate AND R1.stars < R2.stars;
```


7. For each movie that has at least one rating, find the highest number of stars that movie received. Return the movie title and number of stars. Sort by movie title. 


```mysql
SELECT title, MAX(stars)
FROM Movie NATURAL JOIN Rating USING(mID)
ORDER BY title;
```

8. List movie titles and average ratings, from highest-rated to lowest-rated. If two or more movies have the same average rating, list them in alphabetical order. 


```mysql
SELECT title, AVG(stars) AS average
FROM Rating NATURAL JOIN Movie USING(mID)
GROUP BY Movie.mID
ORDER BY average DESC, title;
```

9. Find the names of all reviewers who have contributed three or more ratings. (As an extra challenge, try writing the query without HAVING or without COUNT.) 


```mysql
SELECT name
FROM Reviewer
WHERE (
    SELECT COUNT(*)
    FROM Rating
    WHERE Rating.rId = Reviewer.rId) >= 3
);
```

10. Find the names of all reviewers who rated Gone with the Wind.


```mysql
SELECT DISTINCT name
FROM Reviewer NATURAL JOIN Rating USING(rID)
NATURAL JOIN Movie USING(mID)
WHERE Movie.title = 'Gone with the Wind';
```

11. For any rating where the reviewer is the same as the director of the movie, return the reviewer name, movie title, and number of stars.


```mysql
SELECT name, title, stars
FROM Movie NATURAL JOIN Rating USING(mID)
NATURAL JOIN Reviewer USING(rID)
WHERE director = name;
```

12. Return all reviewer names and movie names together in a single list, alphabetized. (Sorting by the first name of the reviewer and first word in the title is fine; no need for special processing on last names or removing "The".)


```mysql
SELECT name, title
FROM Movie UNION Reviewer
ORDER BY name, title;
```

13. Find the titles of all movies not reviewed by Chris Jackson.


```mysql
SELECT title
FROM Movie
WHERE mID NOT IN (
  SELECT mID
  FROM Rating NATURAL JOIN Reviewer USING(rID)
  WHERE name = "Chris Jackson"
);
```

14. For all pairs of reviewers such that both reviewers gave a rating to the same movie, return the names of both reviewers. Eliminate duplicates, don't pair reviewers with themselves, and include each pair only once. For each pair, return the names in the pair in alphabetical order.


```mysql

```

15. For each rating that is the lowest (fewest stars) currently in the database, return the reviewer name, movie title, and number of stars.


```mysql
SELECT name, title, stars
FROM Movie NATURAL JOIN Rating USING(mID)
NATURAL JOIN Reviewer USING(rID)
WHERE stars = (
    SELECT MIN(stars) 
    FROM Rating
);
```

16. Find the reviewer who reviewed all movies.


```mysql
SELECT name
FROM Reviewer AS r1 NATURAL JOIN Rating USING(rID)
WHERE NOT EXISTS(
    SELECT mID
    FROM Movie
    WHERE title NOT IN(
        SELECT mID
        FROM Reviewer AS r2 NATURAL JOIN Rating USING(rID)
        WHERE r1.name = r2.name
    )
);
```

17. Find the movies reviewed by Tom and not reviewed by Jerry. Please write an SQL with GROUP BY.


```mysql
SELECT title
FROM Movie NATURAL JOIN Rating USING(mID)
NATURAL JOIN Reviewer USING(rID)
WHERE Reviewer.name = 'Tom' AND Reviewer != 'Jerry'
GROUP BY Reviewer.name;
```

18. Find the movies that have been reviewed by at least two reviewers. Please write an SQL with only one SELECT and without GROUP BY


```mysql

```

19. Find the movies that have been reviewed by at least two reviewers. Please write an SQL with subquery.


```mysql

```

20. Find the reviewers who reviewed the largest number of movies.


```mysql
SELECT 
```

21. Find the reviewers who do not review any movie.


```mysql
SELECT *
FROM Reviewer
WHERE rID NOT IN(
    SELECT rID
    FROM Rating
);
```
