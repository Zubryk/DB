use recruitment_agency;

create function my_date_format (my_date date)
returns char(20)
return date_format(my_date, "%M %d, %Y");

create function str_to_date_format (my_date char(20))
returns date
return date_format(my_date, '%Y-%m-%d');

select my_date_format(Interview_date) as dateM
from interviews;

select str_to_date_format(Interview_date) 
from interviews;

DELIMITER //
create procedure my_count (in category char(20), in date1 date, in date2 date)
	begin
		declare error char(20);
        set error ='Неприйнятні дані';
        if (date1<date2) then
			begin
			create table if not exists recruitment_agency.selected_interviews (vacancy_name char(50), amount INT UNSIGNED);
            truncate recruitment_agency.selected_interviews;
            insert into recruitment_agency.selected_interviews select jobs.Vacancy_name as vacancy_name, count(interviews.Id_interview) as amount
            from (interviews inner join jobs)inner join categories 
            on categories.Category_name = category
            and interviews.Id_job = jobs.Id_job
            and jobs.Id_category = categories.Id_category
            where interviews.Interview_date between date1 and date2
			GROUP BY vacancy_name;
			END;
			ELSE SELECT error;
			END IF;
			END//
			DELIMITER ;
CALL my_count('Middle', '2020-01-01', '2020-08-05');
SELECT * FROM selected_interviews;