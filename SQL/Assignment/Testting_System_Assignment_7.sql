-- Question 1
DROP TRIGGER IF EXISTS Bai1_BEFORE_INSERT;

DELIMITER $$
CREATE TRIGGER Bai1_BEFORE_INSERT 
BEFORE INSERT ON `group` FOR EACH ROW
BEGIN
	IF NEW.CreateDate <= (curdate() - interval 1 year) THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'khong the insert vao group';
    END IF;
END
$$
DELIMITER ;
INSERT INTO  `group` (CreateDate) VALUE (2018-01-12);

-- question 2
DROP TRIGGER IF EXISTS Bai2_BEFORE_INSERT;
DELIMITER $$
CREATE TRIGGER Bai2_BEFORE_INSERT 
BEFORE INSERT ON `account` FOR EACH ROW
BEGIN
	DECLARE v_DepId TINYINT;
    SELECT d.DepartmentID INTO v_DepId FROM department d WHERE d.departmentName = 'Sale';
	IF NEW.DepartmentID = v_DepId THEN
		SIGNAL SQLSTATE '12346'
		SET MESSAGE_TEXT =  'Department "Sale" cannot add more user';
    END IF;
END
$$
DELIMITER ;
INSERT INTO `account`(departmentid) VALUE (2)

-- Question 3



