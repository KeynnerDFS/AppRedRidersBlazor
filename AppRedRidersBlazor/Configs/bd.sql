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

-- INSERTS

 
-- Inserts do login entregadores
insert into Cadastrar_login(
id_CaLo,
email_CaLo,
Senha_CaLo,
Confirmar_Senha
)
values (
null,
'DeboraAlmeida@gmail.com',
'Debora123',
'Debora123'
),
(
null,
'GuilhermeSilva@gmail.com',
'Guilherme123',
'Guilherme123'
),
(
null,
'VictorMoraes@gmail.com',
'Victor123',
'Victor123'
);

-- Insert do login restaurantes
insert into Cadastrar_login(
id_CaLo,
email_CaLo,
Senha_CaLo,
Confirmar_Senha
)
values 
(
null,
'SushiBarAli@gmail.com',
'sushi123',
'sushi123'
),
(
null,
'RestauranteFogoeBrasas@gmail.com',
'fogo123',
'Victor123'
);

-- INSERT DO Restaurante
insert into
cadastrar_restaurante (
id_cres,
nome_cres,
telefone_cres,
endereco_cres,
cnpj_cres,
id_Calo_fk)
VALUES
  (
    null,
    'Sushi-Bar Ali',
    '(69) 14223-9784',
    'Rua Jabuti, Bairro Castelo, Número 1212',
	'202415',
    null
  ),
  (
  null,
    'Restaurante Fogo e Brasa',
    '(29) 27543-7854',
    'Rua Natal, Bairro Novo Ano, Número 1562',
	'264544',
    null
  );


-- INSERT DO ENTREGADOR
insert into
cadastrar_entregador (
id_cent,
nome_cent,
cpf_cent,
rg_cent,
cnh_cent,
telefone_cent,
id_Calo_fk
  )
VALUES
  (
    null,
    'Debora Almeida Soares',
    '230.132.132-95',
    '123123',
	'32111123',
	'(69) 1233-9654',
    null
  ),
  (
   null,
    'Guilherme Silva',
    '625.963.425-54',
    '123877',
	'34444423',
	'(65) 17883-8796',
    null
  ),
  (
    null,
    'Victor Moraes',
    '159.546.753-41',
    '184533',
	'7895415',
	'(88) 48957-3254',
    null
  );


-- INSERT CLIENTE
insert into
cadastrar_cliente (
id_ccli,
nome_ccli,
endereco_ccli,
distancia_moradia_ccli,
forma_pagamento_ccli,
forma_contato_ccli,
id_cres_fk,
id_Calo_fk
)
VALUES
(
null,
'Alice Bezerra',
'Rua Amizade, Bairro Ademais, Número 8965',
1.5,
'Cartão, Débito Visa, a vista',
'Telefone (45) 34232-4523',
null,
null
),
(
null,
'Hector Menezes',
'Rua PDS, Bairro Pw, Número 2023',
1.5,
'Dinheiro, a vista',
'Telefone (23) 19875-1234',
null,
null
);

-- Insert do cardapio
insert into
cadastrar_cardapio (
id_ccar,
nome_ccar,
descricao_ccar,
id_cres_fk,
id_Calo_fk
  )
VALUES
(
null, 
'Sushis',
'Comida Japonesa	',
null,
null
),
(
null,
'Churrasco',
'Todo o tipo de churrasco',
null,
null
);


-- Insert pratos
insert into
cadastrar_pratos (
id_cpra,
nome_cpra,
preco_cpra,
descricao_cpra,
id_ccar_fk,
id_Calo_fk 
  )
VALUES
(
null,
'Temaki',
30.99,
'Comida Japonesa	',
null,
null
),
(
null,
'Churrasco',
35.00,
'Comida brasileira',
null,
null
);

-- INSERT ENTREGAS
insert into
entregas (
id_entr,
nome_cliente_entr,
endereco_cliente_entr,
distancia_moradia_ccli,
status_entr,
id_cres_fk,
id_cent_fk ,
 id_Calo_fk

 )
VALUES
  (
    null,
    'Alice Benedita Santos',
    'Rua Casamentos, Bairro Viuvo, Número 3223',
    5.3,
	'Entregue',
    null,
    null,
    null
  ),
  (
    null,
    'Bernardo Rodrigues',
    'Rua Ano Novo, Bairro Nova Colina, Número 2020',
    3.4,
	'Andamento',
    null,
    null,
    null
  );

-- INSERT ENTREGAS
insert into
entregas (
id_entr,
nome_cliente_entr,
endereco_cliente_entr,
distancia_moradia_ccli,
status_entr,
id_cres_fk,
id_cent_fk ,
 id_Calo_fk

 )
VALUES
  (
    null,
    'Alice Benedita Santos',
    'Rua Casamentos, Bairro Viuvo, Número 3223',
    5.3,
	'Entregue',
    null,
    null,
    null
  ),
  (
    null,
    'Bernardo Rodrigues',
    'Rua Ano Novo, Bairro Nova Colina, Número 2020',
    3.4,
	'Andamento',
    null,
    null,
    null
  );


-- INSERT VEICULO
insert into
veiculo (
 id_vei,
 nome_dono_Vei,
 cpf_vei,
 cnh_vei,
 placa_vei,
 id_cent_fk,
  id_Calo_fk
 )
VALUES
  (
    null,
    'Ana Camargo',
    '897.879.897-98',
    '4848158',
	'45d7rs',
    null,
    null
  ),
  (
    null,
    'Rogerio Fernandes',
    '754.854.854-96',
    '458854',
	'fd45s8',
    null,
    null
  );


-- INSERT CORRIDAS
insert into
corridas (
id_corr,
 nome_restaurante_corr,
 endereco_retirada_corr,
 local_entrega_corr,
 distancia_corr,
 status_corr,
 id_cres_fk,
 id_cent_fk,
 id_Calo_fk
  )
VALUES
  (
    null,
    'Sushi-Bar Ali',
      'Rua Jabuti, Bairro Castelo, Número 1212',
    'rua batata, bairro castelinho, número 4543',
	4.8,
    'andamento',
    null,
    null,
    null
  ),
  (
    null,
    'Restaurante Fogo e Brasa',
      'Rua Natal, Bairro Novo Ano, Número 1562',
    'rua abcd, bairro alfabeto, número 1234',
	1.8,
    'entregue',
    null,
    null,
    null
  );

insert into
novo_pedido(
id_nope,
preco_nope,
endereco_entrega_nope,
endereco_buscar_nope,  
quantidade_nope,
descricao_nope,
cliente_nope,
id_corr_fk,
id_Calo_fk
  )
VALUES
  (
    null,
    90.00,
    'rua Vaca, bairro casas, número 4122',
     'Rua Jabuti, Bairro Castelo, Número 1212',
	2,
    'Sopa de polvo',
    'ana fernandes',
    null,
    null
  );