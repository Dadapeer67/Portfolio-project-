Select*
From portfolioproject..CovidDeaths$
WHERE Continent is not NULL
order by 3,4

--Select*
--From project..CovidVaccinations$
--order by 3,4
Select location,date,total_cases,new_cases,total_deaths,population
From portfolioproject..CovidDeaths$
order by 1,2


--Total cases v/s total deaths
--Shows likelyhood o dying if you contract covid in your country
Select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as Deathpercentage
From portfolioproject..CovidDeaths$
WHERE location like'%India%'
order by 1,2

--Looking at total cases v/s Population
--shows what population got covid
Select location,date,total_cases,population,(total_cases/population)*100 as PercentPopulationInfected
From portfolioproject..CovidDeaths$
--WHERE location like'%India%'
order by 1,2

--Countries with highest infection rate  compared to population
Select location, population,MAX(total_cases),Max((total_cases/population))*100 as PercentPopulationInfected
From portfolioproject..CovidDeaths$
Group By population,location
order by PercentPopulationInfected desc


--Showing the Highest Death count per population
Select location,MAX(cast(total_deaths as int)) as TotalDeathCount
From portfolioproject..CovidDeaths$
Where continent is not null
Group By location
order by TotalDeathCount desc


--Let's Break by Continent
Select location,MAX(cast(total_deaths as int)) as TotalDeathCount
From portfolioproject..CovidDeaths$
Where continent is  null
Group by location
order by TotalDeathCount desc

--Showing Continent with Highest Death count

Select SUM(new_cases) as Totalcases,SUM(cast (new_deaths as int )) as Totaldeaths,SUM(cast (new_deaths as int ))/SUM(New_cases)*100 as Deathpercentage
From portfolioproject..CovidDeaths$
--WHERE location like'%India%'
where continent is not null
--Group By date
order by 1,2

--Looking at Total population and Vaccination
Select dea.date,dea.continent,dea.location,dea.population,vac.new_vaccinations
FROM portfolioproject..CovidDeaths$ dea
Join portfolioproject..CovidVaccinations$  vac
 On dea.location=vac.location
 where dea.continent is not null
and dea.date=vac.date
order by 1,2,3

---Creating a view  for Later Visulaization
Create  View  Newcases AS
Select SUM(new_cases) as Totalcases,SUM(cast (new_deaths as int )) as Totaldeaths,SUM(cast (new_deaths as int ))/SUM(New_cases)*100 as Deathpercentage
From portfolioproject..CovidDeaths$
--WHERE location like'%India%'
where continent is not null
--Group By date
--order by 1,2

CREATE VIEW PopulationacrossworldInfected as
--Looking at total cases v/s Population
--shows what population got covid
Select location,date,total_cases,population,(total_cases/population)*100 as PercentPopulationInfected
From portfolioproject..CovidDeaths$
--WHERE location like'%India%'
--order by 1,2


  


