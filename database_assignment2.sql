use world;
select * from city;
select * from country;
select * from countrylanguage;
-- TASK-1 

select count(distinct name) as CITIES , count(distinct district)as DISTRICTS from city;
select name,population from city order by population asc limit 1;
select avg(lifeexpectancy) as AVERAGE from country where continent='asia';
select count(name) as COUNTRY_COUNT from country where name=localname;
-- TASK-2
select name,avg(lifeexpectancy) as AVERAGE from country where name=localname group by name;

select c.name,countrycode,count(language) cnt from countrylanguage cl inner join country c on c.code=cl.countrycode group by countrycode 
having cnt = (select max(languagecount) from (select count(language) as languagecount from countrylanguage group by countrycode) as languagecounts)
order by cnt desc;

select c.name, count(cl.language) as nonofl from countrylanguage cl inner join country c on cl.countrycode = c.code
where cl.isofficial = 'F' group by c.name
having nonofl = (select max(cnt) from (select count(language) as cnt from countrylanguage where isofficial = 'F' group by countrycode) as counts)
order by nonofl desc;