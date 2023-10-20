CREATE TABLE Companies (
    company_id serial PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    registration_date DATE,
    UNIQUE (company_name)
);
CREATE TABLE Departments (
    department_id serial PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    company_id INT REFERENCES Companies(company_id),
    UNIQUE (department_name, company_id)
);
CREATE TABLE Employees (
    employee_id serial PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT REFERENCES Departments(department_id),
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2) CHECK (salary >= 0),
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    UNIQUE (email, phone)
);
CREATE TABLE Projects (
    project_id serial PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    department_id INT REFERENCES Departments(department_id),
    CHECK (start_date <= end_date)
);
CREATE TABLE Employee_Projects (
    employee_id INT REFERENCES Employees(employee_id),
    project_id INT REFERENCES Projects(project_id),
    PRIMARY KEY (employee_id, project_id)
);

INSERT INTO Companies (company_name, location, registration_date)
VALUES
    ('Company A', 'Location A', '2023-01-10'),
    ('Company B', 'Location B', '2023-02-15'),
    ('Company C', 'Location C', '2023-03-20'),
    ('Company D', 'Location D', '2023-04-25'),
    ('Company E', 'Location E', '2023-05-30');

INSERT INTO Departments (department_name, company_id)
VALUES
    ('HR Department', 1),
    ('Sales Department', 1),
    ('Engineering Department', 2),
    ('Marketing Department', 2),
    ('Finance Department', 3);

INSERT INTO Employees (first_name, last_name, department_id, hire_date, salary, email, phone)
VALUES
    ('John', 'Doe', 1, '2023-01-15', 50000, 'john.doe@email.com', '123-456-7890'),
    ('Jane', 'Smith', 1, '2023-02-20', 55000, 'jane.smith@email.com', '234-567-8901'),
    ('David', 'Johnson', 2, '2023-03-25', 60000, 'david.johnson@email.com', '345-678-9012'),
    ('Sarah', 'Williams', 3, '2023-04-30', 65000, 'sarah.williams@email.com', '456-789-0123'),
    ('Michael', 'Brown', 4, '2023-05-05', 70000, 'michael.brown@email.com', '567-890-1234');

INSERT INTO Projects (project_name, start_date, end_date, department_id)
VALUES
    ('Project X', '2023-02-01', '2023-04-30', 1),
    ('Project Y', '2023-03-15', '2023-05-15', 2),
    ('Project Z', '2023-04-01', '2023-06-30', 3),
    ('Project A', '2023-05-15', '2023-07-15', 4),
    ('Project B', '2023-06-01', '2023-08-31', 5);
