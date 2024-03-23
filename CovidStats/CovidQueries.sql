select * from CovidDeaths
where continent is not null
order by 3,4

--Covid Death Percentage
select location, date, total_deaths, total_cases, (cast(total_deaths as decimal)/nullif(total_cases,0))*100 as DeathPercentage
from CovidDeaths
where location like '%morocco%'
order by 1,2

--Percentage of getting covid
select location, date, population, total_cases, (cast(total_cases as decimal)/population)*100 as CovidPercentage
from CovidDeaths
where location like '%morocco%'
order by 1,2

--looking at countries with highest infection rate

select location, population, max(total_cases) as HighestInfectionCount, max((cast(total_cases as decimal)/population))*100 as PercentPopulationInfected
from CovidDeaths
--where location like '%morocco%'
group by location, population
order by PercentPopulationInfected desc

-- showing countries with the highest death count per population
select location, max(total_deaths) as TotalDeathCount from CovidDeaths
--where location like '%morocco%'
where continent is not null
group by location
order by TotalDeathCount desc

-- BY CONTINENT
select continent, max(total_deaths) as TotalDeathCount from CovidDeaths
--where location like '%morocco%'
--where location is null
group by continent
order by TotalDeathCount desc

--Global

select date, sum(new_cases) as TotalCases, sum(cast(new_deaths as decimal)) as TotalDeaths, sum(nullif(new_deaths,0))/sum(cast(new_cases as decimal))*100 as DeathPercentage
from CovidDeaths
--where location like '%morocco%'
where continent != ''
group by date
order by 1,2

-- total population vs vaccination
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from 
CovidDeaths dea
join CovidVaccination vac
	on dea.location = vac.location and dea.date = vac.date
	where dea.continent != ''
	order by 2,3


	-- creating view to store data for later visualizations

	create view PercentPopulationVaccinated as select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from 
CovidDeaths dea
join CovidVaccination vac
	on dea.location = vac.location and dea.date = vac.date
	where dea.continent != ''
	
