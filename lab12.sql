use recruitment_agency;

create trigger category_delete before delete
on recruitment_agency.categories for each row 
update recruitment_agency.jobs set Id_category = 2 where Id_category = OLD.Id_category;

delete from categories where Id_category = 1;
select * from jobs;

create trigger interview_date before insert
on interviews for each row
set new.interview_date = date_add(new.interview_date, interval 1 month);

insert into interviews value (null, '2020-05-04', '16:30:00.000', '17:00:00.000', 2, 3, 1, 1);
select * from interviews;

alter table jobs
add column last_interview date default null;

create trigger last_job_interview after insert
on interviews for each row
update jobs set jobs.last_interview = Date(now())
where jobs.Id_job = new.Id_job;

insert into interviews value (null, '2020-05-04', '16:30:00.000', '17:00:00.000', 4, 3, 1, 1);
select * from jobs 