CREATE DATABASE btvn ;

DROP  DATABASE btvn ;

USE btvn ;

CREATE TABLE Departments
(
	Department_ID		INT(10) AUTO_INCREMENT PRIMARY KEY,
    Department_Name 	VARCHAR(30),
    Description_Dp		TEXT ,
    Created_At			DATETIME,
    Update_At 			DATETIME
);

ALTER	TABLE Departments 
MODIFY COLUMN Update_At DATETIME DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE	Users
(	
	User_ID			INT(10) AUTO_INCREMENT PRIMARY KEY ,
    First_Name		VARCHAR(30),
	Last_Name 		VARCHAR(30),
    Email			VARCHAR(100),
    Phone			VARCHAR(20),
    Employee_ID		VARCHAR(100),
    Avatar			TEXT,
    Department_ID	INT(10),
    Gender			TINYINT(10),
    Age				INT(3),
    Created_At		DATETIME,
    Update_At		DATETIME
);

ALTER	TABLE Users 
MODIFY COLUMN Update_At DATETIME DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE User_Department 
(
	ID 				INT(10) AUTO_INCREMENT  PRIMARY KEY  ,
    User_rid 		INT(10)	 NOT NULL ,
    Department_ID 	INT(10)  NOT NULL   ,
    Startd_Date 	DATE ,
    End_Date 		DATE ,
    Created_At 		DATETIME ,
    Update_At 		DATETIME ,
FOREIGN	KEY (Department_ID) REFERENCES Departments(Department_ID) ,
FOREIGN	KEY (User_rid) 		REFERENCES Users(User_ID) 
);

ALTER	TABLE User_Department 
MODIFY COLUMN Update_At DATETIME DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE Roles
(
	Roles_ID	INT(10) AUTO_INCREMENT PRIMARY KEY ,
    Roles_Name	VARCHAR(30) ,
    Created_At	DATETIME,
    Update_At	DATETIME 
);


ALTER	TABLE Roles 
MODIFY COLUMN Update_At DATETIME DEFAULT CURRENT_TIMESTAMP;


CREATE TABLE User_Role
(
	ID					INT(10) AUTO_INCREMENT PRIMARY KEY ,
    User_Department_ID	INT(10) 	,
    Role_ID				INT(10)		,
    Start_Date			DATE		,
    End_Date			DATE  		,
    Created_At			DATETIME 	,
    Update_At			DATETIME	,
FOREIGN	KEY (User_Department_ID) REFERENCES User_Department (ID) ,
FOREIGN	KEY ( Role_ID	) 		REFERENCES Roles(Roles_ID) 
);

ALTER	TABLE User_Role 
MODIFY COLUMN Update_At DATETIME DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE	Salary 
(
	Salary_ID		INT(10) AUTO_INCREMENT PRIMARY KEY,
    User_Role_ID	INT(10)	,
    Total_Salary	DOUBLE(12,2),
    Salary_Month	VARCHAR(2),	
    Salary_Year		VARCHAR(4),
    Create_At		DATETIME ,
    Update_At		DATETIME,
    FOREIGN	KEY (  User_Role_ID	) 		REFERENCES User_Role(ID) 
);

ALTER	TABLE Salary 
MODIFY COLUMN Update_At DATETIME DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE Salary_Detail_Type
(	
	ID							INT(10) AUTO_INCREMENT PRIMARY KEY ,
    Salary_Detail_Type_Name 	VARCHAR(10),
    Create_At		DATETIME ,
    Update_At		DATETIME
);

ALTER	TABLE Salary_Detail_Type 
MODIFY COLUMN Update_At DATETIME DEFAULT CURRENT_TIMESTAMP;
    
CREATE TABLE Salary_Detail
(
	ID 							INT(10) AUTO_INCREMENT PRIMARY KEY ,
    Amount						DOUBLE(12,2),
    Salary_ID					INT(10),
	Salary_Detail_Type_ID		INT(10),
	Operation					TINYINT(30),
FOREIGN	KEY (Salary_Detail_Type_ID) REFERENCES Salary_Detail (ID) ,
FOREIGN	KEY ( Salary_ID	) 		REFERENCES Salary (Salary_ID) 
);


INSERT INTO Departments 
(
	Department_Name ,
    Description_Dp  ,
    Created_At		
)
VALUES		('Admin','Operator','2020-11-9'),
			('HR','HRM','2020-11-9'),
            ('IT','Information Technology','2020-11-9'),
            ('Delivery','carrier','2020-11-9');

SELECT * FROM Departments ;

SELECT * FROM Roles ;

INSERT INTO Roles
(
	 Roles_Name	,
    Created_At	
)
VALUES 		('Giám Đốc'			,	'2020-11-01 08:00:00'),
			('Trưởng Phòng'		,	'2020-11-01 08:00:00'),
            ('Phó Phòng'		,	'2020-11-01 08:00:00'),
            ('Nhân Viên '		,	'2020-11-8 08:00:00'),
            ('CTV'				,	'2020-11-8 08:00:00');


            
            
            

	



	
    