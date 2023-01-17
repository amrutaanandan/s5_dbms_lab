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
