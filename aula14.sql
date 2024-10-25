create database bd_clientes;
use bd_clientes;

create table tbl_clientes (
codigo int not null primary key auto_increment,
nome varchar(40) not null,
sexo char(1) not null);

insert into tbl_clientes(nome,sexo)
values("Brandão085","M"),("Neymar","M"),("Xuxa","F");

select * from tbl_clientes;

DELIMITER $$
CREATE PROCEDURE sp_lista_clientes(IN opcao INT)
BEGIN
	IF opcao = 0 THEN
      SELECT * FROM tbl_clientes WHERE sexo = 'F';
	ELSEIF opcao = 1 THEN
      SELECT * FROM tbl_clientes WHERE sexo = 'M';
	END IF;
END $$
DELIMITER ;

SHOW PROCEDURE STATUS;

#Lista sexo Feminino
CALL sp_lista_clientes(0);
#Lista sexo Masculino
Call sp_lista_clientes(1);
#Lista todos:
Call sp_lista_clientes(2);

DELIMITER $$
CREATE PROCEDURE sp_busca_cliente_por_nome(IN nome_parcial varchar (100))
BEGIN
      SELECT * FROM tbl_clientes
      WHERE nome LIKE CONCAT ('%', nome_parcial, '%');
END $$
DELIMITER ;

CREATE TABLE tbl_clientes2 (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    sexo CHAR(1) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);

INSERT INTO tbl_clientes2 (nome, idade, sexo, email, telefone, endereco) VALUES
('João Silva', 30, 'M', 'joao.silva@example.com', '11987654321', 'Rua A, 123, São Paulo, SP'),
('Maria Oliveira', 25, 'F', 'maria.oliveira@example.com', '11976543210', 'Rua B, 456, Rio de Janeiro, RJ'),
('Carlos Souza', 40, 'M', 'carlos.souza@example.com', '11965432109', 'Rua C, 789, Belo Horizonte, MG'),
('Ana Costa', 35, 'F', 'ana.costa@example.com', '11954321098', 'Rua D, 321, Curitiba, PR'),
('Pedro Santos', 28, 'M', 'pedro.santos@example.com', '11943210987', 'Rua E, 654, Porto Alegre, RS');

select * from tbl_clientes2;

DELIMITER $$
CREATE PROCEDURE sp_verifica_maioridade()
BEGIN
    SELECT * FROM tbl_clientes2 WHERE idade > 18;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_verifica_menoridade()
BEGIN
    SELECT * FROM tbl_clientes2 WHERE idade < 18;
END $$
DELIMITER ;
