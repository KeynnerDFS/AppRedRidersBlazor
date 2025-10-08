CREATE DATABASE BD_Red_Riders_01;
USE BD_Red_Riders_01;

-- Cadastro Login
CREATE TABLE cadastrar_login (
    id_calo INT PRIMARY KEY AUTO_INCREMENT,
    email_calo VARCHAR(300),
    senha_calo VARCHAR(300),
    confirmar_senha_calo VARCHAR(300)
);

-- Cadastro do restaurante
CREATE TABLE cadastrar_restaurante (
    id_cres INT PRIMARY KEY AUTO_INCREMENT,
    nome_cres VARCHAR(300),
    telefone_cres VARCHAR(50),
    endereco_cres VARCHAR(400),
    cnpj_cres VARCHAR(50),
    imagem_cres VARCHAR(500),
    id_calo_fk INT,
    FOREIGN KEY (id_calo_fk) REFERENCES cadastrar_login(id_calo)
);

-- Cadastro de cardápios
CREATE TABLE cadastrar_cardapio (
    id_ccar INT PRIMARY KEY AUTO_INCREMENT,
    nome_ccar VARCHAR(300),
    descricao_ccar VARCHAR(400),
    id_cres_fk INT,
    FOREIGN KEY (id_cres_fk) REFERENCES cadastrar_restaurante(id_cres),
    id_calo_fk INT,
    FOREIGN KEY (id_calo_fk) REFERENCES cadastrar_login(id_calo)
);

-- Cadastro de pratos
CREATE TABLE cadastrar_pratos (
    id_cpra INT PRIMARY KEY AUTO_INCREMENT,
    nome_cpra VARCHAR(300),
    preco_cpra FLOAT,
    descricao_cpra VARCHAR(400),
    id_ccar_fk INT,
    FOREIGN KEY (id_ccar_fk) REFERENCES cadastrar_cardapio(id_ccar),
    id_calo_fk INT,
    FOREIGN KEY (id_calo_fk) REFERENCES cadastrar_login(id_calo)
);

-- Cadastro de clientes
CREATE TABLE cadastrar_cliente (
    id_ccli INT PRIMARY KEY AUTO_INCREMENT,
    nome_ccli VARCHAR(300),
    endereco_ccli VARCHAR(400),
    distancia_moradia_ccli varchar(200),
    forma_pagamento_ccli VARCHAR(200),
    forma_contato_ccli VARCHAR(200),
    id_cres_fk INT,
    FOREIGN KEY (id_cres_fk) REFERENCES cadastrar_restaurante(id_cres),
    id_calo_fk INT,
    FOREIGN KEY (id_calo_fk) REFERENCES cadastrar_login(id_calo)
);

-- Cadastro do entregador
CREATE TABLE cadastrar_entregador (
    id_cent INT PRIMARY KEY AUTO_INCREMENT,
    nome_cent VARCHAR(300),
    cpf_cent VARCHAR(15),
    rg_cent VARCHAR(30),
    cnh_cent VARCHAR(30),
    telefone_cent VARCHAR(50),
    id_calo_fk INT,
    FOREIGN KEY (id_calo_fk) REFERENCES cadastrar_login(id_calo)
);

-- Veículos
CREATE TABLE Veiculo (
    id_vei INT PRIMARY KEY AUTO_INCREMENT,
    nome_dono_vei VARCHAR(300),
    modelo_vei VARCHAR(15),
    marca_vei VARCHAR(50),
    placa_vei VARCHAR(50),
    cor_vei VARCHAR(50),
    rotaimg_vei VARCHAR(250),
    id_cent_fk INT,
    FOREIGN KEY (id_cent_fk) REFERENCES cadastrar_entregador(id_cent),
    id_calo_fk INT,
    FOREIGN KEY (id_calo_fk) REFERENCES cadastrar_login(id_calo)
);

