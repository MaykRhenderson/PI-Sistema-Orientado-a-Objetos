-- Criar o banco de dados
CREATE DATABASE gestao_universidade;
USE gestao_universidade;

-- Tabela base Pessoa
CREATE TABLE Pessoa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    telefone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabela PessoaFisica (herda de Pessoa)
CREATE TABLE PessoaFisica (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pessoa_id INT NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    FOREIGN KEY (pessoa_id) REFERENCES Pessoa(id) ON DELETE CASCADE,
    INDEX idx_cpf (cpf)
);

-- Tabela PessoaJuridica (herda de Pessoa)
CREATE TABLE PessoaJuridica (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pessoa_id INT NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255),
    endereco TEXT,
    FOREIGN KEY (pessoa_id) REFERENCES Pessoa(id) ON DELETE CASCADE,
    INDEX idx_cnpj (cnpj)
);

-- Tabela de Departamentos (para validação)
CREATE TABLE Departamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE,
    codigo VARCHAR(10) NOT NULL UNIQUE
);

-- Tabela de Cursos (para validação)
CREATE TABLE Curso (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE,
    codigo VARCHAR(10) NOT NULL UNIQUE
);

-- Tabela Professor (herda de PessoaFisica)
CREATE TABLE Professor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pessoa_fisica_id INT NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    departamento_id INT NOT NULL,
    FOREIGN KEY (pessoa_fisica_id) REFERENCES PessoaFisica(id) ON DELETE CASCADE,
    FOREIGN KEY (departamento_id) REFERENCES Departamento(id),
    INDEX idx_matricula_prof (matricula)
);

-- Tabela para disciplinas ministradas pelos professores
CREATE TABLE ProfessorDisciplina (
    id INT PRIMARY KEY AUTO_INCREMENT,
    professor_id INT NOT NULL,
    disciplina_nome VARCHAR(255) NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES Professor(id) ON DELETE CASCADE
);

-- Tabela Aluno (herda de PessoaFisica)
CREATE TABLE Aluno (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pessoa_fisica_id INT NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    curso_id INT NOT NULL,
    periodo INT NOT NULL,
    FOREIGN KEY (pessoa_fisica_id) REFERENCES PessoaFisica(id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES Curso(id),
    INDEX idx_matricula_aluno (matricula)
);

-- Tabela Fornecedor (herda de PessoaJuridica)
CREATE TABLE Fornecedor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pessoa_juridica_id INT NOT NULL UNIQUE,
    produtos_servicos TEXT NOT NULL,
    representante_nome VARCHAR(255) NOT NULL,
    representante_email VARCHAR(255),
    representante_telefone VARCHAR(20),
    FOREIGN KEY (pessoa_juridica_id) REFERENCES PessoaJuridica(id) ON DELETE CASCADE
);

// 🗃️ DML (Data Manipulation Language)
// Inserção de dados de referência (Departamentos e Cursos)

-- Inserir departamentos
INSERT INTO Departamento (nome, codigo) VALUES
('Ciência da Computação', 'CC'),
('Engenharia de Software', 'ES'),
('Matemática', 'MAT'),
('Física', 'FIS'),
('Administração', 'ADM');

-- Inserir cursos
INSERT INTO Curso (nome, codigo) VALUES
('Análise e Desenvolvimento de Sistemas', 'ADS'),
('Engenharia de Software', 'ES'),
('Ciência da Computação', 'CC'),
('Administração', 'ADM'),
('Matemática', 'MAT');

// Exemplos de INSERT para cada entidade

-- 1. Cadastro de Pessoa Física
INSERT INTO Pessoa (nome, email, telefone) VALUES 
('João Silva', 'joao.silva@email.com', '(11) 99999-9999');

INSERT INTO PessoaFisica (pessoa_id, cpf, data_nascimento) VALUES 
(LAST_INSERT_ID(), '123.456.789-00', '1990-05-15');

-- 2. Cadastro de Pessoa Jurídica
INSERT INTO Pessoa (nome, email, telefone) VALUES 
('Tech Solutions LTDA', 'contato@techsolutions.com', '(11) 3333-3333');

INSERT INTO PessoaJuridica (pessoa_id, cnpj, razao_social, nome_fantasia, endereco) VALUES 
(LAST_INSERT_ID(), '12.345.678/0001-90', 'Tech Solutions LTDA', 'Tech Solutions', 'Rua das Flores, 123 - São Paulo/SP');

