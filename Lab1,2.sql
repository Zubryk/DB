create database recruitment_agency;
use recruitment_agency;

CREATE TABLE Companies  (
	Id_company INTEGER NOT NULL,
	Company_name CHAR(30) NOT NULL,
	Descryption CHAR(150),
	Website VARCHAR(20),
PRIMARY KEY (Id_company) ); 

CREATE TABLE Categories  (
	Id_category INTEGER NOT NULL,
	Category_name CHAR(30) NOT NULL,
PRIMARY KEY (Id_category) );

CREATE TABLE Jobs   (
	Id_job   INTEGER NOT NULL,
	Vacancy_name CHAR(30) NOT NULL,
	Descryption CHAR(250) NOT NULL,
	Id_company INT NOT NULL, 
	Id_category INT NOT NULL,
	City  CHAR(20),
	Salary decimal(15, 2) NOT NULL,
PRIMARY KEY (Id_job) ,
CONSTRAINT fk_company FOREIGN KEY (Id_company) 
REFERENCES Companies(Id_company) ON DELETE CASCADE ON UPDATE CASCADE, 
CONSTRAINT fk_category FOREIGN KEY (Id_category) 
REFERENCES Categories(Id_category) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Applicants  (
	Id_applicant INTEGER NOT NULL,
	First_name CHAR(20) NOT NULL,
	Second_name CHAR(20) NOT NULL,
	Email  CHAR(30) NOT NULL,
	Phone_number  INTEGER NOT NULL,
PRIMARY KEY (Id_applicant) );

CREATE TABLE Recruiters  (
	Id_recruiter INTEGER NOT NULL,
	First_name CHAR(20) NOT NULL,
	Second_name CHAR(20) NOT NULL,
	Email  CHAR(30) NOT NULL,
	Phone_number  INTEGER NOT NULL,
PRIMARY KEY (Id_recruiter) );

CREATE TABLE Interviews   (
	Id_interview INTEGER NOT NULL,
	Interwiew_date DATE NOT NULL,
	Start_time TIME NOT NULL, 
	Finish_time TIME NOT NULL, 
	Id_job INT NOT NULL, 
	Id_recruiter INT NOT NULL, 
	Id_applicant INT NOT NULL,
	Passed BIT, 
PRIMARY KEY (Id_interview),
CONSTRAINT  fk_job FOREIGN KEY (Id_job) 
REFERENCES Jobs(Id_job) ON DELETE CASCADE ON UPDATE CASCADE, 
CONSTRAINT  fk_recruiter FOREIGN KEY (Id_recruiter) 
REFERENCES Recruiters(Id_recruiter) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT  fk_applicants FOREIGN KEY (Id_applicant) 
REFERENCES Applicants(Id_applicant) ON DELETE CASCADE ON UPDATE CASCADE
);







