Select location,sum(new_cases) as cases, sum(new_deaths) as deaths
From covidDataTable
WHERE location IS NOT NULL
GROUP BY location
ORDER BY 1

--Total cases , deaths and rate of death by country from 2020-2023

Select location,sum(new_cases) as cases, sum(new_deaths) as deaths,(sum(new_deaths)/sum(new_cases)*100) AS rate
From covidDataTable
WHERE location IS NOT NULL
GROUP BY location
HAVING sum(new_cases)!=0
ORDER BY 1

--Total cases per population
Select location,sum(new_cases) as total_cases,population, (sum(new_cases)/population*100) AS rate_of_infection
From covidDataTable
WHERE location IS NOT NULL
GROUP BY location, population
HAVING (sum(new_cases)/population>0)
ORDER BY 1

--Countries and their rates of infection
Select location,date,sum(new_cases) as total_cases, (sum(new_cases)/population*100) AS highest_rate_of_infection
From covidDataTable
WHERE location IS NOT NULL
GROUP BY location,population
HAVING (sum(new_cases)/population>0)
ORDER BY 2 DESC


Select location,population,date,max(total_cases) as total_cases, (max(total_cases)/population*100) AS highest_rate_of_infection
From covidDataTable
WHERE location IS NOT NULL
GROUP BY location,population,date
HAVING (sum(new_cases)/population>0)
ORDER BY 5 DESC





--What country has the highest population infection rate?
Select TOP 12 location, (sum(new_cases)/population*100) AS highest_rate_of_infection
From covidDataTable
WHERE location IS NOT NULL
GROUP BY location,population
HAVING (sum(new_cases)/population>0)
ORDER BY 2 DESC


--What countries have the highest death count
Select Top 12 location,sum(new_deaths) AS total_deaths
From covidDataTable
WHERE location IS NOT NULL
GROUP BY location
ORDER BY 2 DESC

--OR
Select Top 12 location,MAX(total_deaths) AS total_deaths
From covidDataTable
WHERE location IS NOT NULL
GROUP BY location
ORDER BY 2 DESC

--Total amount of people in the world who have been vaccinated against population segmented by country
Select location,MAX(people_vaccinated) AS total_vaccinated, population, (MAX(people_vaccinated)/population *100)
From covidDataTable
WHERE location IS NOT NULL
GROUP BY location,population
ORDER BY 2 DESC




