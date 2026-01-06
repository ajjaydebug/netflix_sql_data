
-- Netflix Project
DROP TABLE IF EXISTS netflix;

CREATE TABLE netflix (
    show_id VARCHAR(6),
    type VARCHAR(12),
    title VARCHAR(150),
    director VARCHAR(208),
    cast_members VARCHAR(1000),
    country VARCHAR(150),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(15),
    listed_in VARCHAR(120),
    description VARCHAR(250)
);

SELECT * FROM netflix;
SELECT DISTINCT TYPE FROM netflix;
SELECT COUNT(*) AS total from netflix;
SELECT COUNT(*) from netflix;

--Count the number of movies and shows from Database

SELECT 
type,
COUNT(*) as Total_Count_Types
FROM netflix
GROUP BY type;


--Find most common rating for the movies and tv shows
SELECT 
type,
rating
FROM
(select 
type ,
rating,
COUNT(*),
RANK() OVER(PARTITION BY TYPE ORDER BY COUNT(*)DESC) as ranking
from netflix
GROUP BY 1,2
) as T1
where
ranking  = 1



--List all movies that are released in a specific year (eg:2004)

select * from netflix
where
type = 'Movie'
AND 
release_year= 2020;

---Find the top 5 countries with most content on the netflix


select 
country,
count(show_id)as top_count
from netflix
group by 1
order by 2 DESC
LIMIT 5;

--LIST OUT THE LONGEST MOVIE

select * FROM netflix
where 
type = 'Movie'
and 
duration = (select MAX(duration) FROM netflix);




 
