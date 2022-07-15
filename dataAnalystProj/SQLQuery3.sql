--review the imported files
select * from SQLPortProject..covidDeath
order by 3,4

select * from SQLPortProject..covidVaccinations
order by 3,4

-- percentage of deaths of covid cases in indonesia
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from SQLPortProject..covidDeath 
where location like 'indonesia'
order by 1,2

-- percentage of people infected in indonesia
select location, date, total_cases,new_cases, population, (total_cases/population)*100 as InfectedPercentage
from SQLPortProject..covidDeath 
where location like 'indonesia'
order by 1,2

--highest percentage of new cases in asia
select continent, location, population, max(new_cases) as highestNewCases, max((new_cases/population))*100 as NewCasesPercentage
from SQLPortProject..covidDeath 
where continent like 'Asia'
group by location, population, continent
order by NewCasesPercentage desc

--total death count in the world
select location, max(cast(total_deaths as int)) as totalDeathCount
from SQLPortProject..covidDeath
where continent is not null
group by location
order by totalDeathCount desc

--global death percentage by date
select date, sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/sum(new_cases) as deathPercentage
from SQLPortProject..covidDeath
where continent is not null
group by date
order by 1


-- using CTE to make rolling count for vaccination on indonesia
with popVsVac ( continent,location,date,population,new_vaccinations,totalVacPerLocation)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(bigint,vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as totalVacPerLocation
from SQLPortProject..covidDeath dea
join SQLPortProject..covidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3
)
select *, (totalVacPerLocation/population)*100
from popVsVac
where location like 'indonesia'

--creating views on indonesia covid infected population percentage
create view infectedPrecentageIndonesia as
select location, date, total_cases,new_cases, population, (total_cases/population)*100 as InfectedPercentage
from SQLPortProject..covidDeath 
where location like 'indonesia'
--order by 1,2
