-- Exiba a quantidade total vendida dos produtos (group by por codProduto) (exibir id, nome do produto e quantidade)
CREATE PROCEDURE SoldAmount
AS
BEGIN
	SELECT Product.Id, Product.Name, SUM(Sale.Quantity) FROM Product
	INNER JOIN Sale ON Sale.ProductId = Product.id
	GROUP BY Product.Name, Product.Id
END

-- Exiba todas as vendas efetuadas (número do pedido, cliente, total da venda e o vendedor)
CREATE PROCEDURE SalesMade
AS
BEGIN
	SELECT Sale.Id, Client.Name, FinalPrice, Seller.Name FROM Sale
	INNER JOIN Client ON Client.Id = Sale.ClientId
	INNER JOIN Seller ON Seller.Id = Sale.SellerId
END

-- Calcule a comissão para todos os vendedores com base nas vendas do mês/ano e
-- faça o insert na tabela Comissão. 
-- Crie uma condição para, se a comissão para aquele vendedor naquele mês e ano já tiver sido registrada, apenas atualize o valor (mês e ano serão parâmetros)
CREATE PROCEDURE CommCalc
@year INT,
@month INT
AS
BEGIN
	DECLARE @CommPrice DECIMAL, @AuxId INT;
	DECLARE cursor_data CURSOR
	FOR SELECT
	SUM(FinalPrice), SellerId
	FROM Sale WHERE YEAR(DateOfSale) = @year and MONTH(DateOfSale) = @month
	GROUP BY SellerId

	OPEN cursor_data;

	FETCH NEXT FROM cursor_data INTO
	@CommPrice,
	@AuxId;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT CAST(@CommPrice AS VARCHAR) + CAST(@AuxId AS VARCHAR)

		IF(EXISTS(SELECT * FROM  Commission
			WHERE  Year = @year and Month = @month and SellerId = @AuxId))
			BEGIN
				UPDATE Commission
				SET CommissionPrice = @CommPrice
				WHERE SellerId = @AuxId and Month = @month and Year = @year
			END
			ElSE
			BEGIN
				INSERT INTO Commission(Year, Month,CommissionPrice,SellerId)
				VALUES(@year,@month,@CommPrice,@AuxId)
			END

			FETCH NEXT FROM cursor_data INTO
			@CommPrice,
			@AuxId;
		END

		CLOSE cursor_data;
		DEALLOCATE cursor_data
END