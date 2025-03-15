use PersonalTrainer;

-- Use an aggregate to count the number of Clients.
-- 500 rows
--------------------
select count(*) from client;


-- Use an aggregate to count Client.BirthDate.
-- The number is different than total Clients. Why?
-- 463 rows
--------------------

select count(BirthDate) from client;

-- Group Clients by City and count them.
-- Order by the number of Clients desc.
-- 20 rows
--------------------

select city,count(*) as no_of_clients from client group by city order by no_of_clients desc;


-- Calculate a total per invoice using only the InvoiceLineItem table.
-- Group by InvoiceId.
-- You'll need an expression for the line item total: Price * Quantity.
-- Aggregate per group using SUM().
-- 1000 rows
--------------------
select InvoiceId, sum(price * Quantity) total from invoicelineitem group by InvoiceId ;


-- Calculate a total per invoice using only the InvoiceLineItem table.
-- (See above.)
-- Only include totals greater than $500.00.
-- Order from lowest total to highest.
-- 234 rows
--------------------

select InvoiceId, sum(price * Quantity) total from invoicelineitem  group by InvoiceId  having sum(price * Quantity) > 500.00  order by sum(price * Quantity);


-- Calculate the average line item total
-- grouped by InvoiceLineItem.Description.
-- 3 rows
--------------------

select avg((price * Quantity)) total_avg  from invoicelineitem group by description; 

-- Select ClientId, FirstName, and LastName from Client
-- for clients who have *paid* over $1000 total.
-- Paid is Invoice.InvoiceStatus = 2.
-- Order by LastName, then FirstName.
-- 146 rows
--------------------

select c.clientid,c.firstname,c.lastname, sum(il.price * il.quantity) total from client c 
join invoice i on c.clientId=i.clientId 
join invoicelineitem il on i.invoiceid=il.invoiceid
where i.invoicestatus =2 
group by c.clientid,c.firstname,c.lastname
having sum(il.price * il.quantity) > 1000
order by c.lastname,c.firstname;



-- Count exercises by category.
-- Group by ExerciseCategory.Name.
-- Order by exercise count descending.
-- 13 rows
--------------------
select ec.name,count(e.exerciseid) from exercise e
join exercisecategory ec on e.exercisecategoryid=ec.exercisecategoryid
group by ec.name
order by count(*) DESC;

-- Select Exercise.Name along with the minimum, maximum,
-- and average ExerciseInstance.Sets.
-- Order by Exercise.Name.
-- 64 rows
--------------------

select e.name,min(ei.sets) minimum ,max(ei.sets)  maximum, avg(ei.sets)  average from exercise e join
exerciseinstance ei on e.exerciseId=ei.exerciseId
group by e.exerciseId,e.name
order by e.name ;


-- Find the minimum and maximum Client.BirthDate
-- per Workout.
-- 26 rows
-- Sample: 
-- WorkoutName, EarliestBirthDate, LatestBirthDate
-- '3, 2, 1... Yoga!', '1928-04-28', '1993-02-07'
--------------------
select w.name WorkoutName,min(birthdate) EarliestBirthDate, max(birthdate) LatestBirthDate from client c join
clientworkout cw on c.clientid=cw.clientid join
workout w on cw.workoutid = w.workoutid
group by w.workoutid;


-- Count client goals.
-- Be careful not to exclude rows for clients without goals.
-- 500 rows total
-- 50 rows with no goals
--------------------
select c.clientId,count(cg.goalid) goal_count from client c left join
clientgoal cg on c.clientid=cg.clientid
group by c.clientid
order by count(cg.goalid) ;


-- Select Exercise.Name, Unit.Name, 
-- and minimum and maximum ExerciseInstanceUnitValue.Value
-- for all exercises with a configured ExerciseInstanceUnitValue.
-- Order by Exercise.Name, then Unit.Name.
-- 82 rows
--------------------

select e.name exercise_name,u.name unit_name,min(eiv.value) minimum, max(eiv.value) maximum from exercise e
join exerciseinstance ei on e.exerciseid=ei.exerciseid
join exerciseinstanceunitvalue eiv on ei.exerciseinstanceid=eiv.exerciseinstanceid
join unit u on eiv.unitid=u.unitid
group by e.exerciseid,u.unitid
order by e.name, u.name;

-- Modify the query above to include ExerciseCategory.Name.
-- Order by ExerciseCategory.Name, then Exercise.Name, then Unit.Name.
-- 82 rows
--------------------

select ec.name ExerciseCategory_Name,e.name exercise_name,u.name unit_name,min(eiv.value) minimum, max(eiv.value) maximum from exercise e
join exercisecategory ec on e.exercisecategoryid=ec.exercisecategoryid
join exerciseinstance ei on e.exerciseid=ei.exerciseid
join exerciseinstanceunitvalue eiv on ei.exerciseinstanceid=eiv.exerciseinstanceid
join unit u on eiv.unitid=u.unitid
group by ec.name,e.name,u.name
order by e.name, u.name;


-- Select the minimum and maximum age in years for
-- each Level.
-- To calculate age in years, use the MySQL function DATEDIFF.
-- 4 rows
--------------------

select l.name level_name, min(datediff(curdate(),c.birthdate)/365) minimum_age, max(datediff(curdate(),c.birthdate)/365) maximum_age from level l join
workout w on l.levelid=w.levelid
join clientworkout cw on w.workoutid=cw.workoutid
join client c on cw.clientid=c.clientid
group by l.levelid,l.name;

-- Stretch Goal!
-- Count logins by email extension (.com, .net, .org, etc...).
-- Research SQL functions to isolate a very specific part of a string value.
-- 27 rows (27 unique email extensions)
--------------------
select substring_index(EmailAddress, '.',-1) email_extension ,count(emailaddress) login_count from login
group by substring_index(EmailAddress, '.',-1)
order by count(emailaddress) DESC;

-- Stretch Goal!
-- Match client goals to workout goals.
-- Select Client FirstName and LastName and Workout.Name for
-- all workouts that match at least 2 of a client's goals.
-- Order by the client's last name, then first name.
-- 139 rows
--------------------
SELECT
	w.`Name` WorkoutName,
    CONCAT(c.FirstName, ' ', c.LastName) ClientName,
    COUNT(cg.GoalId)
FROM Client c
INNER JOIN ClientGoal cg ON c.ClientId = cg.ClientId
INNER JOIN WorkoutGoal wg ON cg.GoalId = wg.GoalId
INNER JOIN Workout w ON wg.WorkoutId = w.WorkoutId
GROUP BY w.WorkoutId, w.`Name`, c.ClientId, c.FirstName, c.LastName
HAVING COUNT(cg.GoalId) > 1
ORDER BY c.LastName, c.FirstName;
