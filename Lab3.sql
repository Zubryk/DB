use recruitment_agency;

show tables;
describe jobs;

alter table jobs
	drop foreign key fk_category,
    drop index fk_category;
    
alter table jobs
	drop column Id_category,
    modify column Vacancy_name char(35) not null;
    
alter table applicants
	modify column Second_name char(25);
        
alter table interviews
	modify Id_interview int unsigned not null,
	add column Id_version int unsigned not null after Id_interview,
	add constraint unique UQ_Interview_version (Id_interview, Id_version);
describe interviews;

alter table jobs
	drop foreign key fk_company,
    add CONSTRAINT fk_company_new FOREIGN KEY (Id_company) 
REFERENCES Companies(Id_company) ON DELETE CASCADE;
    
    

