



En esta práctica, creará más informes mediante declaraciones que utilizan la cláusula WHERE y la cláusula ORDER BY. Usted hace que las declaraciones SQL sean más reutilizables y genéricas al incluir la sustitución de ampersand

El departamento de recursos humanos necesita su ayuda para crear algunas consultas.
1. Debido a problemas de presupuesto, el departamento de recursos humanos necesita un informe que muestre el apellido y el salario de los empleados que ganan más de $12,000.


	select last_name, salary 
    from hr.employees
    where salary > 12000


2. Abra una nueva hoja de trabajo de SQL. Cree un informe que muestre el apellido y el número de departamento del empleado número 176.
	

	select last_name,DEPARTMENT_ID
    from hr.employees
    where EMPLOYEE_ID= 176


3. El departamento de recursos humanos necesita encontrar empleados con salarios altos y bajos. Mostrar el apellido y el salario de cualquier empleado cuyo salario no esté en el rango de $5,000 a $12,000.

	select last_name, salary 
    from hr.employees
    where salary > 12000
    or   salary < 5000


4. Cree un informe para mostrar el apellido, la identificación del trabajo y la fecha de contratación de los empleados con los apellidos de Matos y Taylor. Ordenar la consulta en orden ascendente por fecha de contratación.

	select last_name, JOB_ID ,HIRE_DATE
    from hr.employees
    where last_name = 'Matos'
    or	  last_name = 'Taylor'
    order by HIRE_DATE


5. Muestre el apellido y la identificación del departamento de todos los empleados en los departamentos 20 o 50 en orden alfabético ascendente por nombre.

	select last_name, DEPARTMENT_ID 
    from hr.employees
    where DEPARTMENT_ID = 20
    or   DEPARTMENT_ID = 50
    order by  FIRST_NAME asc



6. Muestre el apellido y el salario de los empleados que ganan entre $ 5,000 y $ 12,000 y están en el departamento 20 o 50. Etiquete las columnas Empleado y Salario mensual, respectivamente.


	select last_name EMPLEADO, salary  "SALARIO MENSUAL" 
	from hr.employees
    WHERE (DEPARTMENT_ID = 20
    or 	  DEPARTMENT_ID = 50)
    AND (salary < 12000
    AND   salary  >5000)


7. El departamento de recursos humanos necesita un informe que muestre el apellido y la fecha de contratación de todos los empleados que fueron contratados en 2006.



	SELECT LAST_NAME, HIRE_DATE
    FROM HR.EMPLOYEES
    WHERE TO_CHAR(HIRE_DATE, 'YYYY')= 2006


8. Cree un informe para mostrar el apellido y el cargo de todos los empleados que no tienen un gerente.

	
	SELECT LAST_NAME, JOB_ID
    FROM HR.EMPLOYEES
    WHERE MANAGER_ID IS NULL




9. Cree un informe para mostrar el apellido, el salario y la comisión de todos los empleados que ganan comisiones. Ordene los datos en orden descendente de salario y comisiones. Use la posición numérica de la columna en la cláusula ORDER BY

	
SELECT LAST_NAME, SALARY,COMMISSION_PCT
    FROM HR.EMPLOYEES
    WHERE COMMISSION_PCT IS NOT NULL
    ORDER BY SALARY, COMMISSION_PCT DESC



10. Los miembros del departamento de recursos humanos quieren tener más flexibilidad con las consultas que está escribiendo. Les gustaría un informe que muestre el apellido y el salario de los empleados que ganan más de una cantidad que el usuario especifica después de un aviso. Si ingresa 12000 cuando se le solicite, el informe muestra los resultados.


	select last_name, salary
    from hr.employees
    where salary > 12000 or salary > &ventana 


11. El departamento de recursos humanos quiere ejecutar informes basados en un gerente. 
Cree una consulta que solicite al usuario una ID de gerente y genere la ID de empleado, el apellido, el salario y el departamento para los empleados de ese gerente.
El departamento de RRHH quiere tener la capacidad de ordenar el informe en una columna seleccionada. Puede probar los datos con los siguientes valores:

manager_id: 103 organizado por apellido
manager_id: 201 organizado por salario
manager_id: 124 organizado por employee_id


	SELECT EMPLOYEE_ID, last_name, salary,  DEPARTMENT_ID
	FROM HR.EMPLOYEES
	WHERE MANAGER_ID = 103 
	ORDER BY 2,3,1

12. Muestre los apellidos de todos los empleados donde la tercera letra del nombre es "a".

	select last_name
	from hr.employees
	where last_name like '__a%'



13. Mostrar los apellidos de todos los empleados que tienen una "a" y una "e" en su apellido.

	
select last_name
	from hr.employees
	where last_name like '%a%' and last_name like '%e%'


14. Muestre el apellido, el trabajo y el salario de todos los empleados cuyos trabajos sean de representante de ventas o empleado de almacén, y cuyos salarios no sean iguales a $2,500, $3,500 o $7,000.

	select last_name, JOB_ID, salary 
    from hr.employees
    where job_id in ('PU_CLERK','SA_REP') and salary NOT in  (2500, 3500,7000)


15. Mostrar el apellido, salario y comisión de todos los empleados cuya comisión es del 20%.

	select last_name, salary, COMMISSION_PCT*100
    from hr.employees
    where (COMMISSION_PCT*100) =20


