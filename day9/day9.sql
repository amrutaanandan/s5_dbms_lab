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

/*Given the tables,
MASTER (ACCNO, NAME, OPEN_DATE, BALANCE)
TRANSACTION (TACCNO, TAMOUNT, TDATE, OPERATION)*/

create table master(
	accno varchar2(50),
	name varchar2(10),
	open_date date,
	balance number,
	primary key(accno)
);

insert into master values('A01', 'ABC', '11-JAN-23', 4000);
insert into master values('A02', 'DEF', '12-JAN-22', 300);
insert into master values('A03', 'GHI', '13-JAN-21', 100);
insert into master values('A04', 'JKL', '14-JAN-20', 7500);
insert into master values('A05', 'MNO', '15-JAN-19', 3200);

create table transaction(
	taccno varchar2(50),
	tamount number,
	tdate date,
	operation varchar2(10),
	primary key(taccno));


/*Create a trigger to check whether withdrawal or deposit is possible or not. Withdrawal is possible only if the minimum balance after withdrawal is greater than 
or equal to 1000. Update the balance in the Master table accordingly*/

create or replace trigger txn
before update on master
for each row
when (new.balance < 1000)
declare
	low_bal EXCEPTION;
begin
	raise low_bal;

exception 
	when low_bal then
	dbms_output.put_line('Not enough balance to perform this transaction!');
end;
/

create or replace package mastertxn 
is
procedure withdraw(acno master.accno%type, amt number);
procedure deposit(acno master.accno%type, amt number);
end;
/

create or replace package body mastertxn
is
	procedure withdraw(acno master.accno%type, amt number)
	is

	bal master.balance%type;
	
	begin
	select balance into bal from master where accno = acno;
	bal := bal - amt;
	update master set balance = bal where accno = acno;

	end withdraw;
	
	procedure deposit(acno master.accno%type, amt number)
	is

	bal master.balance%type;

	begin
	select balance into bal from master where accno = acno;
	bal := bal + amt;
	update master set balance = bal where accno = acno;

	end deposit;
end mastertxn;


declare 
acno master.accno%type := &acno;
amt number := &amt;
begin
mastertxn.withdraw(acno, amt);
end;
/

declare 
acno master.accno%type := &acno;
amt number := &amt;
begin
mastertxn.deposit(acno, amt);
end;
/

--Record each transaction in the Transaction table. Raise a trigger for each entry in the Transaction table

create or replace trigger entertxn
after update on master
for each row
begin
	if :new.balance > :old.balance then
		insert into transaction values(:new.accno, :new.balance - :old.balance, sysdate, 'Deposited');
	elsif :new.balance < :old.balance then
		insert into transaction values(:new.accno, :new.balance - :old.balance, sysdate, 'Deposited');
	end if;
end;
/

/*
Consider the following tables
SUPPLIERS (SuppNo, SName, SAddress, SCity, SState, SPhone, SBalance)
ORDERS (OrdNo, OrdDate, OrdSuppNo,OrdPartNo, OrdQty)
PARTS (PartNo, PName, Qty, Price)
*/
create table suppliers(SuppNo varchar2(5), SName varchar2(5), SAddress varchar2(5), SCity varchar2(5), SState varchar2(5), SPhone number, SBalance number, primary key(suppno));
create table orders(OrdNo varchar2(5), OrdDate date, OrdSuppNo varchar2(5),OrdPartNo varchar2(5), OrdQty number, primary key(OrdNo));
create table parts(PartNo varchar2(5), PName varchar2(5), Qty number, Price number, primary key(PartNo));


insert into suppliers values('S001', 'ABC', 'abc', '123', '456', 123, 4000);
insert into suppliers values('S002', 'DEF', 'def', '789', '134', 456, 300);
insert into suppliers values('S003', 'GHI', 'ghi', '123', '456', 789, 2500);
insert into suppliers values('S004', 'JKL', 'jkl', '455', '199', 111, 10000);



insert into parts values('P001', 'P1', 10, 500);
insert into parts values('P002', 'P2', 230, 10);
insert into parts values('P003', 'P3', 67, 25);
insert into parts values('P004', 'P4', 150, 12);

--Create a trigger to ensure that Supplier ‘S002’ is not to be given orders larger than 100 units of any part
--Ensure that the supplier has enough balance to place the order

create or replace trigger suppcheck
before insert or update on orders
for each row
declare
	pr number;
	bal number;
begin
	select price into pr from parts where partno = :new.ordpartno;
	select sbalance into bal from suppliers where suppno = :new.ordsuppno;
	
	pr := pr*:new.ordqty;
	
	if :new.ordsuppno = 'S002' and :new.ordqty > 100 then
		raise_application_error(-20343, 'S002 cannot have more than 100 parts!');
		
	elsif pr - bal < 100 then
		raise_application_error(-20343, 'No Balance!');
		
	else
		update suppliers set sbalance = pr-bal where suppno = :new.ordsuppno;
		update parts set qty = qty - :new.ordqty where partno = :new.ordpartno;
		
	end if;
	
exception
	when invalid_qty then
	dbms_output.put_line('S002 cannot have more than 100 parts!');
	when no_bal then
	dbms_output.put_line('Transaction failed due to insufficient balance!');
end;
/

