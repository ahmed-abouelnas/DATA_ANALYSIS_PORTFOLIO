

-- collecting data by each decade from 1980 till 2020
select * from movies



--start with the 1980s

--ranking movies based on gross

SELECT * from movies
where year < 1990
order by gross desc

--most appereance by a director in the 80's
select director,count(director) as Directed_Movies
from movies
where year < 1990
group by director
order by Directed_Movies desc


--most lead roles in the 80's
select star, count(star) as Lead_Roles
from movies
where year < 1990
group by star
order by Lead_Roles desc

--top rated movies of the 80s
select * from movies
where year < 1990
order by score desc

--most grossed star/director/company in the 80's
select director, sum(gross) as Total_Gross from movies
where year < 1990
group by director
order by Total_Gross desc

select star, sum(gross) as Total_Gross from movies
where year < 1990
group by star
order by Total_Gross desc

select company, sum(gross) as Total_Gross from movies
where year < 1990
group by company
order by Total_Gross desc


--Decade 1990's


--most grossing movies of the 90's

SELECT name, year, gross from movies
where year between 1990 and 1999
order by gross desc

--most appereance by a director in the 90's
select director,count(director) as Directed_Movies
from movies
where year between 1990 and 1999
group by director
order by Directed_Movies desc


--most lead roles in the 90's
select star, count(star) as Lead_Roles
from movies
where year between 1990 and 1999
group by star
order by Lead_Roles desc

--top rated movies of the 90s
select * from movies
where year between 1990 and 1999
order by score desc

--most grossed star/director/company in the 90's
select director, sum(gross) as Total_Gross from movies
where year between 1990 and 1999
group by director
order by Total_Gross desc

select star, sum(gross) as Total_Gross from movies
where year between 1990 and 1999
group by star
order by Total_Gross desc

select company, sum(gross) as Total_Gross from movies
where year between 1990 and 1999
group by company
order by Total_Gross desc



--Decade 2000's

--most grossing movies of the 2000's

SELECT name, year, gross from movies
where year between 2000 and 2009
order by gross desc

--most appereance by a director in the 2000's
select director,count(director) as Directed_Movies
from movies
where year between 2000 and 2009
group by director
order by Directed_Movies desc


--most lead roles in the 2000's
select star, count(star) as Lead_Roles
from movies
where year between 2000 and 2009
group by star
order by Lead_Roles desc

--top rated movies of the 2000's
select * from movies
where year between 2000 and 2009
order by score desc

--most grossed star/director/company in the 2000's
select director, sum(gross) as Total_Gross from movies
where year between 2000 and 2009
group by director
order by Total_Gross desc

select star, sum(gross) as Total_Gross from movies
where year between 2000 and 2009
group by star
order by Total_Gross desc

select company, sum(gross) as Total_Gross from movies
where year between 2000 and 2009
group by company
order by Total_Gross desc



--Decade 2010's

--most grossing movies of the 2010's

SELECT name, year, gross from movies
where year between 2010 and 2019
order by gross desc

--most appereance by a director in the 2010's
select director,count(director) as Directed_Movies
from movies
where year between 2010 and 2019
group by director
order by Directed_Movies desc


--most lead roles in the 2010's
select star, count(star) as Lead_Roles
from movies
where year between 2010 and 2019
group by star
order by Lead_Roles desc

--top rated movies of the 2010's
select * from movies
where year between 2010 and 2019
order by score desc

--most grossed star/director/company in the 2010's
select director, sum(gross) as Total_Gross from movies
where year between 2010 and 2019
group by director
order by Total_Gross desc

select star, sum(gross) as Total_Gross from movies
where year between 2010 and 2019
group by star
order by Total_Gross desc

select company, sum(gross) as Total_Gross from movies
where year between 2010 and 2019
group by company
order by Total_Gross desc
