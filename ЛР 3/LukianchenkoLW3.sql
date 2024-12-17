-- CREATE DATABASE "University";

-- USE University;

/* CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    EnrollmentDate DATE
); */

/* CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    CourseDescription TEXT,
    Credits INT
); */

/* INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate)
VALUES 
    (1, 'Іван', 'Петренко', '2024-01-15'),
    (2, 'Марія', 'Коваленко', '2024-02-10'),
    (3, 'Олег', 'Шевченко', '2024-03-05'); */

/* INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits)
VALUES 
    (101, 'Математика', 'Основи вищої математики', 3),
    (102, 'Фізика', 'Класична механіка', 4),
    (103, 'Програмування', 'Основи програмування на Python', 5); */

/* SELECT * FROM Students;

SELECT * FROM Courses; */

/* ALTER TABLE Students
ADD Email VARCHAR(100); */

/* ALTER TABLE Courses
ADD Department VARCHAR(100); */

/* SELECT * FROM Students;

SELECT * FROM Courses; */

-- Вийти з бази даних та видалити її
-- DROP DATABASE University;
