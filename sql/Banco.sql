CREATE DATABASE Banco;

USE Banco;

CREATE TABLE Alerta (
    id int NOT NULL,
    id_condicao int NOT NULL,
    id_parametro int NOT NULL,
    nome varchar(100) NOT NULL,
    valor decimal(100, 10) NOT NULL,
    CONSTRAINT Alerta_pk PRIMARY KEY (id)
);

CREATE TABLE Condicao (
    id int NOT NULL,
    valor varchar(4) NOT NULL,
    CONSTRAINT Condicao_pk PRIMARY KEY (id)
);

CREATE TABLE Estacao (
    id int NOT NULL,
    nome varchar(180) NOT NULL,
    endereco varchar(200) NOT NULL,
    latitude decimal(3, 6) NOT NULL,
    longitude decimal(3, 6) NOT NULL,
    mac_address varchar(20) NOT NULL,
    CONSTRAINT Estacao_pk PRIMARY KEY (id)
);

CREATE TABLE Medicao (
    id int NOT NULL,
    data_hora timestamp NOT NULL,
    valor_calculado decimal(100, 10) NOT NULL,
    id_parametro int NOT NULL,
    CONSTRAINT Medicao_pk PRIMARY KEY (id)
);

CREATE TABLE Ocorrencia (
    id int NOT NULL,
    id_alerta int NOT NULL,
    data_hora timestamp NOT NULL,
    valor decimal(100, 10) NOT NULL,
    CONSTRAINT Ocorrencia_pk PRIMARY KEY (id)
);

CREATE TABLE Parametro (
    id int NOT NULL,
    id_estacao int NOT NULL,
    id_tipo int NOT NULL,
    CONSTRAINT Parametro_pk PRIMARY KEY (id)
);

CREATE TABLE Tipo_Parametro (
    id int NOT NULL,
    id_unidade int NOT NULL,
    nome varchar(100) NOT NULL,
    fator decimal(100, 10) NOT NULL,
    "offset" decimal(100, 10) NOT NULL,
    nome_json varchar(180) NOT NULL,
    CONSTRAINT Tipo_Parametro_pk PRIMARY KEY (id)
);

CREATE TABLE Unidade_Medida (
    id int NOT NULL,
    nome varchar(100) NOT NULL,
    CONSTRAINT Unidade_Medida_pk PRIMARY KEY (id)
);

CREATE TABLE Usuario (
    id int NOT NULL,
    nome varchar(100) NOT NULL,
    email varchar(180) NOT NULL,
    senha varchar(180) NOT NULL,
    CONSTRAINT Usuario_pk PRIMARY KEY (id)
);

ALTER TABLE
    Alerta
ADD
    CONSTRAINT Alerta_Condicao FOREIGN KEY (id_condicao) REFERENCES Condicao (id) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE
    Alerta
ADD
    CONSTRAINT Alerta_Parametro FOREIGN KEY (id_parametro) REFERENCES Parametro (id) ON DELETE CASCADE ON UPDATE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE
    Medicao
ADD
    CONSTRAINT Medicao_Parametro FOREIGN KEY (id_parametro) REFERENCES Parametro (id) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE
    Ocorrencia
ADD
    CONSTRAINT Ocorrencia_Alerta FOREIGN KEY (id_alerta) REFERENCES Alerta (id) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE
    Parametro
ADD
    CONSTRAINT Parametro_Estacao FOREIGN KEY (id_estacao) REFERENCES Estacao (id) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE
    Parametro
ADD
    CONSTRAINT Parametro_Tipo_Parametro FOREIGN KEY (id_tipo) REFERENCES Tipo_Parametro (id) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE
    Tipo_Parametro
ADD
    CONSTRAINT Tipo_Parametro_Unidade_Medida FOREIGN KEY (id_unidade) REFERENCES Unidade_Medida (id) NOT DEFERRABLE INITIALLY IMMEDIATE;