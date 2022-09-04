CREATE DATABASE Store;
GO

USE Store;
GO

CREATE TABLE Product(
	Id INT IDENTITY PRIMARY KEY,
	Name VARCHAR(MAX) NOT NULL,
	ExpirationDate DATE NOT NULL,
	Price DECIMAL(9, 3) NOT NULL
);

CREATE TABLE Stock(
	Id INT IDENTITY PRIMARY KEY,
	Quantity INT NOT NULL,
	ProductId INT FOREIGN KEY REFERENCES Product(Id)
);

--Tabela Cliente, com id, nome do cliente e cpf
CREATE TABLE Client(
	Id INT IDENTITY PRIMARY KEY,
	Name VARCHAR(MAX) NOT NULL,
	Cpf VARCHAR(11) NOT NULL
);

--Tabela vendedor, com id, nome do vendedor, cpf , data de admissão, ativo
CREATE TABLE Seller(
	Id INT IDENTITY PRIMARY KEY,
	Name VARCHAR(MAX) NOT NULL,
	Cpf VARCHAR(11) NOT NULL,
	DateOfHire DATE NOT NULL,
	Active BIT
);

--Tabela Comissão, com id, id do vendendor, mês, ano e valor da comissão (as comissões serão calculadas via procedure a cada mês)
CREATE TABLE Commission(
	Id INT IDENTITY PRIMARY KEY,
	Year INT NOT NULL,
	Month INT NOT NULL,
	CommissionPrice DECIMAL(10,2) NOT NULL,
	SellerId INT NOT NULL FOREIGN KEY REFERENCES Seller(Id)
);

--Adiciona na tabela Vendas as colunas id do vendedor e id do cliente
CREATE TABLE Sale(
	Id INT IDENTITY PRIMARY KEY,
	Quantity  INT NOT NULL,
	DateOfSale DATE NOT NULL,
	FinalPrice DECIMAL(10,2) NOT NULL,
	ProductId INT FOREIGN KEY REFERENCES Product(Id),
	SellerId INT NOT NULL FOREIGN KEY REFERENCES Seller(Id),
	ClientId INT NOT NULL FOREIGN KEY REFERENCES Seller(Id),
);

INSERT INTO Product(Name, ExpirationDate, Price) VALUES ('BATATA', GETDATE() + 20, '200')
INSERT INTO Product(Name, ExpirationDate, Price) VALUES ('POLENTA', GETDATE() + 200, '100')
INSERT INTO Product(Name, ExpirationDate, Price) VALUES ('FRANGO', GETDATE() + 10, '25')
INSERT INTO Product(Name, ExpirationDate, Price) VALUES ('SASSAMI', GETDATE() + 5, '36')
INSERT INTO Product(Name, ExpirationDate, Price) VALUES ('ARROZ', GETDATE() + 9, '42')
INSERT INTO Product(Name, ExpirationDate, Price) VALUES ('TRIGO', GETDATE() + 8, '52')
INSERT INTO Product(Name, ExpirationDate, Price) VALUES ('FEIJAO', GETDATE() + 7, '77')
INSERT INTO Product(Name, ExpirationDate, Price) VALUES ('FAROFA', GETDATE() + 92, '88')
SELECT * FROM Product

INSERT INTO Stock(Quantity, ProductID) VALUES (51, 1)
INSERT INTO Stock(Quantity, ProductID) VALUES (515, 2)
INSERT INTO Stock(Quantity, ProductID) VALUES (7856, 3)
INSERT INTO Stock(Quantity, ProductID) VALUES (5781, 4)
INSERT INTO Stock(Quantity, ProductID) VALUES (7, 5)
INSERT INTO Stock(Quantity, ProductID) VALUES (86, 6)
INSERT INTO Stock(Quantity, ProductID) VALUES (782, 7)
INSERT INTO Stock(Quantity, ProductID) VALUES (782, 8)

INSERT INTO Client(Name, Cpf) VALUES ('Allan Kley', 11235496584)
INSERT INTO Client(Name, Cpf) VALUES ('Alexanrde Nikitin', 56496561898)
INSERT INTO Client(Name, Cpf) VALUES ('Bruno Viotto', 12533654789)

INSERT INTO Seller(Name, Cpf, DateOfHire, Active) VALUES ('Allan Kley Vendedor', 11235496585, GETDATE() - 300, 1)
INSERT INTO Seller(Name, Cpf, DateOfHire, Active) VALUES ('Alexanrde Nikitin Vendedor', 11235496554, GETDATE() - 350, 1)
INSERT INTO Seller(Name, Cpf, DateOfHire, Active) VALUES ('Bruno Viotto Vendedor', 11235496598, GETDATE() - 390, 1)

INSERT INTO Sale(Quantity,DateOfSale,FinalPrice,ProductId,SellerId,ClientId) VALUES (1, GETDATE(), 200, 1, 1, 1)
INSERT INTO Sale(Quantity,DateOfSale,FinalPrice,ProductId,SellerId,ClientId) VALUES (1, GETDATE(), 100, 2, 1, 1)
INSERT INTO Sale(Quantity,DateOfSale,FinalPrice,ProductId,SellerId,ClientId) VALUES (1, GETDATE(), 25, 3, 1, 1)
INSERT INTO Sale(Quantity,DateOfSale,FinalPrice,ProductId,SellerId,ClientId) VALUES (1, GETDATE(), 36, 4, 2, 2)
INSERT INTO Sale(Quantity,DateOfSale,FinalPrice,ProductId,SellerId,ClientId) VALUES (1, GETDATE(), 42, 5, 2, 2)
INSERT INTO Sale(Quantity,DateOfSale,FinalPrice,ProductId,SellerId,ClientId) VALUES (1, GETDATE(), 52, 6, 3, 2)
INSERT INTO Sale(Quantity,DateOfSale,FinalPrice,ProductId,SellerId,ClientId) VALUES (1, GETDATE(), 77, 7, 3, 3)
INSERT INTO Sale(Quantity,DateOfSale,FinalPrice,ProductId,SellerId,ClientId) VALUES (1, GETDATE(), 88, 8, 3, 3)
