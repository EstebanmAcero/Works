cod   : 202413575



Final practice
Overview
In this practice, exercises have been designed to be worked on after you have 
discussed the following topics: basic SQL SELECT statement, basic SQL Developer 
commands, and SQL functions.
Tasks

    
    
--1. The HR department needs to find data for all the clerks who were hired 
--after 1997.

select employee_id, first_name,last_name, email, phone_number, hire_date,job_id,salary
	from hr.employees
	where cast(to_char(hire_date,'YYYY') as integer) > 1997
    		and job_id = 'ST_CLERK'

    
--2. The HR department needs a report of employees who earn a commission. 
--Show the last name, job, salary, and commission of these employees. Sort 
--the data by salary in descending order.


select last_name, job_id, salary, commission_pct
    from hr.employees
	where commission_pct > 0
    order by salary desc


desc hr.employees

    
--3. For budgeting purposes, the HR department needs a report on projected 
--raises. The report should display those employees who have no 
--commission, but who have a 10% raise in salary (round off the salaries).

select 'The salary of '|| last_name|| ' after a 10% raise is ' || round(salary*1.1) as "Newsalary"
    from hr.employees
    where commission_pct is null

    
desc hr.employees
desc hr.departments
    desc hr
    
--4. Create a report of employees and their duration of employment. Show 
--the last names of all the employees together with the number of years 
--and the number of completed months that they have been employed. 
--Order the report by the duration of their employment. The employee who 
--has been employed the longest should appear at the top of the list. 


select last_name, trunc(months_between(sysdate,hire_date)/12) as Years, trunc(mod(months_between(sysdate,hire_date),12)) as Months
    from hr.employees
       order by years desc

    
select last_name,(cast((to_char(sysdate,'yyyy'))as integer)-cast(to_char( hire_date,'YYYY') as integer)) as years,abs(cast((to_char(sysdate,'mm'))as integer)-cast(to_char( hire_date,'mm') as integer)) as months
    from hr.employees, dual
    order by years desc

    


--5. 5. Show those employees who have a last name starting with the letters 
--“J,” “K,” “L,” or “M.”

select last_name
    from hr.employees
    where substr(last_name,1,1) in ('J','K','L', 'M')


--6. Create a report that displays all employees, and indicate with the words 
--Yes or No whether they receive a commission. Use the DECODE expression 
--in your query.
--You can utilize these exercises to reinforce your understanding following discussions 
--on the fundamental SQL concepts, including the basic SQL SELECT statement, 
--essential SQL Developer commands, SQL functions, joins, and group functions.

select last_name, salary, decode (commission_pct, 
    null, 'No' , 'Yes') commision
    from hr.employees



    
--7. Create a report that displays the department name, location ID, last 
--name, job title, and salary of those employees who work in a specific 
--location. Prompt the user for a location. For example, if the user enters 
--1800, results are as follows:


select d.department_name, d.location_id, e.last_name, e.job_id, e.salary
    from hr.employees e, hr.departments d
	where d.location_id = &input_location_id


select d.department_name, d.location_id, e.last_name, e.job_id, e.salary
    from hr.employees e, hr.departments d
	where d.location_id = 1800 
    
select d.department_name, d.location_id, e.last_name, e.job_id, e.salary
    from hr.employees e, hr.departments d
	where d.location_id = 1800 and last_name = 'Hartstein'
    
--8. Find the number of employees who have a last name that ends with the 
--letter “n.” Create two possible solutions.


select count(last_name) "count(*)"
    from hr.employees
    where substr(last_name,-1,1) in ('n') ;

select count(last_name) as "count(*)"
    from hr.employees
    where last_name like '%n';




    
--9. Create a report that shows the name, location, and number of employees 
--for each department. Make sure that the report also includes 
--department_IDs without employees.


select d.department_id,d.department_name, d.location_id, count(e.employee_id)
    from  hr.departments d
    join hr.employees e on (d.department_id = e.department_id)
	group by d.department_id,
	d.department_name,
    d.location_id
    


    
--10. The HR department needs to find the job titles in departments 10 and 20. 
--Create a report to display the job IDs for those departments.


select distinct(job_id)	
    from hr.employees
    where department_id in (10,20)

desc hr.employees

    
--11. Create a report that displays the jobs that are found in the Administration 
--and Executive departments. Also display the number of employees for 
--these jobs. Show the job with the highest number of employees first.


select e.job_id, count(e.employee_id) Frecuency
    from hr.employees e
    join hr.departments d on ( e.department_id=d.department_id)
    where d.department_name in ('Administration', 'Executive')
	group by e.job_id


