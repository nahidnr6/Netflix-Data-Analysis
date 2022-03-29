-- Found this Netflix dataset from Kaggle with data for every show and movie added on Netflix. Lets see what we can learn from this
-- This selects all the data, limiting to only 5 entries 
SELECT *
FROM netflix_titles_csv ntc 
limit 50

-- Find out how many movies and tv shows are on Netflix 
SELECT type, count(type)
FROM netflix_titles_csv ntc 
group by "type" 
-- This query shows there are 6,131 movies on Netflix vs 2,676 TV Shows 

--What if we wanted to filter it to only shows available in the United States 
SELECT type, count(type)
FROM netflix_titles_csv ntc 
WHERE country like '%United States%'
group by "type" 
-- This lowers the amount to 2,752 movies and 938 TV shows available to users in the U.S. 

-- I want to find out the how many tv shows/ movies they have for each year 
SELECT release_year , count(title) as 'Number of Movies/TV Shows'
from netflix_titles_csv ntc 
group by release_year 
ORDER by release_year desc
-- It looks like the most shows were released in the year 2018 at 1,147 

--I now want to know how many movies they added each year, to see if they are giving us more content throughout the years or less 
SELECT COUNT(title)
FROM netflix_titles_csv ntc 
WHERE date_added like '_____21'
-- Found out that in 2021, 856 movies were added. I will create a new table with the amount of movies Netflix added each year since 2014. I will change the year each time 

--Creating new table
CREATE TABLE netflix_yearly_releases (
	year_added varchar, 
	shows_added integer

);

--Selecting everything from netflix_yearly_releases table 
SELECT * FROM netflix_yearly_releases nyr 



-- adding all the data to the new table
INSERT INTO netflix_yearly_releases (year_added, shows_added)
VALUES (2021, 856)

INSERT INTO netflix_yearly_releases (year_added, shows_added)
VALUES (2020, 1025)

INSERT INTO netflix_yearly_releases (year_added, shows_added)
VALUES (2019, 1060)


INSERT INTO netflix_yearly_releases (year_added, shows_added)
VALUES (2018, 830)

INSERT INTO netflix_yearly_releases (year_added, shows_added)
VALUES (2017, 585)

INSERT INTO netflix_yearly_releases (year_added, shows_added)
VALUES (2016, 192)

INSERT INTO netflix_yearly_releases (year_added, shows_added)
VALUES (2015, 40)

INSERT INTO netflix_yearly_releases (year_added, shows_added)
VALUES (2014, 10)

-- All the entries where added. Copying the code to select all columns from new table below 
SELECT * FROM netflix_yearly_releases nyr 
-- From the table, the number of shows added each year increased each year until 2020. In 2019, 1,060 shows were added which was the peak. It is slowly declining. In 2021 856 shows were added. Lets see at the end of the year if this downward trend will continue. 

-- Lets see all the different ratings there are for movies/shows 
select DISTINCT rating 
From netflix_titles_csv ntc


-- Selecting type, title , director, release_year, rating, duration, and listed in for all shows/movies in the U.S. to use for tableau visualization
SELECT type, title , director ,release_year , rating , country, duration
FROM netflix_titles_csv ntc 
WHERE country like '%United States%'



