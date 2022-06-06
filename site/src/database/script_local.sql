create database rams;
use rams;
-- drop database Rams;
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
rating int
);

create table jogador_defesa(
id_jogadorD int primary key not null auto_increment,
nome_jogador varchar(45),
fk_numero int,
foreign key (fk_numero) references jersey (id_numero),
posicao varchar(40),
rating int
);

create table usuario(
id_usuario int primary key not null auto_increment,
nome_usuario varchar(45),
email varchar(45),
senha varchar(30),
fk_jogador_ataque int,
foreign key (fk_jogador_ataque) references jogador_ataque (id_jogadorA),
fk_jogador_defesa int,
foreign key (fk_jogador_defesa) references jogador_defesa (id_jogadorD)
);

insert into jersey (numero) values (9), (3), (10), (99), (40), (5);

insert into jogador_ataque (nome_jogador , fk_numero , posicao, rating)
					values ('Matthew Stafford' , 1 , 'QB' , 83),
							('Kooper Kupp' , 3 , 'WR' , 98),
							('Odell Beckham Jr.' , 2 , 'WR' , 86);
							
            
insert into jogador_defesa (nome_jogador , fk_numero , posicao, rating)
					values ('Aaron Donald' , 4 , 'DL' , 99),
							('Von Miller' , 5 , 'LB' , 93),
							('Jalen Ramsey' , 6 , 'CB' , 99);
                
select * from jersey;
select * from jogador_ataque;
select * from jogador_defesa;
select * from usuario;

		select 
		nome_album, 
        count(*) as votos
        from 
        usuarios join albums 
        on id_album = fk_album 
        group by id_album;

		select 
        nome_usuario, nome_jogador, 
        count(*) as votos
        from 
        usuario join jogador_ataque 
        on id_jogadorA = fk_jogador_ataque 
        group by id_jogadorA;
        
        select 
        nome_usuario, nome_jogador, 
        count(*) as votos
        from 
        usuario join jogador_defesa 
        on id_jogadorD = fk_jogador_defesa 
        group by id_jogadorD;