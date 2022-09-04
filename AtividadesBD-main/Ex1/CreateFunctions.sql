-- Mostrar todas as vendas um determinado vendedor
CREATE FUNCTION SalesOfSeller(@SellerId INT)
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM Sale
	WHERE SellerId = @SellerId
)
GO

-- Mostrar vendas num determinado período (de uma data especifica até outra data especifica)
CREATE FUNCTION PeriodSales(@date1 DATE, @data2 DATE)
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM Sale
	WHERE DateOfSale > @date1 and DateOfSale < @data2
)
GO
