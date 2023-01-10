/*----------Create and insert the following values in the Employee table----------*/

create table Employee
(
EmpId varchar(10),
EmpName varchar(20),
Job varchar(10),
Manager varchar(10),
DeptNo varchar(10),
HireDate date,
Salary number(10,3),
Comm int,
primary key(EmpId));

insert into Employee values ('E0001', 'Abey', 'Tester','E0004','D004', '15-DEC-12',30000,500);
insert into Employee values ('E0002', 'Jesto', 'Analyst','E0001','D002', '24-APR-11',25000,650);
insert into Employee values ('E0003', 'Adarsh', 'Clerk','E0004','D004', '10-JAN-13',15000,500);
insert into Employee values ('E0004', 'Kevin', 'Admin','E0005','D002', '10-OCT-13',20000,1750);
insert into Employee values ('E0005', 'Bony', 'Manager',NULL,'D001', '11-APR-11',50000,1000);
insert into Employee values ('E0006', 'Manu', 'Supplier','E0001','D003', '19-JUN-13',5000,450);


/*----------Create and insert the following values in the Department table----------*/

create table Department
  (
  DeptNo varchar(6),
  DeptName varchar(5),
  Location varchar(10),
  primary key(DeptNo));
  
 insert into Department values(‘D001’, ‘DeptA’, ‘A block’);
 insert into Department values('D002', 'DeptB', 'B block');
 insert into Department values('D003', 'DeptC', 'C block');
 insert into Department values('D004', 'DeptD', 'D block');
 
 /*----------Create a table Client as shown below and insert the values:----------*/
 
 create table Client
 (
 Cno varchar2(6),
 Name varchar2(20),
 City varchar2(15),
 PinCode number(8),
 State varchar2(15),
 Baldue number(10,2),
 primary key(Cno));


/*----------Insert the following values into the Client table----------*/

insert into Client values('C01', 'Nimmy', 'Cochin', 680324, 'Kerala', 14000);
insert into Client values('C02', 'Susan', 'Cochin', 680324, 'Kerala', 0);
insert into Client values('C03', 'Anjana', 'Salem', 680345, 'TamilNadu', 5000);
insert into Client values('C04', 'Sneha', 'Pune', 680223, 'Maharashtra', 500);
insert into Client values('C05', 'Annet', 'Gandipuram', 680321, 'Karnataka', 7600);
insert into Client values('C06', 'Ann', 'Bombay', 680111, 'Maharashtra', 2055);

/*----------Display the entire contents of all the above tables----------*/

select * from Employee;
select * from Department;
select * from Client;

/*----------Insert a new employee with EmpId=E0001 in the Employee table----------*/

insert into Employee values ('E0001','Rose','Tester','E0004','D004', '15-DEC-12',30000,500);

/*----------Display the first 4 rows of the Client table----------*/

select * from Client where rownum<=4;

/*----------Retrieve the names, Hire date and Salary of all employees in the Employee table----------*/

select EmpName, HireDate, Salary from Employee;

/*----------List all employees whose name starts with ‘A’ or ‘K in the Employee table----------*/

select * from Employee where EmpName like 'A%' or EmpName like 'K%';

/*----------Display the distinct cities to which the clients belong in the Client table----------*/

select distinct City from Client;

/*----------List employees hired after 2012 and whose salary is more than 17500 in the Employee table----------*/

select EmpId, EmpName from Employee where HireDate >= '01-JAN-13' and Salary > 17500;

/*----------List all employees whose name falls in the alphabetical range ‘E to L’ in the Employee table----------*/

select * from Employee where EmpName >= 'E' and EmpName <= 'L' order by EmpName;

/*----------Change the city of Client No: C03 from ‘Salem’ to ‘Delhi’ in the Client table----------*/

update Client set City = 'Delhi' where Cno = 'C03';

/*----------Change the Commission of employee ‘Abey’ to 600 in the Employee table----------*/

update Employee set Comm = 600 where EmpName= 'Abey';

/*----------Display all the rows from the Client table in the format: “Annet from Gandhipuram has 7600 Balance due”----------*/

select Name || ' from ' || City || ' has ' || Baldue ||  ' balance due ' from Client;

/*----------Display the column name ‘Baldue’ as “Due Balance” from the Client table----------*/

select Baldue as "Due Balance" from Client;

/*----------List all clients who are not from ‘Kerala’ from the Client table----------*/

select * from Client where State != ‘Kerala’;



