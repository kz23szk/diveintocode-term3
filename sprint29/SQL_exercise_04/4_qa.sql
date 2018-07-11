-- https://en.wikibooks.org/wiki/SQL_Exercises/Movie_theatres
-- 4.1 Select the title of all movies.
select title from movies;

-- 4.2 Show all the distinct ratings in the database.
select distinct rating  from movies;

-- 4.3  Show all unrated movies.
select * from movies where rating is null;

-- 4.4 Select all movie theaters that are not currently showing a movie.
select * from movietheaters where movie is null;

-- 4.5 Select all data from all movie theaters 
    -- and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
    
select t.*, m.title, m.rating
from movietheaters t
left outer join movies m
on t.movie = m.code;
 
-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.

select m.*, t.code, t.name
from movies m
left outer join movietheaters t
on t.movie = m.code;

-- 4.7 Show the titles of movies not currently being shown in any theaters.
select m.title
from movies m
left outer join movietheaters t
on t.movie = m.code
where t.code is not null;


-- 4.8 Add the unrated movie "One, Two, Three".
insert into movies values(9,  "One, Two, Three", null);

-- 4.9 Set the rating of all unrated movies to "G".
update movies set rating = "G" where rating is null;

-- 4.10 Remove movie theaters projecting movies rated "NC-17".

delete from movietheaters 
where code in (select t.code
					  from movies m
					  left outer join movietheaters t
					  on t.movie = m.code
					  where m.rating = "NC-17" );
