use recruitment_agency;

select Vacancy_name as 'Vacancy with salary over 1000'
from jobs
where Salary >= 1000;

select companies.Id_company, companies.Company_name, jobs.Id_job, jobs.Vacancy_name, jobs.Salary
from companies left join jobs
on companies.Id_company = jobs.Id_company;

select interviews.Id_interview, interviews.Interview_date, interviews.Start_time, 
interviews.Finish_time, recruiters.First_name, recruiters.Second_name
from interviews inner join recruiters 
on recruiters.Id_recruiter = interviews.Id_recruiter
where recruiters.Email = 'gapa@gmail.com';

select interviews.Id_interview, interviews.Interview_date, interviews.Start_time, 
interviews.Finish_time, jobs.Vacancy_name, companies.Company_name
from (interviews inner join jobs) inner join companies
on jobs.Id_job = interviews.Id_job
and companies.Id_company = jobs.Id_company
where companies.Company_name in ('Eleks', 'Ciklum');

select interviews.Id_interview, interviews.Interview_date, interviews.Start_time, 
interviews.Finish_time, recruiters.First_name, recruiters.Second_name
from interviews inner join recruiters 
on interviews.Id_recruiter = recruiters.Id_recruiter
where interviews.Id_job in (select jobs.Id_job from jobs
where jobs.City in ('Lviv', 'Kyiv'))
order by interviews.Interview_date;

select categories.Category_name from categories
where not exists 
(select * from jobs
where jobs.Id_category = categories.Id_category);

select recruiters.First_name, recruiters.Second_name, recruiters.Email  
from recruiters
where length(Email) < 10 or Email like  '@';




