SET SQL_SAFE_UPDATES = 0;
DELETE FROM carbon 
WHERE RIGHT(YYYYMM, 2) > 12;
ALTER TABLE carbon ADD COLUMN sale_date DATE;
ALTER TABLE carbon ADD COLUMN emission_value DOUBLE;
UPDATE carbon
SET sale_date = STR_TO_DATE(CONCAT(yyyymm, '01'), '%Y%m%d'),
    emission_value = CAST(Value AS DOUBLE);
ALTER TABLE carbon
DROP emission_value;
ALTER TABLE carbon
RENAME COLUMN Value TO emission_value;
ALTER TABLE carbon
MODIFY COLUMN YYYYMM DATE;
ALTER TABLE carbon
RENAME COLUMN sale_date TO date;
ALTER TABLE carbon
DROP Unit;
ALTER TABLE carbon
RENAME COLUMN MSN TO industry;
ALTER TABLE carbon
RENAME COLUMN Description TO sector;
SET SQL_SAFE_UPDATES = 1;

-- 1. Which industry had the highest CO2 emissions in the most recent year?
SELECT 
    industry, SUM(emission_value) AS CO2_emissions
FROM carbon
GROUP BY industry
ORDER BY CO2_emissions DESC;

-- 2. What has been the trend of total emissions across sectors over the last decade?
SELECT 
    sector,
    SUM(emission_value) AS CO2_emissions,
    YEAR(YYYYMM) AS year
FROM carbon
WHERE YEAR(YYYYMM) BETWEEN 2006 AND 2016
GROUP BY sector , year
ORDER BY year;

-- 3. Which industries showed a decline in emissions over the years?
WITH sector_comparison AS (
    SELECT
		industry,
        AVG(CASE WHEN YEAR(YYYYMM) BETWEEN 1973 AND 1983 THEN emission_value END) AS early_avg,
        AVG(CASE WHEN YEAR(YYYYMM) BETWEEN 2005 AND 2016 THEN emission_value END) AS late_avg
    FROM carbon
    GROUP BY industry)
SELECT 
    industry, 
    early_avg, 
    late_avg, 
    (late_avg - early_avg) AS change_amount
FROM sector_comparison
WHERE late_avg < early_avg
ORDER BY change_amount ASC;

-- 4. Identify the top three emitting industries and their year-wise emission pattern.
WITH top_industry AS (
	SELECT industry
	FROM carbon
	GROUP BY industry
	ORDER BY SUM(emission_value) DESC
	LIMIT 3)
SELECT c.industry,
	YEAR(c.date) AS year,
    SUM(c.emission_value) AS annual_emissions
FROM carbon c
JOIN top_industry t ON c.industry = t.industry
GROUP BY c.industry, year
ORDER BY c.industry, year;