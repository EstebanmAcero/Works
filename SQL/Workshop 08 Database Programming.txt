


Practice 9-1: Using the Set Operators

Overview
In this practice, you write queries using the set operators UNION, INTERSECT, and
MINUS.
Tasks
1. The HR department needs a list of department IDs for departments that do
not contain thejob ID ST_CLERK. Use the set operators to create this report.

select (department_id)
	from hr.employees
minus
select  (department_id)
    from hr.employees
    where job_id = 'ST_CLERK'


2. The HR department needs a list of countries that have no departments
located in them. Display the country IDs and the names of the countries. Use
the set operators to create thisreport.

select country_name
	from hr.countries
minus
select country_name
    from hr.countries c
    join hr.locations l on ( c.country_id = l.country_id )
    join hr.departments d on (l.location_id= d.location_id )





3. Produce a list of jobs for departments 10, 50, and 20, in that order. Display
the job ID anddepartment ID by using the set operators.


select distinct(job_id) ,department_id
    from hr.employees
    where department_id = 10
union all  --- union solo organiza 
select distinct(job_id) ,department_id
    from hr.employees
    where department_id = 50   
union all
select distinct(job_id) ,department_id
    from hr.employees
    where department_id = 20 



4. Create a report that lists the employee IDs and job IDs of those employees
who currentlyhave a job title that is the same as their previous one (that is,
they changed jobs but havenow gone back to doing the same job they
did previously).


select employee_id, job_id
    from hr.employees
intersect
select employee_id, job_id
from hr.job_history 



5. The HR department needs a report with the following specifications:
• Last names and department IDs of all employees from the
EMPLOYEEStable,regardless of whether or not they belong to a
department

• Department IDs and department names of all departments from the
DEPARTMENTS
table, regardless of whether or not they have employees working in them

Write a compound query to accomplish this report


select last_name, department_id , '(null)' dept_name
	from hr.employees
union
select '(null)', department_id, department_name
	from hr.departments

