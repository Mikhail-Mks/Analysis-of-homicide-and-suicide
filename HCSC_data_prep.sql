-- removing rows without data about homicide/suicide level and GDP per capita & checking for missing regions

	SELECT distinct country FROM
    (SELECT
		dt.country,
		year,
		Homicides_per_100K,
		Suicides_per_100K,
		GDP_per_capita,
		avg(GDP_per_capita) over (partition by country) as GDPPC_avg,
		re.Region,
		incomeLevel
	FROM data_analysis.suicide_homicide dt
	LEFT JOIN regions re 
		ON dt.country = re.country	
	WHERE incomeLevel != 'Aggregates' 
		AND Homicides_per_100K > 0 
		AND Suicides_per_100K > 0 
		AND GDP_per_capita > 0) as qq
	WHERE Region is NULL;

-- Removing aggregated regions

DELETE FROM data_analysis.suicide_homicide
	WHERE country IN ('Latin America & Caribbean', 'Sub-Saharan Africa');

UPDATE regions set Region = 'South/Latin America' where country = 'Nicaragua';
	
-- Assigning missing regions to countries

INSERT INTO 
	regions (country, Region)
VALUES
	('Bahamas, The', 'South/Latin America'),
    ('Cabo Verde', 'Africa'),
    ('Egypt, Arab Rep.', 'Middle east'),
    ('Iran, Islamic Rep.', 'Asia & Pacific'),
    ('Korea, Rep.', 'Asia & Pacific'),
    ('Kyrgyz Republic', 'Asia & Pacific'),
    ('Moldova', 'Europe'),
    ('North Macedonia', 'Europe'),
    ('Slovak Republic', 'Europe'),
    ('St. Lucia', 'South/Latin America'),
    ('St. Vincent and the Grenadines', 'South/Latin America'),
    ('Tanzania', 'Africa'),
    ('Venezuela, RB', 'South/Latin America'),
    ('Yemen, Rep.', 'Middle east');

-- Final query	

SELECT
		dt.country,
		year,
		Homicides_per_100K,
		Suicides_per_100K,
		GDP_per_capita,
		avg(GDP_per_capita) over (partition by country) as GDPPC_avg,
		re.Region,
		incomeLevel
	FROM data_analysis.suicide_homicide dt
	LEFT JOIN regions re 
		ON dt.country = re.country	
	WHERE incomeLevel != 'Aggregates' 
		AND Homicides_per_100K > 0 
		AND Suicides_per_100K > 0 
		AND GDP_per_capita > 0






