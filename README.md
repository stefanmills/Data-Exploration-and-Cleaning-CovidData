# CovidProjectSQL

This project focuses on analyzing Covid-19 deaths using data from [Our World in Data](https://ourworldindata.org/covid-deaths). It involves downloading the latest Covid-19 information from the provided website, splitting the data into two parts (CovidDeaths and CovidVaccinated), and saving them as .xlsx files. The project also includes importing the CovidDeaths data into your SQL server, data manipulation using SQL queries, and altering data types for specific columns. Due to the large file size, the data couldn't be uploaded directly to GitHub.

## Project Steps

1. **Download Covid Data**:
   - Download the latest Covid-19 information from [ourworldindata.org](https://ourworldindata.org/covid-deaths).

2. **Data Splitting**:
   - Split the downloaded data from the CSV file into two datasets: CovidDeaths and CovidVaccinated.

3. **SQL Server Setup**:
   - Open your SQL server.

4. **Data Import**:
   - Import the CovidDeaths data into your SQL server.

5. **Data Manipulation**:
   - Use SQL queries provided in the project's code to manipulate and analyze your data.

6. **Data Type Check**:
   - Check the data types of all columns using the SQL command: `EXEC sp_help 'dbo.CovidDeaths'`.

7. **Data Type Alteration**:
   - Alter the data types of specific columns to `float` using SQL commands like:
     ```sql
     ALTER TABLE <tablename> ALTER COLUMN <column_name> <datatype>;
     ```
     Example:
     ```sql
     ALTER TABLE dbo.CovidDeaths ALTER COLUMN reproduction_rate float;
     ```

## Note

- The data file couldn't be uploaded to GitHub due to its size limitations. Users should follow the instructions to download and import the data themselves.
- In addition to CovidDeaths, the project also mentions using the "Vaccination Table," so ensure that it's available for analysis.

## Prerequisites

Before working on this project, make sure you are familiar with the following SQL concepts:

- Common Table Expressions (CTE)
- Temporary Tables (TEMP TABLE)
- Views
- ORDER BY
- PARTITION BY
- JOIN operations

## Contact

If you have any questions or need assistance, feel free to contact the project maintainer at stefanmills8@gmail.com.

Happy coding!

