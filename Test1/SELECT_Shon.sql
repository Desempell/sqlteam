SELECT Projects.project_name, Projects.end_date, Departments.department_name
FROM Projects
JOIN Departments ON Projects.department_id = Departments.department_id
WHERE Projects.end_date <= CURRENT_DATE
AND Departments.department_name = 'Engineering Department';

SELECT last_name, first_name
FROM Employees
WHERE department_id = 1
ORDER BY last_name
LIMIT 2;
