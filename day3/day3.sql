/*dropping pre-existing primary key*/
alter table Client drop primary key;

/*Alter the Client table to add primary key constraint on Cno column*/

alter table Client add constraint p_k primary key(Cno);

/*Create foreign key constraint on Manager of Employee table and Dept. No column of Department table*/

alter table employee add constraint emp foreign key(Manager) references Employee(EmpId);
alter table employee add constraint dep foreign key(DeptNo) references Department(DeptNo);


