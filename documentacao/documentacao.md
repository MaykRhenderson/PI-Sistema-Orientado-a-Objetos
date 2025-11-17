# Documentação Projeto Integrador - SENAC

## Prototipação do Sistema Orientado a Objetos

**Tema:** Gestão de Dados de uma Grande Universidade

## 1. Introdução

Este documento apresenta a prototipação da entrega do Projeto Integrador, baseada nos diagramas e cenários da 1ª entrega.

O objetivo é transformar os casos de uso em interfaces visuais funcionais, produzidas em ferramentas como Figma ou Miro.

## 2. Protótipos Desenvolvidos

Os protótipos foram criados com base fiel nos cenários descritos na Fase 1, contemplando:

- Cadastro de Pessoa Física
- Cadastro de Pessoa Jurídica
- Cadastro de Professores
- Cadastro de Alunos
- Cadastro de Fornecedores

Cada protótipo representa:

- Pré-condições
- Fluxo principal
- Fluxos alternativos
- Pós-condições
- Regras específicas (ex: CPF duplicado, matrícula existente, etc.)

### 2.1. Telas do Sistema

### 2.1.1 Tela Inicial — Menu do Administrador

Contém opções:

- Cadastro de Pessoa Física
- Cadastro de Pessoa Jurídica
- Cadastro de Professores
- Cadastro de Alunos
- Cadastro de Fornecedores

### 2.1.2 Tela de Cadastro de Pessoa Física

**Campos:**

- Nome completo
- CPF
- Data de nascimento
- E-mail
- Telefone

**Botões:**

- Salvar | Cancelar

**Mensagens do fluxo alternativo:**

- "Erro: CPF já cadastrado no sistema."
- "Preencha todos os campos obrigatórios."

### 2.1.3 Tela de Cadastro de Pessoa Jurídica

**Campos:**

- Razão Social
- Nome Fantasia
- CNPJ
- E-mail
- Telefone
- Endereço completo

**Mensagens:**

- CNPJ inválido
- Cadastro cancelado

### 2.1.4 Tela de Busca de Pessoa Física

Utilizada pelos casos:

- Cadastro de Professores
- Cadastro de Alunos

**Campos:**

- Busca por Nome ou CPF

**Mensagens:**

- "Pessoa física não encontrada."

### 2.1.5 Tela de Cadastro de Professores

Após selecionar uma Pessoa Física previamente cadastrada:

**Campos:**

- Departamento
- Disciplinas ministradas
- Matrícula

**Mensagens:**

- "Departamento inválido."

### 2.1.6 Tela de Cadastro de Alunos

Após selecionar uma Pessoa Física:

**Campos:**

- Matrícula
- Curso
- Periodo

**Mensagens:**

- "Matrícula já existente."
- "Curso inválido."

### 2.1.7 Tela de Busca de Pessoa Jurídica

Usada no cadastro de fornecedores.

**Campos:**

- Busca por nome fantasia ou CNPJ

**Mensagens:**

- "Pessoa Jurídica vinculada a outro fornecedor."

### 2.1.8 Tela de Cadastro de Fornecedores

Após selecionar a Pessoa Jurídica:

**Campos:**

- Produtos/Serviços fornecidos
- Nome do representante
- E-mail
- Telefone

**Mensagens:**

- "E-mail inválido."

## 3. Diagramas (Fase 1 Convertidos para Markdown)

### 3.1 Diagrama de Casos de Uso (Representação Textual)

**Ator:** Administrador

- ( Cadastro de Pessoa Física )
- ( Cadastro de Pessoa Jurídica )
- ( Cadastro de Professores )
- ( Cadastro de Alunos )
- ( Cadastro de Fornecedores )

**Administrador --> todos os casos de uso**

### 3.2 Diagrama de Classes (Com Base no Documento da Fase 1)

Classe Pessoa
- nome
- email
- telefone

Classe PessoaFisica extends Pessoa
- cpf
- dataNascimento

Classe PessoaJuridica extends Pessoa
- cmj
- razaoSocial
- nomeFantasia

Classe Professor extends PessoaFisica
- departamento
- disciplinas

Classe Aluno extends PessoaFisica
- matricula
- curso
- periodo

Classe Fornecedor extends PessoaJuridica
- produtosServices
- representante


## 4. Relação Entre os Protótipos e os Casos de Uso

Todos os protótipos foram construídos com base nas informações da 1ª entrega, respeitando:

- Pré-condições
- Fluxo principal
- Fluxos alternativos (ex: dados duplicados, inválidos, inexistentes)
- Pós-condições

## 5. Conclusão

A prototipação representa visualmente os processos definidos na fase anterior, permitindo o início da implementação na próxima etapa do projeto.