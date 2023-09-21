--Selecting everything from the CovidVaccination
SELECT * FROM CovidVaccinations

EXEC sp_help CovidVaccinations

--Alter the column datatypes

ALTER TABLE dbo.CovidVaccinations ALTER COLUMN total_tests  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN new_tests  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN total_tests_per_thousand  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN new_tests_per_thousand  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN new_tests_smoothed  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN new_tests_smoothed_per_thousand  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN positive_rate  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN tests_per_case  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN total_vaccinations  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN people_vaccinated  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN people_fully_vaccinated  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN total_boosters  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN new_vaccinations  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN new_vaccinations_smoothed  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN total_vaccinations_per_hundred  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN people_vaccinated_per_hundred  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN people_fully_vaccinated_per_hundred  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN total_boosters_per_hundred  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN new_vaccinations_smoothed_per_million  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN new_people_vaccinated_smoothed  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN new_people_vaccinated_smoothed_per_hundred  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN stringency_index  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN population_density  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN median_age  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN aged_65_older  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN aged_70_older  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN gdp_per_capita  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN extreme_poverty  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN cardiovasc_death_rate  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN diabetes_prevalence  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN female_smokers  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN male_smokers  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN male_smokers  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN handwashing_facilities  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN hospital_beds_per_thousand  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN life_expectancy  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN human_development_index  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN excess_mortality_cumulative_absolute  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN excess_mortality_cumulative  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN excess_mortality  float;
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN excess_mortality_cumulative_per_million  float;


--Join the CovidDeath and CovidVaccination Table looking at Total Population vs Vaccine
Select Deaths.continent As Continent,Deaths.location AS Location, Deaths.date AS Date ,population AS Population, Vaccine.new_vaccinations AS 'New Vac'
, SUM (Vaccine.new_vaccinations) OVER (PARTITION BY Deaths.Location ORDER BY   Deaths.date) AS 'Daily Vaccination Count'
--Did the partition by to have a count of the vaccination and location was used so when it gets to a different location ist start a new count
-- To get the right count everyday i order by the date
FROM CovidDeaths Deaths join CovidVaccinations Vaccine
ON Deaths.location=Vaccine.location and Deaths.date=Vaccine.date
WHERE Deaths.continent is not null
ORDER BY 2, 3





