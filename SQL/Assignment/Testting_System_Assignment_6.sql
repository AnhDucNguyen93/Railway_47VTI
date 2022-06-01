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
