create database BD_Red_Riders_01;
Use BD_Red_Riders_01;

-- Cadastro Login
create table cadastrar_login(
id_calo int primary key auto_increment,
email_calo varchar(300),
senha_calo varchar(300),
confirmar_senha varchar(300),
id_Calo_fk int,
 foreign key(id_calo_fk) references Cadastrar_login(id_calo)
);

-- Cadastro do restaurante
create table cadastrar_restaurante(
id_cres int primary key auto_increment,
nome_cres varchar(300),
telefone_cres varchar(50),
endereco_cres varchar(400),
cnpj_cres varchar(50),
id_Calo_fk int,
 foreign key(id_calo_fk) references Cadastrar_login(id_calo)
);

-- RESTAURANTE
-- G.CARDÁPIOS

-- Cadastro de cardápios
create table cadastrar_cardapio(
id_ccar int primary key auto_increment,
nome_ccar varchar(300),
descricao_ccar varchar(400),
id_cres_fk int,
foreign key(id_cres_fk) references cadastrar_restaurante(id_cres),
id_Calo_fk int,
 foreign key(id_calo_fk) references Cadastrar_login(id_calo)
);

-- Cadastro de pratos
create table cadastrar_pratos(
id_cpra int primary key auto_increment,
nome_cpra varchar(300),
preco_cpra float,
descricao_cpra varchar(400),
id_ccar_fk int,
foreign key(id_ccar_fk) references cadastrar_cardapio(id_ccar),
id_Calo_fk int,
 foreign key(id_calo_fk) references Cadastrar_login(id_calo)
);

-- G.CLIENTES

-- Cadastro de clientes
create table cadastrar_cliente(
id_ccli int primary key auto_increment,
nome_ccli varchar(300),
endereco_ccli varchar(400),
distancia_moradia_ccli float,
forma_pagamento_ccli varchar(200),
forma_contato_ccli varchar(200),
id_cres_fk int,
foreign key(id_cres_fk) references cadastrar_restaurante(id_cres),
id_Calo_fk int,
 foreign key(id_calo_fk) references Cadastrar_login(id_calo)
);