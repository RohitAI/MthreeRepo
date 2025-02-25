USE PersonalTrainer;

-- Select all columns from ExerciseCategory and Exercise.
-- The tables should be joined on ExerciseCategoryId.
-- This query returns all Exercises and their associated ExerciseCategory.
-- 64 rows
--------------------
select ec.exercisecategoryId,ec.name from exercisecategory ec join exercise e on ec.exercisecategoryId=e.exercisecategoryId;
    
-- Select ExerciseCategory.Name and Exercise.Name
-- where the ExerciseCategory does not have a ParentCategoryId (it is null).
-- Again, join the tables on their shared key (ExerciseCategoryId).
-- 9 rows
--------------------

select ec.name,e.name from ExerciseCategory ec join exercise e  on ec.exercisecategoryId=e.exercisecategoryId where ec.ParentCategoryId is null;

-- The query above is a little confusing. At first glance, it's hard to tell
-- which Name belongs to ExerciseCategory and which belongs to Exercise.
-- Rewrite the query using an aliases. 
-- Alias ExerciseCategory.Name as 'CategoryName'.
-- Alias Exercise.Name as 'ExerciseName'.
-- 9 rows
--------------------

select ec.name as CategoryName,e.name as ExerciseName from ExerciseCategory ec join exercise e  on ec.exercisecategoryId=e.exercisecategoryId where ec.ParentCategoryId is null;

-- Select FirstName, LastName, and BirthDate from Client
-- and EmailAddress from Login 
-- where Client.BirthDate is in the 1990s.
-- Join the tables by their key relationship. 
-- What is the primary-foreign key relationship?
-- 35 rows
--------------------

Select FirstName, LastName, BirthDate, l.EmailAddress from Client c join login l on c.clientId=l.clientId where c.Birthdate >='1990-01-01' and c.Birthdate<'2000-01-01';

-- Select Workout.Name, Client.FirstName, and Client.LastName
-- for Clients with LastNames starting with 'C'?
-- How are Clients and Workouts related?
-- 25 rows
--------------------

select w.name , firstname,lastname from client c
join clientworkout cw on c.clientID=cw.clientID
join workout w on cw.workoutId=w.workoutId
where c.lastname like "c%";

-- Select Names from Workouts and their Goals.
-- This is a many-to-many relationship with a bridge table.
-- Use aliases appropriately to avoid ambiguous columns in the result.
--------------------
select w.name as Workoutnames , g.name as Goalnames from workout w 
join workoutgoal wg on w.workoutId=wg.workoutId
join goal g on wg.goalId=g.goalId;


-- Select FirstName and LastName from Client.
-- Select ClientId and EmailAddress from Login.
-- Join the tables, but make Login optional.
-- 500 rows
--------------------
Select FirstName,LastName,l.ClientId ,l.EmailAddress from Client c 
left join login l on c.clientId=l.clientId;


-- Using the query above as a foundation, select Clients
-- who do _not_ have a Login.
-- 200 rows
--------------------
Select FirstName,LastName,l.ClientId ,l.EmailAddress from Client c 
left join login l on c.clientId=l.clientId
where l.emailaddress is null;



-- Does the Client, Romeo Seaward, have a Login?
-- Decide using a single query.
-- nope :(
--------------------
select ifnull(l.clientID,"nope :(") as login from login l join client c on l.clientId=c.clientId where c.firstname="Romeo" and c.lastname="Seaward";

-- Select ExerciseCategory.Name and its parent ExerciseCategory's Name.
-- This requires a self-join.
-- 12 rows
--------------------

select p.name as parentExerciseCategoryName, c.name as ExerciseCategoryName from ExerciseCategory p
join ExerciseCategory c on p.ParentCategoryId=c.ExerciseCategoryId; 

    
-- Rewrite the query above so that every ExerciseCategory.Name is
-- included, even if it doesn't have a parent.
-- 16 rows
--------------------
select p.name as parentExerciseCategoryName, c.name as ExerciseCategoryName from ExerciseCategory c
left outer join ExerciseCategory p on c.ParentCategoryId=p.ExerciseCategoryId;


    
-- Are there Clients who are not signed up for a Workout?
-- 50 rows
--------------------
Select c.clientID from client c left outer join clientworkout cw on c.clientId =cw.clientId where cw.workoutId is null;

-- Which Beginner-Level Workouts satisfy at least one of Shell Creane's Goals?
-- Goals are associated to Clients through ClientGoal.
-- Goals are associated to Workouts through WorkoutGoal.
-- 6 rows, 4 unique rows
--------------------



-- The relationship between Workouts and Exercises is... complicated.
-- Workout links to WorkoutDay (one day in a Workout routine)
-- which links to WorkoutDayExerciseInstance 
-- (Exercises can be repeated in a day so a bridge table is required) 
-- which links to ExerciseInstance 
-- (Exercises can be done with different weights, repetions,
-- laps, etc...) 
-- which finally links to Exercise.
-- Select Workout.Name and Exercise.Name for related Workouts and Exercises.
--------------------
   
-- An ExerciseInstance is configured with ExerciseInstanceUnitValue.
-- It contains a Value and UnitId that links to Unit.
-- Example Unit/Value combos include 10 laps, 15 minutes, 200 pounds.
-- Select Exercise.Name, ExerciseInstanceUnitValue.Value, and Unit.Name
-- for the 'Plank' exercise. 
-- How many Planks are configured, which Units apply, and what 
-- are the configured Values?
-- 4 rows, 1 Unit, and 4 distinct Values
--------------------