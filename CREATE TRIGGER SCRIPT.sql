CREATE TRIGGER OnDeleteAccount
ON Account
AFTER DELETE
AS
BEGIN
    DECLARE @AccountNumber INT, @Id INT
    @Id = Select Id FROM inserted
    @AccountNumber = SELECT Id FROM Account WHERE Id = @Id
    DELETE * FROM Transation WHERE AccountNumber = @AccountNumber
END
GO

CREATE TRIGGER OnCreateAccount
ON Account
AFTER INSERT
AS
BEGIN
    DECLARE @AccountNumber INT, @Id INT
    @Id = Select Id FROM inserted
    @AccountNumber = SELECT Id FROM Account WHERE Id = @Id
    INSERT INTO Transation (AccountNumber, PreviousBalance, CurrentBalance, Date) VALUES (@AccountNumber, 0, 0, GETDATE())
END
GO

CREATE TRIGGER BeforeRegisterAccount
ON Account
BEFORE INSERT
AS
BEGIN
--     DECLARE @AccountNumber INT, @Id INT
--     @Id = Select Id FROM inserted
--     @AccountNumber = SELECT Id FROM Account WHERE Id = @Id
--     INSERT INTO Transation (AccountNumber, PreviousBalance, CurrentBalance, Date) VALUES (@AccountNumber, 0, 0, GETDATE())
END
GO