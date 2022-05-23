create database Testing_Sysem_Assignment_1;
use Testing_Sysem_Assignment_1;
CREATE TABLE Department (
    departmentID INT PRIMARY KEY AUTO_INCREMENT,
    departmentName VARCHAR(255)
);
CREATE TABLE position (
    positionID INT PRIMARY KEY AUTO_INCREMENT,
    positionName VARCHAR(255)
);
CREATE TABLE `Account` (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(255),
    Usename VARCHAR(255),
    Fullname VARCHAR(255),
    departmentID INT,
    FOREIGN KEY (departmentID)
        REFERENCES Department (departmentID),
    PositionId INT,
    CreateDate DATE,
    foreign key(PositionId) references `position`(positionID)
);

CREATE TABLE `Group` (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(255),
    CreateID INT,
    CreateDate DATE,
    foreign key (CreateID) references `Account`(AccountID)
);
CREATE TABLE GroupAccount (
    GroupId INT,
    FOREIGN KEY (GroupId)
        REFERENCES `group` (GroupID),
    AccountId INT,
    FOREIGN KEY (AccountId)
        REFERENCES `account` (AccountID),
    joinDate DATE
);
CREATE TABLE typeQuestion (
    TypeID INT PRIMARY KEY AUTO_INCREMENT,
    TypeNAme VARCHAR(255)
);
CREATE TABLE categoryquestion (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(255)
);
CREATE TABLE Question (
    QuestionID INT PRIMARY KEY AUTO_INCREMENT,
    Content VARCHAR(255),
    CategoryID INT,
    FOREIGN KEY (CategoryID)
        REFERENCES categoryquestion (CategoryID),
    TypeId INT,
    FOREIGN KEY (TypeId)
        REFERENCES typequestion(TypeID),
    CreatorID INT NOT NULL,
    foreign key (CreatorID) references `Account`(AccountID),
    CreateDate DATE
);
CREATE TABLE answer (
    AnswerID INT PRIMARY KEY AUTO_INCREMENT,
    Content TEXT,
    QuestionId INT,
    FOREIGN KEY (QuestionId)
        REFERENCES question (QuestionID),
    isCorrect ENUM('YES', 'NO')
);
CREATE TABLE Exam (
    ExamID INT PRIMARY KEY AUTO_INCREMENT,
    `Code` VARCHAR(255),
    Title VARCHAR(255),
    CategoryId INT,
    FOREIGN KEY (CategoryId)
        REFERENCES categoryquestion (CategoryID),
    Duration TIME,
    CreatorID INT,
    CreateDate DATE,
    foreign key (CreatorID) references Question(CreatorID)
);
CREATE TABLE ExamQuestion (
    ExamId INT,
    FOREIGN KEY (ExamId)
        REFERENCES Exam (ExamID),
    QuestionID int,
    foreign key (QuestionID) references question(QuestionID)
);