desc hr.departments

select * 
    from hr.departments
    
--12. Show all the employees who were hired in the first half of the month 
--(before the 16th of the month, irrespective of the year).

select last_name, hire_date
    from hr.employees
    where cast(to_char(hire_date,'dd')as integer) <16

    
--13. Create a report that displays the following for all employees: last name, 
--salary, and salary expressed in terms of thousands of dollars.


select last_name, salary, trunc(salary/1000) Thousands
    from hr.employees


    
--14. Show all the employees who have managers with a salary higher than
--$15,000. Show the following data: employee name, manager name, 
--manager salary, and salary grade of the manager.

CREATE TABLE job_grades (
grade 		CHAR(1),
lowest_sal 	NUMBER(8,2) NOT NULL,
highest_sal	NUMBER(8,2) NOT NULL
);

ALTER TABLE job_grades
ADD CONSTRAINT jobgrades_grade_pk PRIMARY KEY (grade);

INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);

select shi.last_name,emp.last_name, emp.salary , g.grade grade_level
	from hr.employees emp
	join hr.employees shi on (shi.manager_id = emp.employee_id)
	join job_grades g on emp.salary between g.lowest_sal and g.highest_sal
    where emp.salary >15000
	order by emp.salary desc


desc hr.manager

select *
    from job_grades
select * 
    from hr.employees
    
--15. Show the department number, name, number of employees, and 
--average salary of all the departments, together with the names, salaries, 
--and jobs of the employees working in each department.

select d.department_id, d.department_name, (select count(distinct employee_id)
from hr.employees ee where ee.department_id=d.department_id) employees, 
    (select round(avg(salary),2) from hr.employees ee where ee.department_id = d.department_id) avg_sal,
    e.last_name, e.salary, e.job_id
    from hr.departments d
    join hr.employees e on (d.department_id = e.department_id)
    group by d.department_id,
    		 d.department_name,
    		 e.last_name,
    		 e.salary,
    		 e.job_id
    order by d.department_id






    
select avg(e.salary)
    from hr.employees e
    join hr.employees d on (d.department_id = e.department_id)
    where d.department_id =10
	group by e.salary


select department_id,count(distinct employee_id)
from hr.employees 
group by department_id

    
select *
    from hr.departments


select *
    from hr.employees

--16. Create a report to display the department number and lowest salary of 
--the department with the highest average salary.

 

select * from (select d.department_id , min(e.salary) sal
    from hr.departments d
    join hr.employees e on (d.department_id =e.department_id)
    group by d.department_id
    order by (sal) desc )
    where rownum =1
    


--17. Create a report that displays departments where no sales representatives 
--work. Include the department number, department name, manager ID, 
--and location in the output.

select d.department_id,d.department_name,d.manager_id,d.location_id
    from hr.departments d
    where d.department_id not in  (
    	select e.department_id
    		from hr.employees e
    		where job_id = 'SA-REP'
    		and department_id is not null
    )
    
--18. Create the following statistical reports for the HR department. Include the 
--department number, department name, and the number of employees 
--working in each department that:



---a. Employs fewer than three employees:

select d.department_id, d.department_name, count(e.employee_id) "COUNT(*)" 
    from hr.departments d
    join hr.employees e on (d.department_id = e.department_id)
    group by d.department_id,
    		 d.department_name
    having count(e.employee_id)<3

    
---b. Has the highest number of employees:
    
select d.department_id, d.department_name, (select max(count(ee.employee_id)) from hr.employees ee group by department_id) "COUNT(*)" 
    from hr.departments d
    join hr.employees e on (d.department_id = e.department_id)
    group by d.department_id,
    		 d.department_name

    
--c. Has the lowest number of employees:

    
select d.department_id, d.department_name, (select min(count(ee.employee_id)) from hr.employees ee group by department_id) "COUNT(*)"
    from hr.departments d
    join hr.employees e on (d.department_id = e.department_id)
    group by d.department_id,
    		 d.department_name


    
---19. Create a report that displays the employee number, last name, salary, 
--department number, and the average salary in their department for all 
--employees.


select e.employee_id,e.last_name,e.department_id, e.salary, (select avg(salary) from 
    hr.employees where department_id= e.department_id) "AVG(S.SALARY)"
    from hr.employees e


    
--20. Create an anniversary overview based on the hire date of the employees. 
--Sort the anniversaries in ascending order.

select last_name, to_char(hire_date,'Month')|| ' '||to_char(hire_date,'dd') Birthaday
	from hr.employees 
