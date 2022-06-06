DROP PROCEDURE IF EXISTS pr_GetAccFromDep;
DELIMITER $$ 
CREATE PROCEDURE pr_GetAccFromDep (IN in_dep_name VARCHAR(255))
BEGIN 
	SELECT A.* from `account` A 
    INNER JOIN department D on A.DepartmentID = D.DepartmentID
    WHERE D.departmentName = in_dep_name;
END $$
DELIMITER ;
call Sp_get('Sale');
-- question 2
DELIMITER $$
CREATE PROCEDURE pr_GetCountAccFromGroup (IN in_groupName VARCHAR(255))
BEGIN 
    SELECT G.GroupName, count(GA.AccountId) as SL_Acc FROM groupaccount GA
    INNER JOIN `group` G ON G.GroupID = GA.GroupId
    WHERE G.GroupName = 'in_groupName';
    END $$
DELIMITER ;
call pr_GetCountAccFromGroup('Hobart');
-- Question 3
DROP PROCEDURE IF EXISTS sp_GetTypeQuestion;
DELIMITER $$
CREATE PROCEDURE sp_GetTypeQuestion()
BEGIN
	SELECT Q.TypeID, TQ.TypeName, Q.questionID,  count(Q.questionID) AS SL 
    FROM typequestion TQ 
    LEFT JOIN question Q ON TQ.TypeID = Q.TypeId
    where month(Q.CreateDate) = month(now()) and year(Q.CreateDate) = year(now())
    GROUP BY TQ.TypeID;
END $$
DELIMITER ;
CALL sp_GetTypeQuestion();
-- Question 4
DROP PROCEDURE IF EXISTS SP_GetTQid_Maxcount_Question;
DELIMITER $$
CREATE PROCEDURE SP_GetTQid_Maxcount_Question(OUT out_SP_GetTQid_Maxcount VARCHAR(255) )
BEGIN
	SELECT TypeID INTO out_SP_GetTQid_Maxcount
    FROM question Q 
    GROUP BY Q.TypeId
    HAVING count(TypeId) = (
		SELECT max(SL) 
        FROM ( SELECT count(TypeId) SL FROM question Q GROUP BY Q.TypeId
        ) AS Max);
END $$
DELIMITER ;
-- Question 5

set @out_SP_GetTQid_Maxcount = '0';
call testing_sysem_assignment_4.SP_GetTQid_(@out_SP_GetTQid_Maxcount);
select * FROM typequestion where TypeID = @out_SP_GetTQid_Maxcount;

-- Question 6
DROP PROCEDURE IF EXISTS in_group_or_username;
DELIMITER $$
CREATE PROCEDURE in_group_or_username(IN in_search VARCHAR(255))
BEGIN
		SELECT	A.usename, G.GroupName
        FROM 
        ACCOUNT A
			LEFT JOIN
		groupaccount GA ON A.AccountID = GA.AccountID
			RIGHT JOIN
		`group` G ON G.GroupID = GA.GroupID
	WHERE
		A.usename LIKE CONCAT('%', in_search, '%')
			OR G.GroupName LIKE CONCAT('%', in_search, '%');
END $$
DELIMITER ;
-- Question 7
DROP PROCEDURE IF EXISTS sp_inFullname_email;
DELIMITER $$
CREATE PROCEDURE sp_inFullname_email(IN in_FullName NVARCHAR(255), 
IN in_Email VARCHAR(255))
BEGIN
		DECLARE v_usename VARCHAR(50) DEFAULT substring_index(in_Email,'@', 1 );
        DECLARE v_positionID TINYINT;
        DECLARE v_derpatmentID TINYINT;
        
        SELECT position.PositionID INTO v_positionID FROM position WHERE PositionName = 'Dev';
        SELECT DepartmentID INTO v_derpatmentID FROM department WHERE  departmentName = 'Waiting';
        
        INSERT INTO account (Usename, Fullname, Email, DepartmentID, PositionID)
        VALUE (v_usename, in_FullName, in_Email, v_derpatmentID, v_positionID);
END $$
DELIMITER ;
-- Question 8
DROP PROCEDURE IF EXISTS sp_GetContent;
DELIMITER $$
CREATE PROCEDURE sp_GetContent(IN in_TypeQuestion VARCHAR(255))  -- ENUM('Essay','Multiple-Choice')
BEGIN
		DECLARE v_MaxLenghtContent INT DEFAULT 0;
        SELECT max(length(Q.content)) INTO v_MaxLenghtContent
        FROM question Q;
        
        SELECT *
        FROM question q
        JOIN typequestion tq ON q.TypeId = tq.TypeID
        WHERE tq.TypeNAme = in_TypeQuestion
        AND length(q.content) = v_MaxLenghtContent;
END $$
DELIMITER ;
-- Cach 2
DROP PROCEDURE IF EXISTS sp_GetContent;
DELIMITER $$
CREATE PROCEDURE sp_GetContent(IN in_TypeQuestion VARCHAR(255))  -- ENUM('Essay','Multiple-Choice')
BEGIN
	with get_lengthContent as (
        SELECT length(Q.content) AS SL
        FROM question Q)
        
        SELECT *
        FROM question q
        JOIN typequestion tq ON q.TypeId = tq.TypeID
        WHERE tq.TypeNAme = in_TypeQuestion
        AND length(Q.content) = ( select max(SL) from get_lengthContent);
END $$
DELIMITER ;

-- Question 9
DROP PROCEDURE IF EXISTS sp_Del_id;
DELIMITER $$
CREATE PROCEDURE sp_Del_id(IN in_ExamID INT)
BEGIN
	DELETE FROM examquestion WHERE ExamId = in_ExamID;
    DELETE FROM exam WHERE ExamID = in_ExamID;
END $$
DELIMITER ;
-- Question 10
DROP PROCEDURE IF EXISTS sp_Del_id;
DELIMITER $$
CREATE PROCEDURE sp_DelExam_3year()
BEGIN
	DECLARE v_beforeDelete INT default 0;
    DECLARE v_afterDelete INT default 0;
    WITH after_table as (
		SELECT 
			count(e.examID) as total
		from exam e UNION ALL
		SELECT count(eq.examID)
		from examquestion eq 
    )
    SELECT SUM(total) INTO v_beforeDelete
    FROM after_table;
    
    DELETE FROM exam
    WHERE year(now()) - year(CreateDate) >= 3;
    SELECT SUM(total) INTO v_afterDelete
    FROM after_table;
    
    SELECT v_beforeDelete - v_afterDelete;
END$$
DELIMITER ;
