SELECT employees.emp_no,
employees.first_name,
employees.last_name,
titles.title,
titles.from_date,
titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')

SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC

SELECT * FROM unique_titles;

SELECT COUNT(title),
title
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC

SELECT * FROM retiring_titles;

SELECT DISTINCT ON (titles.emp_no)
employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
dept_emp.from_date,
dept_emp.to_date,
titles.title
INTO mentorship_eligibilty
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND
(titles.to_date = '9999-01-01')
ORDER BY titles.emp_no;

SELECT * FROM mentorship_eligibilty;

SELECT SUM (count) as total_retiring_employees
INTO total_retiring_employees
FROM retiring_titles;

SELECT COUNT(emp_no) as retirement_ready
INTO retirement_ready
FROM mentorship_eligibilty;

SELECT * FROM retirement_ready;
