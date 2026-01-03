-- CRIANDO O BANCO DO MARKETPLACE
CREATE DATABASE mark_on;
-- VISUALIZANDO O BANCO DE DADOS
SHOW DATABASES;
-- UTILIZAR O BANCO CRIADO
USE mark_on;
-- CRIANDO A TABELA TB_CLIENTE
CREATE TABLE tb_fornecedor(
for_id INT AUTO_INCREMENT PRIMARY KEY,
for_cpf_cnpj VARCHAR(20),
for_tipo CHAR(1) NOT NULL, -- J para pessoa juridica e F para pessoa fisica
for_razao_social VARCHAR(150) NOT NULL,
for_nome VARCHAR(150) NOT NULL,
for_celular VARCHAR(20) NOT NULL,
for_email VARCHAR(150) NOT NULL
);
-- CRIANDO A TABELA TB_CATEGORIA
CREATE TABLE tb_categoria(
cat_id INT AUTO_INCREMENT PRIMARY KEY,
cat_nome VARCHAR(150) NOT NULL
); 
-- CRIANDO A TABELA TB_CLIENTE
CREATE TABLE tb_cliente(
cli_id INT AUTO_INCREMENT PRIMARY KEY,
cli_cpf VARCHAR(15) NOT NULL,
cli_nome VARCHAR (150) NOT NULL,
cli_telefone VARCHAR (15) NOT NULL,
cli_email VARCHAR (100) NOT NULL,
cli_rua VARCHAR (100) NOT NULL,
cli_num VARCHAR (30) NOT NULL,
cli_cep VARCHAR (15) NOT NULL
);
-- CRIANDO A TABELA TB_ENTREGA
CREATE TABLE tb_entrega(
ent_id INT AUTO_INCREMENT PRIMARY KEY,
ent_codigo VARCHAR(10),
ent_nome_entregador VARCHAR (150) NOT NULL,
ent_cpf_entregador VARCHAR(15) NOT NULL,
ent_data_entrega DATE,
ent_data_envio DATE,
ent_status VARCHAR(10)
);
-- CRIANDO A TABELA TB_PRODUTO
CREATE TABLE tb_produto(
pro_id INT AUTO_INCREMENT PRIMARY KEY,
pro_nome VARCHAR (150) NOT NULL,
pro_preco DECIMAL(10,2) NOT NULL,
pro_forid INT,
pro_catid INT,
FOREIGN KEY (pro_forid) REFERENCES tb_fornecedor(for_id),
FOREIGN KEY (pro_catid) REFERENCES tb_categoria(cat_id) 
);
-- CRIANDO A TABELA TB_PEDIDO
CREATE TABLE tb_pedido(
ped_id INT AUTO_INCREMENT PRIMARY KEY,
ped_data DATETIME,
ped_status VARCHAR(10),
ped_cliid INT,
ped_entid INT,
FOREIGN KEY (ped_cliid) REFERENCES tb_cliente(cli_id),
FOREIGN KEY (ped_entid) REFERENCES tb_entrega(ent_id)
);
-- CRIANDO A TABELA tb_pagamento
CREATE TABLE tb_pagamento(
pag_id INT AUTO_INCREMENT PRIMARY KEY,
pag_status VARCHAR(10),
pag_data DATETIME,
pag_valor DECIMAL(10,2) NOT NULL,
pag_metodo VARCHAR(30),
pag_pedid INT,
FOREIGN KEY (pag_pedid) REFERENCES tb_pedido(ped_id)
);
DROP TABLE IF EXISTS tb_pagamento;
CREATE TABLE tb_pagamento(
pag_id INT AUTO_INCREMENT PRIMARY KEY,
pag_data_vencimento DATETIME NOT NULL,
pag_data_pagamento DATETIME,
pag_metodo VARCHAR(30),
pag_valor DECIMAL(10,2),
pag_status BOOLEAN NOT NULL,
pag_pedid INT,
FOREIGN KEY (pag_pedid) REFERENCES tb_pedido(ped_id)
);
-- CRIANDO A TABELA TB_PROD_PEDIDO
CREATE TABLE tb_prod_pedido(
pp_id INT AUTO_INCREMENT PRIMARY KEY,
pp_quantidade INT NOT NULL,
pp_proid INT,
pp_pedid INT,
FOREIGN KEY (pp_proid) REFERENCES tb_produto(pro_id),
FOREIGN KEY (pp_pedid) REFERENCES tb_pedido(ped_id)
);
SHOW TABLES;
-- INSERINDO DADOS NAS TABELAS
-- FORNECEDORES
INSERT INTO tb_fornecedor (for_cpf_cnpj, for_tipo, for_razao_social, for_nome, for_celular, for_email) VALUES
('12.345.678/0001-00','J','Tech Brasil LTDA','Tech Brasil','(11) 91111-1111','contato@techbr.com'),
('98.765.432/0001-55','J','Casa das Peças ME','Casa das Peças','(11) 92222-2222','vendas@casapecas.com'),
('111.222.333-44','F','Fornecedor Autônomo','João Silva','(21) 93333-3333','joao@exemplo.com'),
('22.333.444/0001-77','J','Moda & Cia LTDA','Moda & Cia','(31) 94444-4444','suporte@modacia.com'),
('555.666.777-88','F','Fornecedor Autônomo','Maria Souza','(41) 95555-5555','maria@exemplo.com'),
('33.444.555/0001-99','J','Games Importados SA','Games Import','(51) 96666-6666','hello@gamesimport.com'),
('666.777.888-99','F','Artesão Local','Carlos Pereira','(61) 97777-7777','carlos@artes.com'),
('44.555.666/0001-11','J','EletroMax LTDA','EletroMax','(71) 98888-8888','contato@eletromax.com'),
('777.888.999-00','F','Fornecedor Autônomo','Ana Lima','(81) 99999-9999','ana@exemplo.com'),
('55.666.777/0001-22','J','PetWorld Com.','PetWorld','(85) 90000-0000','oi@petworld.com');
-- CATEGORIAS
INSERT INTO tb_categoria (cat_nome) VALUES
('Eletrônicos'),
('Informática'),
('Moda'),
('Casa'),
('Esporte'),
('Beleza'),
('Livros'),
('Pet Shop'),
('Games'),
('Automotivo');
-- CLIENTES
INSERT INTO tb_cliente (cli_cpf, cli_nome, cli_telefone, cli_email, cli_cep, cli_rua, cli_num) VALUES
('123.456.789-00','Ana Beatriz','(11) 94000-0001','ana.b@ex.com','01000-000','Rua A','100'),
('987.654.321-00','Bruno Costa','(11) 94000-0002','bruno.c@ex.com','02000-000','Rua B','200'),
('111.222.333-44','Carla Mendes','(21) 94000-0003','carla.m@ex.com','03000-000','Rua C','300'),
('222.333.444-55','Diego Nunes','(31) 94000-0004','diego.n@ex.com','04000-000','Rua D','400'),
('333.444.555-66','Elaine Prado','(41) 94000-0005','elaine.p@ex.com','05000-000','Rua E','500'),
('444.555.666-77','Fernando Reis','(51) 94000-0006','fernando.r@ex.com','06000-000','Rua F','600'),
('555.666.777-88','Gabriela Luz','(61) 94000-0007','gabi.l@ex.com','07000-000','Rua G','700'),
('666.777.888-99','Henrique Tavares','(71) 94000-0008','henrique.t@ex.com','08000-000','Rua H','800'),
('777.888.999-00','Isabela Rocha','(81) 94000-0009','isa.r@ex.com','09000-000','Rua I','900'),
('888.999.000-11','Jonas Vieira','(85) 94000-0010','jonas.v@ex.com','10000-000','Rua J','1000');
-- ENTREGAS
INSERT INTO tb_entrega (ent_codigo, ent_data_entrega, ent_data_envio, ent_status, ent_cpf_entregador, ent_nome_entregador) VALUES
('ENT0000001','2025-02-05','2025-02-03','ENTREGUE','111.111.111-11','Rafael Souza'),
('ENT0000002',NULL,'2025-02-06','ENVIADO','222.222.222-22','Paulo Lima'),
('ENT0000003','2025-02-07','2025-02-05','ENTREGUE','333.333.333-33','Luana Alves'),
('ENT0000004',NULL,NULL,'PENDENTE','444.444.444-44','Marcos Dias'),
('ENT0000005','2025-02-10','2025-02-08','ENTREGUE','555.555.555-55','Bianca Teixeira'),
('ENT0000006',NULL,'2025-02-09','ENVIADO','666.666.666-66','Camila Prado'),
('ENT0000007','2025-02-12','2025-02-10','ENTREGUE','777.777.777-77','Rogério Nunes'),
('ENT0000008',NULL,NULL,'PENDENTE','888.888.888-88','Mário Cunha'),
('ENT0000009','2025-02-14','2025-02-12','ENTREGUE','999.999.999-99','Larissa Melo'),
('ENT0000010',NULL,'2025-02-15','ENVIADO','000.000.000-00','Tiago Ramos');
-- PRODUTOS
INSERT INTO tb_produto (pro_nome, pro_preco, pro_forid, pro_catid) VALUES
('Smartphone Z',            1999.90, 1, 1),
('Notebook A15',            3999.00, 1, 2),
('Camiseta Básica',           49.90, 4, 3),
('Jogo de Panelas',          259.90, 8, 4),
('Bicicleta MTB 29',        2499.00, 2, 5),
('Shampoo Premium',           39.90, 5, 6),
('Livro SQL Essencial',       89.90, 3, 7),
('Ração Cães 10kg',          149.90,10, 8),
('Controle Gamer Pro',       299.90, 6, 9),
('Óleo de Motor 5W30',        79.90, 2,10);
-- PEDIDOS
INSERT INTO tb_pedido (ped_data, ped_status, ped_cliid, ped_entid) VALUES
('2025-02-03 10:15:00','PAGO',      1, 1),
('2025-02-04 11:00:00','ABERTO',    2, 2),
('2025-02-05 09:30:00','PAGO',      3, 3),
('2025-02-05 16:45:00','CANCELADO', 4, 4),
('2025-02-06 08:10:00','PAGO',      5, 5),
('2025-02-07 14:25:00','ENVIADO',   6, 6),
('2025-02-08 12:00:00','PAGO',      7, 7),
('2025-02-09 18:35:00','ABERTO',    8, 8),
('2025-02-10 10:05:00','PAGO',      9, 9),
('2025-02-11 19:20:00','ENVIADO',  10,10);
-- PAGAMENTOS
INSERT INTO tb_pagamento (pag_data_vencimento, pag_data_pagamento, pag_metodo, pag_valor, pag_status, pag_pedid) VALUES
('2025-02-04 00:00:00','2025-02-03 12:00:00','CARTAO', 1999.90, 1, 1),
('2025-02-06 00:00:00',NULL,'BOLETO', 299.90, 0, 2),
('2025-02-06 00:00:00','2025-02-05 10:00:00','PIX', 4088.90, 1, 3),
('2025-02-07 00:00:00',NULL,'PIX', 259.90, 0, 4),
('2025-02-08 00:00:00','2025-02-06 09:00:00','CARTAO', 2548.90, 1, 5),
('2025-02-09 00:00:00',NULL,'BOLETO', 149.90, 0, 6),
('2025-02-10 00:00:00','2025-02-08 13:00:00','PIX', 338.80, 1, 7),
('2025-02-11 00:00:00',NULL,'CARTAO', 499.80, 0, 8),
('2025-02-12 00:00:00','2025-02-10 11:00:00','CARTAO', 318.80, 1, 9),
('2025-02-13 00:00:00',NULL,'PIX', 299.90, 0,10);
-- PRODUTOS x PEDIDOS
INSERT INTO tb_prod_pedido (pp_quantidade, pp_proid, pp_pedid) VALUES
(1,  1, 1), 
(1,  9, 2),
(1,  2, 3),
(1,  4, 4),
(1,  5, 5),
(2,  6, 7),
(1,  7, 8),
(2,  8, 9),
(1, 10,10),
(3,  3, 6);
SHOW DATABASES;
USE mark_on;
SELECT * FROM tb_fornecedor;
SELECT * FROM tb_categoria;
SELECT * FROM tb_cliente;
SELECT * FROM tb_entrega;
SELECT * FROM tb_produto;
SELECT * FROM tb_pedido;
SELECT * FROM tb_pagamento;
SELECT * FROM tb_prod_pedido;
SELECT 
c.cli_nome AS Cliente,
c.cli_cpf AS CPF,
c.cli_telefone AS Telefone,
c.cli_email AS Email,
c.cli_cep AS CEP,
c.cli_rua AS Rua,
c.cli_num AS Numero,    
p.ped_id AS Pedido,
p.ped_data AS Data_Pedido,
p.ped_status AS Status_Pedido,    
e.ent_status AS Status_Entrega,
e.ent_data_envio AS Data_Envio,
e.ent_data_entrega AS Data_Entrega,
e.ent_nome_entregador AS Entregador,    
pr.pro_nome AS Produto,
pr.pro_preco AS Preco_Unitario,    
f.for_nome AS Fornecedor,
f.for_celular AS Fornecedor_Telefone,
f.for_email AS Fornecedor_Email,    
cat.cat_nome AS Categoria,    
pp.pp_quantidade AS Quantidade,    
pg.pag_metodo AS Metodo_Pagamento,
pg.pag_status AS Status_Pagamento,
pg.pag_valor AS Valor_Pagamento
FROM tb_pedido p
JOIN tb_cliente c ON p.ped_cliid = c.cli_id
JOIN tb_entrega e ON p.ped_entid = e.ent_id
JOIN tb_prod_pedido pp ON p.ped_id = pp.pp_pedid
JOIN tb_produto pr ON pp.pp_proid = pr.pro_id
JOIN tb_fornecedor f ON pr.pro_forid = f.for_id
JOIN tb_categoria cat ON pr.pro_catid = cat.cat_id
JOIN tb_pagamento pg ON p.ped_id = pg.pag_pedid
ORDER BY p.ped_id, pr.pro_nome;