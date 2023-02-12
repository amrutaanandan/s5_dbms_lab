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

/*Create a package which contains a function to increase the commission of the employee*/

create or replace package emppack as 
function inccomm (eid 	employee.empid%type) return varchar2;
end;
/


create or replace package body emppack as 
function inccomm (eid 	employee.empid%type) return varchar2
is
newcomm employee.comm%type;
	begin
		select comm into newcomm from employee where empid = eid;
		newcomm := newcomm + newcomm*0.5;
		update employee set comm = newcomm where empid = eid;
		return('Increased commission is: '||newcomm);
	end inccomm;
end emppack;
/


declare
emid employee.empid%type := &emid;
op varchar2(50);
begin
op := emppack.inccomm(emid);
dbms_output.put_line(op);
end;
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
