Select * 
From CovidProject..CovidDeaths
where continent is not null
Order By 3,4

--Select * 
--From CovidProject..CovidVaccinations
--Order By 3,4

--Select data that i'am going to be using

Select location,date,total_cases,new_cases,total_deaths,population
From CovidDeaths
where continent is not null
Order by 1,2

-- Total Cases vs Total Deaths 

-- Shows likelihood of dying if you get covid in the United States  

Select location,date,total_cases,total_deaths, (total_deaths/total_cases) * 100 AS Death_Percentage
From CovidDeaths
Where location like '%states%' 
Order by 1,2

-- Total Cases vs Population

-- Shows what percentage of the population got covid in the united states 

Select location,date,population,total_cases, (total_cases/population) * 100 AS PercentagePopulationInfected
From CovidDeaths
Where location like '%states%'
Order by 1,2

--Looking at countries with highest infection rate compared to population

Select location ,population, Max(total_cases) as HighestInfectionCount, Max(total_cases/population) * 100 AS PercentagePopulationInfected
From CovidProject..CovidDeaths
where continent is not null
Group By location,population
Order by PercentagePopulationInfected desc

-- Showing countries with highest death count per population


Select location , Max(cast(total_deaths as int)) As TotalDeathCount
From CovidProject..CovidDeaths
where continent is not null
Group By location
Order by TotalDeathCount desc

--BREAKING IT DOWN BY CONTINENT 

--Showing the continent with the highest death count per population 

Select continent , Max(cast(total_deaths as int)) As TotalDeathCount
From CovidProject..CovidDeaths
where continent is not null
Group By continent
Order by TotalDeathCount desc

-- Global numbers 


Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/
SUM(new_cases)* 100 AS Death_Percentage 
From CovidDeaths
Where continent is not null
--Group By date
Order by 1,2

-- Looking at total population vs vaccinations

Select d.continent,d.location,d.date,d.population,v.new_vaccinations
,SUM(CONVERT(int,v.new_vaccinations)) OVER (Partition By D.location Order By d.location,d.date) As RunningTotalVaccinated
From CovidDeaths D
Join CovidVaccinations V
ON D.location=v.location
and d.date=v.date
Where d.continent is not null
Order By 2,3

--Use CTE

With PopvsVac (continent,location,date,population,new_vaccinations,RunningTotalVaccinated)
as
(
Select d.continent,d.location,d.date,d.population,v.new_vaccinations
,SUM(CONVERT(int,v.new_vaccinations)) OVER (Partition By D.location Order By d.location,d.date) As RunningTotalVaccinated
From CovidDeaths D
Join CovidVaccinations V
ON D.location=v.location
and d.date=v.date
Where d.continent is not null
) 
select *, (RunningTotalVaccinated/population) *100
From PopvsVac


---Temp Table

Drop table if exists #PercentagePopulationVaccinated
Create Table #PercentagePopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar (255),
Date datetime,
Population Numeric,
New_vaccinations numeric,
RunningTotalVaccinated numeric
)


Insert into #PercentagePopulationVaccinated
Select d.continent,d.location,d.date,d.population,v.new_vaccinations
,SUM(CONVERT(int,v.new_vaccinations)) OVER (Partition By D.location Order By d.location,d.date) As RunningTotalVaccinated
From CovidDeaths D
Join CovidVaccinations V
ON D.location=v.location
and d.date=v.date
Where d.continent is not null

select *, (RunningTotalVaccinated/population) *100
From #PercentagePopulationVaccinated
go

--- Creating view to store for visualisation in Tableau

Create View VwPercentagePopulationVaccinated as
Select d.continent,d.location,d.date,d.population,v.new_vaccinations
,SUM(CONVERT(int,v.new_vaccinations)) OVER (Partition By D.location Order By d.location,d.date) As RunningTotalVaccinated
From CovidDeaths D
Join CovidVaccinations V
ON D.location=v.location
and d.date=v.date
Where d.continent is not null
---Order By 2,3

Select * from VwPercentagePopulationVaccinated

