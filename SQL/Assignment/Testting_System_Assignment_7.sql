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
INSERT INTO `account`(departmentid) VALUE (2);

-- Question 3
DROP TRIGGER IF EXISTS Bai3_Max5_User;
DELIMITER $$
CREATE TRIGGER Bai3_Max5_User 
BEFORE INSERT ON `groupaccount` FOR EACH ROW
BEGIN
	DECLARE v_count_groupId TINYINT;
	SELECT count(G.groupId) INTO v_count_groupId
		FROM groupaccount G 
        WHERE g.GroupId = NEW.GroupId;
	IF v_count_groupId > 5 THEN 
		SIGNAL SQLSTATE '45621'
        SET MESSAGE_TEXT = ' Cấu hình 1 group có nhiều nhất là 5 user';
	END IF;
END
$$
DELIMITER ;

-- Question 4
DROP TRIGGER IF EXISTS Bai4_Max10_Question;
DELIMITER $$
CREATE TRIGGER Bai4_Max10_Question 
BEFORE INSERT ON `examquestion` FOR EACH ROW
BEGIN
	DECLARE v_count_examID TINYINT;
	SELECT count(eq.ExamId) INTO v_count_examID
		FROM examquestion eq
        WHERE eq.ExamId = NEW.ExamId;
	IF v_count_examID > 10 THEN 
		SIGNAL SQLSTATE '44621'
        SET MESSAGE_TEXT = 'Cấu hình 1 bài thi có nhiều nhất là 10 Question';
	END IF;
END
$$
DELIMITER ;

-- Question 5

DROP TRIGGER IF EXISTS Bai5_delete_user;
DELIMITER $$
CREATE TRIGGER Bai5_delete_user
BEFORE DELETE ON `account` FOR EACH ROW
BEGIN
	IF old.Email = 'admin@gmail.com' THEN
		SIGNAL SQLSTATE '44521'
        SET MESSAGE_TEXT = 'đây là tài khoản admin, không cho phép user xóa)';
	END IF;
    DELETE FROM `groupaccount` ga-- , question, exam, `group`
        WHERE ga.AccountId = old.AccountId;
    DELETE FROM question q WHERE q.CategoryID = old.AccountId;
    DELETE FROM `group` g WHERE g.CreateID = old.AccountId;
END $$
DELIMITER ;

-- Question 6
DROP TRIGGER IF EXISTS Bai6_set_deparmetnID_waiting;
DELIMITER $$
CREATE TRIGGER Bai6_set_deparmetnID_waiting
BEFORE INSERT ON `account` FOR EACH ROW
BEGIN
	DECLARE v_set_deparmetnID_waiting VARCHAR(50);
    SELECT d.DepartmentID INTO v_set_deparmetnID_waiting
    FROM department d 
    WHERE departmentName = 'Waiting';
    IF 
		NEW.DepartmentID IS NULL 
	THEN 
		SET NEW.DepartmentID = v_set_deparmetnID_waiting;
	END IF;
END $$
DELIMITER ;

-- Question 7
DROP TRIGGER IF EXISTS Bai7_SetMaxAnswer;
DELIMITER $$
CREATE TRIGGER Bai7_SetMaxAnswer
BEFORE INSERT ON `answer` FOR EACH ROW
BEGIN
		DECLARE v_Count_Answer_questionID INT;
		DECLARE v_Count_Answer_Corrects INT;
		SELECT 
				count(a.QuestionId) INTO  v_Count_Answer_questionID
        FROM answer a 
			WHERE a.QuestionId = NEW.QuestionId;
        SELECT
				count(a.isCorrect) INTO v_Count_Answer_Corrects
		FROM answer a
			WHERE a.QuestionId = NEW.QuestionId AND NEW.isCorrect = 'YES'; 
        IF
           (v_Count_Answer_questionID > 4) OR (v_Count_Answer_Corrects > 2)
		THEN
			SIGNAL SQLSTATE '56875'
            SET MESSAGE_TEXT = 'Mỗi Question không được quá 4 Answers và tối đa 2 đáp án đúng!';
		END IF;
