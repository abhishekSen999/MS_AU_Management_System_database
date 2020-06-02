-- select employee by project alocation
-- --------------------------------------------------
select emp_id,proj_id from project_allocation 
where DATE(end_date) between '2020-04-25' and '2020-05-31' ;

select * from employee where emp_id = 2;

select* from employee where company_email = "abhishek.sen@accoliteindia.com";

select* from employee where personal_email = "abhishek1@gmail.com";

select * from employee where location = "mumbai";

select * from skill where skill_id = 1;

-- all skill of employee with id =1

select skill.skill_id, skill.skill_name 
from skill
join employee_skillset  on  employee_skillset.skill_id =  skill.skill_id
where employee_skillset.emp_id = 1 ;
-- ----------------------------------

-- all employee with skill id = 1

select employee.emp_id , employee.name , employee.company_email , employee.personal_email , employee.location
from employee
join employee_skillset on employee_skillset.emp_id = employee.emp_id
where employee_skillset.skill_id =1;


-- --------------
-- demand

select * from demand ;

select * from demand where creation_date <= "2020-04-05" ;
 
 
 select * from demand where location = "Mumbai";
 
 
 select * from demand where number_people >5;
 
 -- ------------------
 -- get all demand with skill id
 
 select demand.dem_id,demand.creation_date,demand.experience_requirement,demand.h_id,demand.location,demand.number_people
 from demand
 join demand_skillset on demand.dem_id = demand_skillset.dem_id
 where demand_skillset.skill_id = 1;
 
 select* from demand_skillset;
 
 
 -- get all skills for demand with id
 select skill.skill_id, skill.skill_name
 from skill
 join demand_skillset on demand_skillset.skill_id = skill.skill_id
 where demand_skillset.dem_id = 1;
 
 select* from employee where lower(name) = "abhishek1 sen";
 
 
select* from employee;

select* from hiring_manager;

select* from hiring_manager;

select* from hiring_manager where h_id = 1;

select * from hiring_manager where lower(name) = "manager1";

select * from hiring_manager where lower(email) = "email1@gmail.com";

select * from hiring_manager where lower(email) = "email1@gmail.com";






