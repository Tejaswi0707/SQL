SELECT e1.name
from Employee e1, Employee e2
where e2.managerId=e1.id
group by e1.id
having count(*)>=5
