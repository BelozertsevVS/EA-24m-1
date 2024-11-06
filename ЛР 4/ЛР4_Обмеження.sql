-- БЛОК 1. ДОДАВАННЯ ОБМЕЖЕНЬ ПІСЛЯ СТВОРЕННЯ ТАБЛИЦЬ --


CREATE DATABASE UniversityDB;						/*СТВОРЮЄМО БАЗУ ДАНИХ UniversityDB*/

USE UniversityDB;									/* ОБИРАЄМО БАЗУ ДЛЯ РОБОТИ*/

CREATE TABLE Departments (							/*СТВОРЮЄМО ТАБЛИЦЮ Departments*/
	DepartmentID INT NOT NULL,
	DepartmentName VARCHAR(100)
	);

CREATE TABLE Professors (							/*СТВОРЮЄМО ТАБЛИЦЮ Professors*/
	ProfessorID INT NOT NULL,
	FirstName VARCHAR(50),
	LastName VARCHAR (50),
	Age TINYINT,
	DepartmentID INT,
	Email VARCHAR(50)
	);

	ALTER TABLE Departments ADD CONSTRAINT PK_Department			/*ЗАДАЄМО ПЕРВІСНИЙ КЛЮЧ В ТАБЛИЦІ Departments В КОЛОНЦІDepartmentID */
				PRIMARY KEY (DepartmentID);
	ALTER TABLE Professors ADD CONSTRAINT UK_Professor_Email		/*ЗАДАЄМО ОБМЕЖЕННЯ В ТАБЛИЦІ Departments В КОЛОНЦІ Email - ЗНАЧЕННЯ МАЄ БУТИ УНІКАЛЬНИМ*/
				UNIQUE (Email);

	ALTER TABLE Professors ADD CONSTRAINT FK_Professor_Department	/*ЗАДАЄМО ЗОВНІШНІЙ КЛЮЧ В ТАБЛИЦІ Professors з посиланням на таблицю Departments В КОЛОНЦІ DepartmentID*/
				FOREIGN KEY (DepartmentID)
				REFERENCES Departments(DepartmentID);

	ALTER TABLE Professors ADD CONSTRAINT CK_Age CHECK (Age>=20);	/*ЗАДАЄМО ОБМЕЖЕННЯ В ТАБЛИЦІ Departments В КОЛОНЦІ Age - ВІК МАЄ БУТИ БІЛЬШИМ ЗА 20*/

	ALTER TABLE Professors ALTER COLUMN FirstName VARCHAR(50) NOT NULL;		/*ЗАДАЄМО ОБМЕЖЕННЯ В ТАБЛИЦІ Professors В КОЛОНЦІ FirstName НЕ МАЄ БУТИ ПУСТИХ ЗНАЧЕНЬ*/
	ALTER TABLE Professors ALTER COLUMN LastName VARCHAR(50) NOT NULL;		/*ЗАДАЄМО ОБМЕЖЕННЯ В ТАБЛИЦІ Professors В КОЛОНЦІ LarstName НЕ МАЄ БУТИ ПУСТИХ ЗНАЧЕНЬ*/

	ALTER TABLE Departments ADD CONSTRAINT DF_DepartmentName				/*ЗАДАЄМО ОБМЕЖЕННЯ В ТАБЛИЦІ Departments В КОЛОНЦІ DepartmentName ЗА ЗАМОВЧУВАННЯМ ВСТАНОВЛЕНО ЗНАЧЕННЯ General*/
							DEFAULT 'General' FOR DepartmentName;

INSERT INTO Departments (DepartmentID) VALUES (1);							/*ВНОСИМО ДАНІ В ТАБЛИЦЮ Departments*/

INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email)		/*ВНОСИМО ДАНІ В ТАБЛИЦЮ Professors*/
		VALUES (1, 'John', 'Smith', 57, 1, 'johnsmith@university.com');

INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email)		/*ВНОСИМО ДАНІ В ТАБЛИЦЮ Professors - отримаєм помилку щодо емейлу (він має бути унікальним)*/
		VALUES (2, 'Jane', 'Doe', 1, 35, 'johnsmith@university.com');

INSERT INTO Professors (ProfessorID, FirstName, LastName, DepartmentID, Email)			/*ВНОСИМО ДАНІ В ТАБЛИЦЮ Professors - отримаємо помилку, бо втрачено логікукоманди (відсутній вік Age)*/
		VALUES (3, 'Bob', 'Doe', 1, 17, 'bob@university.com');


DROP TABLE Professors;						/*ВИДАЛЯЄМО ТАБЛИЦІ І БАЗУ ДАНИХ*/
DROP TABLE Departments;

USE [SHOP];

DROP DATABASE UniversityDB;



-- БЛОК 2. СТВОРЕННЯ ТАБЛИЦЬ З ОБМЕЖЕННЯМИ --

CREATE DATABASE CompanyDB;										/*СТВОРЮЄМО БАЗУ ДАНИХ І ПОЧИНАЄМО РОБОТУ З НЕЮ*/
USE CompanyDB;

CREATE TABLE Employees (										/*СТВОРЮЄМО ТАБЛИЦІ*/
		EmployeeID INT PRIMARY KEY,
		FirstName VARCHAR(50) NOT NULL,
		LastName VARCHAR(50) NOT NULL,
		Email VARCHAR(100) UNIQUE,
		Position VARCHAR(50) DEFAULT 'Junior Developer'
		);

CREATE TABLE Departments (
		DepartmentID INT PRIMARY KEY,
		DepartmentName VARCHAR(100) NOT NULL CHECK (DepartmentName <>''),
		Budget DECIMAL(10,2) CHECK (Budget >0),
		DefaultRoomNumber INT DEFAULT 101
		);

CREATE TABLE Assignments (
		AssignmentID INT PRIMARY KEY,
		EmployeeID INT NOT NULL,
		DepartmentID INT NOT NULL,
		AssignmentDate DATE DEFAULT GETDATE(),
		FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
		FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
		);



INSERT INTO Departments (DepartmentID, DepartmentName, Budget)					/*ВНОСИМО ДАНІ В ТАБЛИЦІ*/
	VALUES (1, 'Human Resources', 50000);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email)
	VALUES (1, 'John', 'Smith', 'john.smith@company.com');

INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID)
	VALUES (1, 1, 1);

select* from [dbo].[Assignments];										/*ВИВОДИМО ТАБЛИЦІ ДЛЯ ОГЛЯДУ*/
select* from [dbo].[Departments];
select* from [dbo].[Employees];


INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID)		/*НАМАГАЄМОСЬ ВНЕСТИ НЕКОРЕКТНІ ДАНІ*/	
	VALUES (2, 999, 1);


DROP TABLE Employees;													/*ВИДАЛЯЄМО ТАБЛИЦІ*/
DROP TABLE Departments;
DROP TABLE Assignments;

use[SHOP]																/*ПЕРЕМИКАЄМОСЬ НА ІНЩУ БД*/

DROP DATABASE CompanyDB;												/*ВИДАЛЯЄМО БАЗУ ДАНИХ*/