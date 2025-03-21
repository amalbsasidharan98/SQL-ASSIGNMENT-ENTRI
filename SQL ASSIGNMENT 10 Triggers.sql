# Create the teachers table
CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    subject VARCHAR(50),
    experience INT CHECK (experience >= 0),
    salary DECIMAL(10,2) CHECK (salary >= 0)
);

INSERT INTO teachers (name, subject, experience, salary) VALUES
('Amit Sharma', 'Mathematics', 12, 70000),
('Priya Verma', 'Science', 8, 65000),
('Rahul Iyer', 'English', 6, 62000),
('Sunita Reddy', 'History', 15, 80000),
('Vikram Patel', 'Physics', 7, 68000),
('Neha Singh', 'Biology', 5, 63000),
('Suresh Menon', 'Chemistry', 10, 67000),
('Anjali Mehta', 'Computer Science', 9, 75000);


CREATE TABLE teacher_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END;
// DELIMITER ;

DELIMITER //
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END;
// DELIMITER ;

DELIMITER //
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teachers with experience greater than 10 years';
    END IF;
END;
// DELIMITER ;

DELIMITER //
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END;
// DELIMITER ;
