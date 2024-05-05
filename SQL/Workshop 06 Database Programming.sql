


Practices for Lesson 6
Practice Overview
This practice covers the following topics
Joining tables using an equijoin
Performing outer and self-joins
Adding conditions
Displaying Data from Multiple Tables Using Joins
Overview
This practice is intended to give you experience in extracting data from
multiple tables using the SQL:1999–compliant joins
Tasks


1. Write a query for the HR department to produce the addresses of all
the departments. Use the LOCATIONS and COUNTRIES tables. Show
the location ID, street address, city, state or province, and country in
the output. Use a NATURAL JOIN to produce the results.

select l.LOCATION_ID, STREET_ADDRESS, city,STATE_PROVINCE, COUNTRY_name
    from hr.locations l
    natural join hr.countries


2. The HR department needs a report of all employees with
corresponding departments. Write a query to display the last name,
department number, and department name for these employees


select e.last_name, department_id, d.department_name 
    from hr.employees e 
    natural  join hr.departments d



3. The HR department needs a report of employees in Toronto. Display
the last name, job, department number, and the department name
for all employees who work in Toronto.


select e.last_name, e.job_id, d.department_id, d.department_name 
    from hr.employees e  
     join hr.departments d on (d.department_id= e.department_id)  
     join hr.locations l   on (d.location_id = l.location_id) 
    where l.city = 'Toronto'




4. Create a report to display employees’ last names and employee
numbers along with their managers’ last names and manager
numbers. Label the columns Employee, Emp#, Manager, and Mgr#,
respectively.


SELECT  e.last_name "Employee", e.employee_id "EMP#",
        g.last_name "Manager", g.employee_id "Mgr#"
    FROM     hr.employees e  join hr.employees g
    ON     (e.manager_id =g.employee_id)  



5. modify the above query to display all employees, including King, who
has no manager. Order the results by employee number

SELECT  e.last_name "Employee", e.employee_id "EMP#",
        g.last_name "Manager", g.employee_id "Mgr#"
    FROM     hr.employees e left join hr.employees g
    ON     (e.manager_id =g.employee_id)  
    order by e.employee_id



6. Create a report for the HR department that displays employee last
names, department numbers, and all the employees who work in the
same department as a given employee. Give each column an
appropriate label


select e.department_id department, g.last_name employee, e.last_name colleague
    from hr.employees e
    join hr.employees g on (e.department_id=g.department_id)
where  g.last_name<>e.last_name


.....

7. The HR department needs a report on job grades and salaries. To
familiarize yourself with the JOB_GRADES table, first show the structure
of the JOB_GRADES table. Then create a query that displays the name,
job, department name, salary, and grade for all employees


select last_name, job_id, department_name, salary, g.grade
        from job_grades g, hr.employees e
        join hr.departments d on ( d.department_id = e.department_id)
        where e.salary between g.lowest_sal and g.highest_sal


8. The HR department wants to determine the names of all employees
who were hired after Davies. Create a query to display the name and
hire date of any employee hired after employee Davies

select e.last_name, e.hire_date
        from hr.employees e
        join hr.employees d on (d.last_name='Davies')
        where e.hire_date > d.hire_date


9. The HR department needs to find the names and hire dates of all
employees who were hired before their managers, along with their
managers’ names and hire dates.

select e.last_name , e.hire_date, g.last_name LAST_NAME_1, g.hire_date hire_date_1
        from hr.employees e
        join hr.employees g on ( e.manager_id = g.employee_id)
        where g.hire_date > e.hire_date


