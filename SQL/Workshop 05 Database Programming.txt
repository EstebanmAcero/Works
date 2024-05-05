

Practices for Lesson 5
Practice Overview
This practice covers the following topics:
• Writing queries that use the group functions
• Grouping by rows to achieve multiple results
• Restricting groups by using the HAVING clause
Reporting Aggregated Data Using the Group Functions
Overview
After completing this practice, you should be familiar with using
group functions and selectinggroups of data
Tasks
Determine the validity of the following statements. Circle either
True or False.


1. Group functions work across many rows to produce one
result per group.
True
SELECT Department_id, COUNT(*) AS TotalEmployee 
    FROM hr.Employees 
    GROUP BY Department_id
    order by department_id



2. Group functions include nulls in calculations.
False
el group by tiene como precedente tener un atributo y un funcion para agrupar como regla general



SELECT COUNT(EMPLOYEE_ID), MANAGER_ID
    FROM HR.EMPLOYEES
    WHERE MANAGER_ID IS NULL
    GROUP BY MANAGER_ID



3. The WHERE clause restricts rows before inclusion in a group
calculation.
True
SELECT COUNT(EMPLOYEE_ID), MANAGER_ID
    FROM HR.EMPLOYEES
    WHERE MANAGER_ID IS NULL
    GROUP BY MANAGER_ID


The HR department needs the following reports:
4. Find the highest, lowest, sum, and average salary of all
employees. Label the columns Maximum, Minimum, Sum,
and Average, respectively. Round your results to the
nearest whole number.


select Max(SALARY) Maximun,Min(SALARY) Minimun, Sum(SALARY) Sum, ROUND(AVG(SALARY),0) Average
    from hr.employees




5. Modify the above query to display the minimum,
maximum, sum, and average salary for each job type

select job_id,Max(SALARY) Maximun,Min(SALARY) Minimun, Sum(SALARY) Sum, ROUND(AVG(SALARY),0) Average
    from hr.employees
    group by job_id




6. Write a query to display the number of people with the
same job.


select job_id, count(*)
    from hr.employees
    group by job_id




7. Determine the number of managers without listing them.
Label the column Number of Managers.

select count(distinct(manager_id)) as "Number of Manager"
	    from hr.employees




8. Find the difference between the highest and lowest
salaries. Label the column DIFFERENCE.


select MAX(SALARY)-MIN(SALARY) DIFFERENCE
    FROM HR.EMPLOYEES




9. Create a report to display the manager number and the
salary of the lowest-paid employee for that manager.
Exclude anyone whose manager is not known. Exclude
any groups where the minimum salary is $6,000 or less. Sort
the output in descending order of salary

SELECT MANAGER_ID, MIN(SALARY)
    FROM HR.EMPLOYEES
    WHERE MANAGER_ID IS NOT NULL 
    AND (SALARY)>6000
    GROUP BY MANAGER_ID
    ORDER BY MIN(SALARY)  DESC




10. Create a query to display the total number of employees
and, of that total, the number of employees hired in 2005,
2006, 2007, and 2008. Create appropriate column
headings.


select

COUNT (*) TOTAL,
count(decode(to_char(HIRE_DATE, 'yyyy') , '2005', HIRE_DATE)) "2005",
count(decode(to_char(HIRE_DATE, 'yyyy') , '2006', HIRE_DATE)) "2006",
count(decode(to_char(HIRE_DATE, 'yyyy') , '2007', HIRE_DATE)) "2007",
count(decode(to_char(HIRE_DATE, 'yyyy') , '2008', HIRE_DATE)) "2008"
from HR.EMPLOYEES
    



11. Create a matrix query to display the job, the salary for that
job based on the department number, and the total salary
for that job, for departments 20, 50, 80, and 90, giving
each column an appropriate heading.


SELECT DISTINCT(JOB_ID),
    SUM(DECODE(TO_CHAR(DEPARTMENT_ID),'20',SALARY)) "DEP 20",
    SUM(DECODE(TO_CHAR(DEPARTMENT_ID),'50',SALARY)) "DEP 50",
    SUM(DECODE(TO_CHAR(DEPARTMENT_ID),'80',SALARY)) "DEP 80",
    SUM(DECODE(TO_CHAR(DEPARTMENT_ID),'90',SALARY)) "DEP 90",
    SUM(SALARY)TOTAL
FROM HR.EMPLOYEES
    GROUP BY JOB_ID