-- Novo pedido
CREATE TABLE novo_pedido (
    id_nope INT PRIMARY KEY AUTO_INCREMENT,
    nome_restaurante_nope VARCHAR(300),
    preco_nope FLOAT,
    endereco_entrega_nope VARCHAR(400),
    endereco_buscar_nope VARCHAR(400),
    distancia_nope VARCHAR(100),
    quantidade_nope INT,
    descricao_nope VARCHAR(400),
    cliente_nope VARCHAR(400),
    status_nope VARCHAR(100),
    id_cres_fk INT,
    FOREIGN KEY (id_cres_fk) REFERENCES cadastrar_restaurante(id_cres),
    id_cent_fk INT,
    FOREIGN KEY (id_cent_fk) REFERENCES cadastrar_entregador(id_cent),
    id_calo_fk INT,
    FOREIGN KEY (id_calo_fk) REFERENCES cadastrar_login(id_calo)
);

-- INSERTS --------------------------------------------------

-- Logins
INSERT INTO cadastrar_login (email_calo, senha_calo, confirmar_senha_calo)
VALUES 
('restaurante@email.com', '1234', '1234'),
('entregador@email.com', 'abcd', 'abcd');

-- Restaurantes
INSERT INTO cadastrar_restaurante (nome_cres, telefone_cres, endereco_cres, cnpj_cres, imagem_cres, id_calo_fk)
VALUES 
('Restaurante Sabor da Casa', '11987654321', 'Rua das Flores, 123', '12.345.678/0001-90', 'img/sabor.png', 1),
('Restaurante Bom Gosto', '11911223344', 'Av. Central, 456', '98.765.432/0001-10', 'img/bomgosto.png', 1);

-- Cardápios
INSERT INTO cadastrar_cardapio (nome_ccar, descricao_ccar, id_cres_fk, id_calo_fk)
VALUES 
('Almoço Executivo', 'Pratos variados para o dia a dia.', 1, 1),
('Massas Italianas', 'Cardápio com foco em massas e molhos.', 2, 1);

-- Pratos
INSERT INTO cadastrar_pratos (nome_cpra, preco_cpra, descricao_cpra, id_ccar_fk, id_calo_fk)
VALUES 
('Bife com Arroz e Feijão', 25.90, 'Acompanha salada e batata frita.', 1, 1),
('Lasanha Bolonhesa', 32.50, 'Massa caseira com molho bolonhesa.', 2, 1);

-- Clientes
INSERT INTO cadastrar_cliente (nome_ccli, endereco_ccli, distancia_moradia_ccli, forma_pagamento_ccli, forma_contato_ccli, id_cres_fk, id_calo_fk)
VALUES 
('João Pereira', 'Rua Azul, 55', 2.5, 'Cartão de Crédito', 'WhatsApp', 1, 1),
('Maria Souza', 'Av. Brasil, 900', 4.2, 'Pix', 'Telefone', 2, 1);

-- Entregadores
INSERT INTO cadastrar_entregador (nome_cent, cpf_cent, rg_cent, cnh_cent, telefone_cent, id_calo_fk)
VALUES 
('Carlos Silva', '123.456.789-00', '12.345.678-9', '1234567890', '11998887766', 2),
('Pedro Santos', '987.654.321-00', '98.765.432-1', '0987654321', '11997776655', 2);

-- Veículos
INSERT INTO Veiculo (nome_dono_vei, modelo_vei, marca_vei, placa_vei, cor_vei, rotaimg_vei, id_cent_fk, id_calo_fk)
VALUES 
('Carlos Silva', 'CG 160', 'Honda', 'ABC-1234', 'Vermelha', 'img/moto1.png', 1, 2),
('Pedro Santos', 'Fazer 250', 'Yamaha', 'XYZ-5678', 'Preta', 'img/moto2.png', 2, 2);

-- Pedidos
INSERT INTO novo_pedido (nome_restaurante_nope, preco_nope, endereco_entrega_nope, endereco_buscar_nope, distancia_nope, quantidade_nope, descricao_nope, cliente_nope, status_nope, id_cres_fk, id_cent_fk, id_calo_fk)
VALUES 
('Restaurante Sabor da Casa', 25.90, 'Rua Azul, 55', 'Rua das Flores, 123', '2.5 km', 1, 'Bife com Arroz e Feijão', 'João Pereira', 'Em preparo', 1, 1, 1),
('Restaurante Bom Gosto', 32.50, 'Av. Brasil, 900', 'Av. Central, 456', '4.2 km', 1, 'Lasanha Bolonhesa', 'Maria Souza', 'A caminho', 2, 2, 1);
