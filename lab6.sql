use recruitment_agency;

create view interviews2 as select distinct Interview_date, Start_time, Finish_time, Id_job, 
Id_recruiter, Id_applicant, Passed from interviews;

select *
from interviews2
where (Interview_date < '2020-04-03' and Interview_date > '2020-04-11');

select interviews2.Interview_date, interviews2.Start_time, interviews2.Finish_time, jobs.Vacancy_name, 
interviews2.Id_recruiter, interviews2.Id_applicant, interviews2.Passed
from interviews2, jobs
where jobs.Id_job = interviews2.Id_job;

select interviews2.Interview_date, interviews2.Start_time, interviews2.Finish_time, jobs.Vacancy_name, 
interviews2.Id_recruiter, interviews2.Id_applicant, interviews2.Passed
from interviews2, jobs
where jobs.Id_job = interviews2.Id_job and passed = 0;