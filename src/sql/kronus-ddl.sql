-- Dropa tudo
DROP TABLE IF EXISTS cadastro.agenda;
DROP TABLE IF EXISTS cadastro.avaliacao;
DROP TABLE IF EXISTS cadastro.telefone_cliente;
DROP TABLE IF EXISTS cadastro.endereco_cliente;
DROP TABLE IF EXISTS cadastro.cliente;
DROP TABLE IF EXISTS cadastro.telefone_empresa;
DROP TABLE IF EXISTS cadastro.endereco_empresa;
DROP TABLE IF EXISTS cadastro.servico;
DROP TABLE IF EXISTS cadastro.empresa;
DROP TABLE IF EXISTS cadastro.area_atuacao;
DROP TABLE IF EXISTS cadastro.municipio;
DROP TABLE IF EXISTS cadastro.users;
DROP TABLE IF EXISTS cadastro.roles;
DROP SEQUENCE IF EXISTS cadastro.seq_area_atuacao;
DROP SEQUENCE IF EXISTS cadastro.seq_municipio;
DROP SEQUENCE IF EXISTS cadastro.seq_empresa;
DROP SEQUENCE IF EXISTS cadastro.seq_endereco_empresa;
DROP SEQUENCE IF EXISTS cadastro.seq_endereco_cliente;
DROP SEQUENCE IF EXISTS cadastro.seq_telefone_empresa;
DROP SEQUENCE IF EXISTS cadastro.seq_telefone_cliente;
DROP SEQUENCE IF EXISTS cadastro.seq_servico;
DROP SEQUENCE IF EXISTS cadastro.seq_cliente;
DROP SEQUENCE IF EXISTS cadastro.seq_avaliacao;
DROP SEQUENCE IF EXISTS cadastro.seq_agenda;

DROP SCHEMA IF EXISTS cadastro;

-- Cria objetos
CREATE SCHEMA IF NOT EXISTS cadastro
  AUTHORIZATION kronus;

-- Sequence: cadastro.area_atuacao_id_area_atuacao_seq


CREATE SEQUENCE IF NOT EXISTS cadastro.seq_area_atuacao
  INCREMENT 2
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 2
  CACHE 1;
ALTER TABLE cadastro.seq_area_atuacao
  OWNER TO kronus;

-- Sequence: cadastro.empresa_id_empresa_seq


CREATE SEQUENCE IF NOT EXISTS cadastro.seq_empresa
  INCREMENT 2
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 2
  CACHE 1;
ALTER TABLE cadastro.seq_empresa
  OWNER TO kronus;
  
-- Sequence: cadastro.municipio_id_municipio_seq

CREATE SEQUENCE IF NOT EXISTS cadastro.seq_municipio
  INCREMENT 2
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 2
  CACHE 1;
ALTER TABLE cadastro.seq_municipio
  OWNER TO kronus; 

-- Sequence: cadastro.seq_endereco_empresa

CREATE SEQUENCE IF NOT EXISTS cadastro.seq_endereco_empresa
  INCREMENT 2
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 2
  CACHE 1;
ALTER TABLE cadastro.seq_endereco_empresa
  OWNER TO kronus; 

-- Sequence: cadastro.seq_telefone_empresa

CREATE SEQUENCE IF NOT EXISTS cadastro.seq_telefone_empresa
  INCREMENT 2
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 2
  CACHE 1;
ALTER TABLE cadastro.seq_telefone_empresa
  OWNER TO kronus; 

-- Sequence: cadastro.seq_servico

CREATE SEQUENCE IF NOT EXISTS cadastro.seq_servico
  INCREMENT 2
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 2
  CACHE 1;
ALTER TABLE cadastro.seq_servico
  OWNER TO kronus; 

-- Sequence: cadastro.seq_cliente

CREATE SEQUENCE IF NOT EXISTS cadastro.seq_cliente
  INCREMENT 2
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 2
  CACHE 1;
