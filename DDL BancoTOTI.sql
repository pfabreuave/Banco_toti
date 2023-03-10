--DDL - Criando tabelas

CREATE DATABASE IF NOT EXISTS banco_toti;

CREATE TABLE IF NOT EXISTS cliente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
    ativo BOOLEAN DEFAULT TRUE,
    data_criacao DATETIME NOT NULL DEFAULT (datetime('now','localtime'))
);

CREATE TABLE IF NOT EXISTS conta (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    numero INTEGER NOT NULL UNIQUE,
    saldo REAL NOT NULL DEFAULT 0.00,
    ativo BOOLEAN DEFAULT TRUE,
    data_criacao DATETIME NOT NULL DEFAULT (datetime('now','localtime'))
);

CREATE TABLE IF NOT EXISTS cliente_conta (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER REFERENCES cliente(id),
    id_conta INTEGER REFERENCES conta(id),
    dependente BOOLEAN DEFAULT FALSE,
    ativo BOOLEAN DEFAULT TRUE,
    data_criacao TIMESTAMP NOT NULL DEFAULT (datetime('now','localtime'))
);
CREATE UNIQUE INDEX id_cliente_conta_unicos ON cliente_conta (id_cliente, id_conta);

CREATE TABLE IF NOT EXISTS tipo_transacao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    descricao TEXT NOT NULL UNIQUE,
    ativo BOOLEAN DEFAULT TRUE,
    data_criacao TIMESTAMP NOT NULL DEFAULT (datetime('now','localtime'))
);

CREATE TABLE IF NOT EXISTS transacao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_tipo_transacao INTEGER REFERENCES tipo_transacao(id),
    id_cliente_conta INTEGER REFERENCES cliente_conta(id),
    valor DECIMAL NOT NULL,
    data_realizacao TIMESTAMP NOT NULL DEFAULT (datetime('now','localtime'))
);