-- 3. Cadastro de Professor
INSERT INTO Pessoa (nome, email, telefone) VALUES 
('Maria Oliveira', 'maria.oliveira@universidade.edu', '(11) 88888-8888');

INSERT INTO PessoaFisica (pessoa_id, cpf, data_nascimento) VALUES 
(LAST_INSERT_ID(), '987.654.321-00', '1985-08-20');

INSERT INTO Professor (pessoa_fisica_id, matricula, departamento_id) VALUES 
(LAST_INSERT_ID(), 'PROF2025001', 1);

INSERT INTO ProfessorDisciplina (professor_id, disciplina_nome) VALUES 
(LAST_INSERT_ID(), 'Programação Orientada a Objetos'),
(LAST_INSERT_ID(), 'Banco de Dados');

-- 4. Cadastro de Aluno
INSERT INTO Pessoa (nome, email, telefone) VALUES 
('Pedro Santos', 'pedro.santos@universidade.edu', '(11) 77777-7777');

INSERT INTO PessoaFisica (pessoa_id, cpf, data_nascimento) VALUES 
(LAST_INSERT_ID(), '111.222.333-44', '2000-03-10');

INSERT INTO Aluno (pessoa_fisica_id, matricula, curso_id, periodo) VALUES 
(LAST_INSERT_ID(), 'AL2025001', 1, 3);

-- 5. Cadastro de Fornecedor
INSERT INTO Pessoa (nome, email, telefone) VALUES 
('Office Supply Comércio', 'vendas@officesupply.com', '(11) 4444-4444');

INSERT INTO PessoaJuridica (pessoa_id, cnpj, razao_social, nome_fantasia, endereco) VALUES 
(LAST_INSERT_ID(), '98.765.432/0001-10', 'Office Supply Comércio LTDA', 'Office Supply', 'Av. Principal, 456 - São Paulo/SP');

INSERT INTO Fornecedor (pessoa_juridica_id, produtos_servicos, representante_nome, representante_email, representante_telefone) VALUES 
(LAST_INSERT_ID(), 'Material de escritório, papéis, suprimentos', 'Carlos Mendes', 'carlos.mendes@officesupply.com', '(11) 94444-4444');

// Consultas SELECT de exemplo

-- Consulta de todos os professores com suas disciplinas
SELECT 
    p.nome as nome_professor,
    pf.cpf,
    pr.matricula,
    d.nome as departamento,
    pd.disciplina_nome
FROM Professor pr
INNER JOIN PessoaFisica pf ON pr.pessoa_fisica_id = pf.id
INNER JOIN Pessoa p ON pf.pessoa_id = p.id
INNER JOIN Departamento d ON pr.departamento_id = d.id
LEFT JOIN ProfessorDisciplina pd ON pr.id = pd.professor_id;

-- Consulta de alunos com informações do curso
SELECT 
    p.nome as nome_aluno,
    pf.cpf,
    a.matricula,
    c.nome as curso,
    a.periodo
FROM Aluno a
INNER JOIN PessoaFisica pf ON a.pessoa_fisica_id = pf.id
INNER JOIN Pessoa p ON pf.pessoa_id = p.id
INNER JOIN Curso c ON a.curso_id = c.id;

-- Consulta de fornecedores
SELECT 
    pj.razao_social,
    pj.nome_fantasia,
    pj.cnpj,
    f.produtos_servicos,
    f.representante_nome,
    f.representante_email
FROM Fornecedor f
INNER JOIN PessoaJuridica pj ON f.pessoa_juridica_id = pj.id
INNER JOIN Pessoa p ON pj.pessoa_id = p.id;

// Exemplos de UPDATE e DELETE

-- UPDATE: Atualizar telefone de uma pessoa
UPDATE Pessoa 
SET telefone = '(11) 98888-8888' 
WHERE email = 'joao.silva@email.com';

-- UPDATE: Alterar período do aluno
UPDATE Aluno 
SET periodo = 4 
WHERE matricula = 'AL2025001';

-- DELETE: Remover um fornecedor (cascata remove PessoaJuridica e Pessoa)
DELETE FROM Pessoa 
WHERE email = 'vendas@officesupply.com';