SELECT * FROM employees;

--List the employee number, last name, first name, sex, and salary of each employee
--Join table
select emp.first_name, emp.last_name, emp.sex, sal.salary, emp.emp_no
from employees as emp
inner join salaries as sal 
on emp.emp_no = sal.emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986
select last_name, first_name, hire_date 
from employees
where EXTRACT(year FROM hire_date) = 1986;


--List the manager of each department along with their department number, department name, employee number, last name, and first name
select titles.title_id, dept.dept_no, emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from titles
inner join employees as emp
on titles.title_id = emp.emp_title_id
inner join dept_manager as depman 
on emp.emp_no = depman.emp_no
join departments as dept
on depman.dept_no = dept.dept_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name 
select dept.dept_no, emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees as emp
inner join dept_manager as depman 
on emp.emp_no = depman.emp_no
join departments as dept
on depman.dept_no = dept.dept_no

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select last_name, first_name, hire_date, sex 
from employees
where last_name like 'B%' and first_name like 'Hercules'

--list each employee in the Sales department, including their employee number, last name, and first name 
select dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
from employees as emp
inner join dept_emp as depemp
on emp.emp_no = depemp.emp_no
join departments as dept
on depemp.dept_no = dept.dept_no
where dept_name like 'Sales%'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
select dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
from employees as emp
inner join dept_emp as depemp
on emp.emp_no = depemp.emp_no
join departments as dept
on depemp.dept_no = dept.dept_no
where dept_name like 'Sales%' or 'Devel%'


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
select last_name, count(last_name) frequency
from employees 
group by last_name 
order by frequency desc;