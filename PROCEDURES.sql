--USE JobPortal
--GO
--CREATE PROC ShowEmployers
--AS
--SELECT E.*
--FROM Employer E
--  INNER JOIN Review_Profile R ON R.employer_id=E.ID
--WHERE R."status"=1
--ORDER BY E.company_name ASC
--GO
--CREATE PROC ShowJobs
--AS
--SELECT *
--FROM Job
--GO
--CREATE PROC JobsSearch
--@semester int,
--@allowed_faculty VARCHAR(20)
--AS
--IF(EXISTS(
--SELECT J.*
--FROM Job J
--  INNER JOIN Required_semesters R ON R.ID=J.ID
--  INNER JOIN Allowed_faculties A ON A.ID=J.ID
--WHERE A.faculty_name=@allowed_faculty AND R.semester=@semester
--))
--SELECT J.*
--FROM Job J
--  INNER JOIN Required_semesters R ON R.ID=J.ID
--  INNER JOIN Allowed_faculties A ON A.ID=J.ID
--WHERE A.faculty_name=@allowed_faculty AND R.semester=@semester
--ELSE
--SELECT *
--FROM JOB
--GO

--CREATE PROC UserRegister
--@usertype VARCHAR(20),
--@email VARCHAR(50),
--@first_name VARCHAR(20),
--@middle_name VARCHAR(20),
--@last_name VARCHAR(20),
--@birth_date DATETIME,
--@GIU_id INT,
--@semester INT,
--@faculty VARCHAR(20),
--@major VARCHAR(20),
--@gpa DECIMAL(4,2),
--@adress VARCHAR(10),
--@company_name VARCHAR(20),
--@company_phone VARCHAR(20),
--@fax VARCHAR(50),
--@company_website VARCHAR(50),
--@type_of_business VARCHAR(30),
--@establishment_year DATETIME,
--@origin_country VARCHAR(20),
--@industry VARCHAR(20),
--@n_current_employees INT,
--@products_services VARCHAR(30)
--AS
--INSERT INTO "User"(email,"password")VALUES(@email,0)
--DECLARE @user_id INT
--SELECT @user_id="User".ID
--FROM "User"
--WHERE "User".email=@email
--IF @usertype='Employer'
--INSERT INTO Employer(ID,company_name,"address",phone_number,fax,website,
--type_of_business,establishment_year,country_of_origin,industry,
--number_of_current_employees,products_or_services)
--VALUES(@user_id,@company_name,@adress,@company_phone,@fax,@company_website,@type_of_business,@establishment_year,@origin_country,
--@industry,@n_current_employees,@products_services)
--ELSE IF @usertype='Student'
--INSERT INTO Student(ID,GIU_ID,first_name,middle_name,last_name,birth_date,semester,
--faculty,major,GPA,"address")
--VALUES(@user_id,@GIU_id,@first_name,@middle_name,@last_name,@birth_date,@semester,@faculty,@major,@gpa,@adress)
--ELSE IF @usertype='Faculty_Representative'
--INSERT INTO Faculty_Representative (ID, faculty)VALUES(@user_id,@faculty)
--ELSE IF @usertype='Career_Office_Coordinator'
--INSERT INTO Career_Office_Coordinator(ID)VALUES(@user_id)
--ELSE IF @usertype='Admin'
--INSERT INTO "Admin"(ID) VALUES(@user_id)
--GO

--CREATE PROC UserLogin
--@email VARCHAR(50),
--@password VARCHAR(20)
--AS
--DECLARE @user_id INT
--DECLARE @success BIT
--SELECT @user_id="User".ID
--FROM "User"
--WHERE "User".email=@email AND "User"."password"=@password
--IF(@user_id IS NOT NULL)
--BEGIN
--PRINT 'TRUE'
--print @user_id
--END
--ELSE
--BEGIN
--PRINT 'False'
--SET @user_id=-1
--PRINT @user_id
--INSERT INTO "User"(ID,email,"password") VALUES(@user_id,@email,@password)
--END


--GO

--CREATE PROC ViewProfile
--@user_id INT
--AS
--SELECT *
--FROM "User"
--WHERE "User".ID=@user_id
--GO

-- CREATE PROC DeleteProfile
--@user_id INT
--AS
--DELETE FROM "User" WHERE "User".ID=@user_id
--GO

--CREATE PROC AdminViewEmps
--AS
--SELECT *
--FROM Employer
--GO

--CREATE PROC AdminReviewEmp
--@admin_id int,
--@emp_id int,
--@profile_status bit,
--@reason VARCHAR(100)
--AS
--UPDATE Review_Profile
--SET "status"=@profile_status,reason=@reason
--WHERE employer_id=@emp_id AND admin_id=@admin_id
--GO


--CREATE PROC AdminViewJobs
--AS
--SELECT *
--FROM Job
--GO

