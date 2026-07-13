-- Connect to database (MySQL)
USE maven_advanced_sql;

-- 1. Basic joins
SELECT * FROM happiness_scores;
SELECT * FROM country_stats;

SELECT happiness_scores.year, happiness_scores.country, happiness_scores.happiness_score,
		country_stats.continent
FROM happiness_scores
		INNER JOIN country_stats
        ON happiness_scores.country = country_stats.country
WHERE happiness_scores.country = 'Russia';

SELECT hs.year, hs.country, hs.happiness_score,
		cs.continent
FROM happiness_scores hs
		INNER JOIN country_stats cs
        ON hs.country = cs.country;

-- 2. Join types
SELECT hs.year, hs.country, hs.happiness_score,
		cs.country, cs.continent
FROM happiness_scores hs
		INNER JOIN country_stats cs
        ON hs.country = cs.country
WHERE cs.country IS NULL;

SELECT hs.year, hs.country, hs.happiness_score,
		cs.country, cs.continent
FROM happiness_scores hs
		LEFT JOIN country_stats cs
        ON hs.country = cs.country
WHERE cs.country IS NULL;

SELECT hs.year, hs.country, hs.happiness_score,
		cs.country, cs.continent
FROM happiness_scores hs
		RIGHT JOIN country_stats cs
        ON hs.country = cs.country
WHERE hs.country IS NULL;

-- find all values that exist in one table vs another
SELECT DISTINCT hs.country
FROM happiness_scores hs
		LEFT JOIN country_stats cs
        ON hs.country = cs.country
WHERE cs.country IS NULL;

SELECT DISTINCT cs.country
FROM happiness_scores hs
		RIGHT JOIN country_stats cs
        ON hs.country = cs.country
WHERE hs.country IS NULL;

        
-- 3. Joining on multiple columns


        
-- 4. Joining multiple tables



-- 5. Self joins
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
    
SELECT * FROM employees;

-- Employees with the same salary



-- Employees that have a greater salary



-- Employees and their managers


        
-- 6. Cross joins
CREATE TABLE tops (
    id INT,
    item VARCHAR(50)
);

CREATE TABLE sizes (
    id INT,
    size VARCHAR(50)
);

CREATE TABLE outerwear (
    id INT,
    item VARCHAR(50)
);

INSERT INTO tops (id, item) VALUES
	(1, 'T-Shirt'),
	(2, 'Hoodie');

INSERT INTO sizes (id, size) VALUES
	(101, 'Small'),
	(102, 'Medium'),
	(103, 'Large');

INSERT INTO outerwear (id, item) VALUES
	(2, 'Hoodie'),
	(3, 'Jacket'),
	(4, 'Coat');
    
-- View the tables



-- Cross join the tables



-- From the self join assignment:
-- Which products are within 25 cents of each other in terms of unit price?


        
-- Rewritten with a CROSS JOIN



-- 7. Union vs union all



-- Union



-- Union all



-- Union with different column names

