drop database rap;
create database rap;
use rap;

CREATE TABLE usuario (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) ,
  email VARCHAR(100) UNIQUE,
  data_cadastro DATE DEFAULT CURRENT_DATE,
  status BOOLEAN DEFAULT TRUE
);
  

create table grupo(
    id SERIAL PRIMARY KEY,
    nome varchar (50),
);

create table papel(
    id SERIAL PRIMARY KEY,
    nome varchar (50),
);
create table usuario_grupo(
    usuario_id INT REFERENCES usuario(id),
    grupo_id INT REFERENCES grupo(id)
    primary key (usuario_id, grupo_id)
);
create table grupo_papel(
    grupo_id INT REFERENCES grupo(id),
    papel_id INT REFERENCES papel(id),
    primary key (grupo_id, papel_id)
   
);
create table log_login(
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuario(id),
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip VARCHAR(45),
    sucesso BOOLEAN
);
insert into usuario (nome, email) values 
('João', 'joao@empresa.com'),
('Maria', 'maria@empresa.com'),
('Carlos', 'carlos@empresa.com');

insert into grupo (nome) values 
('administradores'),
('vendedores'),
('suporte');


insert into papel (nome) values 
('administrador'),
('vendedor'),
('suporte');

insert into usuario_grupo (usuario_id, grupo_id) values
(1, 1),
(2, 2),
(3, 3);


insert into log_login (usuario_id, ip, sucesso) values
(1, '192.168.1.1', true),
(2, '192.168.1.3', false),
(3, '192.168.1.2', true);

select * from grupo;
select * from usuario;
select * from papel;query;
select * from usuario_grupo;