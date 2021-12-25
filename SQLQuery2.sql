
-- Ques 1
select e.first_name, e.last_name, e.department_id, d.department_name
from employees e
join departments d on d.department_id = e.department_id

-- Ques 2
select e.first_name,e.last_name, d.department_name , l.city , l.state_province
from employees e
join departments d on d.department_id = e.department_id
join locations l on l.location_id = d.location_id

-- Ques 3
select e.first_name, e.last_name, e.salary , j.GRADE_LEVEL
from employees e
join job_grades j on e.salary between j.LOWEST_SAL and j.HIGHEST_SAL

-- Ques 4
select e.first_name, e.last_name , e.department_id , d.department_name
from employees e
join departments d on d.department_id = e.department_id
where e.department_id = 4 or e.department_id = 8

-- Ques 5
select e.first_name , e.last_name , d.department_name , l.city , l.state_province
from employees e
join departments d on d.department_id = e.department_id
join locations l on l.location_id = d.location_id
where e.first_name like '%z%'

-- Ques 6
select *
from departments d
full join employees e on e.department_id = d.department_id

-- Ques 7
select e.first_name , e.last_name , e.salary
from employees e
join employees s
on e.salary < s.salary
and s.employee_id = 100

-- Ques 8
select e.first_name Employee , s.first_name Manager
from employees e
join employees s 
on s.employee_id = e.manager_id

-- Ques 9
select d.department_name , l.city , l.state_province
from departments d
join locations l 
on l.location_id = d.location_id

-- Ques 10
select e.first_name , e.last_name , d.department_id , d.department_name
from employees e
left join departments d
on d.department_id = e.department_id

-- Ques 11
select e.* , s.*
from employees e
join employees s
on s.manager_id = e.employee_id
where e.manager_id is null

-- Ques 12
select e.first_name , e.last_name , e.department_id
from employees e
join employees d
on d.department_id = e.department_id
and d.last_name like '%Taylor%'

-- Ques 13
select j.job_title , d.department_name ,e.first_name + '_' + e.last_name , jh.START_DATE
from job_history jh
join departments d
on d.department_id = jh.department_id
join jobs j
on jh.job_id = j.job_id
join employees e 
on e.employee_id = jh.EMPLOYEE_ID
where jh.START_DATE <='1993-01-01' and jh.END_DATE < '1997-08-31'

-- Ques 14
select  j.job_title , e.first_name + ' ' + e.last_name Employee_Name , j.max_salary - e.salary 'Differance Between Max'
from employees e
join jobs  j
on j.job_id = e.job_id

-- Ques 15
select d.department_name , AVG(e.salary) AVG_salary , COUNT(case when e.COMMISSION_PCT > 0 then 1 else null end) COUNT_COMMISSION_PCT
from departments d
right join employees e
on e.department_id = d.department_id
group by d.department_name

-- Ques 16
select j.job_title , e.first_name +' '+ e.last_name, j.max_salary - e.salary Differance  	
from departments d 
join employees e
on e.department_id = d.department_id
join jobs j
on j.job_id = e.job_id
where d.department_id = 8 

-- Ques 17
select c.country_name ,l.city , d.department_name
from countries c
join locations l
on l.country_id = c.country_id
join departments d 
on d.location_id = l.location_id
order by c.country_name

-- Ques 18
select d.department_name , e.first_name +' '+ e.last_name 'Manager name'
from departments d
join employees e
on e.employee_id = d.MANAGER_ID

-- Ques 19
select j.job_title , AVG(e.salary) 'avg salary'
from jobs j
join employees e
on e.job_id = j.job_id
group by j.job_title

-- Ques 20
select e.employee_id , jh.START_DATE 'START_DATE' , jh.END_DATE 'END_DATE ' ,jh.JOB_ID , jh.DEPARTMENT_ID
from employees e
join job_history jh
on jh.EMPLOYEE_ID = e.employee_id
where e.salary >= 12000

-- Ques 21
select c.country_name , l.city , COUNT(depID) DepartmentCount
from 
(
select d.department_id depID ,d.location_id, COUNT(e.employee_id) CountOfEmployee
from departments d
join employees e
on e.department_id = d.department_id
group by d.department_id ,d.location_id
having COUNT(e.employee_id) >= 2
) view1
join locations l
on l.location_id = view1.location_id
join countries c
on c.country_id = l.country_id
group by c.country_name , l.city;

-- Ques 22
select d.department_name , e.first_name + ' ' + e.last_name Manager , l.city City
from departments d
join employees e
on e.employee_id = d.MANAGER_ID
join locations l 
on l.location_id = d.location_id

-- Ques 23
select jh.department_id, e.employee_id , j.job_title , DATEDIFF(DAY, jh.START_DATE , jh.END_DATE) DaysWorked
from job_history jh
join employees e
on jh.EMPLOYEE_ID = e.employee_id
join jobs j
on j.job_id = jh.JOB_ID
where jh.department_id = 8

-- Ques 24
select  e.first_name + ' ' + e.last_name , e.salary
from locations l
join departments d
on d.location_id = l.location_id
join employees e
on e.department_id = d.department_id
where l.city = 'London'

-- Ques 25
select  e.first_name + ' ' + e.last_name 'Name' , j.job_title , jh.START_DATE , jh.END_DATE
from employees e
join jobs j
on j.job_id = e.job_id
full outer join job_history jh
on jh.EMPLOYEE_ID = e.employee_id
where e.COMMISSION_PCT = 0

-- Ques 26
select d.department_name , d.department_id , COUNT(e.employee_id) countOfEmployees
from departments d
join employees e
on d.department_id = e.department_id
group by  d.department_name , d.department_id 


-- Ques 27
select e.first_name + ' ' + e.last_name , e.employee_id ,c.country_name
from employees e
join departments d 
on e.department_id = d.department_id
join locations l
on l.location_id = d.location_id
join countries c
on c.country_id = l.country_id

