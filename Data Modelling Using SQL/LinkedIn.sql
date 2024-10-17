
-- 1. Primary Keys and Fact Table Creation

-- Job Details table (Fact Table)
ALTER TABLE Job_Details
ADD CONSTRAINT PK_Job_Details PRIMARY KEY (job_id);

-- Location and Company Information table (Fact Table)
ALTER TABLE Location_and_Company_Information
ADD CONSTRAINT PK_Location_and_Company_Information PRIMARY KEY (job_id);


-- Job Industries table (Fact Table)
ALTER TABLE Job_Industries
ADD CONSTRAINT PK_Job_Industries PRIMARY KEY (job_id, industry_id);


-- Job Skills table (Fact Table)
ALTER TABLE Job_Skills
ADD CONSTRAINT PK_Job_Skills PRIMARY KEY (skill_abr);


-- Skills_des table (Fact Table)
ALTER TABLE Skills_des
ADD CONSTRAINT PK_Skills_des PRIMARY KEY (skill_abr);




-- 2. Dimension Table Primary Keys
-- Companies table (Dimension Table)
ALTER TABLE Companies
ADD CONSTRAINT PK_Companies PRIMARY KEY (company_id);

-- Skills_des table (Dimension Table)
ALTER TABLE Skills_des
ADD CONSTRAINT PK_Skills_des PRIMARY KEY (skill_abr);

-- Industries table (Dimension Table)
ALTER TABLE Industries
ADD CONSTRAINT PK_Industries PRIMARY KEY (industry_id);


-- Link PK and FK

-- Link Application_Information to Job_Details using job_id
ALTER TABLE Application_Information
ADD CONSTRAINT FK_Application_Information_Job_Details FOREIGN KEY (job_id)
REFERENCES Job_Details (job_id);


-- Link Benefits to Job_Details using job_id
ALTER TABLE Benefits
ADD CONSTRAINT FK_Benefits_Job_Details FOREIGN KEY (job_id)
REFERENCES Job_Details (job_id);


-- Link Job_Industries to Job_Details using job_id
ALTER TABLE Job_Industries
ADD CONSTRAINT FK_Job_Industries_Job_Details FOREIGN KEY (job_id)
REFERENCES Job_Details (job_id);


-- Link Job_Skills to Job_Details using job_id
ALTER TABLE Job_Skills
ADD CONSTRAINT FK_Job_Skills_Job_Details FOREIGN KEY (job_id)
REFERENCES Job_Details (job_id);



-- Link Location_and_company_Information to Job_Details using job_id
ALTER TABLE Location_and_company_Information
ADD CONSTRAINT FK_Location_and_company_Information_Job_Details FOREIGN KEY (job_id)
REFERENCES Job_Details (job_id);


-- Link Salaries to Job_Details using job_id
ALTER TABLE Salaries
ADD CONSTRAINT FK_Salaries_Job_Details FOREIGN KEY (job_id)
REFERENCES Job_Details (job_id);


-- Link Skill to Job_Details using job_id
ALTER TABLE Skill
ADD CONSTRAINT FK_Skill_Job_Details FOREIGN KEY (job_id)
REFERENCES Job_Details (job_id);



-- Link Time_Data to Job_Details using job_id
ALTER TABLE Time_Data
ADD CONSTRAINT FK_Time_Data_Job_Details FOREIGN KEY (job_id)
REFERENCES Job_Details (job_id);



-- Link Job_Industries to Industries using industry_id
ALTER TABLE Job_Industries
ADD CONSTRAINT FK_Job_Industries_Industries FOREIGN KEY (industry_id)
REFERENCES Industries (industry_id);



-- Link Job_Skills to Skills_des using skill_abr
ALTER TABLE Job_Skills
ADD CONSTRAINT FK_Job_Skills_Skills_des FOREIGN KEY (skill_abr)
REFERENCES Skills_des (skill_abr);



-- Link Location_and_company_Information to Companies using company_id
ALTER TABLE Location_and_company_Information
ADD CONSTRAINT FK_Location_and_company_Information_Companies FOREIGN KEY (company_id)
REFERENCES Companies (company_id);


-- Link Company_Industries to Companies using company_id
ALTER TABLE Company_Industries
ADD CONSTRAINT FK_Company_Industries_Companies FOREIGN KEY (company_id)
REFERENCES Companies (company_id);



-- Link Company_Specialities to Companies using company_id
ALTER TABLE Company_Specialities
ADD CONSTRAINT FK_Company_Specialities_Companies FOREIGN KEY (company_id)
REFERENCES Companies (company_id);




-- Link Employee_Counts to Companies using company_id
ALTER TABLE Employee_Counts
ADD CONSTRAINT FK_Employee_Counts_Companies FOREIGN KEY (company_id)
REFERENCES Companies (company_id);










-- Find the missing values

-- Find job_id values in Benefits that do not exist in Job_Details
SELECT job_id
FROM Benefits
WHERE job_id NOT IN (SELECT job_id FROM Job_Details);



-- Find company_id values in Location_and_company_information that do not exist in Companies
SELECT company_id
FROM Location_and_company_Information
WHERE company_id NOT IN (SELECT company_id FROM Companies);



-- Find job_id values in Job_Industries that do not exist in Job_Details
SELECT job_id
FROM Job_Industries
WHERE job_id NOT IN (SELECT job_id FROM Job_Details);