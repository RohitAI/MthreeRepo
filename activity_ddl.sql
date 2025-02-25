create database MovieCatalogue ;
use MovieCatalogue;

create table Movie(
MovieID Int primary key,
GenreID int ,
constraint fk_Genre foreign key(GenreID)
	references genre(GenreID),
DirectorID int,
constraint fk_Director foreign key(DirectorID)
	references Director(DirectorID),
Title char(128) Not null,
ReleaseDate date Null
);
  
create table Genre(
GenreId Int Primary key,
GenreName char(30) Not null
);

create table Director(
DirectorId Int Primary key,
firstname char(30) Not Null,
lastname char(30) not null,
birthdate date Null
);

create table actor (
ActorId Int primary key,
firstname char(30) Not Null,
lastname char(30) Not null,
Birthdate date Null
);

create table CastMembers (
CastMemberID Int primary key,
ActorId int,
foreign key (MovieId) references actor(ActorId),
MovieId int,
foreign key (MovieId) references Movie(MovieId),
role char(30) Not Null
);



