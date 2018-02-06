-- Week 1 assignment

-- 1. How many airplanes have listed speeds? 23
-- What is the minimum listed speed? 90
-- the maximum listed speed? 432

SELECT COUNT(*) FROM planes WHERE speed IS NOT NULL;
SELECT MAX(speed) FROM planes;
SELECT MIN(speed) FROM planes;

-- 2. What is the total distance flown by all of the planes in January 2013? 27188805
-- What is the total distance flown by all of the planes in January 2013 where the tailnum is missing? 81763

SELECT SUM(distance) FROM flights WHERE year=2013 AND month=1;
SELECT SUM(distance) FROM flights WHERE year=2013 AND month=1 AND tailnum IS NULL;

-- What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? 
-- Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare?
-- They both show the same information except the left outer join shows the total distance for planes with no manufacturer

SELECT manufacturer, sum(distance) FROM flights INNER JOIN planes on 
flights.tailnum = planes.tailnum WHERE month=7 AND day=5 AND flights.year=2013 GROUP BY manufacturer;

SELECT manufacturer, sum(distance) FROM flights LEFT OUTER JOIN planes on 
flights.tailnum = planes.tailnum WHERE month=7 AND day=5 AND flights.year=2013 GROUP BY manufacturer;

-- Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database.
-- What airport had the most filghts depart in 2013

SELECT COUNT(*) AS 'Number of Flights', flights.origin
FROM flights 
LEFT JOIN planes
ON flights.tailnum = planes.tailnum
LEFT JOIN airports ON flights.origin = airports.faa
WHERE planes.year = 2013
ORDER BY  origin desc limit 1;