create view vaccinationVsCases as
select vac.location, vac.date, vac.people_fully_vaccinated,vac.positive_rate, dea.population, dea.new_cases, dea.new_deaths, (dea.new_cases/dea.population)*100 as DailyCasePercentage, (dea.new_deaths/Nullif(dea.new_cases,0))*100 as DailyDeathsPercentage
from SQLPortProject..covidDeath dea
join SQLPortProject..covidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where vac.location like 'indonesia' 
and vac.people_fully_vaccinated is not null
and vac.positive_rate is not null
--order by 2