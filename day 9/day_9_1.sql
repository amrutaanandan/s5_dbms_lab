/*--------Create a package which contains a procedure to hire a new employee---------*/

create or replace package emppack as 
procedure hireemp (
eid 	employee.empid%type,
ename	employee.empname%type,
ejob	employee.job%type,
emgr	employee.manager%type,
edept employee.deptno%type,
ehire employee.hiredate%type,
esal 	employee.salary%type,
ecomm	employee.comm%type
);
end;
/

create or replace package body emppack as 
procedure hireemp (
eid 	employee.empid%type,
ename	employee.empname%type,
ejob	employee.job%type,
emgr	employee.manager%type,
edept 	employee.deptno%type,
ehire 	employee.hiredate%type,
esal 	employee.salary%type,
ecomm	employee.comm%type
)
is
begin
insert into employee values(eid, ename, ejob, emgr, edept, ehire, esal, ecomm);
dbms_output.put_line('New employee hired!');
end hireemp;
end emppack;
/

declare
eid1 	employee.empid%type := &eid1;
ename1	employee.empname%type := &ename1;
ejob1	employee.job%type := &ejob1;
emgr1	employee.manager%type := &emgr1;
edept1 	employee.deptno%type := &edept1;
ehire1 	employee.hiredate%type := &ehire1;
esal1 	employee.salary%type := &esal1;
ecomm1	employee.comm%type := &ecomm1;
begin
emppack.hireemp(eid1, ename1, ejob1, emgr1, edept1,ehire1, esal1, ecomm1);
end;
/
