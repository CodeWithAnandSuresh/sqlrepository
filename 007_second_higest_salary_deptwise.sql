-- How to find the second highest salary in each department?

-- Create Departments table
CREATE TABLE Departments (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Create Employees table
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);

-- Insert sample data into Departments table
INSERT INTO Departments (id, name) VALUES
    (1, 'HR'),
    (2, 'Finance'),
    (3, 'Marketing');

-- Insert sample data into Employees table
INSERT INTO Employees (id, name, salary, department_id) VALUES
    (1, 'John Doe', 50000.00, 1),
    (2, 'Jane Smith', 60000.00, 1),
    (3, 'Michael Johnson', 70000.00, 2),
    (4, 'Emily Davis', 55000.00, 2),
    (5, 'David Miller', 80000.00, 3),
    (6, 'Sarah Johnson', 65000.00, 3),
    (7, 'Adam Smith', 45000.00, 1),
    (8, 'Jessica Brown', 75000.00, 2),
    (9, 'Andrew Wilson', 70000.00, 3);

-- Solution:


SELECT id, name, salary 
  FROM 
(SELECT id, name, salary, department_id, 
  DENSE_RANK() over(partition by department_id ORDER BY salary desc) as rk 
  FROM emp) A
WHERE rk = 2
