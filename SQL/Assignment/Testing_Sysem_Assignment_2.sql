create database Testing_Sysem_Assignment_2;
use Testing_Sysem_Assignment_2;
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
    Duration TIME,
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
INSERT INTO department (departmentID, departmentName)
VALUES
				(1, N'Marketing'),
				(2, N'Sale'),
				(3, N'Bao ve'),
				(4, N'Nhan su'),
				(5, N'Ky thuat'),
				(6, N'Tai chinh'),
				(7, N'Pho giam doc'),
				(8, N'Giam doc'),
				(9, N'Thu ky'),
				(10, N'Ban hang');
insert into Position (PositionName) values ('Dev'), ('Test'), ('Scrum Master'), ('PM');
-- Account
insert into `Account` (Email, Usename, Fullname, DepartmentID, PositionId, CreateDate) values ('lmatous0@jiathis.com', 'Charlean', 'Loraine', 1, 2, '2022/01/06');
insert into `Account` (Email, Usename, Fullname, DepartmentID, PositionId, CreateDate) values ('rcoffin1@independent.co.uk', 'Stormie', 'Ronnie', 3, 4, '2022/04/09');
insert into `Account` (Email, Usename, Fullname, DepartmentID, PositionId, CreateDate) values ('mnussii2@utexas.edu', 'Ailsun', 'Minny', 5, 1, '2021/09/28');
insert into `Account` (Email, Usename, Fullname, DepartmentID, PositionId, CreateDate) values ('kpavlov3@over-blog.com', 'Bo', 'Kassie', 7, 3, '2022/01/21');
insert into `Account` (Email, Usename, Fullname, DepartmentID, PositionId, CreateDate) values ('inigh4@smh.com.au', 'Wood', 'Isadore', 9, 1, '2022/01/22');
insert into `Account` (Email, Usename, Fullname, DepartmentID, PositionId, CreateDate) values ('bkrimmer5@aol.com', 'Tynan', 'Bale', 2, 1, '2022/04/11');
insert into `Account` (Email, Usename, Fullname, DepartmentID, PositionId, CreateDate) values ('hmalecky6@answers.com', 'Myranda', 'Hettie', 4, 3, '2021/10/16');
insert into `Account` (Email, Usename, Fullname, DepartmentID, PositionId, CreateDate) values ('tbrearty7@msu.edu', 'Tasia', 'Theo', 6, 2, '2021/06/10');
insert into `Account` (Email, Usename, Fullname, DepartmentID, PositionId, CreateDate) values ('wwitherdon8@yahoo.com', 'Rice', 'Wyatan', 8, 3, '2022/03/11');
insert into `Account` (Email, Usename, Fullname, DepartmentID, PositionId, CreateDate) values ('cleads9@hubpages.com', 'Gabbey', 'Cirilo', 10, 4, '2022/05/15');
-- Group
insert into `Group` (GroupName, CreateID, CreateDate) values ('Christi', 1, '2022/04/29');
insert into `Group` (GroupName, CreateID, CreateDate) values ('Colas', 7, '2022/01/01');
insert into `Group` (GroupName, CreateID, CreateDate) values ('Myrah', 8, '2021/06/01');
insert into `Group` (GroupName, CreateID, CreateDate) values ('Farleigh', 6, '2021/12/08');
insert into `Group` (GroupName, CreateID, CreateDate) values ('Marne', 4, '2021/10/23');
insert into `Group` (GroupName, CreateID, CreateDate) values ('Nathanial', 9, '2022/04/04');
insert into `Group` (GroupName, CreateID, CreateDate) values ('Hobart', 5, '2021/07/19');
insert into `Group` (GroupName, CreateID, CreateDate) values ('Antony', 2, '2021/08/03');
insert into `Group` (GroupName, CreateID, CreateDate) values ('Cristabel', 10, '2021/11/30');
insert into `Group` (GroupName, CreateID, CreateDate) values ('Lorry', 3, '2021/08/11');
-- GroupAccount
insert into GroupAccount (GroupId, AccountId, joinDate) values (1, 10, '2021/11/29');
insert into GroupAccount (GroupId, AccountId, joinDate) values (2, 9, '2021/06/15');
insert into GroupAccount (GroupId, AccountId, joinDate) values (3, 8, '2021/11/04');
insert into GroupAccount (GroupId, AccountId, joinDate) values (4, 6, '2021/05/30');
insert into GroupAccount (GroupId, AccountId, joinDate) values (5, 7, '2022/04/18');
insert into GroupAccount (GroupId, AccountId, joinDate) values (6, 5, '2022/01/22');
insert into GroupAccount (GroupId, AccountId, joinDate) values (7, 4, '2022/02/22');
insert into GroupAccount (GroupId, AccountId, joinDate) values (10, 3, '2021/11/20');
insert into GroupAccount (GroupId, AccountId, joinDate) values (8, 2, '2022/03/31');
insert into GroupAccount (GroupId, AccountId, joinDate) values (9, 1, '2021/07/29');
-- TypeQuestion
insert into typeQuestion (TypeID, TypeNAme) values (1, 'NislNuncNisl.tiff');
insert into typeQuestion (TypeID, TypeNAme) values (2, 'Turpis.mp3');
insert into typeQuestion (TypeID, TypeNAme) values (3, 'Maecenas.xls');
insert into typeQuestion (TypeID, TypeNAme) values (4, 'NequeVestibulum.gif');
insert into typeQuestion (TypeID, TypeNAme) values (5, 'Posuere.mp3');
insert into typeQuestion (TypeID, TypeNAme) values (6, 'NonMauris.mp3');
insert into typeQuestion (TypeID, TypeNAme) values (7, 'TristiqueFusce.jpeg');
insert into typeQuestion (TypeID, TypeNAme) values (8, 'UltricesLibero.avi');
insert into typeQuestion (TypeID, TypeNAme) values (9, 'DisParturient.xls');
insert into typeQuestion (TypeID, TypeNAme) values (10, 'InFaucibus.jpeg');
-- categoryquestion
insert into categoryquestion (CategoryID, CategoryName) values (1, 'OdioOdioElementum.tiff');
insert into categoryquestion (CategoryID, CategoryName) values (2, 'Praesent.mpeg');
insert into categoryquestion (CategoryID, CategoryName) values (3, 'EstLacinia.pdf');
insert into categoryquestion (CategoryID, CategoryName) values (5, 'UtMassa.mp3');
insert into categoryquestion (CategoryID, CategoryName) values (4, 'Elit.xls');
insert into categoryquestion (CategoryID, CategoryName) values (6, 'InLiberoUt.ppt');
insert into categoryquestion (CategoryID, CategoryName) values (10, 'Elit.ppt');
insert into categoryquestion (CategoryID, CategoryName) values (9, 'IpsumDolorSit.mp3');
insert into categoryquestion (CategoryID, CategoryName) values (7, 'ProinInterdumMauris.png');
insert into categoryquestion (CategoryID, CategoryName) values (8, 'CumSociisNatoque.mp3');
-- Question
insert into Question (Content, CategoryID, TypeId, CreatorID, CreateDate) values ('Proin leo odio,', 1, 1, 1, '2022/02/22');
insert into Question (Content, CategoryID, TypeId, CreatorID, CreateDate) values ('Curabitur in libero', 2, 2, 2, '2021/09/27');
insert into Question (Content, CategoryID, TypeId, CreatorID, CreateDate) values ('Aenean lectus.', 3, 3, 3, '2022/01/08');
insert into Question (Content, CategoryID, TypeId, CreatorID, CreateDate) values ('Maecenas ut massa ', 4, 4, 4, '2022/02/21');
insert into Question (Content, CategoryID, TypeId, CreatorID, CreateDate) values (' sit amet lobortis sapien sapien non mi. Integer ac neque.', 5, 5, 5, '2022/05/16');
insert into Question (Content, CategoryID, TypeId, CreatorID, CreateDate) values (' Nulla suscipit ligula in lacus.', 6, 6, 6, '2022/04/15');
insert into Question (Content, CategoryID, TypeId, CreatorID, CreateDate) values ('P Vivamus metus arcu,, nisl.', 7, 7, 7, '2021/10/07');
insert into Question (Content, CategoryID, TypeId, CreatorID, CreateDate) values ('Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 8, 8, 8, '2022/01/09');
insert into Question (Content, CategoryID, TypeId, CreatorID, CreateDate) values ('In hac habitasse platea dictumst.', 9, 9, 9, '2022/02/18');
insert into Question (Content, CategoryID, TypeId, CreatorID, CreateDate) values ('Etiam vel augue. Vestibulum rutrum rutrum neque.', 10, 10, 10, '2022/04/06');
-- answer
insert into answer (Content, QuestionId, isCorrect) values ('Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1, 'Yes');
insert into answer (Content, QuestionId, isCorrect) values ('Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 2, 'No');
insert into answer (Content, QuestionId, isCorrect) values ('Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 3, 'Yes');
insert into answer (Content, QuestionId, isCorrect) values ('Sed ante. Vivamus tortor. Duis mattis egestas metus.Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 4, 'No');
insert into answer (Content, QuestionId, isCorrect) values ('Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 5, 'No');
insert into answer (Content, QuestionId, isCorrect) values ('Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 6, 'Yes');
insert into answer (Content, QuestionId, isCorrect) values ('Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.Fusce consequat. Nulla nisl. Nunc nisl.', 7, 'Yes');
insert into answer (Content, QuestionId, isCorrect) values ('Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 8, 'No');
insert into answer (Content, QuestionId, isCorrect) values ('Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 9, 'Yes');
insert into answer (Content, QuestionId, isCorrect) values ('Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 10, 'No');
-- Exam
insert into Exam (ExamID, `Code`, Title, CategoryId, Duration, CreatorID, CreateDate) values (1, '24979-514', 'Sexo, Amor e Traição', 1, '7:15', 1, '2021/09/02');
insert into Exam (ExamID, `Code`, Title, CategoryId, Duration, CreatorID, CreateDate) values (2, '76472-1139', 'R.S.V.P. ', 2, '2:25', 2, '2022/05/11');
insert into Exam (ExamID, `Code`, Title, CategoryId, Duration, CreatorID, CreateDate) values (3, '0268-0955', 'Undertaker and His Pals, The', 3, '20:04', 3, '2022/04/01');
insert into Exam (ExamID, `Code`, Title, CategoryId, Duration, CreatorID, CreateDate) values (4, '0023-0042', 'End of the Affair, The', 4, '14:11', 4, '2021/09/30');
insert into Exam (ExamID, `Code`, Title, CategoryId, Duration, CreatorID, CreateDate) values (5, '42982-4451', 'Dead Ahead: The Exxon Valdez Disaster', 5, '4:56', 5, '2021/11/06');
insert into Exam (ExamID, `Code`, Title, CategoryId, Duration, CreatorID, CreateDate) values (6, '0597-0001', 'City Dark, The', 6, '6:43', 6, '2021/12/17');
insert into Exam (ExamID, `Code`, Title, CategoryId, Duration, CreatorID, CreateDate) values (7, '0168-0011', 'Angel''s Leap', 7, '18:23', 7, '2022/05/11');
insert into Exam (ExamID, `Code`, Title, CategoryId, Duration, CreatorID, CreateDate) values (8, '58930-051', 'Karla', 8, '23:24', 8, '2021/05/28');
insert into Exam (ExamID, `Code`, Title, CategoryId, Duration, CreatorID, CreateDate) values (9, '66949-271', 'Naked Blood: Megyaku (Nekeddo burâddo: Megyaku)', 9, '18:18', 9, '2021/10/10');
insert into Exam (ExamID, `Code`, Title, CategoryId, Duration, CreatorID, CreateDate) values (10, '14783-471', 'Fist of Legend (Jing wu ying xiong)', 10, '19:15', 10, '2021/09/05');
-- ExamQuestion
insert into ExamQuestion (ExamId, QuestionID) values (1, 1);
insert into ExamQuestion (ExamId, QuestionID) values (2, 2);
insert into ExamQuestion (ExamId, QuestionID) values (3, 3);
insert into ExamQuestion (ExamId, QuestionID) values (4, 4);
insert into ExamQuestion (ExamId, QuestionID) values (5, 5);
insert into ExamQuestion (ExamId, QuestionID) values (6, 6);
insert into ExamQuestion (ExamId, QuestionID) values (7, 7);
insert into ExamQuestion (ExamId, QuestionID) values (8, 8);
insert into ExamQuestion (ExamId, QuestionID) values (9, 9);
insert into ExamQuestion (ExamId, QuestionID) values (10, 10);