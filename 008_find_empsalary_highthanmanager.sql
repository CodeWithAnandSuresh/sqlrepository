-- Write an SQL query to find the employees who earn more than their managers.

-- Creating the Employees table
CREATE TABLE Employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  salary DECIMAL(10, 2),
  manager_id INT
);

-- Inserting sample data into the Employees table
INSERT INTO Employees (emp_id, emp_name, salary, manager_id) VALUES
  (1, 'John Doe', 5000.00, 3),
  (2, 'Jane Smith', 6000.00, 3),
  (3, 'Michael Johnson', 7000.00, 5),
  (4, 'Emily Davis', 5500.00, 5),
  (5, 'Robert Wilson', 8000.00, NULL),
  (6, 'Sarah Brown', 4500.00, 4),
  (7, 'David Lee', 7500.00, 4),
  (8, 'Karen Taylor', 6500.00, 5),
  (9, 'Daniel Clark', 9000.00, NULL),
  (10, 'Amy Turner', 4000.00, 4);

-- SOLUTION:

SELECT e.emp_name FROM empmanager e
JOIN empmanager m
ON e.emp_id = m.emp_id
WHERE e.manager_id < m.salary
