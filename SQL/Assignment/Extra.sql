DROP TABLE IF EXISTS fresher;
CREATE TABLE fresher(
	TraineeID INT PRIMARY KEY AUTO_INCREMENT,
    Full_Name NVARCHAR(100),
    Birth_Date DATE,
    Gender ENUM('Male', 'Female', 'Unknown'),
    ET_IQ TINYINT(200), CHECK (0 <= ET_IQ <= 20),
    ET_Gmath TINYINT(100), CHECK (0 <= ET_IQ <= 20),
    ET_English TINYINT(100), CHECK (0 <= ET_IQ <= 20),
    Training_Class VARCHAR(5),
    Evaluation_Notes TEXT
);
ALTER TABLE fresher
ADD COLUMN VTI_Account TINYINT NOT NULL UNIQUE;

DROP TABLE IF EXISTS `Description`;
CREATE TABLE 'Description'(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    'Name' VARCHAR(255),
    'Code' VARCHAR(5),
    ModifiedDate DATETIME
);

