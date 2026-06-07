
CREATE TABLE usuario (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  data_cadastro DATE DEFAULT CURRENT_DATE,
  status BOOLEAN DEFAULT TRUE
);

CREATE TABLE grupo (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50)
);

CREATE TABLE papel (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50)
);

CREATE TABLE usuario_grupo (
  usuario_id INT REFERENCES usuario(id),
  grupo_id INT REFERENCES grupo(id),
  PRIMARY KEY (usuario_id, grupo_id)
);

CREATE TABLE grupo_papel (
  grupo_id INT REFERENCES grupo(id),
  papel_id INT REFERENCES papel(id),
  PRIMARY KEY (grupo_id, papel_id)
);

CREATE TABLE log_login (
  id SERIAL PRIMARY KEY,
  usuario_id INT REFERENCES usuario(id),
  data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ip VARCHAR(45),
  sucesso BOOLEAN
);


INSERT INTO usuario (nome, email) VALUES
('Ana', 'ana@empresa.com'),
('Bruno', 'bruno@empresa.com'),
('Carla', 'carla@empresa.com');

INSERT INTO grupo (nome) VALUES
('Administradores'),
('Vendedores'),
('Suporte');

INSERT INTO papel (nome) VALUES
('CADASTRAR_USUARIO'),
('RELATORIO_ACESSO'),
('CONFIGURAR_GRUPOS');


INSERT INTO usuario_grupo VALUES (1, 1), (2, 2), (3, 3);
INSERT INTO grupo_papel VALUES (1, 1), (1, 2), (2, 2), (3, 3);


INSERT INTO log_login (usuario_id, ip, sucesso) VALUES
(1, '192.168.0.10', TRUE),
(2, '192.168.0.11', FALSE),
(3, '192.168.0.12', TRUE);
