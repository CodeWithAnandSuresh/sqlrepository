-- How to find the employees who are not present in the department table?

-- Create Employees table
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT
);

-- Create Departments table
CREATE TABLE Departments (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Insert sample data into Employees table
INSERT INTO Employees (id, name, department_id) VALUES
    (1, 'John Doe', 1),
    (2, 'Jane Smith', 2),
    (3, 'Michael Johnson', NULL),
    (4, 'Emily Davis', 3),
    (5, 'David Miller', NULL);

-- Insert sample data into Departments table
INSERT INTO Departments (id, name) VALUES
    (1, 'HR'),
    (2, 'Finance'),
    (3, 'Marketing');

-- Solution

SELECT Employees.* 
FROM Employees 
LEFT JOIN Departments 
ON Employees.department_id = Departments.id 
WHERE Departments.id IS NULL;
