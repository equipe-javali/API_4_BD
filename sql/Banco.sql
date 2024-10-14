CREATE TABLE Alerta (
    id serial NOT NULL,
    id_estacao int NOT NULL,
    id_parametro int NOT NULL,
    condicao varchar(4) NOT NULL,
    nome varchar(100) NOT NULL,
    valor numeric(20, 5) NOT NULL,
    CONSTRAINT Alerta_pk PRIMARY KEY (id)
);

CREATE TABLE Estacao (
    id serial NOT NULL,
    nome varchar(180) NOT NULL,
    endereco varchar(200) NOT NULL,
    latitude numeric(9, 6) NOT NULL,
    longitude numeric(9, 6) NOT NULL,
    mac_address varchar(20) NOT NULL,
    CONSTRAINT Estacao_pk PRIMARY KEY (id)
);

CREATE TABLE Medicao (
    id serial NOT NULL,
    id_sensor int NULL,
    data_hora timestamp NOT NULL,
    valor_calculado numeric(20, 5) NOT NULL,
    CONSTRAINT Medicao_pk PRIMARY KEY (id)
);

CREATE TABLE Ocorrencia (
    id serial NOT NULL,
    id_alerta int NULL,
    data_hora timestamp NOT NULL,
    valor numeric(20, 5) NOT NULL,
    CONSTRAINT Ocorrencia_pk PRIMARY KEY (id)
);

CREATE TABLE Parametro (
    id serial NOT NULL,
    id_unidade int NULL,
    nome varchar(100) NOT NULL,
    fator numeric(20, 5) NOT NULL,
    "offset" numeric(20, 5) NOT NULL,
    nome_json varchar(180) NOT NULL,
    CONSTRAINT Tipo_Parametro_pk PRIMARY KEY (id)
);

CREATE TABLE Sensor (
    id serial NOT NULL,
    id_parametro int NOT NULL,
    nome varchar(100) NOT NULL,
    CONSTRAINT Sensor_pk PRIMARY KEY (id)
);

CREATE TABLE SensorEstacao (
    id serial NOT NULL,
    id_estacao int NOT NULL,
    id_sensor int NOT NULL,
    CONSTRAINT SensorEstacao_pk PRIMARY KEY (id)
);

CREATE TABLE Unidade_Medida (
    id serial NOT NULL,
    nome varchar(100) NOT NULL,
    CONSTRAINT Unidade_Medida_pk PRIMARY KEY (id)
);

CREATE TABLE Usuario (
    id serial NOT NULL,
    nome varchar(100) NOT NULL,
    email varchar(180) NOT NULL,
    senha varchar(180) NOT NULL,
    CONSTRAINT Usuario_pk PRIMARY KEY (id)
);

ALTER TABLE
    Alerta
ADD
    CONSTRAINT Alerta_Estacao FOREIGN KEY (id_estacao) REFERENCES Estacao (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE
    Alerta
ADD
    CONSTRAINT Alerta_Parametro FOREIGN KEY (id_parametro) REFERENCES Parametro (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE
    Medicao
ADD
    CONSTRAINT Medicao_Sensor FOREIGN KEY (id_sensor) REFERENCES Sensor (id) ON DELETE
SET
    NULL NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE
    Ocorrencia
ADD
    CONSTRAINT Ocorrencia_Alerta FOREIGN KEY (id_alerta) REFERENCES Alerta (id) ON DELETE
SET
    NULL NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE
    SensorEstacao
ADD
    CONSTRAINT SensorEstacao_Estacao FOREIGN KEY (id_estacao) REFERENCES Estacao (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE
    SensorEstacao
ADD
    CONSTRAINT SensorEstacao_Sensor FOREIGN KEY (id_sensor) REFERENCES Sensor (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE
    Sensor
ADD
    CONSTRAINT Sensor_Parametro FOREIGN KEY (id_parametro) REFERENCES Parametro (id) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE
    Parametro
ADD
    CONSTRAINT Tipo_Parametro_Unidade_Medida FOREIGN KEY (id_unidade) REFERENCES Unidade_Medida (id) ON DELETE
SET
    NULL NOT DEFERRABLE INITIALLY IMMEDIATE;