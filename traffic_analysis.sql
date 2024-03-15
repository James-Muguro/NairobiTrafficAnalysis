-- 1. Select all records from the table
-- This query retrieves all columns and rows from the 'traveldataset' table in the 'travel_data' schema.

SELECT * FROM travel_data.traveldataset;

-- This query will return a result set containing every record in the 'traveldataset' table.



-- 2. Count total number of records in the table
-- This query calculates and returns the total number of records (rows) in the 'traveldataset' table.

SELECT COUNT(*) FROM travel_data.traveldataset;

-- The 'COUNT(*)' function is used to count all the rows in the specified table.



-- 3. Select all columns from the 'traveldataset' table in the 'travel_data' schema
-- where the payment method is 'Mpesa'.
SELECT * 
FROM travel_data.traveldataset 
WHERE payment_method = 'Mpesa';



-- 4. Count the number of distinct destinations in the 'travel_to' column
-- from the 'traveldataset' table in the 'travel_data' schema.
SELECT COUNT(DISTINCT travel_to) 
FROM travel_data.traveldataset;



-- 5. Calculate the average of the 'max_capacity' column and alias it as 'avgCapacity'
-- from the 'traveldataset' table in the 'travel_data' schema.
SELECT AVG(max_capacity) AS avgCapacity
FROM travel_data.traveldataset;



-- 6. Calculate the average of the 'max_capacity' column and store it in a common table expression (CTE) named 'AvgCapacity'
-- from the 'traveldataset' table in the 'travel_data' schema.
WITH AvgCapacity AS (
    SELECT AVG(max_capacity) AS avgCap 
    FROM travel_data.traveldataset)

-- Select all columns from the 'traveldataset' table
-- where the 'max_capacity' is greater than the average capacity calculated in the 'AvgCapacity' CTE.
SELECT * 
FROM travel_data.traveldataset
WHERE max_capacity > (SELECT avgCap FROM AvgCapacity);



-- 7. Select distinct seat numbers from the 'traveldataset' table in the 'travel_data' schema
-- for rows where the 'ride_id' is equal to '5781'.
SELECT DISTINCT seat_number 
FROM travel_data.traveldataset
WHERE ride_id IN (SELECT ride_id FROM travel_data.traveldataset WHERE ride_id = '5781');



-- 8. Update the 'payment_receipt' column in the 'traveldataset' table in the 'travel_data' schema
-- setting the value to 'NewReceipt' for rows where the 'ride_id' is equal to a specific identifier (someID).
UPDATE travel_data.traveldataset
SET payment_receipt = 'NewReceipt'
WHERE ride_id = 5781;



-- 9. Delete rows from the 'traveldataset' table in the 'travel_data' schema
-- where the 'car_type' is 'Bus' and the 'max_capacity' is less than a specific value (someValue).
DELETE FROM travel_data.traveldataset
WHERE car_type = 'Bus' AND max_capacity < 10;



-- 10 Create a common table expression (CTE) named 'CarTypeCount'
-- to count the occurrences of each 'car_type' in the 'traveldataset' table in the 'travel_data' schema.
WITH CarTypeCount AS (
    SELECT car_type, COUNT(*) as count 
    FROM travel_data.traveldataset 
    GROUP BY car_type)
    
-- Select all columns from the 'CarTypeCount' CTE.
SELECT * 
FROM CarTypeCount;



-- 11. Select all columns from the 'traveldataset' table in the 'travel_data' schema
-- where the 'travel_time' is less than a specific time (someTime).
SELECT * 
FROM travel_data.traveldataset 
WHERE travel_time < '10:58:00';



-- 12. Select the top 1 destination ('travel_to') and its corresponding count as 'frequency'
-- from the 'traveldataset' table in the 'travel_data' schema.
-- The results are grouped by 'travel_to' and ordered in descending order by frequency.
SELECT TOP(1) travel_to, COUNT(*) as frequency
FROM travel_data.traveldataset
GROUP BY travel_to
ORDER BY frequency DESC;



-- 13. Select the 'ride_id' from the 'traveldataset' table in the 'travel_data' schema
-- for rows where the 'max_capacity' is equal to the maximum value of 'max_capacity' in the entire dataset.
SELECT ride_id
FROM travel_data.traveldataset
WHERE max_capacity = (SELECT MAX(max_capacity) FROM travel_data.traveldataset);



-- 14. Select distinct combinations of 'payment_method' and 'car_type'
-- from the 'traveldataset' table in the 'travel_data' schema.
SELECT DISTINCT payment_method, car_type
FROM travel_data.traveldataset;



-- 15. Select the 'travel_to' destination and the count of rides ('numberOfRides')
-- from the 'traveldataset' table in the 'travel_data' schema.
-- The results are grouped by 'travel_to'.
SELECT travel_to, COUNT(*) as numberOfRides
FROM travel_data.traveldataset
GROUP BY travel_to;



-- 16. Select all columns from the 'traveldataset' table in the 'travel_data' schema
-- and order the results by 'travel_time' in ascending order.
SELECT * 
FROM travel_data.traveldataset 
ORDER BY travel_time;



-- 17. Create a common table expression (CTE) named 'SeatSum'
-- to calculate the sum of 'seat_number' for each 'ride_id'
-- from the 'traveldataset' table in the 'travel_data' schema.
WITH SeatSum AS (
    SELECT ride_id, SUM(seat_number) as sum 
    FROM travel_data.traveldataset 
    GROUP BY ride_id)

