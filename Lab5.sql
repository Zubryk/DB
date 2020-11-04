use recruitment_agency;

create table if not exists applicants1
	as select * from applicants
    where Id_applicant < 3;
select * from applicants1;

create table if not exists applicants2 
	as select * from applicants
    where Id_applicant < 5;
select * from applicants2;
    
select * from applicants1
union select * from applicants2;

select * from applicants1
	where Id_applicant in (select Id_applicant from applicants2);
    
select * from applicants2
	where Id_applicant not in (select Id_applicant from applicants1);
    
select * from applicants1, applicants2;
