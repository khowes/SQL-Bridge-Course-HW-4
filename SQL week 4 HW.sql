/*
SQL Bridge Course Week 4 Assignment – Self-Joins
*/

DROP TABLE IF EXISTS org_chart;

-- Create table of all employees in organization
CREATE TABLE org_chart
(
	employee_id		int PRIMARY KEY,
	employee_name	varchar(20) NOT NULL,
    job_title 		varchar(20) NOT NULL,
    supervisor_id	int
);

-- Populate table
INSERT INTO org_chart (employee_id, employee_name, job_title, supervisor_id) VALUES ( 1, 'Steve Jobs', 'CEO', NULL);
INSERT INTO org_chart (employee_id, employee_name, job_title, supervisor_id) VALUES ( 2, 'Joel Podolny', 'VP, HR', 1);
INSERT INTO org_chart (employee_id, employee_name, job_title, supervisor_id) VALUES ( 3, 'Tim Cook', 'COO', 1);
INSERT INTO org_chart (employee_id, employee_name, job_title, supervisor_id) VALUES ( 4, 'John Couch', 'VP, Education Sales', 3);
INSERT INTO org_chart (employee_id, employee_name, job_title, supervisor_id) VALUES ( 5, 'John Brandon', 'VP, Channel Sales', 3);
INSERT INTO org_chart (employee_id, employee_name, job_title, supervisor_id) VALUES ( 6, 'Peter Oppenheimer', 'SVP, CFO', 1);
INSERT INTO org_chart (employee_id, employee_name, job_title, supervisor_id) VALUES ( 7, 'Betsy Rafael', 'VP, Controller', 6);
INSERT INTO org_chart (employee_id, employee_name, job_title, supervisor_id) VALUES ( 8, 'Gary Wipfler', 'VP, Treasurer', 6);

-- Create table showing who reports to whom
SELECT 
e.employee_id as employee_id,
e.employee_name as employee,
e.job_title as employee_title,
s.employee_name as supervisor,
s.job_title as supervisor_title
FROM org_chart e
LEFT JOIN org_chart s
ON e.supervisor_id = s.employee_id
ORDER BY supervisor_title;
