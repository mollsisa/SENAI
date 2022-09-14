CREATE PROCEDURE Withdraw
@AccountNumber INT, @WithdrawValue DECIMAL(10, 2) 
AS
BEGIN
    DECLARE @CurrentBalance DECIMAL(10, 2)
    SET @CurrentBalance = SELECT Balance FROM Account WHERE AccountNumber = @AccountNumber
    SET @CurrentBalance = @CurrentBalance - @WithdrawValue
    UPDATE Account SET Balance = @CurrentBalance WHERE AccountNumber = @AccountNumber
END
GO

CREATE PROCEDURE Deposit
@AccountNumber INT, @DepositValue DECIMAL(10, 2) 
AS
BEGIN
    DECLARE @CurrentBalance DECIMAL(10, 2)
    SET @CurrentBalance = SELECT Balance FROM Account WHERE AccountNumber = @AccountNumber
    SET @CurrentBalance = @CurrentBalance + @DepositValue
    UPDATE Account SET Balance = @CurrentBalance WHERE AccountNumber = @AccountNumber
END
GO

CREATE PROCEDURE GreaterBalance
@Value DECIMAL(10, 2)
AS
BEGIN
    SELECT * FROM Account WHERE  @Value < Balance
END
GO

CREATE PROCEDURE Transfer
@TransferValue DECIMAL(10, 2), @SourceAccount INT, @TargetAccount INT
BEGIN
    DECLARE @Balance1 DECIMAL(10, 2), @Balance2 DECIMAL(10, 2), @NewBalance DECIMAL(10, 2)

    SET @Balance1 = SELECT Balance FROM Account WHERE AccountNumber = @SourceAccount
    SET @Balance2 = SELECT Balance FROM Account WHERE AccountNumber = @TargetAccount

    SET @NewBalance = @Balance1 - @TransferValue
    UPDATE Account SET Balance = @NewBalance WHERE AccountNumber = @SourceAccount

    INSERT INTO Transation (AccountNumber, PreviousBalance, CurrentBalance, Date)
    VALUES (@SourceAccount, @Balance1, @NewBalance, GETDATE())
    
    SET @NewBalance = @Balance2 + @TransferValue
    UPDATE Account SET Balance = @NewBalance WHERE AccountNumber = @TargetAccount
    
    INSERT INTO Transation (AccountNumber, PreviousBalance, CurrentBalance, Date)
    VALUES (@TargetAccount, @Balance2, @NewBalance, GETDATE())
END
GO