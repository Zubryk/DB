use recruitment_agency;

insert into applicants
values(null, 'Yurii', 'Bronx', 'bronxy@gmail.com', '+38(067)-261-42-34');

insert into applicants 
values (null, 'Andrian', 'Horban', 'anho@gmail.com', '+38(067)-341-24-26'),
		(null, 'Oleh', 'Zhuravlev', 'zhurik@gmail.com', '+38(099)-231-32-44'),
		(null, 'Ruslan', 'Prokopcev', 'rulikpro@gmail.com', '+38(097)-461-42-99'), 
		(null, 'Maxym', 'Hladun', 'hladunm@gmail.com', '+38(097)-321-54-76');
        
insert into recruiters
values (null, 'Vasyl', 'Andrushchak', 'andrvas@gmail.com', '+38(097)-261-42-34'),
		(null, 'Galyna', 'Pavliy', 'gapa@gmail.com', '+38(067)-431-24-26'),
		(null, 'Oleh', 'Marchuk', 'omarchuk@gmail.com', '+38(099)-132-32-44'),
		(null, 'Rustam', 'Andruasvili', 'rustama@gmail.com', '+38(097)-461-40-07'),
		(null, 'Mariya', 'Melnyk', 'mmelnyk@gmail.com', '+38(099)-751-544-76');

insert into categories
values(null, 'Trainee'),
		(null, 'Junior'),
        (null, 'Middle'),
        (null, 'Senior'),
        (null, 'Lead'),
        (null, 'Architect');
        
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/companies.csv'
	into table companies
	fields terminated by ';'
	lines terminated by '\n';

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/jobs.csv'
	into table jobs
	fields terminated by ';'
	lines terminated by '\n';
    
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/interviews.csv'
	into table interviews
	fields terminated by ';'
	lines terminated by '\n';
    
select * from applicants;
update applicants
	set Second_name = 'Borodin'
    where Email = 'bronxy@gmail.com';
select * from applicants;

select * from interviews;
delete from interviews
	where (Interview_date < '2020-04-07' or Passed = 1);
select * from interviews;


