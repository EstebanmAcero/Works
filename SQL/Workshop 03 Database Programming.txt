

practica 3


1. Write a query to display the system date. Label the column Date.

	
SELECT TO_CHAR
    (SYSDATE, 'DD-MM-YYYY HH12:MI:SS') "DATE"
     FROM DUAL;

2. The HR department needs a report to display the employee number, last name, salary, and salary increased by 15.5% (expressed as a whole number) for each employee. Label the column New Salary


	SELECT EMPLOYEE_ID, LAST_NAME, SALARY, CAST(SALARY*1.155 AS INTEGER) "NEW SALARY"
    FROM HR.EMPLOYEES


3. Modify your query 2 to add a column that subtracts the old salary from the new salary. Label the column Increase.


	SELECT EMPLOYEE_ID, LAST_NAME, SALARY, CAST(SALARY*1.155 AS INTEGER) "NEW SALARY", CAST(SALARY*1.155 - SALARY AS INTEGER ) "COLUMN INCREASE"
    FROM HR.EMPLOYEES



4. Write a query that displays the last name (with the first letter in uppercase and all the other letters in lowercase) and the length of the last name for all employees whose name starts with the letters “J,” “A,” or “M.” Give each column an appropriate label. Sort the results by the employees’ last names.

	
SELECT INITCAP(LAST_NAME) Nombre, LENGTH(LAST_NAME) Apellido
    FROM HR.EMPLOYEES, DUAL
    WHERE LAST_NAME LIKE 'J%'
    OR	  LAST_NAME LIKE 'A%'
    OR	  LAST_NAME LIKE 'M%'
    ORDER BY LAST_NAME



5. Rewrite the query so that the user is prompted to enter a letter that starts the last name. For example, if the user enters H (capitalized) when prompted for a letter, the output should show all employees whose last name starts with the letter “H.”

	SELECT INITCAP(LAST_NAME) Nombre, LENGTH(LAST_NAME) Apellido
    FROM HR.EMPLOYEES, DUAL
    WHERE SUBSTR (LAST_NAME, 1,1) = INITCAP(&asd)
    ORDER BY LAST_NAME


	SELECT INITCAP(LAST_NAME) Nombre, LENGTH(LAST_NAME) Apellido
    FROM HR.EMPLOYEES, DUAL
    WHERE SUBSTR (LAST_NAME, 1,1) = INITCAP('a')



6. The HR department wants to find the duration of employment for each employee. For each employee, display the last name and calculate the number of months between today and the date on which the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed. The number of months must be rounded to the closest whole number.
	

	SELECT LAST_NAME,ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)) MONTHS_WORKED
    FROM HR.EMPLOYEES, DUAL



7. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with the $ symbol. Label the column SALARY.


	SELECT LAST_NAME, LPAD(SALARY, '15' ,'$')
    FROM HR.EMPLOYEES



8. Create a query that displays the first eight characters of the employees’ last names, and indicates the amounts of their salaries with asterisks. Each asterisk signifies a thousand dollars. Sort the data in descending order of salary. Label the column EMPLOYEES_AND_THEIR_SALARIES.


	SELECT SUBSTR(LAST_NAME,1,8)||' ' || RPAD('*',SALARY/1000,'*') AS EMPLOYEES_AND_THEIR_SALARIES
    FROM DUAL, HR.EMPLOYEES


9. Create a query to display the last name and the number of weeks employed for all employees in department 90. Label the number of weeks column as TENURE. Truncate the number of weeks value to 0 decimal places. Show the records in descending order of the employee’s tenure.


	SELECT LAST_NAME, HIRE_DATE, Trunc(((SYSDATE-HIRE_DATE)/7),0)  AS "TERNURE"
    FROM HR.EMPLOYEES, DUAL
    WHERE DEPARTMENT_ID = 90
    ORDER BY TERNURE DESC


			
