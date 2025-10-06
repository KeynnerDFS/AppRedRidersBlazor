create database BD_Red_Riders_01;
Use BD_Red_Riders_01;

-- Cadastro Login
create table cadastrar_login(
id_calo int primary key auto_increment,
email_calo varchar(300),
senha_calo varchar(300),
confirmar_senha_calo varchar(300)
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

-- Cadastro do entregador
create table cadastrar_entregador(
id_cent int primary key auto_increment,
nome_cent varchar(300),
cpf_cent varchar(15),
rg_cent varchar(30),
cnh_cent varchar(30),
telefone_cent varchar(50),
id_Calo_fk int,
 foreign key(id_calo_fk) references Cadastrar_login(id_calo)
);

-- ENTREGADOR

-- G.ENTREGAS

--  Entregas
create table entregas(
id_entr int primary key auto_increment,
nome_cliente_entr varchar(300),
endereco_cliente_entr varchar(400),
distancia_moradia_ccli float,
status_entr varchar(200),
id_cres_fk int,
foreign key(id_cres_fk) references cadastrar_restaurante(id_cres),
id_cent_fk int,
 foreign key(id_cent_fk) references cadastrar_entregador(id_cent),
 id_Calo_fk int,
 foreign key(id_calo_fk) references Cadastrar_login(id_calo)
); 


-- corridas entregador
 create table Corridas(
 id_corr int primary key auto_increment,
 nome_restaurante_corr varchar(300),
 endereco_retirada_corr varchar(300),
 local_entrega_corr varchar(300),
 distancia_corr double,
 status_corr varchar(100),
 id_cres_fk int,
 foreign key(id_cres_fk) references cadastrar_restaurante(id_cres),
 id_cent_fk int,
 foreign key(id_cent_fk) references cadastrar_entregador(id_cent),
 id_Calo_fk int,
 foreign key(id_calo_fk) references Cadastrar_login(id_calo)
 );

-- Veiculos
 create table Veiculo(
 id_vei int primary key auto_increment,
 nome_dono_vei varchar(300),
 modelo_vei varchar(15),
 marca_vei varchar(50),
 placa_vei varchar(50),
 cor_vei varchar(50),
 rotaimg_vei varchar(250),
 id_cent_fk int,
 foreign key(id_cent_fk) references cadastrar_entregador(id_cent),
  id_Calo_fk int,
 foreign key(id_calo_fk) references Cadastrar_login(id_calo)
 );
 
-- Novo pedido
create table novo_pedido(
id_nope int primary key auto_increment,
preco_nope float,
endereco_entrega_nope varchar(400),
endereco_buscar_nope varchar(400),
quantidade_nope int,
descricao_nope varchar(400),
cliente_nope varchar(400),
id_corr_fk int,
foreign key(id_corr_fk) references corridas(id_corr),
id_Calo_fk int,
 foreign key(id_calo_fk) references Cadastrar_login(id_calo)
);

