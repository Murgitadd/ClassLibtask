CREATE DATABASE [Library]

USE [Library]

CREATE TABLE Authors (
    id INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50) DEFAULT 'XXX'
);


CREATE TABLE Borrowers (
    id INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50) DEFAULT 'XXX',
    Email NVARCHAR(50) UNIQUE
);


CREATE TABLE Books (
    id INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(50),
    ISBN DECIMAL(13, 0) UNIQUE DEFAULT 0000000000000,
    PublicationDate INT CHECK (PublicationDate = 2023),
    AuthorId INT,
    FOREIGN KEY (AuthorId) REFERENCES Authors(id)
);


CREATE TABLE Checkouts (
    id INT PRIMARY KEY IDENTITY(1,1),
    CheckoutDate DATETIME,
    ReturnDate DATETIME,
    BookId INT,
    BorrowerId INT,
    FOREIGN KEY (BookId) REFERENCES Books(id),
    FOREIGN KEY (BorrowerId) REFERENCES Borrowers(id)
);

INSERT INTO Authors (FirstName, LastName)
VALUES
    ('Sabir', 'Nezeriyev'),
    ('Adil', 'Praktikov'),
    ('Qurban', 'Ramazanli');

INSERT INTO Borrowers (FirstName, LastName, Email)
VALUES
    ('Murad', 'Khasaddinov', 'murad@gmail.com'),
    ('Subhan', 'Amiraslanov', 'adolf@mail.ru'),
    ('Vagif', 'Qarayev', 'notnasirli@code.edu.az');

INSERT INTO Books (Title, ISBN, PublicationDate, AuthorId)
VALUES
    ('C#-in esaslari', '1234567890098', 2023,1),
	('SQL ve database', '8746823194721', 2022,2),
	('Front End  developing', '1234567938398', 2000,3);

INSERT INTO Checkouts(CheckoutDate, ReturnDate, BookId, BorrowerId)
VALUES
    (),
