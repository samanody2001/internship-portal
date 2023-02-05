--CREATE DATABASE JobPortal;
--USE JobPortal ;
--CREATE TABLE "User"(
--ID INT PRIMARY KEY IDENTITY NOT NULL,
--email VARCHAR(40),
--username VARCHAR(25), 
--"password" VARCHAR(60)
--);

--CREATE TABLE Student (
--ID INT PRIMARY KEY NOT NULL,
--FOREIGN KEY (ID) REFERENCES "User" ON DELETE CASCADE ON UPDATE CASCADE,
--GIU_ID INT,
--first_name VARCHAR(25),
--middle_name VARCHAR(25),
--last_name VARCHAR(25),
--birth_date datetime, 
--age  AS (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date)) , 
--semester INT, 
--faculty VARCHAR(50), 
--major VARCHAR(25), 
--GPA DECIMAL(4,2), 
--"address" VARCHAR(40),
--CV VARCHAR(300), 
--coverletter VARCHAR (300)
--);

--CREATE TABLE Student_phoneNumber (
--ID INT NOT NULL ,
--number INT NOT NULL,
--FOREIGN KEY(ID) REFERENCES Student ON DELETE CASCADE ON UPDATE CASCADE,
--PRIMARY KEY (ID, number)
--);


--CREATE TABLE Employer (
--ID INT PRIMARY KEY,
--FOREIGN KEY (ID) REFERENCES "User" ON DELETE CASCADE ON UPDATE CASCADE,	
--company_name VARCHAR (25), 
--"address" VARCHAR(40), 
--phone_number INT,
--fax VARCHAR(50), 
--website VARCHAR(50),
--type_of_business VARCHAR(50), 
--establishment_year DATETIME, 
--country_of_origin VARCHAR(50),
--industry VARCHAR (50),
--number_of_current_employees INT, 
--products_or_services VARCHAR(50)
--);

--CREATE TABLE Contact_person (
--employer_ID INT PRIMARY KEY NOT NULL,
--FOREIGN KEY (employer_ID) REFERENCES Employer(ID) ON DELETE CASCADE ON UPDATE CASCADE,
--"name" VARCHAR(25), 
--job_title VARCHAR(25),
--email VARCHAR(40), 
--mobile_number INT, 
--fax VARCHAR(40)
--);

--CREATE TABLE HR_Director (
--employer_ID INT PRIMARY KEY NOT NULL,
--FOREIGN KEY (employer_ID) REFERENCES Employer,
--"name" VARCHAR (25),
--email VARCHAR (60)
--);

--CREATE TABLE "ADMIN"(
--ID INT PRIMARY KEY NOT NULL,
--FOREIGN KEY (ID) REFERENCES "User" ON DELETE CASCADE ON UPDATE CASCADE
--);

--CREATE TABLE  Faculty_Representative (
--ID INT PRIMARY KEY NOT NULL, 
--FOREIGN KEY (ID) REFERENCES "User" ON DELETE CASCADE ON UPDATE CASCADE,
--faculty VARCHAR(30)
--);

--CREATE TABLE Academic_Advisor (
--ID INT PRIMARY KEY NOT NULL, 
--faculty VARCHAR(30),
--FOREIGN KEY (ID) REFERENCES "User" ON DELETE CASCADE ON UPDATE CASCADE
--);

--CREATE TABLE Career_Office_Coordinator (
--ID INT PRIMARY KEY NOT NULL, 
--FOREIGN KEY (ID) REFERENCES "User" ON DELETE CASCADE ON UPDATE CASCADE
--);

--CREATE TABLE Review_Profile (
--employer_id INT PRIMARY KEY NOT NULL, 
--admin_id INT NOT NULL,
--"status" bit, 
--reason VARCHAR (60),
--FOREIGN KEY(employer_id) REFERENCES Employer ON DELETE CASCADE ON UPDATE CASCADE,
--FOREIGN KEY(admin_id) REFERENCES "Admin" ON DELETE NO ACTION ON UPDATE NO ACTION
--);

--CREATE TABLE Job (
--ID INT PRIMARY KEY IDENTITY NOT NULL,
--employer_id INT,
--admin_id INT,
--title VARCHAR(60), 
--"description" VARCHAR(60), 
--department VARCHAR(60), 
--"start_date" DATETIME, 
--end_date DATETIME, 
--duration AS (YEAR(end_date) -YEAR("start_date")),
--application_deadline DATETIME, 
--num_of_available_internships INT, 
--salary_range REAL, 
--qualifications VARCHAR(100),
--"location" VARCHAR(60),
--application_link VARCHAR(150),
--application_email VARCHAR(40), 
--job_type VARCHAR(30), 
--visibility BIT,
--reason VARCHAR(90),
--FOREIGN KEY(employer_id) REFERENCES Employer ON DELETE CASCADE ON UPDATE CASCADE,   
--FOREIGN KEY(admin_id) REFERENCES "Admin" ON DELETE NO ACTION ON UPDATE NO ACTION,
--);

