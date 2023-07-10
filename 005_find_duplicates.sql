-- How to find the duplicate records in the table?

-- Create table
CREATE TABLE find_duplicate (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    email VARCHAR(100));

-- Insert data
INSERT INTO find_duplicate(id, name, age, email) VALUES
    (1, 'John Doe', 25, 'john.doe@example.com'),
    (2, 'Jane Smith', 30, 'jane.smith@example.com'),
    (3, 'Michael Johnson', 35, 'michael.johnson@example.com'),
    (4, 'Emily Davis', 28, 'emily.davis@example.com'),
    (5, 'John Doe', 40, 'john.doe@example.com'),
    (6, 'Sarah Johnson', 32, 'sarah.johnson@example.com'),
    (7, 'David Miller', 27, 'david.miller@example.com'),
    (8, 'Emily Davis', 26, 'emily.davis@example.com'),
    (9, 'Michael Johnson', 33, 'michael.johnson@example.com'),
    (10, 'John Doe', 28, 'john.doe@example.com'),
    (11, 'Sarah Johnson', 31, 'sarah.johnson@example.com'),
    (12, 'Jane Smith', 29, 'jane.smith@example.com'),
    (13, 'David Miller', 30, 'david.miller@example.com'),
    (14, 'Emily Davis', 24, 'emily.davis@example.com'),
    (15, 'Michael Johnson', 37, 'michael.johnson@example.com'),
    (16, 'John Doe', 25, 'john.doe@example.com'),
    (17, 'Jane Smith', 30, 'jane.smith@example.com');

-- Solution:

SELECT name, email from 
(select name, email, age, count(1) as dup_count 
FROM find_duplicate
GROUP BY name, email,age) A
WHERE dup_count > 1