ALTER TABLE cadastro.seq_cliente
  OWNER TO kronus; 

-- Sequence: cadastro.seq_telefone_cliente

CREATE SEQUENCE IF NOT EXISTS cadastro.seq_telefone_cliente
  INCREMENT 2
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 2
  CACHE 1;
ALTER TABLE cadastro.seq_telefone_cliente
  OWNER TO kronus; 

-- Sequence: cadastro.seq_endereco_cliente

CREATE SEQUENCE IF NOT EXISTS cadastro.seq_endereco_cliente
  INCREMENT 2
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 2
  CACHE 1;
ALTER TABLE cadastro.seq_endereco_cliente
  OWNER TO kronus; 

-- Sequence: cadastro.seq_avaliacao

CREATE SEQUENCE IF NOT EXISTS cadastro.seq_avaliacao
  INCREMENT 2
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 2
  CACHE 1;
ALTER TABLE cadastro.seq_avaliacao
  OWNER TO kronus; 

-- Sequence: cadastro.seq_agenda

CREATE SEQUENCE IF NOT EXISTS cadastro.seq_agenda
  INCREMENT 2
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 2
  CACHE 1;
ALTER TABLE cadastro.seq_agenda
  OWNER TO kronus; 

-- Table: cadastro.area_atuacao

