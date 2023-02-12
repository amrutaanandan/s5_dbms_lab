/*Write a PL/SQL code block to calculate the area of a circle for a value of radius varying from 5 to 15. Store the radius and the corresponding values of calculated
 area in an empty table named areas, consisting of two columns radius & area*/

declare
counter number;
ar number;
begin
    for counter in 1..5 loop
        ar := power(counter, 2) * 3.14;
        insert into areas values (ar, counter);
    end loop;
end;
/
select * from areas;

/*Write a PL/SQL code block that will accept an account number from the user, check if the users balance is less than minimum balance, then deduct Rs.100/- from the 
balance. This process is fired on the ACCOUNT table. (Exception handling in PL/SQL)*/

create table bank(accno varchar(5), bal number, primary key(accno));

insert into account values ('A001', 12000);
insert into account values ('A002', 200);
insert into account values ('A003', 5000);
insert into account values ('A004', 380);

declare
    acno varchar(5) := &acno;
    balance number;
    less_than_hun EXCEPTION;
begin
    select bal into balance from account where accno = acno;
    if balance <= 100 then
	    raise less_than_hun;
	    
    elsif balance < 500 then
	    balance := balance - 100;
	    update bank set bal = balance where accno = acno;
    end if;

exception
    when no_data_found then 
          dbms_output.put_line('no such customer!');
    when less_than_hun then
	    dbms_output.put_line('balance less than rs 100 !!!');
end;
/
