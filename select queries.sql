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


-- --------------------------------------------------------
-- project alloation
-- --------------------------------------------------------
select * from project_allocation;

select * from project_allocation;

(select emp_id , max(end_date)  as last_end_date
from project_allocation
group by emp_id);



select project_allocation.emp_id, project_allocation.proj_id, project_allocation.start_date, project_allocation.end_date
from project_allocation
join(select emp_id , max(end_date)  end_date
	from project_allocation
	group by emp_id) as last_project
on project_allocation.end_date = last_project.end_date
where project_allocation.emp_id = 1;



-- get all employee who are free after date
-- ------------------------------------------
select employee.emp_id,employee.company_email,employee.location, employee.name , employee.personal_email, last_project.end_date
from employee
join (select emp_id , max(end_date)  end_date
	from project_allocation
	group by emp_id) as last_project
on employee.emp_id = last_project.emp_id
where last_project.end_date <= "2020-03-01"; 

select * from onboard;

select * from demand_skillset;
select * from project_allocation;

select*from onboard;

select * from onboard where bgc_status like "started";

update onboard set emp_id = 6,dem_id = 2 , start_Date = "2020-06-02" , eta_of_completion = "2020-05-31" , onboarding_status = "waiting-approval" , bgc_status = "started" 
where onb_id = 2;

select * from onboard where onb_id=24;

update onboard set emp_id = 3,dem_id = 1 , start_Date = "2222-02-22" , eta_of_completion = "2222-02-22" , onboarding_status = "completed" , bgc_status = "started"  where onb_id = 56;

select * from Onboard_Log where timestamp between "2020-06-04 16:24:23" and "2020-06-04 16:24:23";

insert into Onboard_Log (operator , operation , onb_id , emp_id , dem_id, start_date , eta_of_completion , onboarding_status , bgc_status)
	values("test_operator" , "test_operation" , 1 ,1 ,1, "2020-01-02" , "2020-01-02" , "started" , "started");

select * from employee_skillset;




select * from onboard_log;
commit; 

select* from demand;

select location,count(*) as count from demand group by location;

select * from onboard where BGC_status like "s%";
select * from onboard where dem_id=2;


select* from onboard_log where onb_id  = 1;

select* from onboard;

-- delete from onboard where onb_id = 2;
update onboard set onb_id = 74 where onb_id = 76;

select * from onboard_log where onb_id = 2;



