CREATE TABLE cadastro.area_atuacao
(
  id_area_atuacao integer NOT NULL DEFAULT nextval('cadastro.seq_area_atuacao'::regclass),
  descricao character(100),
  CONSTRAINT pk_id_area_atuacao PRIMARY KEY (id_area_atuacao)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cadastro.area_atuacao
  OWNER TO kronus;
COMMENT ON TABLE cadastro.area_atuacao
  IS 'Área de atuação da empresa. Exemplo: Clinica médica, Dentista, Pet Shop, etc.';

-- Table: cadastro.municipio

CREATE TABLE cadastro.municipio
(
  id_municipio integer NOT NULL DEFAULT nextval('cadastro.seq_municipio'::regclass),
  nome character(100),
  uf character(2),
  CONSTRAINT pk_municipio PRIMARY KEY (id_municipio)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cadastro.municipio
  OWNER TO kronus;

  
 -- Table: cadastro.empresa

DROP TABLE IF EXISTS cadastro.empresa;

CREATE TABLE cadastro.empresa
(
  id_empresa integer NOT NULL DEFAULT nextval('cadastro.seq_empresa'::regclass),
  razao_social character(100),
  nome_fantasia character(100),
  id_area_atuacao integer,
  CONSTRAINT pk_empresa PRIMARY KEY (id_empresa),
  CONSTRAINT fk_e_area_atuacao FOREIGN KEY (id_area_atuacao)
      REFERENCES cadastro.area_atuacao (id_area_atuacao) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cadastro.empresa
  OWNER TO kronus;

 -- Table: cadastro.endereco_empresa

DROP TABLE IF EXISTS cadastro.endereco_empresa;

CREATE TABLE cadastro.endereco_empresa
(
  id_endereco_empresa integer NOT NULL DEFAULT nextval('cadastro.seq_endereco_empresa'::regclass),
  logradouro character(200),
  numero integer,
  cep character(8),
  complemento character(8),
  id_empresa integer,
  id_municipio integer,
  CONSTRAINT pk_endereco_empresa PRIMARY KEY (id_endereco_empresa),
  CONSTRAINT fk_ee_empresa FOREIGN KEY (id_empresa)
      REFERENCES cadastro.empresa (id_empresa) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_ee_municipio FOREIGN KEY (id_municipio)
      REFERENCES cadastro.municipio (id_municipio) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cadastro.endereco_empresa
  OWNER TO kronus;

 -- Table: cadastro.telefone_empresa

CREATE TABLE cadastro.telefone_empresa
(
  id_telefone_empresa integer NOT NULL DEFAULT nextval('cadastro.seq_telefone_empresa'::regclass),
  codigo_ddd smallint,
  numero bigint,
  celular boolean,
  id_empresa integer,
  CONSTRAINT pk_telefone_empresa PRIMARY KEY (id_telefone_empresa),
  CONSTRAINT fk_te_empresa FOREIGN KEY (id_empresa)
      REFERENCES cadastro.empresa (id_empresa) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cadastro.telefone_empresa
  OWNER TO kronus;

 -- Table: cadastro.servico

CREATE TABLE cadastro.servico
(
  id_servico integer NOT NULL DEFAULT nextval('cadastro.seq_servico'::regclass),
  descricao character(200),
  horario_inicial time,
  horario_final time,
  id_empresa integer,
  CONSTRAINT pk_servico PRIMARY KEY (id_servico),
  CONSTRAINT fk_s_empresa FOREIGN KEY (id_empresa)
      REFERENCES cadastro.empresa (id_empresa) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cadastro.telefone_empresa
  OWNER TO kronus;

-- Table: cadastro.uses e cadastro.roles

CREATE TABLE cadastro.users (username VARCHAR(32) NOT NULL PRIMARY KEY, password VARCHAR(64) NOT NULL);
CREATE TABLE cadastro.roles (username VARCHAR(32) NOT NULL, rolename VARCHAR(32) NOT NULL,PRIMARY KEY (username, rolename));
 
ALTER TABLE cadastro.users OWNER TO kronus;
ALTER TABLE cadastro.roles OWNER TO kronus;

 -- Table: cadastro.cliente

CREATE TABLE cadastro.cliente
(
  id_cliente integer NOT NULL DEFAULT nextval('cadastro.seq_cliente'::regclass),
  nome character(200),
  cpf character(11),
  data_nascimento date,
  e_mail character(50),
  username varchar(32),
  CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cadastro.cliente
  OWNER TO kronus;

 -- Table: cadastro.telefone_cliente

CREATE TABLE cadastro.telefone_cliente
(
  id_telefone_cliente integer NOT NULL DEFAULT nextval('cadastro.seq_telefone_cliente'::regclass),
  codigo_ddd smallint,
  numero bigint,
  celular boolean,
  id_cliente integer,
  CONSTRAINT pk_telefone_cliente PRIMARY KEY (id_telefone_cliente),
  CONSTRAINT fk_te_cliente FOREIGN KEY (id_cliente)
      REFERENCES cadastro.cliente (id_cliente) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cadastro.telefone_cliente
  OWNER TO kronus;

 -- Table: cadastro.endereco_cliente

DROP TABLE IF EXISTS cadastro.endereco_cliente;

CREATE TABLE cadastro.endereco_cliente
(
  id_endereco_cliente integer NOT NULL DEFAULT nextval('cadastro.seq_endereco_cliente'::regclass),
  logradouro character(200),
  numero integer,
  cep character(8),
  complemento character(8),
  id_cliente integer,
  id_municipio integer,
  CONSTRAINT pk_endereco_cliente PRIMARY KEY (id_endereco_cliente),
  CONSTRAINT fk_ec_cliente FOREIGN KEY (id_cliente)
      REFERENCES cadastro.cliente (id_cliente) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_ec_municipio FOREIGN KEY (id_municipio)
      REFERENCES cadastro.municipio (id_municipio) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cadastro.endereco_cliente
  OWNER TO kronus;

 -- Table: cadastro.avaliacao

DROP TABLE IF EXISTS cadastro.avaliacao;

CREATE TABLE cadastro.avaliacao
(
  id_avaliacao integer NOT NULL DEFAULT nextval('cadastro.seq_avaliacao'::regclass),
  nota integer,
  id_cliente integer,
  id_empresa integer,
  id_servico integer,
  CONSTRAINT pk_avaliacao PRIMARY KEY (id_avaliacao),
  CONSTRAINT fk_av_cliente FOREIGN KEY (id_cliente)
      REFERENCES cadastro.cliente (id_cliente) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_av_empresa FOREIGN KEY (id_empresa)
      REFERENCES cadastro.empresa (id_empresa) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_av_servico FOREIGN KEY (id_servico)
      REFERENCES cadastro.servico (id_servico) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cadastro.avaliacao
  OWNER TO kronus;

 -- Table: cadastro.agenda

DROP TABLE IF EXISTS cadastro.agenda;

CREATE TABLE cadastro.agenda
(
  id_agenda integer NOT NULL DEFAULT nextval('cadastro.seq_agenda'::regclass),
  id_cliente integer,
  id_empresa integer,
  id_servico integer,
  data_hora timestamp,
  CONSTRAINT pk_agenda PRIMARY KEY (id_agenda),
  CONSTRAINT fk_ag_cliente FOREIGN KEY (id_cliente)
      REFERENCES cadastro.cliente (id_cliente) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_ag_empresa FOREIGN KEY (id_empresa)
      REFERENCES cadastro.empresa (id_empresa) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_ag_servico FOREIGN KEY (id_servico)
      REFERENCES cadastro.servico (id_servico) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cadastro.agenda
  OWNER TO kronus;


-- Index: FKs

DROP INDEX IF EXISTS cadastro.fk_e_area_atuacao;

CREATE INDEX fk_e_area_atuacao
  ON cadastro.empresa
  USING btree
  (id_area_atuacao);
  
DROP INDEX IF EXISTS cadastro.fk_ee_empresa;

CREATE INDEX fk_ee_empresa
  ON cadastro.endereco_empresa
  USING btree
  (id_empresa);

DROP INDEX IF EXISTS cadastro.fk_ee_municipio;

CREATE INDEX fk_ee_municipio
  ON cadastro.endereco_empresa
  USING btree
  (id_municipio);

DROP INDEX IF EXISTS cadastro.fk_te_empresa;

CREATE INDEX fk_te_empresa
  ON cadastro.telefone_empresa
  USING btree
  (id_empresa);

DROP INDEX IF EXISTS cadastro.fk_te_cliente;

CREATE INDEX fk_te_cliente
  ON cadastro.telefone_cliente
  USING btree
  (id_cliente);

DROP INDEX IF EXISTS cadastro.fk_s_empresa;

CREATE INDEX fk_s_empresa
  ON cadastro.servico
  USING btree
  (id_empresa);

DROP INDEX IF EXISTS cadastro.fk_ec_cliente;

CREATE INDEX fk_ec_cliente
  ON cadastro.endereco_cliente
  USING btree
  (id_cliente);

DROP INDEX IF EXISTS cadastro.fk_ec_municipio;

CREATE INDEX fk_ec_municipio
  ON cadastro.endereco_cliente
  USING btree
  (id_municipio);

DROP INDEX IF EXISTS cadastro.fk_av_cliente;

CREATE INDEX fk_av_cliente
  ON cadastro.avaliacao
  USING btree
  (id_cliente);

DROP INDEX IF EXISTS cadastro.fk_av_empresa;

CREATE INDEX fk_av_empresa
  ON cadastro.avaliacao
  USING btree
  (id_empresa);

DROP INDEX IF EXISTS cadastro.fk_av_servico;

CREATE INDEX fk_av_servico
  ON cadastro.avaliacao
  USING btree
  (id_servico);

DROP INDEX IF EXISTS cadastro.fk_ag_cliente;

CREATE INDEX fk_ag_cliente
  ON cadastro.agenda
  USING btree
  (id_cliente);

DROP INDEX IF EXISTS cadastro.fk_ag_empresa;

CREATE INDEX fk_ag_empresa
  ON cadastro.agenda
  USING btree
  (id_empresa);

DROP INDEX IF EXISTS cadastro.fk_ag_servico;

CREATE INDEX fk_ag_servico
  ON cadastro.agenda
  USING btree
  (id_servico);

