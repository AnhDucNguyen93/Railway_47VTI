-- Question 1
SELECT 
    A.*
FROM
    account A
WHERE
    A.DepartmentID = (SELECT 
            D.DepartmentID
        FROM
            department D
        WHERE
            D.departmentName = 'Sale');
-- Question 2
SELECT 
    GA.*, A.*, COUNT(A.AccountID)
FROM
    groupaccount GA
        JOIN
    `account` A ON GA.AccountID = A.AccountID
GROUP BY A.AccountID
HAVING COUNT(A.AccountID) = (SELECT 
        COUNT(GA.AccountID) SL_Ac
    FROM
        groupaccount GA
    GROUP BY GA.AccountId
    ORDER BY SL_Ac DESC
    LIMIT 1);
SELECT 
    COUNT(GA.AccountID) SL_Ac
FROM
    groupaccount GA
GROUP BY GA.AccountId
ORDER BY SL_Ac DESC
limit 1;
-- Question 3
SELECT 
    Q.QuestionID, Q.Content
FROM
    question Q
WHERE
    LENGTH(Q.content) > '35';
delete