-- Impedir a exclus�o de um vendedor e ao inv�s de deletar, alterar o status ativo para false
CREATE TRIGGER AlterSellerStatus
ON  Seller
INSTEAD OF DELETE
AS
BEGIN
	UPDATE Seller SET Active = 0 WHERE Id = (SELECT Id FROM deleted)
END
GO

-- Ao atualizar a tabela estoque, caso o estoque esteja menor que sim, escrever mensagem na tela avisando sobre isso
CREATE TRIGGER  UpdateStock
ON  Stock
AFTER UPDATE
AS
BEGIN
	IF (SELECT Quantity FROM inserted) < 50
	BEGIN
		PRINT('iih deu ruim hein')
	END
END
GO