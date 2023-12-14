
--SELECT ALL DATASET TO BE USED

SELECT *
FROM ProjectOne.dbo.CovidDeaths

SELECT *
FROM ProjectOne.dbo.CovidVaccinations

--SELECT SPECIFIC DATASET TO BE USED

SELECT Location, Date, population, total_cases, new_cases, total_deaths
FROM ProjectOne.dbo.CovidDeaths
ORDER BY 1, 2

SELECT Location, Date, population, total_cases, new_cases, total_deaths
FROM ProjectOne.dbo.CovidDeaths
WHERE location like 'Nigeria'
Order by 4 desc

--LOOKING AT TOTAL CASES vs TOTAL DEATHS
--LOOKING AT LIKELIHOOD OF DEATH AFTER CONTRACTING COVID IN YOUR COUNTRY

SELECT Location, Date, total_cases, total_deaths, (total_deaths/total_cases)
FROM ProjectOne.dbo.CovidDeaths
ORDER BY 1, 2

SELECT Location, Date, population, total_cases, total_deaths, (total_deaths/total_cases)*100 as PercentageDeath
FROM ProjectOne.dbo.CovidDeaths
WHERE location like 'Nigeria'
Order by 4 desc


--LOOKING AT TOTAL CASES vs POPULATION
--PERCENTAGE OF POPULATION INFECTED

SELECT Location, Date, population, total_cases, total_deaths, (total_cases/population)*100 as PercentageDeath
FROM ProjectOne.dbo.CovidDeaths
--WHERE location like 'Nigeria'
Order by 1,2 

--LOOKING AT COUNTRIES WITH HIGHEST INFECTION RATE COMPARED TO POPULATION

SELECT Location, population, max(total_cases) as MaxTotalCase, max((total_cases/population)*100) as MaxPercentageCases
FROM ProjectOne.dbo.CovidDeaths
--WHERE location like 'Nigeria'
Group by location, population
Order by  3 desc

SELECT Location, population, max(total_cases) as MaxTotalCase, max((total_cases/population)*100) as MaxPercentageCases
FROM ProjectOne.dbo.CovidDeaths
WHERE location like 'Nigeria'
Group by location, population

--LOOKING AT COUNTRIES WITH HIGHEST INFECTION RATE COMPARED TO POPULATION

SELECT Location, max(cast(total_deaths as int)) as MaxDeath
FROM projectone.dbo.CovidDeaths
--WHERE location like 'Nigeria'
--WHERE continent is null
Group by location
Order by  2 desc

--BREAKDOWN BY CONTINENTS
--Looking at continent with max death count

SELECT location, total_deaths
FROM ProjectOne.dbo.CovidDeaths
where location like 'Africa'
order by 2 desc

SELECT continent, max(cast(total_deaths as int)) as MaxDeath
FROM projectone.dbo.CovidDeaths
--WHERE location like 'Nigeria'
WHERE continent is not null
Group by continent
Order by  2 desc

--GLOBAL STATS

SELECT date, SUM(cast(total_cases as int)) as TotalGlobalCases, SUM(cast(total_deaths as int)) as TotalGlobalDeath 
FROM projectone.dbo.CovidDeaths
--WHERE location like 'Nigeria'
--WHERE continent is null
Group by date
Order by  1 desc


SELECT SUM(new_cases) as TotalGlobalCases, SUM(cast(new_deaths as int)) as TotalGlobalDeath
, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as GlobalPercentageDeath
FROM projectone.dbo.CovidDeaths
--WHERE location like 'Nigeria'
WHERE continent is not null
--Group by date
Order by  1,2

SELECT date, SUM(new_cases) as TotalGlobalCases, SUM(cast(new_deaths as int)) as TotalGlobalDeath
, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as GlobalPercentageDeath
FROM projectone.dbo.CovidDeaths
--WHERE location like 'Nigeria'
WHERE continent is not null
Group by date
Order by  1,2

SELECT *
FROM ProjectOne..CovidDeaths Dea
JOIN ProjectOne..CovidVaccinations Vac
ON Dea.location = Vac.location
AND Dea.date = Vac.date

--TOTAL POPULATION VS VACCINATION

SELECT dea.continent, Dea.location, Dea.date, Dea.population, Vac.new_vaccinations
, SUM(cast(Vac.new_vaccinations as int)) OVER (Partition by dea.location order by dea.location, dea.date) as RollingVaccinatedCount
FROM ProjectOne..CovidDeaths Dea
JOIN ProjectOne..CovidVaccinations Vac
ON Dea.location = Vac.location
AND Dea.date = Vac.date
WHERE Dea.location like 'Nigeria' AND Dea.continent is not null
ORDER BY 2,3

-- TEMP TABLE

CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar (255),
Location nvarchar (255),
Date datetime,
Population int,
New_vaccinations int,
RollingVaccinatedCount int,
)

--CREATING VIEW TO STORE DATA

CREATE VIEW PercentPopulationVaccinated as
SELECT dea.continent, Dea.location, Dea.date, Dea.population, Vac.new_vaccinations
, SUM(cast(Vac.new_vaccinations as int)) OVER (Partition by dea.location order by dea.location, dea.date) as RollingVaccinatedCount
FROM ProjectOne..CovidDeaths Dea
JOIN ProjectOne..CovidVaccinations Vac
ON Dea.location = Vac.location
AND Dea.date = Vac.date
WHERE Dea.location like 'Nigeria' AND Dea.continent is not null
--ORDER BY 2,3

SELECT *
FROM PercentPopulationVaccinated