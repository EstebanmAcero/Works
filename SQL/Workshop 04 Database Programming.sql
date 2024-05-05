
practica 4

1.	Create a report that produces the following for each employee:
<employee last name> earns <salary> monthly but wants <3 times salary.>.
Label the column Dream Salaries.


	select last_name ||' earns ' ||TO_CHAR(salary,'FM$999,999,999.00') || ' monthly but wants '||TO_CHAR(salary*3,'FM$999,999,999.00')||'. ' as "Dream Salaries"
	from hr.employees


2.	Display each employee’s last name, hire date, and salary review date, which is the first Monday after six months of service. 
Label the column REVIEW. Format the dates to appear in a format that is similar to “Monday, the Thirty-First of July, 2000.”

	select last_name, hire_date, to_char(next_day(add_months(hire_date,6),'MONDAY'), 'Day, "the" fmDdspth  "of" Month, YYYY') AS "REVIEW"
	from hr.employees



3. Create a query that displays employees’ last names and commission amounts. If an employee does not earn commission, show “No Commission.” Label the column COMM.

	select last_name, NVL(TO_CHAR(COMMISSION_PCT), 'No Commission.') CMM
    from hr.employees

4.	Using the DECODE function, write a query that displays the grade of all employees based on the value of the JOB_ID column, using the following data

	select job_id, decode(job_id, 
    'AD_PRES', 'A',
    'ST_MAN' , 'B',
    'IT_PROG', 'C',
    'SA_REP' , 'D',
    'ST_CLERK','E ',
    '0') grade
    from hr.employees



5. Rewrite the statement in the preceding exercise by using the CASE syntax


select job_id, case job_id
    when 'AD_PRES' THEN 'A'
    when 'ST_MAN'  THEN 'B'
    when 'IT_PROG' THEN 'C'
    when 'SA_REP'  THEN 'D'
    when 'ST_CLERK'THEN 'E'
    ELSE '0'
    END AS GRADE
    from hr.employees