-- Select all columns from the 'SeatSum' CTE.
SELECT * 
FROM SeatSum;



-- 18. Select the minimum and maximum values of 'travel_time' from the 'traveldataset' table
-- in the 'travel_data' schema.
SELECT MIN(travel_time) AS minTravelTime, MAX(travel_time) AS maxTravelTime
FROM travel_data.traveldataset;



-- 19. Select the 'ride_id' and the average value of 'seat_number' for each ride
-- from the 'traveldataset' table in the 'travel_data' schema.
SELECT ride_id, AVG(seat_number) AS avgSeatNumber
FROM (SELECT ride_id, seat_number FROM travel_data.traveldataset) AS subquery
GROUP BY ride_id;



-- 20. Create a common table expression (CTE) named 'Average'
-- to calculate the average value of 'travel_time' from the 'traveldataset' table.
WITH Average AS (
    SELECT AVG(travel_time) AS avgTravelTime 
    FROM travel_data.traveldataset
)

-- Select all columns from the 'traveldataset' table
-- where 'travel_time' is greater than the average travel time
-- and 'ride_id' is present in a subquery filtering for a specific ride_id ('5778').
SELECT * 
FROM travel_data.traveldataset 
WHERE travel_time > (SELECT avgTravelTime FROM Average) 
  AND ride_id IN (SELECT ride_id FROM table_name WHERE ride_id = '5778');



-- 21.  Most Common Payment Method
SELECT payment_method, COUNT(*) AS paymentCount
FROM travel_data.traveldataset
GROUP BY payment_method
ORDER BY paymentCount DESC;

-- This query helps identify the most common payment method used by passengers



-- 22. Total Revenue
SELECT SUM(payment_amount) AS totalRevenue
FROM travel_data.traveldataset;

-- This query calculates the total revenue generated from all travel transactions


-- 23. Popular Travel Routes
SELECT travel_from, travel_to, COUNT(*) AS routeCount
FROM travel_data.traveldataset
GROUP BY travel_from, travel_to
ORDER BY routeCount DESC;

-- This query provides information on the popularity of travel routes based on the number of rides


-- 24. Busiest Travel Times
SELECT DATE_FORMAT(travel_time, '%Y-%m-%d %H:%i:%s') AS formattedTime, COUNT(*) AS rideCount
FROM travel_data.traveldataset
GROUP BY formattedTime
ORDER BY rideCount DESC;

-- This query aggregates rides based on formatted travel times to identify peak travel times



-- 25.  Rides with Low Capacity Utilization
SELECT ride_id, (max_capacity - seat_number) AS emptySeats
FROM travel_data.traveldataset
WHERE max_capacity > seat_number;

-- This query identifies rides where there are empty seats, indicating lower capacity utilization



-- 26. verage Travel Time for Each Car Type
SELECT car_type, AVG(travel_time) AS avgTravelTime
FROM travel_data.traveldataset
GROUP BY car_type;

-- This query calculates the average travel time for each car type, providing insights
-- into the average duration of trips for different vehicle types.


-- 27. Average Seat Utilization for Each Ride
WITH SeatUtilization AS (
    SELECT ride_id, max_capacity, seat_number,
           (max_capacity - seat_number) AS emptySeats
    FROM travel_data.traveldataset
)

SELECT ride_id, max_capacity, seat_number, emptySeats,
       100 * (1 - CAST(emptySeats AS DECIMAL) / max_capacity) AS seatUtilizationPercentage
FROM SeatUtilization;

-- This query calculates the seat utilization percentage for each ride by using a CTE to compute the
-- number of empty seats


-- 28. Rides with High Demand (Max Capacity Exceeded)
WITH ExceededCapacity AS (
    SELECT ride_id, max_capacity, seat_number
    FROM travel_data.traveldataset
    WHERE seat_number > max_capacity
)

SELECT * FROM ExceededCapacity;

-- This query identifies rides where the number of occupied seats exceeds the maximum capacity.


-- 29. Travel Time Trends Over Time
WITH TimeTrends AS (
    SELECT DATE_FORMAT(travel_time, '%Y-%m') AS month, COUNT(*) AS rideCount
    FROM travel_data.traveldataset
    GROUP BY month
)

SELECT * FROM TimeTrends
ORDER BY month;

-- This query uses a CTE to analyze trends in the number of rides over different months


-- 30. Rides where the travel time is within a certain range and the 
-- seat utilization percentage is above the average
WITH SeatUtilization AS (
    SELECT ride_id, max_capacity, seat_number,
           100 * (1 - CAST(seat_number AS DECIMAL) / max_capacity) AS seatUtilizationPercentage
    FROM travel_data.traveldataset
),
TimeRangeRides AS (
    SELECT ride_id
    FROM travel_data.traveldataset
    WHERE travel_time BETWEEN '07:00:00' AND '23:00:00'
)

SELECT su.ride_id, su.max_capacity, su.seat_number, su.seatUtilizationPercentage
FROM SeatUtilization su
JOIN TimeRangeRides tr ON su.ride_id = tr.ride_id
WHERE su.seatUtilizationPercentage > (
    SELECT AVG(seatUtilizationPercentage) 
    FROM SeatUtilization
);

