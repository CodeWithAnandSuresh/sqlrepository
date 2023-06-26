--QUESTION: 

--Find the room types that are searched most no Of times.  Output the room type alongside the number of searches for it. 
--If the filter for room types has more than one room type, consider each unique room type as a separate row. 
--Sort the result based on the number Of searches in descending order. 

--CREATING TABLE:

create table airbnb_searches 
(
user_id int,
date_searched date,
filter_room_types varchar(200)
);

--INSERTING RECORDS:

insert into airbnb_searches values
(1,'2022-01-01','entire home,private room')
,(2,'2022-01-02','entire home,shared room')
,(3,'2022-01-02','private room,shared room')
,(4,'2022-01-03','private room')
;

--SOLUTION:

SELECT value AS room_type, 
count(1) AS no_of_searches 
FROM airbnb_searches
CROSS APPLY string_split (filter_room_types,',')
GROUP BY value
ORDER BY no_of_searches DESC



