


Practices for Lesson 11: Introduction to Data Definition Language

Lesson Overview
This practice covers the following topics:
• Creating new tables
• Creating a new table by using the CREATETABLEASsyntax
• Verifying that tables exist
• Altering tables
• Adding columns
• Dropping columns
• Setting a table to read-only status
• Dropping tables
Tasks
1. Create the DEPTtable based on the following table instance chart.
Confirm that the table is created.
Column Name ID NAME
Key Type Primary key
Nulls/Unique
FK Table
FK Column
Data type NUMBER VARCHAR2
Length 7 25


create table dept (
        id number (7),
        name varchar2 (25),
        primary key (id)
)




2. Create the EMPtable based on the following table instance chart.

create table emp(
	id number (7),
    last_name 	varchar2(25),
    first_name	varchar2(25),
    dept_id		number   (7),
	foreign key (dept_id) references dept(id)      
)







3. Modify the EMPtable. Add a COMMISSIONcolumn of the NUMBER
data type, with precision 2and scale 2. Confirm your modification.


alter table emp add comission number (2,2)
desc emp



4. Modify the EMPtable to allow for longer employee last names. Confirm
your modification.


alter table emp modify last_name varchar2(50);
desc emp;



5. Drop the FIRST_NAMEcolumn from the EMPtable. Confirm your
modification by checkingthe description of the table.


alter table emp drop column first_name ;
desc emp;




6. In the EMPtable, mark the DEPT_IDcolumn as UNUSED. Confirm
your modification bychecking the description of the table.


alter table emp set unused column dept_id;




7. Drop all the UNUSEDcolumns from the EMPtable.



alter table emp drop unused columns


8. Create the EMPLOYEES2table based on the structure of the
EMPLOYEEStable. Include onlythe EMPLOYEE_ID, FIRST_NAME,
LAST_NAME, SALARY, and DEPARTMENT_ID columns. Name the

columns in your new table ID, FIRST_NAME, LAST_NAME, SALARY, and
DEPT_ID, respectively.



create table employees2 (

    id number(6),
    first_name   varchar2(20),
    last_name	 varchar2(25) not null,
    salary		 number(8,2),
    dept_id  	 number(4)
)

    desc employees2




9. Alter the status of the EMPLOYEES2table to read-only


alter table employees2 read only





10. Try to add a column JOB_IDin the EMPLOYEES2table.

Note, you will get the “Update operation not allowed on table”
error message. You will notbe allowed to add any column to the

table because it is assigned a read-only status.


alter table employees2 add job_id varchar2(20)




11. Revert the EMPLOYEES2table to the read/write status. Now try to
add the same columnagain.
Now, because the table is assigned a READWRITEstatus, you will be
allowed to add acolumn to the table.
You should get the following messages:


alter table employees2 read write

alter table employees2 add job_id varchar2(9)






12. Drop the EMP, DEPT, and EMPLOYEES2table.



drop table emp;
drop table dept;
drop table employees2;




