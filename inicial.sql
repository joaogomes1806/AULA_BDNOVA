CREATE DATABASE IF NOT EXISTS controle_acesso;
USE controle_acesso;


CREATE TABLE usuario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
  status BOOLEAN DEFAULT TRUE
);

CREATE TABLE grupo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50)
);

CREATE TABLE papel (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50)
);


CREATE TABLE usuario_grupo (
  usuario_id INT,
  grupo_id INT,
  PRIMARY KEY (usuario_id, grupo_id),
  FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE,
  FOREIGN KEY (grupo_id) REFERENCES grupo(id) ON DELETE CASCADE
);

CREATE TABLE grupo_papel (
  grupo_id INT,
  papel_id INT,
  PRIMARY KEY (grupo_id, papel_id),
  FOREIGN KEY (grupo_id) REFERENCES grupo(id) ON DELETE CASCADE,
  FOREIGN KEY (papel_id) REFERENCES papel(id) ON DELETE CASCADE
);

CREATE TABLE log_login (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT,
  data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ip VARCHAR(45),
  sucesso BOOLEAN,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
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