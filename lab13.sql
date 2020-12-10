use recruitment_agency;

show index from companies;
show index from jobs;

create index INDX3 on companies (Id_company, Company_name);
show index from companies;

create index IND3 on jobs (Id_job, Id_company);
show index from jobs;

explain select companies.Company_name as best_company, (count(distinct interviews.Id_interview)*2 + count(jobs.Id_job)) as rating
from (interviews inner join jobs) inner join companies
on jobs.Id_job = interviews.Id_job
and companies.Id_company = jobs.Id_company
where month(interviews.Interview_date) = (month(current_date)-8)
group by companies.Company_name
order by rating desc limit 1;
            
explain select straight_join companies.Company_name as best_company, (count(distinct interviews.Id_interview)*2 + count(jobs.Id_job)) as rating
from (interviews inner join jobs) inner join companies
on jobs.Id_job = interviews.Id_job
and companies.Id_company = jobs.Id_company
where month(interviews.Interview_date) = (month(current_date)-8)
group by companies.Company_name
order by rating desc limit 1;