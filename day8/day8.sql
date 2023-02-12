--Create a procedure which increases the Commission of the given employee of the Employee table by 5%

create or replace procedure comm_inc(emid in employee.empid%type)
as
commission employee.comm%type;
begin
	select comm into commission from employee where empid = emid;
	commission := commission + commission*0.5;
	update employee set comm = commission where empid = emid;
end;
/

declare
  emid employee.empid%type := &emid;
  begin
  comm_inc(emid);
  end;
  /
	
--Create a function which returns the manager name of an employee, given the EmpId

create or replace function mgr_name(emid in employee.empid%type) return varchar2
as
	mgrname employee.empname%type;
begin
	select m.empname into mgrname from employee e left outer join employee m on e.manager = m.empid where e.empid=emid;
	return('Manager of given employee is: '|| mgrname);
end;
/

declare
  msg varchar2(50);
  emid employee.empid%type := &emid;
  begin
  msg := mgr_name(emid);
  dbms_output.put_line(msg);
  end;
  /
