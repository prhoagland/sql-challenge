SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no;

SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no, departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE (first_name = 'Hercules') AND (last_name LIKE 'B%');

SELECT * FROM departments;

SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
)

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no 
WHERE (departments.dept_name = 'Sales') OR (departments.dept_name = 'Development');

SELECT last_name, COUNT(*) AS last_name_counts
FROM employees
GROUP BY last_name
ORDER BY last_name_counts DESC;