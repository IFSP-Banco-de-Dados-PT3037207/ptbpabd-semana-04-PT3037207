-- ex4 (Parte A: Tabela de Apoio)
CREATE TABLE endereco (
    ID INT PRIMARY KEY,
    rua VARCHAR(100) NOT NULL
);

-- ex1
CREATE TABLE pessoa (
    ID INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,

-- ex3
    idade INT NOT NULL,

-- ex4 (part2)
    id_endereco INT,

-- ex1 (part2)
    CONSTRAINT CHK_idade_positiva CHECK (idade >= 0), -- Faz parte do ex1

-- ex2
    CONSTRAINT UC_pessoa_identidade UNIQUE (ID, nome, sobrenome),

-- ex4 (part3)
    FOREIGN KEY (id_endereco) REFERENCES endereco(ID)
);