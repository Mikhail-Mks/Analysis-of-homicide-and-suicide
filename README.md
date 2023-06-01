# Exploratory Data Analysis of Homicide and Suicide Rates

What drives people to kill themselves or others? This is a question that has fascinated and troubled many researchers, policymakers, and ordinary citizens. Is it poverty, inequality, unhappiness, or something else? In this project, I set out to explore the relationship between homicide and suicide rates and various socioeconomic factors, using data from Kaggle and MySQL.

I used Python to clean, preprocess, and analyze the data, and to assign regions based on geographic location using HTML data, impute missing data and classify groups. Then I compared homicide and suicide rates against factors such as GDP per capita, Gini coefficient, and happiness index. I wanted to see if there were any patterns or correlations that could shed some light on the causes and consequences of these violent acts.

The results were surprising and intriguing. I found that:

* European countries have the highest suicide rates among the regions, while Asian countries have a spike in 2014. Middle Eastern countries have the lowest and decreasing suicide rates since 2010.
* Countries with high GDP per capita have a gradual increase in suicide rates since 2006, while countries with low and very high GDP per capita have similar patterns with a minimum in 2012.
* Countries with mid-high or higher GDP per capita have very low and stable homicide rates, while countries with lower GDP per capita have higher and more variable homicide rates.
* There is a strong positive correlation between Gini index and homicide rate: countries with lower income inequality (Gini index less than 40) have lower homicide rates (less than 10 per 100000 people).
* There is a weak negative correlation between Gini index and suicide rate: countries with higher income inequality tend to have lower suicide rates.
* There is no significant correlation between happiness index and either homicide or suicide rate.
* The highest variation in homicide rate is observed in Latin America among the countries with mid-low income level.

These findings suggest that there are complex and multifaceted factors that influence homicide and suicide rates across the world. They also raise more questions: Why do European countries have such high suicide rates? What caused the spike in Asian countries in 2014? How does income inequality affect violence? What makes Latin America so prone to homicide?



The results of analysis were visualised in Power BI:   
https://www.novypro.com/project/exploratory-data-analysis-of-homicide-and-suicide-rates

### Data Sources:
https://www.kaggle.com/datasets/prasertk/homicide-suicide-rate-and-gdp?select=suicide+homicide+gdp.csv
https://api.worldbank.org/v2/en/indicator/SI.POV.GINI?downloadformat=csv  
https://www.kaggle.com/datasets/mathurinache/world-happiness-report
