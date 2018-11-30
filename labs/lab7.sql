/* Delete the tables if they already exist */
drop table if exists Movie;
drop table if exists Reviewer;
drop table if exists Rating;

/* Create the schema for our tables */
	create table Movie(mID int PRIMARY KEY, title text, year int, director text, UNIQUE (title, year));
	create table Reviewer(rID int PRIMARY KEY, name text NOT NULL);
	create table Rating(rID int references Reviewer(rID) ON DELETE SET NULL ON UPDATE CASCADE, mID int references Movie(mID) ON DELETE CASCADE, stars int NOT NULL, ratingDate date, UNIQUE (rID, mID, ratingDate));

/* Populate the tables with our data */
insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');

--1

ALTER TABLE movie 
ADD CONSTRAINT year CHECK( year > 1900);
ALTER TABLE rating
ADD CONSTRAINT stars CHECK( stars >= 1 and stars <= 5);
ALTER TABLE rating
ADD CONSTRAINT ratingDate CHECK( ratingDate > '2000-01-01')
ALTER TABLE movie 
ADD CONSTRAINT director CHECK((director = 'Steven Spielberg' AND year >= 1990) OR (director = 'James Cameron' AND year >= 1990) OR (year >= 1900 AND director != 'James Cameron' AND director != 'Steven Spielberg'));--2&3
--I have tried every command from the laboratory work and pgAdmin shows an error on every command supposed to be wrong, and works right when it's needed from the task.

--4-

insert into Rating values (209, 109, 3, '2001-01-01');
SELECT sum(rID) FROM rating WHERE rID is not null;
update Movie set mID = 109 where mID = 102;
update Reviewer set rID = rID + 10;
delete from Reviewer where rID > 215;
delete from Movie where mID < 105;
--Check is showing the right values ( according to the html file ).
