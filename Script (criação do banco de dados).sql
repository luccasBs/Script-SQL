CREATE DATABASE LOJA;
USE LOJA;

CREATE TABLE Clientes(
	Cod_cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(100) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Cep CHAR(8) NOT NULL
);



CREATE TABLE Pedidos(
	Num_Pedido INT PRIMARY KEY AUTO_INCREMENT,
    Data_Pedido DATE,
    Item VARCHAR(150) NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
	Cod_cliente INT,
	FOREIGN KEY(Cod_cliente) REFERENCES Clientes(Cod_cliente)
);

INSERT INTO Clientes (Nome, Endereco, Cidade, Cep)
VALUES ('Luccas B', 'Rua Antônio de Lima', 'São Paulo','12914081');

INSERT INTO Clientes (Nome, Endereco, Cidade, Cep)
VALUES ('Nathan', 'Rua Tiradentes', 'São Paulo','07145330');

INSERT INTO Pedidos (Data_Pedido, Item, Valor, Cod_cliente)
VALUES ('2025-03-13', 'SQL', '29,90','1');

INSERT INTO Pedidos (Data_Pedido, Item, Valor, Cod_cliente)
VALUES ('2025-03-14', 'Sql', '49,99','2');

SELECT *FROM Clientes;
SELECT *FROM Pedidos;

SELECT *FROM clientes join pedidos ON clientes.cod_cliente = pedidos.cod_cliente;