--CREATE PROC AdminViewFRs
--AS
--SELECT F.*,U.*
--FROM Faculty_Representative F
--  INNER JOIN "User" U ON F.ID=U.ID

--GO

--CREATE PROC AddFacultyRepToll
--@job_id int,
--@admin_id int,
--@facultyRep_id int
--AS
--UPDATE Industrial_Internship
--SET facultyRep_id=@facultyRep_id
--WHERE ID=@job_id AND aa_id=@admin_id

--GO

--CREATE PROC AdminReviewJob
--@admin_id int,
--@job_id int,
--@visibility bit,
--@reason varchar(100)
--AS
--UPDATE Job
--SET visibility=@visibility,reason=@reason
--WHERE admin_id=@admin_id AND ID=@job_id
--GO

--CREATE PROC EmpEditProfile
--@id INT,
--@password VARCHAR(8),
--@address VARCHAR(10),
--@company_name VARCHAR(20),
--@company_phone VARCHAR(20),
--@fax VARCHAR(50),
--@company_website VARCHAR(50),
--@type_of_business VARCHAR(30),
--@establishment_year DATETIME,
--@origin_country VARCHAR(20),
--@industry VARCHAR(20),
--@n_current_employees INT,
--@products_services VARCHAR(30)
--AS
--UPDATE "User"
--SET "password"=@password
--WHERE "User".ID=@id
--UPDATE Employer
--SET company_name=@company_name,"address"=@address,phone_number=@company_phone,fax=@fax,
--website=@company_website,type_of_business=@type_of_business,establishment_year=@establishment_year,country_of_origin=@origin_country,industry=@industry,
--number_of_current_employees=@n_current_employees,products_or_services=@products_services
--WHERE Employer.ID=@id
--GO

--CREATE PROC AddContact
--@emp_id int,
--@name varchar(20),
--@job_title varchar(30), 
--@email varchar(50), 
--@mobile_number varchar(20), 
--@fax varchar(50)
--AS
--INSERT INTO Contact_person(employer_ID,name,job_title,email,mobile_number,fax)
--VALUES(@emp_id,@name,@job_title,@email,@mobile_number,@fax)
--GO

--CREATE PROC AddHR
--@emp_id int,
--@name varchar(20),
--@email varchar(50)
--AS
--INSERT INTO HR_Director(employer_ID,name,email)
--VALUES(@emp_id,@name,@email)
--GO

--CREATE PROC ViewProfileStatus
--@emp_id int
--AS
--SELECT Review_Profile."status",Review_Profile.reason
--FROM Review_Profile
--WHERE Review_Profile.employer_id=@emp_id
--GO

--create PROC PostJob
--@emp_id int,
--@title varchar(30),
--@description varchar(50),
--@department varchar(20),
--@start_date datetime,
--@end_date datetime,
--@application_deadline datetime,
--@n_available_internships int,
--@salary_range varchar(20),
--@qualifications varchar(100),
--@location varchar(20), 
--@application_link varchar(50),
--@application_email varchar(50),
--@job_type varchar(30),
--@workdays int
--AS
--DECLARE @statuss bit
--SELECT @statuss=Review_Profile."status"
--FROM Review_Profile
--WHERE Review_Profile.employer_id=@emp_id
--IF (@statuss=1)
--BEGIN
--INSERT INTO Job(ID,title,"description",department,"start_date",end_date,
--application_deadline,num_of_available_internships,salary_range,qualifications,
--"location",application_link,application_email,job_type,employer_id)
--VALUES(10,@title,@description,@department,@start_date,@end_date,@application_deadline,@n_available_internships,@salary_range,@qualifications,
--@location,@application_link,@application_email,@job_type,@emp_id)
--END
--ELSE
--PRINT 'Employer not accepted'
--GO

--CREATE PROC AddFaculty
--@job_id int,
--@allowed_faculty varchar(20)
--AS
--INSERT INTO Allowed_faculties(ID,faculty_name)
--VALUES(@job_id,@allowed_faculty)

--GO

--CREATE PROC Required_semesters
--@job_id int,
--@semester int
--AS
--INSERT INTO Required_semesters(ID,semester)
--VALUES(@job_id,@semester)
--GO

--CREATE PROC EmpViewJobs
--@emp_id int
--AS
--SELECT *
--FROM JOB
--WHERE employer_id=@emp_id
--ORDER BY "start_date"

--GO

--CREATE PROC EmpViewApplicants
--@emp_id int,
--@job_id int
--AS
--SELECT S.*
--FROM Student S
-- INNER JOIN "Apply" A ON A.job_ID=@job_id
-- INNER JOIN Job J ON J.ID= @job_id AND J.employer_id=@emp_id

--GO

