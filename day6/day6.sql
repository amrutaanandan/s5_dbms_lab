/*Display the client names in ascending order*/

select name from client order by name asc;

/*Determine the maximum salary in each department*/

select deptno, max(salary) from employee group by deptno order by deptno;

/*Display the minimum salary of all departments except D001*/

select deptno, min(salary) from employee having deptno != 'D001' group by deptno order by deptno;

/*Display all the DeptNo available with the Department and Employee table*/

select deptno from employee union all select deptno from department;

/*Display all the DeptNo available in Employee table and not in Department table*/

select deptno from employee minus select deptno from department;

/*Write a nested query to select the employees who have got more salary than Adarsh*/

select empname, salary from employee where salary > (select salary from employee where empname='Adarsh');

/*Write a nested query to select the employees who have less salary than any employees working in dept D004*/

select empname, salary from employee where salary < (select min(salary) from employee where deptno='D004' group by deptno) and deptno != 'D004';

/*Display all employee names and salary whose salary is greater than minimum salary of the company and job title starts with ‘A’*/

select empname, salary from employee where salary > (select min(salary) from employee) and job like 'A%';

/*Display Employee Name and Department Name of employees whose salary is greater than 20000*/

select employee.empname, department.deptname from employee inner join department on employee.deptno = department.deptno;

/*Display the Employee name, Job, Manager Name by implementing a left outer join*/

select e.empname, e.job, f.empname as "MANAGER" from employee e left outer join employee f on e.manager = f.empid;

/*Display the Employee name, Job, Manager Name by implementing a right outer join*/

select f.empname, f.job, e.empname as "MANAGER" from employee e right outer join employee f on f.manager = e.empid;

/*Display the Employee name, Job, Manager Name by implementing a full outer join*/

select e.empname, e.job, f.empname as "MANAGER" from employee e full outer join employee f on e.manager = f.empid;
