-- Connect to database (MySQL)
USE maven_advanced_sql;

-- 1. Subqueries in the SELECT clause
SELECT * FROM happiness_scores;

-- Average happiness score
SELECT AVG(happiness_score) FROM happiness_scores;

-- Happiness score deviation from the average
SELECT	year, country, happiness_score,
		(SELECT AVG(happiness_score) FROM happiness_scores) AS avg_hs,
        happiness_score - (SELECT AVG(happiness_score) FROM happiness_scores) AS diff_from_avg
FROM	happiness_scores;

-- 2. Subqueries in the FROM clause
SELECT * FROM happiness_scores;

-- Average happiness score for each country
SELECT	country,
		AVG(happiness_score) AS avg_hs
FROM	happiness_scores
GROUP BY country;

/* Return a country's happiness score for the year as well as
the average happiness score for the country across years */
SELECT	hs.year, hs.country, hs.happiness_score,
		country_hs.avg_hs_by_country
FROM	happiness_scores hs LEFT JOIN
		(SELECT	country,
				AVG(happiness_score) AS avg_hs_by_country
		 FROM	happiness_scores
		 GROUP BY country) AS country_hs
		ON hs.country = country_hs.country;
        
-- View one country
SELECT	hs.year, hs.country, hs.happiness_score,
		country_hs.avg_hs_by_country
FROM	happiness_scores hs LEFT JOIN
		(SELECT	country,
				AVG(happiness_score) AS avg_hs_by_country
		 FROM	happiness_scores
		 GROUP BY country) AS country_hs
		ON hs.country = country_hs.country
WHERE	hs.country = 'Russia';
            
-- 3. Multiple subqueries

-- Return happiness scores for 2015 - 2024
SELECT DISTINCT year FROM happiness_scores;
SELECT * FROM happiness_scores_current;

SELECT year, country, happiness_score FROM happiness_scores
UNION ALL
SELECT 2024, country, ladder_score FROM happiness_scores_current;
            
/* Return a country's happiness score for the year as well as
the average happiness score for the country across years */
SELECT	hs.year, hs.country, hs.happiness_score,
		country_hs.avg_hs_by_country
FROM	(SELECT year, country, happiness_score FROM happiness_scores
		 UNION ALL
		 SELECT 2024, country, ladder_score FROM happiness_scores_current) AS hs
         LEFT JOIN
		(SELECT	country, AVG(happiness_score) AS avg_hs_by_country
		 FROM	happiness_scores
		 GROUP BY country) AS country_hs
		ON hs.country = country_hs.country;
       
/* Return years where the happiness score is a whole point
greater than the country's average happiness score */
SELECT * FROM

(SELECT	hs.year, hs.country, hs.happiness_score,
		country_hs.avg_hs_by_country
FROM	(SELECT year, country, happiness_score FROM happiness_scores
		 UNION ALL
		 SELECT 2024, country, ladder_score FROM happiness_scores_current) AS hs
         LEFT JOIN
		(SELECT	country, AVG(happiness_score) AS avg_hs_by_country
		 FROM	happiness_scores
		 GROUP BY country) AS country_hs
		ON hs.country = country_hs.country) AS hs_country_hs

WHERE	happiness_score > avg_hs_by_country + 1;

-- 4. Subqueries in the WHERE and HAVING clauses
SELECT * FROM happiness_scores;

-- Average happiness score
SELECT AVG(happiness_score) FROM happiness_scores;

-- Above average happiness scores (WHERE)
SELECT		year, country, happiness_score
FROM		happiness_scores
WHERE		happiness_score > (SELECT AVG(happiness_score) FROM happiness_scores)
ORDER BY	happiness_score;

-- Above average happiness scores for each region (HAVING)
SELECT		region, AVG(happiness_score) AS avg_hs
FROM		happiness_scores
GROUP BY	region
HAVING		avg_hs > (SELECT AVG(happiness_score) FROM happiness_scores)
ORDER BY	avg_hs;

-- 5. ANY vs ALL
SELECT * FROM happiness_scores; -- 2015-2023
SELECT * FROM happiness_scores_current; -- 2024

-- Scores that are greater than ANY 2024 scores
SELECT	*
FROM	happiness_scores
WHERE	happiness_score >
		ANY(SELECT	ladder_score
			FROM	happiness_scores_current); -- greater than the smallest ladder_score in 2024

-- Scores that are greater than ALL 2024 scores
SELECT	*
FROM	happiness_scores
WHERE	happiness_score >
		ALL(SELECT	ladder_score
			FROM	happiness_scores_current); -- greated than the greatest ladder_score in 2024

-- 6. EXISTS

/* Return happiness scores of countries
that exist in the inflation rates table */

-- Alternative to EXISTS: INNER JOIN
     
-- 7. CTEs: Readability

/* SUBQUERY: Return the happiness scores along with
   the average happiness score for each country */

/* CTE: Return the happiness scores along with
   the average happiness score for each country */
   
-- 8. CTEs: Reusability
        
-- SUBQUERY: Compare the happiness scores within each region in 2023

-- CTE: Compare the happiness scores within each region in 2023

-- 9. Multiple CTEs

-- Step 1: Compare 2023 vs 2024 happiness scores side by side

-- Step 2: Return the countries where the score increased

-- Alternative: CTEs only

-- 10. Recursive CTEs

-- Create a stock prices table
CREATE TABLE IF NOT EXISTS stock_prices (
    date DATE PRIMARY KEY,
    price DECIMAL(10, 2)
);

INSERT INTO stock_prices (date, price) VALUES
	('2024-11-01', 678.27),
	('2024-11-03', 688.83),
	('2024-11-04', 645.40),
	('2024-11-06', 591.01);
    
/* Employee table was created in prior section:
   This is the code if you need to create it again */
    
/*
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    salary INT,
    manager_id INT
);

INSERT INTO employees (employee_id, employee_name, salary, manager_id) VALUES
	(1, 'Ava', 85000, NULL),
	(2, 'Bob', 72000, 1),
	(3, 'Cat', 59000, 1),
	(4, 'Dan', 85000, 2);
*/

-- Example 1: Generating sequences

-- Generate a column of dates

-- Include the original prices
  

-- Example 2: Working with hierachical data

-- Return the reporting chain for each employee


-- 11. Subquery vs CTE vs Temp Table vs View

-- Subquery


-- CTE


-- Temporary table


-- View
