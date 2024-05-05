

Practice 7: Using Subqueries to Solve Queries
Overview
In this practice, you write complex queries using nested SELECT
statements.
For practice questions, you may want to create the inner query first. Make
sure that it runs and produces the data that you anticipate before
you code the outer query.
Tasks



1. The HR department needs a query that prompts the user for an
employee’s last name. Thequery then displays the last name and hire
date of any employee in the same department as the employee
whose name the user supplies (excluding that employee). For
example, ifthe user enters Zlotkey, find all employees who work with
Zlotkey (excluding Zlotkey).



select last_name, hire_date
        from hr.employees
        where department_id in (
                select department_id
                	from hr.employees
                	where last_name = 'Zlotkey')
                        and last_name<>'Zlotkey'


select last_name, hire_date
        from hr.employees
        where department_id in (
                select department_id
                	from hr.employees
                	where last_name = &Ingresar_nombre)
                        and last_name<>&Ingresar_nombre


2. Create a report that displays the employee number, last name, and
salary of all employeeswho earn more than the average salary. Sort the
results in ascending order by salary


select employee_id, last_name, salary
        from hr.employees
        where salary > (
                    select avg(salary)
                    	from hr.employees)
		order by salary asc


3. Write a query that displays the employee number and last name of all
employees who workin a department with any employee whose last
name contains the letter “u.”

select employee_id, last_name
        from hr.employees
        where department_id in (
                    select department_id
                            from hr.employees
                            where last_name like '%u%')



4. The HR department needs a report that displays the last name,
department number, andjob ID of all employees whose department
location ID is 1700.


select last_name, department_id, job_id
        from hr.employees 
        where department_id in(
                    select department_id
                            from hr.departments
                            where location_id =1700)


5. Create a report for HR that displays the last name and salary of every
employee whoreports to King.


select last_name, salary
        from hr.employees
        where manager_id in 
                (select employee_id
                        from hr.employees
                        where last_name = 'King' )


6. Create a report for HR that displays the department number, last name,
and job ID for everyemployee in the Executive department.


select department_id, last_name,job_id
from hr.employees
where department_id in (select department_id
                        from hr.departments
                        where department_name='Executive')




7. Create a report that displays a list of all employees whose salary is more
than the salary ofany employee from department 60.

select last_name
        from hr.employees
        where salary > any
                    (select salary 
                            from hr.employees
                            where department_id  = 60)



8. Modify the query in point 3 to display the employee number, last name,
andsalary of all employees who earn more than the average salary,
and who work in a department with any employee whose last name

contains the letter “u.”


select employee_id, last_name, salary
        from hr.employees
        where department_id in (
                    select department_id
                            from hr.employees
                            where last_name like '%u%')
		and 	salary > (
        			select avg(salary) 
        					from hr.employees
        			)

