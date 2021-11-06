CREATE SCHEMA panacademy;

use panacademy;

create table categorias_filmes (
	id int unsigned not null auto_increment,
    nome varchar(50),
    classificacao enum('0','12','16','18') not null,
    unique key(nome),
    primary key(id)
);

insert into categorias_filmes (nome, classificacao) values ('Acao','12');

insert into categorias_filmes (nome, classificacao) values ('Infantil','0');


insert into
	categorias_filmes (nome, classificacao)
values 
    ('Fic. Científica', '12'),
    ('Aventura', '0'),
    ('Comédia', '12'),
    ('Terror', '18');

-- selecionar todos
select * from categorias_filmes;

insert into categorias_filmes (id, nome, classificacao) values (100 ,'Documentario','0');

insert into categorias_filmes ( nome, classificacao) values ('Documentario Infantil','0');

delete from categorias_filmes where id in (100,101);

select sum(id) from categorias_filmes;

select sum(id) from categorias_filmes;

select 
        count(*), 
        classificacao,
        nome
        
from categorias_filmes
group by classificacao, nome
order by nome ;


select count(*), classificacao, group_concat(nome) 
from categorias_filmes 
group by classificacao 
order by nome;

