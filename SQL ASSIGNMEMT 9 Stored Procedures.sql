#Create Worker Table
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);

#qs 1. Stored Procedure to Add a New Worker Record
DELIMITER //
CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT(15),
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //
DELIMITER ;

-- Call the procedure to add a worker
CALL AddWorker(1, 'John', 'Doe', 50000, '2023-01-15', 'HR');

#qs 2. Stored Procedure to Retrieve Salary of a Worker
DELIMITER //
CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary FROM Worker WHERE Worker_Id = p_Worker_Id;
END //
DELIMITER ;

# Declare a variable and call the procedure
CALL GetWorkerSalary(1, @Salary);
SELECT @Salary;

#QS 3. Stored Procedure to Update Department of a Worker
DELIMITER //
CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker SET Department = p_Department WHERE Worker_Id = p_Worker_Id;
END //
DELIMITER ;

# Call the procedure to update department
CALL UpdateWorkerDepartment(1, 'Finance');

#QS  4. Stored Procedure to Count Workers in a Department
DELIMITER //
CREATE PROCEDURE CountWorkersInDepartment(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount FROM Worker WHERE Department = p_Department;
END //
DELIMITER ;

# Declare a variable and call the procedure
CALL CountWorkersInDepartment('HR', @WorkerCount);
SELECT @WorkerCount;

#QS 5. Stored Procedure to Calculate Average Salary in a Department
DELIMITER //
CREATE PROCEDURE AvgSalaryInDepartment(
    IN p_Department CHAR(25),
    OUT p_AvgSalary INT
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary FROM Worker WHERE Department = p_Department;
END //
DELIMITER ;

# Declare a variable and call the procedure
CALL AvgSalaryInDepartment('HR', @AvgSalary);
SELECT @AvgSalary;


