use recruitment_agency;

select jobs.Vacancy_name, jobs.City, jobs.Salary from jobs
where jobs.Id_category in (1, 2, 3)
order by jobs.Salary asc;

select * from interviews
order by Interview_date desc limit 3;

select interviews.Id_interview, interviews.Interview_date, interviews.Start_time, 
interviews.Finish_time, jobs.Vacancy_name, companies.Company_name
from (interviews inner join jobs) inner join companies
on jobs.Id_job = interviews.Id_job
and companies.Id_company = jobs.Id_company
group by companies.Company_name;