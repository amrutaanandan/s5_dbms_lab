/*dropping pre-existing primary key*/
alter table Client drop primary key;

/*Alter the Client table to add primary key constraint on Cno column*/

alter table Client add constraint p_k primary key(Cno);

/*Create foreign key constraint on Manager of Employee table and Dept. No column of Department table*/

alter table employee add constraint emp foreign key(Manager) references Employee(EmpId);
alter table employee add constraint dep foreign key(DeptNo) references Department(DeptNo);

/*Add a constraint to make the Job column unique*/

alter table employee add constraint unique_job unique(job);

/*Add constraints to check if Comm> 400 in the Employee table*/

alter table employee add check(comm>400);

/*Set Salary value by default as 25000, otherwise as the user enters*/

alter table employee modify salary default 25000;

/*Remove the constraint from the column Job*/

alter table employee drop constraint unique_job;

/*Display all the constraints*/

select constraint_name, constraint_type from user_constraints;
