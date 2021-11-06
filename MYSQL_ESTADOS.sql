/*
Criar uma tabela de Estados com 
id, nome, sigla(utilizar ENUM) , região utilizar ENUM (), população.

- Id deve ser a PK
- nome campo único

- Inserir 10 estados (dois de cada região)
- Listar estados ordenando por sigla
- Encontrar a população total de cada região
- Encontrar a média da população por região 
- Agrupar estados por região

*/

---------------------------
-- Escolhe banco de dados
---------------------------
use panacademy;

-- Cria tabela Estado, conforme definição
create table Estados
(
	id int unsigned not null auto_increment,
    nome varchar(50),
    sigla enum('AC','AL','AP','AM','BA','CE',
    'ES','GO','MA','MT','MS','MG','PA',
	'PB','PR','PE','PI','RJ','RN','RS','RO',
	'RR','SC','SP','SE','TO','DF'      ) not null,
	regiao enum('Norte', 'Nordeste', 'Centro-Oeste', 'Sudeste', 'Sul') NOT NULL,
    populacao int,
    primary key(id),
    unique key(nome) 
);

-----------------------------------
-- Faz as inclusões dos registros
-----------------------------------
insert into
	estados (nome, sigla, regiao, populacao)
values 
	('Acre', 'AC', 'Norte', 790000),
    ('Alagoas', 'AL', 'Nordeste', 3300000),
	('Amapá', 'AP', 'Norte', 751000),
	('Amazonas', 'AM', 'Norte', 3800000),
	('Bahia', 'BA', 'Nordeste', 15000000),
	('Ceará', 'CE', 'Nordeste', 8800000),
	('Distrito Federal', 'DF', 'Centro-Oeste', 3000000),	
    ('Espírito Santo', 'ES', 'Sudeste', 3800000),
	('Goiás', 'GO', 'Centro-Oeste', 6500000),
    ('Maranhão', 'MA', 'Nordeste', 6800000),
    ('Mato Grosso', 'MT', 'Centro-Oeste', 3200000),
    ('Mato Grosso do Sul', 'MS', 'Centro-Oeste', 2600000),
    ('Minas Gerais', 'MG', 'Sudeste', 20900000),
    ('Pará', 'PA', 'Norte', 8000000),
    ('Paraíba', 'PB', 'Nordeste', 4000000),
    ('Paraná', 'PR', 'Sul', 11000000),
    ('Pernambuco', 'PE', 'Nordeste', 9300000),
    ('Piauí', 'PI', 'Nordeste', 3200000),
    ('Rio de Janeiro', 'RJ', 'Sudeste', 16700000),
    ('Rio Grande do Norte', 'RN', 'Nordeste', 3400000),
    ('Rio Grande Sul', 'RS', 'Sul', 11300000);

---------------------------------------------
-- Consulta todos as informações (registros)
----------------------------------------------
SELECT * FROM estados;

---------------------------------------------
-- Consulta ordenada por sigla dos estados
----------------------------------------------
select * 
from estados
order by sigla;

---------------------------------------------
-- Consulta população total de cada região
----------------------------------------------
select regiao, sum(populacao) as 'Total da População por região'
from estados
group by regiao
order by populacao desc;

---------------------------------------------
-- Consulta população média de cada região
----------------------------------------------
select regiao, avg(populacao) as 'Média da População por região'
from estados
group by regiao
order by populacao desc;

---------------------------------------------
-- Consulta agrupada por estados e região
----------------------------------------------
select regiao, group_concat(' ' ,nome) 
from estados 
group by regiao; 

/*
CREATE TABLE panacademy.estados (
	id INT UNSIGNED auto_increment NOT NULL,
	nome varchar(30) NOT NULL,
	uf enum('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO') NOT NULL,
	regiao enum('Norte', 'Nordeste', 'Centro-Oeste', 'Sudeste e Sul') NOT NULL,
	CONSTRAINT estados_pk PRIMARY KEY (id),
	CONSTRAINT estados_un UNIQUE KEY (nome)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;
CREATE INDEX estados_id_IDX USING BTREE 

*/