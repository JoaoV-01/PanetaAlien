CREATE DATABASE planetaalien;
USE planetaalien;
CREATE TABLE usuario(
	id int primary key auto_increment,
    nome varchar(70) NULL,
    apelido varchar(70) NOT NULL,
    email varchar(80) NOT NULL,
    senha nchar(8) NOT NULL
    );
    
    show tables;
    describe usuario;
    
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Tatiene','Taty','tatiene@gmail.com','12345678');
            
	SELECT * FROM usuario;
    SELECT apelido FROM usuario;
    SELECT apelido,senha FROM usuario;
    SELECT id,apelido FROM usuario;
    
    UPDATE usuario SET apelido = 'Taty_Games' WHERE id = 1;
    
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Romulo-Cesar','Jogador-Da-Cei','jogao@gmail.com','34567898');
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Joao','Jota','joao@gmail.com','33746542');
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Flavio','Flavinhobsb','flavio@gmail.com','33341829');
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Thiago','Thiago-du-crime','thiago@gmail.com','23242629');
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Artur','bigode-de-leite','artur@gmail.com','10111214');
            
DELETE FROM usuario WHERE id=2; 
UPDATE usuario SET apelido = 'Jota_Croma' WHERE id=3;
DELETE FROM usuario WHERE id=7;

	SELECT * FROM usuario;
    SELECT apelido FROM usuario;
    SELECT apelido,senha FROM usuario;
    SELECT id,apelido FROM usuario;
    
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Alan','alanzoka','alano@gmail.com','34567898');
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Jorge','martelinho-de-ouro','jorgeo@gmail.com','33746542');
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Flaviana','Flavinha','flavia@gmail.com','33341829');
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Tiago','besouro','tiago@gmail.com','23242629');
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Arlinda','linda','ar.linda@gmail.com','10111214');
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Erika','rika','erika@gmail.com','34567898');
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Erika','rika','erika@gmail.com','34567898');
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Erika','rika','erika@gmail.com','34567898');
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Erika','rika','erika@gmail.com','34567898');
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Erika','rika','erika@gmail.com','34567898');
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Erika','rika','erika@gmail.com','34567898');
INSERT INTO usuario(nome,apelido,email,senha)
			VALUES('Erika','rika','erika@gmail.com','34567898');
            
DELETE FROM usuario WHERE id>=14 and id<=17
SHOW TABLES;
DESCRIBE usuario;

use romullus

go

with MediaMetroEstado as 

	(select
u.Nome_UF,
avg(i.Valor_imovel/i.Area_util) as MediaPorEstado
	from Imovel i
	join Endereco e
	on i.fk_Endereco_ID = e.ID
	join Bairro b
	on e.fk_Bairro_ID = b.ID
	join Cidade c
	on b.fk_Cidade_ID = c.ID
	join UF u
	on c.fk_UF_ID = u.ID
group by u.Nome_UF)

select
format(MAX (mme.MediaPorEstado), 'C', 'pt-br') as MaximaEstado,
format(MIN (mme.MediaPorEstado), 'C','pt-br') as MinimaEstado
from MediaMetroEstado mme 

go

---------------------------------------------------------------

create view vw_MediaMetroCidade as
with MediaPorCidade as 
	(select
c.Nome_Cidade,
avg(i.Valor_imovel/i.Area_util) as MediaPorCidade
	from Imovel i
	join Endereco e 
	on i.fk_Endereco_ID = e.ID
	join Bairro b
	on e.fk_Bairro_ID = b.ID
	join Cidade c
	on b.fk_Cidade_ID = c.ID
group by 
c.Nome_Cidade)

select
    Nome_Cidade,
    format(MediaPorCidade, 'C', 'pt-br') as MediaPorCidade
from 
    MediaPorCidade;

go


create view vw_Top5MediaPorCidade as
with ValorMedio as 
	(select
c.Nome_Cidade,
avg(i.Valor_imovel/i.Area_util) as MediaPorCidade
	from Imovel i
	join Endereco e 
	on i.fk_Endereco_ID = e.ID
	join Bairro b
	on e.fk_Bairro_ID = b.ID
	join Cidade c
	on b.fk_Cidade_ID = c.ID
group by 
c.Nome_Cidade)
select top 5

    Nome_cidade,
    format(MediaPorCidade, 'C', 'pt-br') as MediaPorCidade

from ValorMedio

go

select * from vw_Top5MediaPorCidade