END $$
DELIMITER ;

-- Question 8
DROP TRIGGER IF EXISTS Bai8_update_gender;
DELIMITER $$
CREATE TRIGGER Bai8_update_gender
BEFORE INSERT ON `account` FOR EACH ROW
BEGIN
	IF
		NEW.gender = 'Nam' 
	THEN SET NEW.gender = 'M';
    ELSEIF NEW.gender = 'Nu' THEN
		SET NEW.gender = 'F';
	ELSEIF  NEW.gender = 'Khong xac dinh' THEN
		SET NEW.gender = 'U';
	ELSEIF NEW.gender NOT IN ('M', 'F', 'U') THEN
		SIGNAL SQLSTATE '45789'
		SET MESSAGE_TEXT = 'Loi cu phap';
	END IF;
END $$
DELIMITER ;
INSERT INTO `account` (Gender) VALUES ('Na'); -- ok
INSERT INTO `account` (Gender) VALUES ('M');  -- ok

-- Question 9
DROP TRIGGER IF EXISTS Bai9_delete_2day;
DELIMITER $$
CREATE TRIGGER Bai9_delete_2day
BEFORE DELETE ON exam FOR EACH ROW
BEGIN
	IF
    OLD.CreateDate > date_sub(now(), interval 2 day) THEN
    SIGNAL SQLSTATE '45799'
		SET MESSAGE_TEXT = 'không cho phép người dùng xóa bài thi mới tạo được 2 ngày';
	END IF;
END $$
DELIMITER ;

-- QUestion 10
DROP TRIGGER IF EXISTS Bai10_update_question;
DELIMITER $$
CREATE TRIGGER Bai10_update_question
BEFORE UPDATE ON question FOR EACH ROW
BEGIN
	DECLARE v_questionId_in_exam INT;
    SELECT e.QuestionID  INTO v_questionId_in_exam
    FROM examquestion e;
    IF 
		OLD.questionId IN (v_questionId_in_exam)
    THEN
		  SIGNAL SQLSTATE '45788'
		SET MESSAGE_TEXT = 'not update';
	END IF;
END $$
DELIMITER ;
-- DELETE
DROP TRIGGER IF EXISTS Bai10_delete_question;
DELIMITER $$
CREATE TRIGGER Bai10_delete_question
BEFORE DELETE ON question FOR EACH ROW
BEGIN
	DECLARE v_questionId_in_exam INT;
    SELECT e.QuestionID  INTO v_questionId_in_exam
    FROM examquestion e;
    IF 
		OLD.questionId IN (v_questionId_in_exam)
    THEN
		  SIGNAL SQLSTATE '45788'
		SET MESSAGE_TEXT = 'not delete';
	END IF;
END $$
DELIMITER ;

-- Question 12
SELECT e.ExamID, e.Code, e.Title , CASE 
	WHEN Duration <= 30 THEN 'Short time'
	WHEN Duration <= 60 THEN 'Medium time'
	ELSE 'Longtime'
	END  AS Duration
FROM exam e;

-- Question 13
SELECT GA.GroupID, count(GA.accountID) AS SL, 
	CASE
		WHEN count(GA.accountID) <= 5 THEN 'Few'
        WHEN 5 < count(GA.accountID) <= 20 THEN 'Normal'
        WHEN count(GA.accountID) > 20 THEN 'Higher'
	END AS Mat_Do
FROM groupaccount GA
GROUP BY GA.GroupId;

SELECT GA.GroupID, count(*) AS SL, 
	CASE
		WHEN count(*) <= 5 THEN 'Few'
        WHEN 5 < count(*) <= 20 THEN 'Normal'
        WHEN count(*) > 20 THEN 'Higher'
	END AS Mat_Do
FROM groupaccount GA
GROUP BY GA.GroupId;