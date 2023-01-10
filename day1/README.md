<h1>Day 1</h1>
<h2>Creation of a database using DDL commands and write DQL queries to retrieve information from the database</h2>
<p>a.  Create the following tables:</p>


- Hospital
  
| Column Name    |   Data Type  |  Constraint |
| :--------------: | :------------: | :-----------: |
| DoctorId       | Varchar2(10) | Primary Key |
| DocName        | Varchar2(20) |             |
| Specialization | Varchar2(10) |             |
| HOD            | Varchar2(10) |             |
| DeptNo         | Varchar2(5)  |             |
| HireDate       | Date         |             |
| Sal            | Number(10,3) |             |

- HospitalDept

Column Name | Data Type | Constraint
| :-----------: | :-----------: | :-----------: |
DeptNo | Varchar2 (5) | Primary key
DeptName | Varchar2(20) |
Location | Varchar2(20)

<br></br>
  
<p>b.  Add a column 'Additional Qualification' to the Hospital table. The data type is character</p>
<p>c.  Modify the column width of the Specialization field of Hospital table</p>
<p>d.  Remove column Location from HospitalDept table</p>
<p>e.  Rename the column name Sal to Salary in Hospital table</p>
<p>f.  Delete the table HospitalDept</p>
<p>g.  Display your name and age using the DUAL command</p>
<p>h.  Display the current system date</p>
<p>i.  Perform the following operations: 55-15+8*3/6</p>
<p>j.  Display all the tables currently available to the user</p>
