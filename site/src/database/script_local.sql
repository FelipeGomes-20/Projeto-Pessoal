/* CREATE DATABASE Ecoffee;
USE Ecoffee;

create table empresa (idEmpresa int primary key auto_increment,
 nome_empresa varchar (40), 
 cnpj varchar (18),
 telefone varchar (11),
 cep varchar (10),
 cidade varchar (40),
 logradouro varchar(40),
 n_endereco VARCHAR (5),
 fk_matriz int,
 foreign key (fk_matriz) references empresa (idEmpresa)
 )auto_increment = 1000 ;
 
 
create table usuario ( idUsuario int primary key auto_increment,
nome_usuario varchar (30),
funcao char (3), check (funcao = "adm" or funcao = "fun"),
email varchar (45),
senha varchar (45),
fk_supervisor int,
foreign key (fk_supervisor) references usuario (idUsuario),
fk_empresa int,
foreign key (fk_empresa) references empresa (idEmpresa)
) auto_increment = 1;


create table setor ( idSetor int primary key auto_increment,
nome_area char (2),
qtd_sensores int,
fk_empresa int,
foreign key (fk_empresa) references empresa (idEmpresa)) auto_increment = 2000;

create table sensor (idSensor int primary key auto_increment,
fk_setor int,
foreign key (fk_setor) references setor (idSetor) ) auto_increment = 10000;

create table historico_monitoramento ( idMonitoramento int primary key auto_increment,
data_hora datetime default current_timestamp,
temperatura decimal,
umidade decimal,
fk_sensor int,
foreign key (fk_sensor) references sensor (idSensor)) auto_increment = 70000;

insert into empresa (nome_empresa,cnpj,telefone,cep,cidade,logradouro,n_endereco) values('Amazon','2032109','119832120','04821209','Tokyo','Akihabara','512');

insert into setor (nome_area,qtd_sensores,fk_empresa) values('A1','4','1000');

insert into sensor (fk_setor) values(2000);

insert into historico_monitoramento(fk_sensor,temperatura,umidade) values(10000,3,0); */

create database Rams;
use Rams;

create table jersey(
id_numero int primary key not null auto_increment,
numero int
);

create table jogador_ataque(
id_jogadorA int primary key not null auto_increment,
nome_jogador varchar(45),
fk_numero int,
foreign key (fk_numero) references jersey (id_numero),
posicao varchar(40),
passe int,
recepcao int,
towchdowns int,
jardas_corridas int,
OverAll_madden int,
salario decimal
);

create table jogador_defesa(
id_jogadorD int primary key not null auto_increment,
nome_jogador varchar(45),
fk_numero int,
foreign key (fk_numero) references jersey (id_numero),
posicao varchar(40),
tackle int,
interceptacao int,
sack int,
OverAll_madden int,
salario decimal
);

create table usuario(
id_usuario int primary key not null auto_increment,
nome_usuario varchar(45),
email varchar(45),
senha varchar(30),
idade int,
fk_jogador_ataque int,
foreign key (fk_jogador_ataque) references jogador_ataque (id_jogadorA),
fk_jogador_defesa int,
foreign key (fk_jogador_defesa) references jogador_defesa (id_jogadorD)
);