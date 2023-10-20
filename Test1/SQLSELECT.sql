SELECT * FROM visit;

SELECT * FROM doctor WHERE work_experience > 3;

SELECT * FROM patient WHERE age > 20 LIMIT 5;

SELECT count(patient.pid) FROM patient  GROUP BY age;