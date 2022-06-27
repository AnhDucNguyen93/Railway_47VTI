CREATE DATABASE ThucTapSV;
USE ThucTapSV;

DROP TABLE IF EXISTS Country;
CREATE TABLE Country (
    Country_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    Country_Name NVARCHAR(50)
);
DROP TABLE IF EXISTS Location;
CREATE TABLE Location (
    Location_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    Street_address NVARCHAR(100),
    Postal_code VARCHAR(15),
    Country_id TINYINT,
    FOREIGN KEY (Country_id) REFERENCES Country(Country_id)
);
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
	Employee_id	TINYINT PRIMARY KEY AUTO_INCREMENT,
    Full_name NVARCHAR(50),
    Email VARCHAR(50),
    Location_id TINYINT,
    FOREIGN KEY (Location_id) REFERENCES Location(Location_id)
);
-- insert 
insert into Employee (Employee_id, Full_name, Email, Location_id) values (1, 'Arliene McConachie', 'amcconachie0@google.it', 23);
insert into Employee (Employee_id, Full_name, Email, Location_id) values (2, 'Tansy Center', 'tcenter1@bing.com', 17);

-- Question 2
-- A
SELECT e.* 
FROM employee e 
	JOIN location l ON e.Location_id = l.Location_id
	JOIN country c ON c.Country_id = l.Country_id
WHERE c.Country_Name = 'Việt Nam';
-- B
SELECT c.Country_Name 
FROM employee e 
	JOIN location l ON e.Location_id = l.Location_id
	JOIN country c ON c.Country_id = l.Country_id
WHERE e.Email = 'nn03@gmail.com';
-- C
 SELECT c.Country_Name, l.Street_address, count(e.employee_id) AS SL_Employee
 FROM employee e 
	JOIN location l ON e.Location_id = l.Location_id
	JOIN country c ON c.Country_id = l.Country_id
GROUP BY c.Country_id, l.Location_id;

 -- Question 3
DROP TRIGGER IF EXISTS tr_Insert_Country;
DELIMITER $$
CREATE TRIGGER tr_Insert_Country 
BEFORE INSERT ON employee FOR EACH ROW
BEGIN
	DECLARE v_countEmply_In_Country INT;
	SELECT count(e.employee_id) INTO v_countEmply_In_Country
	FROM employee e 
		JOIN location l ON e.Location_id = l.Location_id
		JOIN country c ON c.Country_id = l.Country_id
		WHERE e.Location_id = NEW.Location_id
	GROUP BY c.Country_id;
    IF v_countEmply_In_Country > 10 THEN
		SIGNAL SQLSTATE '14445'
		SET MESSAGE_TEXT = 'khong the insert vao Country nay';
    END IF;
END
$$
DELIMITER ;
insert into Employee (Employee_id, Full_name, Email, Location_id)
 values (54, 'Tansy Center', 'tcenter1@bing.com', 1);
 
 -- Question 4
 DROP TRIGGER IF EXISTS tr_Delete_location;
DELIMITER $$
CREATE TRIGGER tr_Delete_location 
BEFORE DELETE ON location FOR EACH ROW
BEGIN
		UPDATE employee 
        SET Location_id = NULL
        WHERE Location_id = old.location_id;
END
$$
DELIMITER ;
DELETE FROM location WHERE Location_id = '17'
 
