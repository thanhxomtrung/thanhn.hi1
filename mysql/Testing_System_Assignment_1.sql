CREATE DATABASE bai1;


USE bai1;

CREATE TABLE Department  
(
	Department_ID  		int auto_increment primary key ,
    Department_Name 	varchar(50)
);

CREATE TABLE Position1
(
	Position_ID			int auto_increment primary key ,
    Position_Name 		enum('Dev','Test','Scrum Master','PM')
);

drop TABLE Account1;

CREATE TABLE Account1 
(
	Account_ID			int auto_increment primary key ,
    Email 				varchar(50),
    User_Name 			varchar(50),
    Full_Name			varchar(50),
    Department_ID		INT  ,
    Position_ID			INT ,
    Create_Date			Date,
FOREIGN KEY	 (Department_ID) REFERENCES Department(Department_ID),
FOREIGN KEY (Position_ID) 	REFERENCES Position1(Position_ID)
);


CREATE TABLE Group1
(
	Group_ID			INT AUTO_INCREMENT PRIMARY KEY,
    Group_Name			VARCHAR(50),
    Creator_ID			INT,
    Create_Date			DATE
);

CREATE TABLE Gruop_Account 
(
	Group_ID				INT,
    Account_ID				INT,
    Join_Date				DATE ,
FOREIGN KEY	 (Group_ID) 	REFERENCES 		Group1(Group_ID),
FOREIGN KEY (Account_ID) 	REFERENCES 		Account1(Account_ID)

);

CREATE TABLE Type_Question
(
	Type_ID 				INT AUTO_INCREMENT PRIMARY KEY ,
    Type_Name				VARCHAR(50)
);

CREATE TABLE Category_Question
(
	Category_ID				INT AUTO_INCREMENT PRIMARY KEY ,
    Category_Name			VARCHAR(50)
);

CREATE TABLE Question
(
	Question_ID				INT AUTO_INCREMENT PRIMARY KEY ,
    Content					VARCHAR(50),
    Category_ID				INT,
    Type_ID					INT,
    Creator_ID				INT,
    Create_Date				DATE,
FOREIGN KEY	 (Category_ID) 	REFERENCES 		Category_Question(Category_ID),
FOREIGN KEY (Type_ID) 		REFERENCES 		Type_Question(Type_ID)
);


CREATE TABLE Answer
(
	Answer_ID				INT AUTO_INCREMENT PRIMARY KEY,
    Content					VARCHAR(50),
    Question_ID				INT,
    is_Correct				ENUM('Đúng','Sai'),
FOREIGN KEY	 (Question_ID) 	REFERENCES 		Question(Question_ID)
);

CREATE TABLE Exam
(
	Exam_ID					INT AUTO_INCREMENT PRIMARY KEY ,
	Code1					VARCHAR(50),
    Title					VARCHAR(50),
    Category_ID				INT,
    Duration 				DATETIME,
    Creator_ID				INT,
    Create_Date				DATE,
FOREIGN KEY	 (Category_ID) 	REFERENCES 		Category_Question(Category_ID)
);

CREATE TABLE Exam_Question
(
	Exam_ID					INT,
    Question_ID				INT,
FOREIGN KEY	 (Question_ID) 	REFERENCES 		Question(Question_ID)
);



	
    



    
    

    


