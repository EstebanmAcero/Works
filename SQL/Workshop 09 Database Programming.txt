


Practices for Lesson 10: Managing Tables Using DMLStatements
Lesson Overview
This practice covers the following topics:
• Inserting rows into tables
• Updating and deleting rows in a table
• Controlling transactions
Practice 9-1: Managing Tables Using DML Statements
Overview
The HR department wants you to create SQL statements to insert, update,
and delete employeedata. As a prototype, you use the MY_EMPLOYEE
table before giving the statements to the HR department
Tasks
Insert data into the MY_EMPLOYEEtable.



1. Create table my_employee
Id is not null number to 4 characters
Last name string 25 characters
First name string 25 characters
Userid string 25 characters
Salary number 9 characters, 2 decimals to precision


create table my_employee
(
	id  number(4) not null ,
    last_name  varchar2(25)	,
    first_name varchar2(25)	,
    userid	   varchar2(8)	,
    salary	 	number(9,2)
)



2. Describe the structure of the MY_EMPLOYEEtable to identify the column

names.

desc my_employee




3. Create an INSERTstatement to add the first row of data to the
MY_EMPLOYEEtable fromthe following sample data. Do not list the
columns in the INSERTclause. Do not enter all rows yet.
ID LAST_NAME FIRST_NAME USERID SALARY
insert into my_employeevalues 
    (1, 'Patel' 	, 'Ralph'	, 'rpatel'	, 895)






4. Populate the MY_EMPLOYEEtable with the second row of the
sample data from thepreceding list. This time, list the columns
explicitly in the INSERTclause.

insert into my_employee (id, last_name, first_name, userid, salary)values 
    (2, 'Dancs'		, 'Betty' 	,'bdancs' 	, 860)



5. Confirm your addition to the table.


select * 
    from my_employee



6. Write an INSERTstatement in a dynamic reusable script file to load
the remaining rows intothe MY_EMPLOYEE table. The script should
prompt for all the columns (ID, LAST_NAME, FIRST_NAME, USERID, and
SALARY). Save this script to a lab_10_06.sqlfile.

 insert into my_employee values  (&id, &last_name, &first_name, &userid, &salary)



7. Populate the table with the next two rows of the sample data listed in
step 3 by running the
INSERTstatement in the script that you created.

insert into my_employee (id, last_name, first_name, userid, salary)values  (3, 'Biri'		, 'Ben'		, 'bbiri'	, 1100)

  insert into my_employee (id, last_name, first_name, userid, salary)values  (4, 'Newman' 	,'Chad'		, 'cnewman'	, 750);




8. Confirm your additions to the table.


select * 
    from my_employee 



9. Make the data additions permanent.
Update and delete data in the MY_EMPLOYEEtable

commit work



10. Change the last name of employee 3 to Drexler.

update my_employee
set last_name = 'Drexler'
where id   = 3


11. Change the salary to $1,000 for all employees who have a salary less
than $900.

update my_employee
    set salary = 1000
    where salary <900


12. Verify your changes to the table.


    select * from my_employee



13. Delete Betty Dancs from the MY_EMPLOYEEtable.


    delete from my_employee 
    where first_name = 'Betty' and 
    		last_name = 'Dancs'


14. Confirm your changes to the table.

    select * from my_employee


15. Commit all pending changes.
Control the data transaction to the MY_EMPLOYEEtable.


commit work

16. Populate the table with the last row of the sample data listed
in step 3 by using the statements in the script that you
created in step 6. Run the statements in the script.
Note: Perform the steps (17-23) in one session only.

insert into my_employee values  (&id, '&last_name', '&first_name', '&userid', &salary)
insert into my_employee (id, last_name, first_name, userid, salary)values  (5, 'Ropeburn' ,'Audrey'	, 'aropebur', 1550)  ;



17. Confirm your addition to the table.



select *
    from my_employee



18. Mark an intermediate point in the processing of the transaction.

    exec savepoint intermadiate_point



19. Delete all the rows from the MY_EMPLOYEEtable.



    delete from my_employee



20. Confirm that the table is empty.


select *
    from my_employee



21. Discard the most recent DELETEoperation without discarding the earlier
INSERToperation.

rollback to savepoint status



22. Confirm that the new row is still intact.


select *
    from my_employee


23. Make the data addition permanent.


commit work
