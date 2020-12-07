use recruitment_agency;

select Category_name as category, count(jobs.Id_job) as vacancies
from categories inner join jobs
on categories.Id_category = jobs.Id_category
group by Category_name;

select year(i.Interview_date) as year, month(i.Interview_date) as month,
count(i.Id_job) as vacancies
from interviews i
group by year(i.Interview_date), month(i.Interview_date) with rollup;

select companies.Company_name as company, avg(jobs.Salary) as avg_salary
from companies inner join jobs
on jobs.Id_company = companies.Id_company
group by companies.Company_name;

select companies.Company_name as best_company, (count(distinct interviews.Id_interview)*2 + count(jobs.Id_job)) as rating
from (interviews inner join jobs) inner join companies
on jobs.Id_job = interviews.Id_job
and companies.Id_company = jobs.Id_company
where month(interviews.Interview_date) = (month(current_date)-8)
group by companies.Company_name
order by rating desc limit 1;