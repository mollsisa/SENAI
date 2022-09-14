CREATE DATABASE SenaiBank
GO

USE SenaiBank
GO

CREATE TABLE Client(
    Id INT IDENTITY PRIMARY KEY,
    Name VARCHAR(MAX),
    Cpf VARCHAR(11)
)

CREATE TABLE Account(
    AccountNumber INT IDENTITY PRIMARY KEY,
    BankBranch INT,
    ClientId INT FOREIGN KEY REFERENCES Client(Id),
    Balance DECIMAL(10, 2)
)

CREATE TABLE Transation(
    Id INT IDENTITY PRIMARY KEY,
    AccountNumber INT FOREIGN KEY REFERENCES Account(AccountNumber),
    PreviousBalance DECIMAL(10, 2),
    CurrentBalance DECIMAL(10, 2),
    Date DATE
)

INSERT INTO Client(Name, Cpf) VALUES ('Melissa Moll', '12345678912')
INSERT INTO Client(Name, Cpf) VALUES ('Murilo Pereira', '12345678913')
INSERT INTO Client(Name, Cpf) VALUES ('Allan Kley', '12345678914')

INSERT INTO Account(BankBranch, ClientId, Balance) VALUES ('123', '1', 1200)
INSERT INTO Account(BankBranch, ClientId, Balance) VALUES ('456', '2', 900)
INSERT INTO Account(BankBranch, ClientId, Balance) VALUES ('789', '3', 700)
