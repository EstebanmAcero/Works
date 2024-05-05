


Parte 1 

1. La siguiente instrucci�n SELECT se ejecuta correctamente:
	Verdadero
	SELECT last_name, job_id, salary AS Sal
    FROM	hr.employees

2. La siguiente instrucci�n SELECT se ejecuta correctamente:
	Verdadero
	SELECT * FROM	job_grades;
	
3. Hay cuatro errores de codificaci�n en la siguiente declaraci�n. �Puedes identificarlos?
	SELECT	employee_id, last_name sal x 12 ANNUAL SALARY FROM	employees;
	Verdadero
	SELECT	EMPLOYEE_ID, LAST_NAME, SALARY *12 AS  "ANNUAL SALARY" FROM	hr.employees


Parte 2

1. Su primera tarea es determinar la estructura de la tabla DEPARTAMENTOS y su contenido
	SELECT * 
	FROM hr.departments

2. El departamento de recursos humanos desea una consulta para mostrar el apellido, la identificaci�n del trabajo, la fecha de contrataci�n y la identificaci�n del empleado para cada empleado, con la identificaci�n del empleado en primer lugar. Proporcione un alias STARTDATE para la columna HIRE_DATE

	SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID ,HIRE_DATE as "STARTDATE"
	FROM hr.employees

3. El departamento de recursos humanos desea una consulta para mostrar todos los ID de trabajo �nicos de la tabla EMPLOYEES
	
SELECT DISTINCT (JOB_ID)
	FROM HR.EMPLOYEES
	GROUP BY JOB_ID
	ORDER BY JOB_id

Parte 3

1. El departamento de recursos humanos quiere encabezados de columna m�s descriptivos para su informe sobre los empleados. Nombre las columnas Emp #, Employee, Job y Hire Date, respectivamente. A continuaci�n, ejecute la consulta de nuevo

		SELECT  EMPLOYEE_ID AS " NUMERO DEL EMPLEADO" ,LAST_NAME AS "NOMBRE DEL EMPLEADO", HIRE_DATE AS " FECHA DE CONTRATACION" ,JOB_ID	AS "TIPO DE TRABAJO"
    FROM HR.EMPLOYEES


2. El departamento de recursos humanos ha solicitado un informe de todos los empleados y sus ID de trabajo. Muestre el apellido concatenado con el ID del trabajo (separado por una coma y un espacio) y nombre la columna Empleado y T�tulo.

	SELECT CONCAT(CONCAT(LAST_NAME, ', ' ),EMPLOYEE_ID) "EMPLEADO Y TITULO"
	FROM HR.EMPLOYEES


	SELECT LAST_NAME|| ', ' ||EMPLOYEE_ID "EMPLEADO Y TITULO"
	FROM HR.EMPLOYEES

3. Para familiarizarse con los datos de la tabla EMPLOYEES, cree una consulta para mostrar todos los datos de esa tabla. Separe cada salida de columna con una coma.

	SELECT EMPLOYEE_ID||','||
FIRST_NAME||','||
LAST_NAME||','||
EMAIL||','||
PHONE_NUMBER||','||
HIRE_DATE||','||
JOB_ID||','||
SALARY||','||
COMMISSION_PCT||','||
MANAGER_ID||','||
DEPARTMENT_ID AS "ALL DATA"
    FROM HR.EMPLOYEES


