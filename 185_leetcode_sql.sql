with cte as
(SELECT d.name as Department, e.name as Employee, Salary,
DENSE_RANK() OVER (PARTITION BY e.departmentid ORDER BY salary desc) as Ranks
FROM employee e, department d where
e.departmentId=d.id)

Select Department, Employee, Salary from cte where ranks<=3