--CREATE PROC EmpUpdateApplicant
--@student_id int,
--@job_id int,
--@application_status varchar(20)
--AS
--DECLARE @temp VARCHAR
--SELECT @temp=job_type
--FROM Job
--WHERE ID=@job_id
--IF (@temp='industrial_internship')
--DECLARE @temp2 BIT
--SELECT @temp2=eligibility
--FROM Eligible
--WHERE student_id=@student_id
-- IF (@temp2='false')
-- UPDATE "Apply"
-- SET student_id=@student_id,job_id=@job_id,applicaton_status='rejected'
-- WHERE student_id=@student_id
--ELSE
--UPDATE "Apply"
--SET student_id=@student_id,job_id=@job_id,applicaton_status=@application_status
--WHERE student_id=@student_id


--GO
--CREATE PROC courseInformation @facRep_id int, @job_id int, @ii_status bit 
--AS
--UPDATE Industrial_Internship
--SET "status" = @ii_status
--WHERE FacultyRep_id = @facRep_id AND ID= @job_id;
--GO

--CREATE PROC StudentEditProfile @sid int, @email varchar(50),@first_name varchar(20),@middle_name varchar(20), @last_name
--varchar(20), @birth_date datetime,@GIU_id int,@semester int, @faculty varchar(20),@major varchar(20),@gpa decimal(4,2),@adress varchar(10)	
--AS
--UPDATE "User"
--SET "User".email=@email
--WHERE "User".ID=@sid
--UPDATE Student
--SET ID =@sid,first_name = @first_name,middle_name = @middle_name,last_name = @last_name,birth_date = @birth_date,
--GIU_ID=@GIU_id,semester = @semester,
--faculty = @faculty,
--major = @major,
--GPA = @gpa,
--"address" = @adress
--WHERE Student.ID=@sid
--GO

--CREATE PROC AddMobile @sid int,@mobileNumber varchar(20)
--AS
--INSERT INTO Student_phoneNumber (ID,number)
--VALUES (@sid , @mobileNumber);
--GO

--CREATE PROC CreateCV 
--@s_id int,
--@personal_mail varchar(50),
--@education varchar(100),
--@extracurricular_activities varchar(300),
--@linkedIn_link varchar(30),
--@github_link varchar(30),
--@skills varchar(300),
--@achievements varchar(300)
--AS
--INSERT INTO CV_Builder(personal_mail,education,extracurricular_activities,linkedIn_link,
--githubLink,skills,achievements,student_id)VALUES(@personal_mail,@education,@extracurricular_activities
--,@linkedIn_link,@github_link, @skills,@achievements,@s_id)
--GO

--CREATE PROC ApplyForJob @sid int, @job_id int
--AS
--INSERT INTO "Apply" (student_ID,job_ID,applicaton_status)
--VALUES (@sid , @job_id , 'Pending' );
--GO

--CREATE PROC ViewMyStatus @sid int, @job_id int
--AS
--SELECT applicaton_status
--FROM "Apply"
--WHERE student_ID = @sid AND job_ID = @job_id

--GO

--CREATE PROC AddProgressReport @sid int, @date datetime, @description varchar (100)
--AS
--INSERT INTO Progress_report(student_id,"date","description" , numeric_state , evaluation )
--VALUES(@sid , @date , @description , -1 , 'not evaluated');

--GO

--CREATE PROC ViewMyReports 
--@sid int
--AS
--SELECT "date", numeric_state, evaluation,"description"
--FROM Progress_report
--WHERE Progress_report.student_id=@sid
--GO

--CREATE PROC ViewAdvisors
--AS
--SELECT *
--FROM Academic_Advisor


--GO
--CREATE PROC CocViewStudents
-- @ii_id INT
-- AS
-- SELECT *
-- FROM Eligible
-- WHERE Eligible.ll_id=@ii_id

-- GO

--create proc CocUpdateEligibility
--@coc_id int, @s_id int, @ii_id int, @eligibility bit
--AS
--UPDATE Eligible
--SET student_id=@s_id,ll_id=@ii_id,coc_id=@coc_id,eligibility=@eligibility
--WHERE Eligible.student_id=@s_id
--GO

--create proc AAToII
--@aa_id int, @ii_id int
--as 
--UPDATE Industrial_Internship
--SET Industrial_Internship.aa_id=@aa_id
--WHERE Industrial_Internship.ID=@ii_id AND "status"=1
--GO

--CREATE PROC EvalProgressReport
--@sid int,
--@date datetime,
--@numeric_state int,
--@evaluation varchar(100)
--AS
--UPDATE Progress_report
--SET student_id=@sid,"date"=@date,numeric_state=@numeric_state,evaluation=@evaluation
--WHERE Progress_report.student_id=@sid
--GO
-- create proc ViewProgressReports
-- @advisor_id int
-- as
-- select *
-- from Progress_report
-- where Progress_report.advisor_id=@advisor_id
-- order by "date" desc 