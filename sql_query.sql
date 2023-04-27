1)Write an SQL query to solve the given problem statement.
For a high-level overview of the hotels, provide us the top 5 most voted hotels in the delivery category.

SELECT name,votes,rating FROM `zomato` WHERE `zomato`.`type`='delivery' order by `zomato`.`votes` desc limit 5

2)Write an SQL query to solve the given problem statement.
The rating of a hotel is a key identifier in determining a restaurant’s performance. Hence for a particular location called Banashankari find out the top 5 highly rated hotels in the delivery category.

#write your query
SELECT name,rating,location,type FROM zomato WHERE location= 'Banashankari' and type='delivery' 
order by rating desc limit 5

3)Write an SQL query to solve the given problem statement.
compare the ratings of the cheapest and most expensive hotels in Indiranagar.

SELECT (select rating from zomato where location='Indiranagar' order by approx_cost limit 1) as rating1, 
(select rating from zomato where location='Indiranagar' order by approx_cost desc limit 1)as rating2

4)Write an SQL query to solve the given problem statement.
Online ordering of food has exponentially increased over time. Compare the total votes of restaurants that provide online ordering services and those who don’t provide online ordering service.

SELECT SUM(votes) AS total_votes, 
       online_order 
FROM zomato 
GROUP BY online_order

5)Write an SQL query to solve the given problem statement.
Number of votes defines how much the customers are involved with the service provided by the restaurants For each Restaurant type, find out the number of restaurants, total votes, and average rating. Display the data with the highest votes on the top( if the first row of output is NA display the remaining rows).

SELECT type,count(name),sum(votes)as total_votes,avg(rating) FROM zomato 
where type!='NA' GROUP BY type order by total_votes desc

6)Write an SQL query to solve the given problem statement.
What is the most liked dish of the most-voted restaurant on Zomato(as the restaurant has a tie-up with Zomato, the restaurant compulsorily provides online ordering and delivery facilities.

SELECT name,dish_liked,rating,votes from zomato where type='delivery'
and online_order='Yes' ORDER BY `zomato`.`rating` DESC, votes DESC limit 1

7)Write an SQL query to solve the given problem statement.
To increase the maximum profit, Zomato is in need to expand its business. For doing so Zomato wants the list of the top 15 restaurants which have min 150 votes, have a rating greater than 3, and is currently not providing online ordering. Display the restaurants with highest votes on the top.

#write your query
select name,rating,votes,online_order FROM zomato WHERE votes >= 150 AND rating > 3 
AND online_order = 'No' ORDER BY votes DESC LIMIT 15