--CREATE TABLE Allowed_faculties (
--ID INT  NOT NULL,
--FOREIGN KEY (ID) REFERENCES Job ON DELETE CASCADE ON UPDATE CASCADE,
--faculty_name VARCHAR(30) NOT NULL,
--PRIMARY KEY (ID, faculty_name)
--);

--CREATE TABLE Required_semesters (
--ID INT NOT NULL,
--FOREIGN KEY (ID) REFERENCES Job ON DELETE CASCADE ON UPDATE CASCADE,
--semester INT NOT NULL,
--PRIMARY KEY (ID, semester)
--);

--CREATE TABLE Part_time (
--ID INT PRIMARY KEY NOT NULL ,
--FOREIGN KEY (ID) REFERENCES Job ON DELETE CASCADE ON UPDATE CASCADE,
--workdays VARCHAR(80)
--);

--CREATE TABLE Freelance (
--ID INT PRIMARY KEY NOT NULL ,
--FOREIGN KEY (ID) REFERENCES Job ON DELETE CASCADE ON UPDATE CASCADE
--);

--CREATE TABLE Summer_internship (
--ID INT PRIMARY KEY NOT NULL,
--FOREIGN KEY (ID) REFERENCES Job ON DELETE CASCADE ON UPDATE CASCADE
--);

--CREATE TABLE Full_time (
--ID INT PRIMARY KEY NOT NULL,
--FOREIGN KEY (ID) REFERENCES Job ON DELETE CASCADE ON UPDATE CASCADE
--);

--CREATE TABLE Project_based (
--ID INT PRIMARY KEY NOT NULL,
--FOREIGN KEY (ID) REFERENCES Job ON DELETE CASCADE ON UPDATE CASCADE
--);

--CREATE TABLE Industrial_Internship (
--ID INT PRIMARY KEY NOT NULL,
--"status" VARCHAR(20),
--aa_id INT,
--FacultyRep_id INT,
--FOREIGN KEY (ID) REFERENCES Job ON DELETE CASCADE ON UPDATE CASCADE,
--FOREIGN KEY (aa_id) REFERENCES Academic_Advisor ON DELETE NO ACTION ON UPDATE NO ACTION,
--FOREIGN KEY (FacultyRep_id ) REFERENCES  Faculty_Representative ON DELETE NO ACTION ON UPDATE NO ACTION
--);

--CREATE TABLE CV_Builder(
--personal_mail VARCHAR(50) PRIMARY KEY NOT NULL,
--education VARCHAR(50),
--extracurricular_activities  VARCHAR(50),
--linkedIn_link  VARCHAR(50),
--githubLink  VARCHAR(50),
--skills VARCHAR(50),
--achievements VARCHAR(50),
--student_id  INT,
--FOREIGN KEY (student_id) REFERENCES Student ON DELETE CASCADE ON UPDATE CASCADE
--);

--CREATE TABLE "Apply"(
--student_ID INT NOT NULL,
--job_ID INT NOT NULL,
--applicaton_status VARCHAR(20),
--PRIMARY KEY(student_ID,job_ID),
--FOREIGN KEY (student_ID) REFERENCES Student(ID) ON DELETE CASCADE ON UPDATE CASCADE,
--FOREIGN KEY (job_ID) REFERENCES Job(ID) ON DELETE NO ACTION ON UPDATE NO ACTION
--);

--CREATE TABLE Eligible(
--student_id INT ,
--ll_id INT ,
--coc_id INT,
--eligibility BIT,
--PRIMARY KEY(student_id,ll_id),
--FOREIGN KEY (student_id) REFERENCES Student ON DELETE CASCADE ON UPDATE CASCADE,
--FOREIGN KEY (ll_id) REFERENCES Industrial_Internship ON DELETE NO ACTION ON UPDATE NO ACTION,
--FOREIGN KEY (coc_id) REFERENCES Career_Office_Coordinator ON DELETE NO ACTION ON UPDATE NO ACTION
--);

--CREATE TABLE Progress_report(
--student_id INT ,
--"date" DATETIME ,
--PRIMARY KEY(student_id, "date"),
--numeric_state INT,
--evaluation VARCHAR(20),
--"description" VARCHAR(100),
--advisor_id INT,
--FOREIGN KEY (student_id) REFERENCES Student(ID) ON DELETE CASCADE ON UPDATE CASCADE,
--FOREIGN KEY (advisor_id) REFERENCES "Admin"(ID) ON DELETE NO ACTION ON UPDATE NO ACTION 
--);
