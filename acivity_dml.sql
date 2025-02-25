use moviecatalogue;

Insert into Actor(ActorId, Firstname,Lastname,Birthdate) values
	(1,"bill", "Murray",'1950-09-21'),
    (2,"Dan","Aykroyd",'1952-07-01'),
    (3,"Jhon","Candy",'1950-10-31'),
    (4,"Steve","Martin",null),
    (5,"Slyvester","Stailone",null);

select * from actor;
    
Insert into Director(DirectorID , Firstname,Lastname,Birthdate) values
	(1,"Ivan","Reitman",'1946-10-27'),
    (2,"Ted","Kotcheff",null);
    
select * from director;

create table rating(
RatingID Int Primary key,
RatingName char(5) Not Null
);

Insert into Rating(RatingID,RatingName) values
	(1,"G"),
    (2,"PG"),
    (3,"PG-13"),
    (4,"R");
    
select * from rating;

Insert into genre(GenreID, GenreName) values
	(1,"Action"),
    (2,"Comedy"),
    (3,"Darma"),
    (4,"Horror");
    
select * from genre;

Alter table movie add RatingId int Null;
Alter table movie add foreign key(RatingId) references rating(RatingID);

Insert Into movie(movieId,genreId,directorId,RatingId,title,releasedate) values
	(1,1,2,4,"Rambo:First Blood",'1982-10-22'),
    (2,2,null,4,"Planes,Trains & Automobiles","1987-11-25"),
    (3,2,1,2,"Ghostbusters",null),
    (4,2,null,2,"The Great Outdoors","1988-06-17");
    
select * from movie;

Insert into Castmembers(castmemberID,ActorID,MovieId,role) values
	(1,5,1,"john Rambo"),
    (2,4,2,"Neil Paqe"),
    (3,3,2,"Del Griffith"),
    (4,1,3,"Dr.Peter Venkman"),
    (5,2,3,"Dr.Raymond Stanz"),
    (6,2,4,"Roman Craig"),
    (7,3,4,"Chet Ripley");

select * from castmembers;

Set Sql_safe_updates=0;
update movie set
title=" Ghostbusters (1984)" ,
releasedate="1984-06-08"
where movieId=3;


select * from movie;

update genre set 
genrename="Action/Adventure"
Where genreId=1;

select * from genre;

Set sql_safe_updates=0;
delete from castmembers 
	where MovieID=1;

delete from movie 
	 where title ="Rambo:First Blood";
	
select * from movie ;

Alter table actor add DateOfDeath date ;
select * from actor;

update actor set
Dateofdeath="1994-3-4"
where actorId=3;

select * from actor;



