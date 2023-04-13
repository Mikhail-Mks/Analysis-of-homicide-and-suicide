
# Exploratory Data Analysis of Homicide and Suicide Rates

This project explores the relationship between homicide and suicide rates and various socioeconomic factors, including GDP per capita, Gini coefficient, and happiness index. The dataset was sourced from Kaggle and loaded into MySQL for cleaning and preprocessing.

In Python, I have analyzed the data and assigned regions based on geographic location using HTML data. I have compared homicide and suicide rates against the aforementioned factors to uncover any patterns or correlations.

## Key Findings

* European countries have the highest suicide rates among the regions, while Asian countries have a spike in 2014. Middle Eastern countries have the lowest and decreasing suicide rates since 2010.
* Countries with high GDP per capita have a gradual increase in suicide rates since 2006, while countries with low and very high GDP per capita have similar patterns * with a minimum in 2012.
* Countries with mid-high or higher GDP per capita have very low and stable homicide rates, while countries with lower GDP per capita have higher and more variable homicide rates.
* There is a strong positive correlation between Gini index and homicide rate: countries with lower income inequality (Gini index less than 40) have lower homicide rates (less than 10 per 100000 people).
* There is a weak negative correlation between Gini index and suicide rate: countries with higher income inequality tend to have lower suicide rates.
* There is no significant correlation between happiness index and either homicide or suicide rate.
* The highest variation in homicide rate is observed in Latin America among the countries with mid-low income level.

### Data Sources:
https://www.kaggle.com/datasets/prasertk/homicide-suicide-rate-and-gdp?select=suicide+homicide+gdp.csv
https://api.worldbank.org/v2/en/indicator/SI.POV.GINI?downloadformat=csv  
https://www.kaggle.com/datasets/mathurinache/world-happiness-report
