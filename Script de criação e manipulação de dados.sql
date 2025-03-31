-- Luccas Barbosa da Silva 28-03-2025

-- Criando o banco de dados 
CREATE DATABASE Empresa; 
USE Empresa;

-- Criando a tabela de Departamentos 
CREATE TABLE Departamentos ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL 
    );

-- Criando a tabela de Cargos 
CREATE TABLE Cargos ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL, 
    nivel VARCHAR(50) NOT NULL 
    );
    
    -- Criando a tabela de Funcionários 
CREATE TABLE Funcionarios ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL, 
    data_nascimento DATE NOT NULL, 
    salario DECIMAL(10,2) NOT NULL, 
    departamento_id INT NOT NULL, 
    cargo_id INT NOT NULL, 
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(id), 
    FOREIGN KEY (cargo_id) REFERENCES Cargos(id) 
);

-- Inserindo dados na tabela Departamentos 
INSERT INTO Departamentos (nome) VALUES ('TI'), ('RH'), ('Financeiro'), ('Marketing'), ('Vendas');

-- Inserindo dados na tabela Cargos 
INSERT INTO Cargos (nome, nivel) VALUES 
('Analista', 'Pleno'), 
('Gerente', 'Sênior'), 
('Assistente', 'Júnior'), 
('Coordenador', 'Sênior'), 
('Desenvolvedor', 'Pleno');

-- Inserindo dados na tabela Funcionarios 
INSERT INTO Funcionarios (nome, data_nascimento, salario, departamento_id, cargo_id) VALUES 
('Ana Silva', '1985-06-15', 5500.00, 1, 5), 
('Carlos Santos', '1990-03-22', 4800.00, 2, 1), 
('Bruna Costa', '1987-12-10', 6000.00, 3, 2), 
('Daniel Oliveira', '1992-08-05', 5200.00, 1, 5), 
('Fernanda Lima', '1995-09-30', 4500.00, 2, 3), 
('Gustavo Souza', '1980-01-25', 7000.00, 3, 2), 
('Helena Martins', '1983-11-17', 5300.00, 1, 4), 
('Igor Ferreira', '1991-07-08', 4900.00, 2, 1), 
('Juliana Rocha', '1989-04-19', 5600.00, 3, 2), 
('Lucas Mendes', '1993-06-23', 5100.00, 1, 5);

-- Select * FROM Funcionarios;
-- Select * FROM departamentos;

-- 1.Encontre o maior Salário
SELECT MAX(salario) FROM Funcionarios; 

-- 2.Encontre o menor Salário;
SELECT MIN(salario) FROM Funcionarios; 

-- 3.Qual a quantidade de Funcionários;
SELECT COUNT(id) FROM Funcionarios; 

-- 4.Filtre os funcionários nascidos apartir de 1990;
SELECT nome,YEAR(data_nascimento)FROM Funcionarios WHERE YEAR(data_nascimento) >= 1990; 

-- 5.Encontre a média Salárial;
SELECT AVG(salario) FROM Funcionarios; 

-- 6.Extraia os 3 primeiros caracteres do nome (substring);
Select nome, SUBSTRING(nome, 1,3)  From Funcionarios;

-- 7.Contar quantos funcionários por departamento
SELECT Count( Func.departamento_id) as qtdFunc, dep.nome as nomedep
FROM Funcionarios Func
JOIN departamentos dep ON Func.departamento_id=dep.id 
GROUP BY nomedep;

-- 8.Contar quantos funcionários por cargo
SELECT Count( Func.cargo_id) as qtdFunc, c.nome as Nome
FROM Funcionarios Func
JOIN cargos c ON Func.cargo_id=c.id 
GROUP BY c.nome;