/* Creating a new DataBase  called movie and calling it up to use */
CREATE DATABASE movie;
USE movie;

/* 2. Creating a new table to hold data of Pixar movies in a database */
CREATE TABLE movie_200343236(
movieTitle VARCHAR(30),
releaseDate DATE,
costInMillion INT,
revenueInMillion INT
);

/* 3. Inserting the info of every Pixar Film Into the Table  movie_200343236 */
INSERT INTO movie_200343236 VALUES('Toy Story', '1995-11-22', 31, 365);
INSERT INTO movie_200343236 VALUES('Toy Story 2', '1999-11-24', 90, 512);
INSERT INTO movie_200343236 VALUES('Toy Story 3', '2010-06-18', 200, 1070);
INSERT INTO movie_200343236 VALUES('A Bugs Life', '1998-11-25', 60, 363);
INSERT INTO movie_200343236 VALUES('Monsters Inc', '2001-11-02', 115, 560);
INSERT INTO movie_200343236 VALUES('Finding Nemo', '2003-05-30', 94, 906);
INSERT INTO movie_200343236 VALUES('The Incredibles', '2005-11-04', 92, 615);
INSERT INTO movie_200343236 VALUES('Cars', '2006-06-09', 120, 462);
INSERT INTO movie_200343236 VALUES('Cars 2', '2011-06-24', 200, 560);
INSERT INTO movie_200343236 VALUES('Ratatouille', '2007-06-29', 150, 626);
INSERT INTO movie_200343236 VALUES('Wall-E', '2008-06-27', 180, 533);
INSERT INTO movie_200343236 VALUES('Up', '2009-05-29', 175, 731);
INSERT INTO movie_200343236 VALUES('Brave', '2012-06-22', 185, 555);
INSERT INTO movie_200343236 VALUES('Monsters University', '2013-06-21', 200, 744);
INSERT INTO movie_200343236 VALUES('Planes', '2013-08-09', 50, 220);
INSERT INTO movie_200343236 VALUES('Inside Out', '2015-06-19', 245, 850);
INSERT INTO movie_200343236 VALUES('The Good Dinosaur', '2015-11-25', 188, 299);
INSERT INTO movie_200343236 VALUES('Finding Dory', '2016-06-17', 200, 1022);

/* This Retrurns All the data in the Table*/
SELECT *
FROM movie_200343236;

/*This turns off SQL save mode */
SET SQL_SAFE_UPDATES = 0;

/* 4. a. This Qurey Orders the Movies By Release Date By oldest to newest */ 
SELECT * 
FROM movie_200343236
ORDER BY releaseDate;

/* 4. b. This Query will return the max Return on Investment with the corsponding film */
SELECT MAX ((revenueInMillion - costInMillion) DIV costInMillion) AS ROI, movieTitle
FROM movie_200343236;

/* 4. c. This Querry returns the sum of all the movies between the years of 1990 and 1999 */
SELECT SUM(revenueInMillion)
FROM movie_200343236
GROUP BY YEAR(releaseDate) BETWEEN '1990' AND '1999';

/* 4. d. This Querry returns the sum of all the movies between the years of 2000 and 2015 */
SELECT SUM(revenueInMillion)
FROM movie_200343236
GROUP BY YEAR(releaseDate) BETWEEN '2000' AND '2015';

/* 4. e. This Querry will count how many movies were release by month */
SELECT COUNT(releaseDate) AS num_of_movies, MONTH(releaseDate) AS month_number
FROM movie_200343236
GROUP BY MONTH(releaseDate);

/* 4. f. Returns all Films total cost in millions */
SELECT SUM(costInMillion) AS allFilms
FROM movie_200343236;

/* 4. g. This Calculates the Return on Investment for every Movie */
SELECT (revenueInMillion - costInMillion) AS netIncome, movieTitle
FROM movie_200343236;

/* 5. a. Adding a new movie into the table movie_200343236 */
INSERT INTO movie_200343236 VALUES('Fun times at Georgian', '2017-01-15', 63, 25); 

/* 5. b. This Update will change all movie budgets under or equal to 90 to 100 */
UPDATE movie_200343236
SET costInMillion = 100
WHERE costInMillion <=90;

/* 5. c. This Update Changes The column revenueInMillion to gross_income */
ALTER TABLE movie_200343236
CHANGE COLUMN revenueInMillion gross_income INT;

/* 5. d. This Update Changes all instances of the word Cars in movieTitle and replaces it with Zip-Cars */
UPDATE movie_200343236
SET movieTitle = REPLACE(movieTitle, 'Cars', 'Zip-Cars');

/* 6. a. This Deletes any movie with the word 'of' in it anywhere */
DELETE FROM movie_200343236
WHERE movieTitle LIKE '%of%';

/* 6. b. This Query will delete any movie with a ROI lower than 100% */
DELETE FROM movie_200343236
WHERE ((revenueInMillion - costInMillion) DIV costInMillion) < 100 / revenueInMillion;