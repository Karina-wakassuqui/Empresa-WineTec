create database winetec;
use winetec;
create table Clientes(
ID_Cliente int primary key,
CNPJ_Cliente char (18),
RazaoSocial_Cliente varchar (60),
Nome_Cliente varchar (40),
Endereco_Cliente varchar (80),
Cidade_Cliente varchar (30),
Estado_Cliente char (2),
Contato_Cliente varchar (40),
Telefone_Cliente varchar (14),
Email_Cliente varchar (30)
);
insert into Clientes values
(0001,'05.089.637/0001-10','Grand Cru Importadora Ltda.','Grand Cru', 'Avenida Aruana, 884','São Paulo', 'SP', 'Renato', '(11)4756-9988', 'renato@grandcru.com.br'),
(0002,'17.392.519/0001-65', 'E-Vino Comércio de Vinhos S.A.', 'Evino', 'Rua Bela Cintra, 986','São Paulo', 'SP', 'Mariana', '(11)5563-3466', 'mariana@evino.com.br'),
(0003, '46.516.308/0001-95', 'Mistral importadora Ltda', 'Mistral', 'Rua Rocha, 288','São Paulo', 'SP', 'Silvana','(11)5478-5426', 'silvana@mistral.com.br'),
(0004, '87.848.180/0001-44', 'Casa Valduga-Vinhos Finos Ltda.', 'Casa Valduga','Via Trento, 2355','Bento Gonçalves', 'RS','Camila', '(54)2105-3122', 'camila@casavalduga.com.br');
select * from Clientes;
create table Estabelecimento(
ID_Estab int primary key,
ID_Cliente int,
Categoria_Estab varchar (10),
Nome_Estab varchar (30),
Endereco_Estab varchar (80),
Cidade_Estab varchar (30),
Estado_Estab char (2),
Contato_Estab varchar(40),
Telefone_Estab varchar (14)
);
insert into Estabelecimento values
(0001,0001, 'Loja', 'Moema', 'Alameda Nhambiquaras, 614', 'São Paulo','SP', 'Juliana', '(11)3624-5819'),
(0002, 0001,'Loja', 'Perdizes', 'Rua Cotoxó, 493','São Paulo','SP', 'Carlos', '(11)3853-3933'),
(0003,0001, 'Loja','Shopping Pátio Paulista', 'R. Treze de Maio, 1947 - Piso Térreo','São Paulo','SP', 'Jorge', '(11)3287-5487'),
(0004, 0002,'Loja', 'Jundiaí', 'Avenida Nove de Julho, 3345','São Paulo','SP', 'Lucas', '(11)4385-6286'),
(0005, 0002,'Loja', 'Guarulhos', 'Av. Bartholomeu de Carlos, 200','São Paulo','SP', 'Patricia', '(11)2436-4920'),
(0006, 0002,'Loja', 'Campinas', ' Rua Dr. Sampaio Ferraz, 336','São Paulo','SP', 'Adriana', '(19)98493-9843'),
(0007, 0003,'Loja', 'Bela Vista', 'Rua Rocha 288', 'São Paulo','SP','Rogerio', '(11)3372-3400'),
(0008, 0003,'Loja', 'JK Iguatemi', 'Av. Pres. Juscelino Kubitschek, 2041','São Paulo','SP', 'Pedro', '(11)3152-6050'),
(0009,0003,'Loja','Iguatemi', 'Av. Brigadeiro Faria Lima, 2232','São Paulo','SP', 'Soraya', '(11)3037-7001'),
(0010,0004, 'Armazém', 'Bento Gonçalves', 'Via Trento, 2355','Bento Gonçalves', 'RS','Camila', '(54)2105-3122'),
(0011,0004, 'Loja', 'BH', 'Rua Vitório Marçola, 203 - sala 10', 'Belo Horizonte', 'MG', 'Ronaldo', '(31)3643-6505');
select * from Estabelecimento;
create table Setor(
ID_Setor int primary key,
ID_Estab int,
Nome_Setor varchar (30),
Cod_Sensor int unique,
Temperatura_Minima int,
Temperatura_Maxima int,
Umidade_Minima int,
Umidade_Maxima int,
Frequencia_Evento int
);
insert into Setor values
(0001,0001, 'Tintos', 0001, 16, 18, 65, 75, 10),
(0002,0001, 'Brancos', 0002, 9, 12, 60, 80, 10),
(0003,0002, 'Tintos', 0003, 18, 20, 65, 75, 15),
(0004,0002, 'Brancos', 0004, 8, 11, 65, 75, 15),
(0005,0002, 'Espumantes', 0005, 6, 8, 65, 75, 15),
(0006,0003, 'Tintos', 0006, 16, 18, 60, 80, 5),
(0007,0004, 'Tintos', 0007, 16, 18, 60, 80, 10),
(0008,0004, 'Brancos', 0008, 9, 12, 65, 75, 10),
(0009,0005, 'Tintos', 0009, 14, 16, 60, 80, 10),
(0010,0006, 'Tintos', 0010, 18, 20, 65, 75, 10),
(0011,0006, 'Brancos', 0011, 7, 9, 60, 80, 5),
(0012,0007, 'Brancos', 0012, 9, 10, 65, 75, 5),
(0013,0007, 'Espumantes', 0013, 6, 8, 65, 75, 5),
(0014,0008, 'Espumantes', 0014, 6, 8, 65, 75, 5),
(0015,0009, 'Tintos', 0015, 18, 20, 65, 75, 5),
(0016,0010, 'Tintos Guarda', 0016, 16, 18, 65, 75, 10),
(0017,0010, 'Tintos Jovem', 0017, 14, 16, 65, 75,10),
(0018,0011, 'Brancos', 0018, 9, 10, 65, 75, 5),
(0019,0011, 'Espumantes', 0019, 6, 8, 65, 75, 5);
select * from setor;
create table Evento(
ID_Evento int primary key,
ID_Setor int,
Dia_Evento char (8),
Hora_Evento char(5),
Temperatura_Registrada int,
Umidade_Registrada int);
insert into evento values
(0001,0001,'02/03/20','08:00',16,65),
(0002,0002, '02/03/20', '08:00', 9, 62),
(0003,0003, '02/03/20', '08:00', 17, 65),
(0004,0004, '02/03/20', '08:00', 8, 65),
(0005,0005, '02/03/20', '08:00', 6, 70),
(0006,0006, '02/03/20', '08:00', 16, 60),
(0007,0007, '02/03/20', '08:00', 15, 60),
(0008,0008, '02/03/20', '08:00', 9, 65),
(0009,0009, '02/03/20', '08:00', 14, 60),
(0010,0010, '02/03/20', '08:00', 18, 70),
(0011,0011, '02/03/20', '08:00', 6, 62),
(0012,0012, '02/03/20', '08:00', 9, 65),
(0013,0013, '02/03/20', '08:00', 6, 70),
(0014,0014, '02/03/20', '08:00', 6, 65),
(0015,0015, '02/03/20', '08:00', 17, 65),
(0016,0016, '02/03/20', '08:00', 18, 70),
(0017,0017,'02/03/20', '08:00', 14, 60),
(0018,0018, '02/03/20', '08:00', 6, 62),
(0019,0019,'02/03/20', '08:00', 6, 70);
insert into evento values
(0020,0006, '02/03/20', '08:05', 16, 60),
(0021,0011, '02/03/20', '08:05', 6, 62),
(0022,0012, '02/03/20', '08:05', 9, 65),
(0023,0013, '02/03/20', '08:05', 7, 70),
(0024,0014, '02/03/20', '08:05', 6, 65),
(0025,0015, '02/03/20', '08:05', 17, 70),
(0026,0018, '02/03/20', '08:05', 6, 62),
(0027,0019, '02/03/20', '08:05', 6, 70),
(0028,0001, '02/03/20', '08:10', 16, 65),
(0029,0002, '02/03/20', '08:10', 9, 62),
(0030,0006, '02/03/20', '08:10', 16, 60),
(0031,0007, '02/03/20', '08:10', 15, 60),
(0032,0008, '02/03/20', '08:10', 9, 65),
(0033,0009, '02/03/20', '08:10', 14, 60),
(0034,0010, '02/03/20', '08:10', 18, 70),
(0035,0011, '02/03/20', '08:10', 6, 62),
(0036,0012, '02/03/20', '08:10', 9, 65),
(0037,0013, '02/03/20', '08:10', 7, 70),
(0038,0014, '02/03/20', '08:10', 6, 65),
(0039,0015, '02/03/20', '08:10', 17, 70);
insert into evento values
(0040,0016, '02/03/20', '08:10', 18, 70),
(0041,0017,'02/03/20', '08:10', 14, 60),
(0042,0018, '02/03/20', '08:10', 6, 62),
(0043,0019,'02/03/20', '08:10', 6, 70);

select * from evento;
