/*Create a view CUST_VW of the Employee table*/

create view CUST_VW as select EmpId, EmpName, Manager from employee;

/*Update CUST_VW by changing the Job=’Clerk’ to ‘Senior Clerk’*/

alter table employee modify job varchar2(20);
update CUST_VW set Job='Senior Clerk' where Job='Clerk';

/*Delete from CUST_VW the Employee-Kevin*/
delete from cust_vw where empname = 'Kevin';

/*Delete the view created*/

drop view cust_vw;

/*Find the value of 16^5*/

select power(16, 5) as "POWER" from dual;

/*Find the length of the string “Application”*/

select length('APPLICATION') from dual;

/*Display the last date of the current month*/

select last_day(sysdate) from dual;

/*Convert the given number 65432 to $65432. (Hint:Use format mask)*/

select to_char(65432, '$99999') from dual;

/*Display the current system date and time with fractional seconds with time zone*/

select systimestamp from dual;

/*Display the year of the hiring of all the employees from the Employee table*/

select to_char(hiredate, 'YYYY') from employee;

/*Calculate the number of months the employees have been working in the Company*/

select trunc(months_between(sysdate, to_date(hiredate))) from employee;

/*Find the number of departments available*/

select count(distinct(deptname)) from department;

/*Display the hire date of all employees in the following format:Friday, 11th August, 2017*/

select to_char(hiredate, 'DY, DDth MONTH, YYYY') from employee;
