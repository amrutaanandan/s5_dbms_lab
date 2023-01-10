/*----------Create table Hospital----------*/

create table Hospital
(
    DoctorId varchar2(20),
    DocName varchar2(20),
    Specialization varchar2(10),
    HoD varchar2(10),
    DeptNo varchar2(5),
    HireDate date,
    Sal number(10,3),
   Primary key(DoctorId)
)

/*----------Create table HospitalDept----------*/

create table HospitalDept
(
    DeptNo varchar2(5),
    DeptName  varchar2(20),
    Loc number(10,3),
   Primary key(DeptNo)
);

/*----------Add a column “Additional Qualification”to the Hospital table. The data type is character----------*/


alter table Hospital
add Additional_qualification char(15);

/*----------Modify the column width of the Specialization field of Hospital table----------*/

alter table Hospital modify(
    Specialization varchar(20)
);

/*----------Remove column Location from HospitalDept table----------*/

alter table HospitalDept drop(
    Loc
);

/*----------Rename the column name Sal to Salary in Hospital table----------*/

alter table Hospital rename column Sal to Salary;

/*----------Delete the table HospitalDept----------*/

drop table HospitalDept;

/*----------Display your name and age using the DUAL command----------*/

select 21 from dual;
select 'Amruta' from dual;
select sysdate from dual;

/*----------Display the current system date----------*/

select sysdate from dual;

/*----------Perform the following operations: 55-15+8*3/6*---------*/

select 55-15+8*3/6 from dual;

/*----------Display all the tables currently available to the user----------*/

select * from user_tables;




