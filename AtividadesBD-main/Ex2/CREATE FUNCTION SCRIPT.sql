CREATE FUNCTION ClientTransations(@Date1 DATE, @Date2 DATE)
RETURNS TABLE
AS
RETURN (
    SELECT *
    FROM  Transation
    WHERE Date >= @Date1 AND Date <= @Date2
    )
GO