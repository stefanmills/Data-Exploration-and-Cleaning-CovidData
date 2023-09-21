# CovidProjectSQL
This is a project which analizes the Covid Death using the data from https://ourworldindata.org/covid-deaths.
Download the latest Covid information from the website above
Split the data from the CSV into CovidDeaths & CovidVaccinated and save them as .xlxs
Open your SQL server and import the CovidDeaths data into your server
Use the Query in the Codes to manipulate your data
Please check the data type of all the Columns with command >>EXEC sp_help 'dbo.CovidDeaths'
Please alter all these columns (reproduction_rate,icu_patients,icu_patients_per_million,hosp_patients,hosp_patients_per_million,weekly_icu_admissions,weekly_icu_admissions_per_million, weekly_hosp_admissions,
weekly_hosp_admissions_per_million,total_deaths,total_cases,total_cases_per_million,total_deaths_per_million) to datatype float
Use the above command for all the COlumns >>ALTER TABLE <tablename> ALTER COLUMN <column_name> <datatype>; (ALTER TABLE dbo.CovidDeaths ALTER COLUMN reproduction_rate float;) 
File could not be uploaded because it was bigger than the required in github
