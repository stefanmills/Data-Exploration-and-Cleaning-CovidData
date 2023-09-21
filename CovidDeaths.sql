--Selecting All
SELECT * FROM CovidDeaths
--Realized that parts with Continent as null have the countries being continents
where continent is not null 

-- Select data you are going to use and get it in order with the location & date
SELECT Location, date, total_cases,new_cases,total_deaths,population
FROM CovidDeaths
ORDER BY 1,2

--Checking the date types 
EXEC sp_help 'dbo.CovidDeaths'

-- Realize some values are nvarchar instead of interget/ decimal. Alter columns
ALTER TABLE dbo.CovidDeaths ALTER COLUMN reproduction_rate float;
ALTER TABLE dbo.CovidDeaths ALTER COLUMN icu_patients float;
ALTER TABLE dbo.CovidDeaths ALTER COLUMN icu_patients_per_million float;
ALTER TABLE dbo.CovidDeaths ALTER COLUMN hosp_patients float;
ALTER TABLE dbo.CovidDeaths ALTER COLUMN hosp_patients_per_million float
ALTER TABLE dbo.CovidDeaths ALTER COLUMN weekly_icu_admissions float;
ALTER TABLE dbo.CovidDeaths ALTER COLUMN weekly_icu_admissions_per_million float; 
ALTER TABLE dbo.CovidDeaths ALTER COLUMN weekly_hosp_admissions float;
ALTER TABLE dbo.CovidDeaths ALTER COLUMN weekly_hosp_admissions_per_million float;
ALTER TABLE dbo.CovidDeaths ALTER COLUMN total_deaths float; 
ALTER TABLE dbo.CovidDeaths ALTER COLUMN total_cases float;
ALTER TABLE dbo.CovidDeaths ALTER COLUMN total_cases_per_million float;
ALTER TABLE dbo.CovidDeaths ALTER COLUMN total_deaths_per_million float;

-- Get the Death Rate and round it to 2 DCP
SELECT Location, date As Date, total_cases AS 'Total Cases', total_deaths AS 'Total Death', 
Round((total_deaths/total_cases)*100,2) AS 'Death Rate (%)'
FROM CovidDeaths
where continent is not null
ORDER BY 1,2 --Odering by column 1 & 2 


--Show the Percentage of Populatiion with Covid
SELECT Location, date As Date,Population, total_cases AS 'Total Cases', 
(total_cases/Population)*100 AS 'Population Covid Rate (%)'
FROM CovidDeaths
where continent is not null
ORDER BY 1,2 - 

--Countries with the highest infection rate compared to Covid Infection
SELECT Location,Population, MAX(total_cases) AS 'Highest Infection Count ', 
ROUND(Max((total_cases/Population))*100,3) AS 'Population Infection  Rate (%)'
FROM CovidDeaths
where continent is not null
Group by Population, Location -- Because we used the aggregation function 'MAX'
ORDER BY 'Population Infection  Rate (%)' desc

--Highest Covid Deaths Count In Countries
SELECT Location, MAX(total_deaths) AS 'Highest Country Death Count' 
FROM CovidDeaths
where continent is not null
Group by Location 
ORDER BY 'Highest Country Death Count' desc

--Highest Covid Deaths Count In Continent
SELECT continent, MAX(total_deaths) AS 'Highest Continent Death Count' 
FROM CovidDeaths
where continent is not null
Group by continent 
ORDER BY 'Highest Continent Death Count' desc

--Highest Covid Deaths Count In Continent 
--Used the Location because i realized that the ones without continents are Continents and these have the daily total 
SELECT location, MAX(total_deaths) AS 'Highest Continent Death Count' 
FROM CovidDeaths
where continent is null
Group by location 
ORDER BY 'Highest Continent Death Count' desc

-- GLOBAL NUMBERS OF NEW DEATHS AND CASES DAILY AND HOURLY
SELECT date As Date, sum(new_cases) AS 'Daily Hourly Cases', SUM(new_deaths) AS 'Daily Hourly Death', 
Round((SUM(new_deaths)/NULLIF(SUM(new_cases),0))*100,2) AS 'Daily Hourly Death Rate (%)'
--Used the NULLIF command to prevent divided by zero error
FROM CovidDeaths
where continent is not null
GROUP BY Date
ORDER BY 1,2 

-- TOTAL CASES
SELECT  sum(new_cases) AS 'Total Cases', SUM(new_deaths) AS 'Total New Death', 
Round((SUM(new_deaths)/NULLIF(SUM(new_cases),0))*100,2) AS 'Total Death Rate (%)'
FROM CovidDeaths
where continent is not null
ORDER BY 1,2 


-- CREATE THE CONTIENT VIEW
CREATE VIEW
	ContinetTable AS
SELECT 
	location, 
	MAX(total_deaths) AS 'Highest Continent Death Count' 
FROM 
	CovidDeaths
WHERE 
	continent is null
GROUP BY
	location 
