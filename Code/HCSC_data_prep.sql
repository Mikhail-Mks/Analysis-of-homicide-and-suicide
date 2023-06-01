-- Checking for missing regions
WITH miss
AS (
	SELECT s.Country
		,s.year
		,Homicides_per_100K
		,Suicides_per_100K
		,g.Value AS GINI
		,Happiness_Score AS HAPP
		,avg(GDP_per_capita) OVER (PARTITION BY country) AS GDPPC_avg
		,Region
		,incomeLevel
	FROM shg s
	LEFT JOIN regions r ON s.country = r.country
	LEFT JOIN gini g ON s.country = g.Country
		AND s.year = g.year
	LEFT JOIN happ h ON s.country = h.Country
		AND s.year = h.year
	WHERE Region IS NULL
		AND incomeLevel != 'Aggregates'
	)
SELECT DISTINCT Country
FROM miss;

-- Removing aggregated regions
DELETE
FROM shg
WHERE Country IN ('Latin America & Caribbean', 'Sub-Saharan Africa');

-- updating country names
UPDATE regions
SET Region = 'South/Latin America'
WHERE country = 'Nicaragua';

UPDATE shg
SET s.Country = 'Congo'
WHERE country = 'Congo, Dem. Rep.';

UPDATE shg
SET s.Country = 'Congo'
WHERE country = 'Congo, Rep.';

-- Assigning missing regions to countries

INSERT INTO 
	regions(country, Region)
VALUES
	('Bahamas, The', 'South/Latin America'),
    ('Micronesia, Fed. Sts.', 'Asia & Pacific'),
    ('Sint Maarten (Dutch part)', 'South/Latin America'),
    ('St. Kitts and Nevis', 'South/Latin America'),
    ('St. Martin (French part)', 'South/Latin America'),
    ('Virgin Islands (U.S.)', 'South/Latin America'),
    ('British Virgin Islands', 'South/Latin America'),
    ('Cabo Verde', 'Africa'),
    ('West Bank and Gaza', 'Middle east'),
    ('Egypt, Arab Rep.', 'Middle east'),
    ('Iran, Islamic Rep.', 'Asia & Pacific'),
    ('Macao SAR, China', 'Asia & Pacific'),
    ('Lao PDR', 'Asia & Pacific'),
    ('Korea, Rep.', 'Asia & Pacific'),
    ('Kyrgyz Republic', 'Asia & Pacific'),
    ('Hong Kong SAR, China', 'Asia & Pacific'),
    ("Korea, Dem. People's Rep.", 'Asia & Pacific'),
    ('Moldova', 'Europe'),
    ('North Macedonia', 'Europe'),
    ('Kosovo', 'Europe'),
    ('Slovak Republic', 'Europe'),
    ('Channel Islands', 'Europe'),
    ('St. Lucia', 'South/Latin America'),
    ('St. Vincent and the Grenadines', 'South/Latin America'),
    ('Tanzania', 'Africa'),
    ("Cote d'Ivoire", 'Africa'),
    ('Curacao', 'Africa'),
    ('Gambia, The', 'Africa'),
    ('Tanzania', 'Africa'),
    ('Venezuela, RB', 'South/Latin America'),
    ('Yemen, Rep.', 'Middle east');
    
-- updating Income Level

UPDATE shg
SET incomeLevel = 
    CASE
        WHEN GDPPC_avg >= 719 AND GDPPC_avg < 8600 THEN 'Low'
        WHEN GDPPC_avg >= 8600 AND GDPPC_avg < 25417 THEN 'Mid-Low'
        WHEN GDPPC_avg >= 25417 AND GDPPC_avg < 35015 THEN 'Mid-High'
        WHEN GDPPC_avg >= 35015 AND GDPPC_avg < 48000 THEN 'High'
        WHEN GDPPC_avg >= 48000 AND GDPPC_avg <= 122389.95 THEN 'Very High'
    END
WHERE incomeLevel != 'Aggregates';




-- Final query    
SELECT s.Country
	,s.year
	,Homicides_per_100K
	,Suicides_per_100K
	,g.Value AS GINI
	,Happiness_Score AS HAPP
	,avg(GDP_per_capita) OVER (PARTITION BY country) AS GDPPC_avg
	,Region
	,incomeLevel
FROM shg s
LEFT JOIN regions r ON s.country = r.country
LEFT JOIN gini g ON s.country = g.Country
	AND s.year = g.year
LEFT JOIN happ h ON s.country = h.Country
	AND s.year = h.year
WHERE incomeLevel != 'Aggregates'
	AND GDP_per_capita > 0
	AND Homicides_per_100K > 0
	AND Suicides_per_100K > 0