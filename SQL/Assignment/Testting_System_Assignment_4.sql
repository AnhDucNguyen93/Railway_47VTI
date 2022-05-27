create database Testing_Sysem_Assignment_4;
use Testing_Sysem_Assignment_4;
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    departmentName VARCHAR(255)
);
CREATE TABLE Position (
    PositionID INT PRIMARY KEY AUTO_INCREMENT,
    PositionName VARCHAR(255)
);
CREATE TABLE `Account` (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(255),
    Usename VARCHAR(255),
    Fullname VARCHAR(255),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department (DepartmentID),
    PositionId INT,
    CreateDate DATETIME,
    FOREIGN KEY (PositionId)
        REFERENCES Position (PositionID)
);

CREATE TABLE `Group` (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(255),
    CreateID INT,
    CreateDate DATETIME,
    FOREIGN KEY (CreateID)
        REFERENCES `Account` (AccountID)
);
CREATE TABLE GroupAccount (
    GroupId INT,
    FOREIGN KEY (GroupId)
        REFERENCES `group` (GroupID),
    AccountId INT,
    FOREIGN KEY (AccountId)
        REFERENCES `account` (AccountID),
    joinDate DATETIME
);
alter table groupaccount add constraint primary key auto_increment (GroupId);
CREATE TABLE TypeQuestion (
    TypeID INT PRIMARY KEY AUTO_INCREMENT,
    TypeNAme VARCHAR(255)
);
CREATE TABLE CategoryQuestion (
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
        REFERENCES typequestion (TypeID),
    CreatorID INT,
    FOREIGN KEY (CreatorID)
        REFERENCES `Account` (AccountID),
    CreateDate DATETIME
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
    Duration INT NOT NULL,
    CreatorID INT,
    CreateDate DATETIME,
    FOREIGN KEY (CreatorID)
        REFERENCES Question (CreatorID)
);
CREATE TABLE ExamQuestion (
    ExamId INT,
    FOREIGN KEY (ExamId)
        REFERENCES Exam (ExamID),
    QuestionID INT,
    FOREIGN KEY (QuestionID)
        REFERENCES question (QuestionID)
);
alter table ExamQuestion add constraint primary key auto_increment(ExamId);

-- Question 1
SELECT 
    A.*, D.departmentName
FROM
    `account` AS A
        JOIN
    department D ON A.DepartmentID = D.DepartmentID;
-- Question 2
SELECT 
    A.*, D.departmentName
FROM
    `account` AS A
        JOIN
    department D ON A.DepartmentID = D.DepartmentID
WHERE
    A.CreateDate < '2022-01-22';
--    Question 3
 SELECT 
    A.*, P.PositionName, D.departmentName
FROM
    `account` A
        JOIN
    position P ON A.PositionId = P.PositionID
        JOIN
    department D ON A.DepartmentID = D.DepartmentID
WHERE
    P.PositionName = 'dev';
 --    Question 4
 SELECT 
    D.departmentName, COUNT(A.departmentID) AS SL, D.DepartmentID
FROM
    `account` A
        JOIN
    department D ON A.DepartmentID = D.DepartmentID
GROUP BY D.departmentID
HAVING COUNT(departmentName) > '3';
  --    Question 5
SELECT 
    E.QuestionID, Q.Content
FROM
    examquestion E
        JOIN
    question Q ON E.QuestionID = Q.QuestionID
GROUP BY E.QuestionID
HAVING COUNT(E.QuestionID) = (SELECT 
        MAX(countQue) 
    FROM
        (SELECT 
            COUNT(E.QuestionID) AS countQue
        FROM
            examquestion E
        GROUP BY E.QuestionID) countTable);

SELECT 
    MAX(countQue) AS maxC
FROM
    (SELECT 
        COUNT(E.QuestionID) AS countQue
    FROM
        examquestion E
    GROUP BY E.QuestionID) countTable;

-- Question 6
SELECT 
    q.CategoryID, cq.CategoryName, count(Q.CategoryID)
FROM
    question Q
        JOIN
    categoryquestion cq ON q.QuestionID = cq.CategoryID
GROUP BY q.CategoryID;
SELECT 
    cq.CategoryID, cq.CategoryName, COUNT(q.CategoryID)
FROM
    categoryquestion cq
        JOIN
    question q ON cq.CategoryID = q.CategoryID
GROUP BY q.CategoryID;
-- Question 7
SELECT 
    Q.QuestionID, Q.Content, COUNT(E.QuestionID)
FROM
    examquestion E
        JOIN
    question Q ON E.QuestionID = Q.QuestionID
GROUP BY Q.QuestionID;

-- Question 8
SELECT 
    AN.QuestionId, AN.content
FROM
    answer AN
        JOIN
    question Q ON Q.QuestionID = AN.QuestionId
GROUP BY AN.QuestionId
HAVING COUNT(AN.QuestionId) = (SELECT 
        MAX(SL) AS maxSL
    FROM
        (SELECT 
            AN.QuestionId, COUNT(AN.questionId) AS SL
        FROM
            answer AS AN
        GROUP BY AN.QuestionId) AS TB);
-- Question 9
 SELECT 
    G.GroupID, G.GroupName, GA.AccountId, A.Fullname, COUNT(G.GroupID)
FROM
    groupaccount GA
        JOIN
    `group` G ON G.GroupID = GA.GroupId
        JOIN
    `account` A ON GA.AccountId = A.AccountID
GROUP BY GA.GroupId;
-- Question 10 
SELECT 
    A.*, P.PositionName, COUNT(A.PositionId) AS SL
FROM
    account A
        JOIN
    position P ON A.PositionId = P.PositionID
GROUP BY A.PositionId
HAVING COUNT(A.PositionId) = (SELECT 
        MIN(countP)
    FROM
        (SELECT 
            COUNT(A.PositionId) AS countP
        FROM
            account A
        JOIN position P ON A.PositionId = P.PositionId
        GROUP BY A.PositionId) as MinCountP);