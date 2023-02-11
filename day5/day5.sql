/*Delete all clients whose Baldue is 0 or below*/

commit;
delete from client where baldue <= 0;

/*Write a query to undo the above delete query*/
rollback;

/*using savepoint*/
savepoint sp;
delete from client where baldue <= 0;
rollback to sp;

/*Write a query to grant all privileges of client table to nearby user*/

grant all privileges on employee to scott;

/*Write a query to grant some privileges of Employee table to nearby user*/

grant delete, insert, select on employee to scott;

/*Write a query to revoke all privileges of client table from the user*/

revoke all privileges on employee to scott;

/*Write a query to revoke some privileges of employees table from the user*/

revoke delete, insert, select on employee from scott;
