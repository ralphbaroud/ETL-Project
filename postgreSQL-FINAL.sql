-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

DROP TABLE if exists happiness;
DROP TABLE if exists crime;
DROP TABLE if exists innovation;
DROP TABLE if exists weather;
DROP TABLE if exists fertility;


CREATE TABLE "happiness" (
    "country" varchar(255)   NOT NULL,
    "happiness_index" float   NOT NULL,
    "happiness_rank" int   NOT NULL,
    "year" int   NOT NULL,
    CONSTRAINT "pk_happiness" PRIMARY KEY (
        "country","year"
     )
);

CREATE TABLE "crime" (
    "country" varchar(255)   NOT NULL,
    "crime_index" float   NOT NULL,
    "crime_rank" int   NOT NULL,
    "year" int   NOT NULL,
    CONSTRAINT "pk_crime" PRIMARY KEY (
        "country","year"
     )
);

CREATE TABLE "innovation" (
    "country" varchar(255)   NOT NULL,
    "innovation_index" float   NOT NULL,
    "year" int   NOT NULL,
    CONSTRAINT "pk_innovation" PRIMARY KEY (
        "country","year"
     )
);

CREATE TABLE "weather" (
    "country" varchar(255)   NOT NULL,
    "sunshine_days_per_year" int   NOT NULL,
    "year" int   NOT NULL,
    CONSTRAINT "pk_weather" PRIMARY KEY (
        "country","year"
     )
);

CREATE TABLE "fertility" (
    "country" varchar(255)   NOT NULL,
    "births_per_woman" float   NOT NULL,
    "year" int   NOT NULL,
    CONSTRAINT "pk_fertility" PRIMARY KEY (
        "country","year"
     )
);

select * from happiness limit 5;
select * from crime limit 5;
select * from innovation limit 5;
select * from weather limit 5;
select * from fertility order by births_per_woman desc; 

select * from happiness where Country = 'Switzerland';

SELECT h.country, h.happiness_index, h.happiness_rank, h.year, f.births_per_woman, c.crime_index, c.crime_rank, 
       w.sunshine_days_per_year, i.innovation_index
 FROM happiness h, fertility f, crime c, weather w, innovation i
 WHERE h.country = f.country and f.country = c.country and c.country = w.country and w.country = i.country
   and h.year = f.year and f.year = c.year and c.year = w.year and w.year = i.year
   and h.year = 2015;




