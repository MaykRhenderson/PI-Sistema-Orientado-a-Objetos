# Projeto Integrador: Sistema de Gestão de Dados para uma Universidade

## 📋 Descrição do Projeto
Este projeto consiste na modelagem de um sistema orientado a objetos para a gestão de dados de uma grande universidade. Desenvolvido como parte do Projeto Integrador do curso de **Análise e Desenvolvimento de Sistemas (ADS)** do **SENAC EAD**, no 3º semestre de 2025.

## 👥 Equipe
- [**Igor Araujo**](https://github.com/SouIgor)
- **Ana Carolina Gomes Mota Freitas**
- **Gustavo Da Silva Gomes**
- **Mayk Rhenderson**
- [**Thalisson Souza**](https://github.com/thalissonsouzas)

**Professor:** Julio Cesar Severino

## 🎯 Objetivo
Desenvolver um sistema completo para cadastro e gestão de diferentes tipos de entidades em uma universidade, incluindo:
- Pessoas Físicas
- Pessoas Jurídicas
- Professores
- Alunos
- Fornecedores

## 📊 Funcionalidades Principais

### 1. Cadastro de Pessoa Física
- **Pré-condição:** Administrador logado com permissões
- **Campos:** Nome completo, CPF, data de nascimento, e-mail, telefone
- **Validações:** Formato e unicidade do CPF

### 2. Cadastro de Pessoa Jurídica
- **Pré-condição:** Administrador logado com permissões
- **Campos:** Razão social, nome fantasia, CNPJ, informações de contato
- **Validações:** Formato do CNPJ

### 3. Cadastro de Professores
- **Pré-condição:** Pessoa Física já cadastrada
- **Campos específicos:** Departamento, disciplinas
- **Vinculação:** Pessoa Física → Perfil Professor

### 4. Cadastro de Alunos
- **Pré-condição:** Pessoa Física já cadastrada
- **Campos específicos:** Matrícula, curso, período
- **Validações:** Unicidade da matrícula, existência do curso

### 5. Cadastro de Fornecedores
- **Pré-condição:** Pessoa Jurídica já cadastrada
- **Validações:** E-mail válido, Pessoa Jurídica não vinculada a outro fornecedor

## 🏗️ Modelagem do Sistema

### Diagrama de Casos de Uso
- **Ator Principal:** Administrador
- **Casos de Uso:** Todos os cadastros listados acima

### Diagrama de Classes
Principais classes modeladas:
- **Pessoa** (classe base)
- **Física** e **Jurídica** (especializações)
- **Autores**, **Professores**, **Financiadores** (entidades específicas)
- Diversas classes de domínio acadêmico

## 🔧 Tecnologias e Ferramentas
- **Modelagem UML:** Diagramas de Caso de Uso e Classes
- **Paradigma:** Orientação a Objetos
- **Ferramentas de Modelagem:** Baseadas nas referências do projeto

## 🎨 Protótipo no Figma

O protótipo visual do sistema foi desenvolvido no Figma para representar a interface e fluxo das principais funcionalidades do projeto.

🔗 [Acesse o protótipo no Figma](https://www.figma.com/design/ajJ7ENKQCiGk9fWcWBiBsB/PI---Senac?node-id=18-7579&t=ZuqoQxUh6UGkCxrx-0)

📁 O arquivo também está disponível no diretório `prototipo-figma` na raiz do projeto.

## 📚 Referências
- [Alura: Conceitos de POO](https://www.alura.com.br/artigos/poo-programacao-orientada-a-objetos)
- [Lucidchart: Diagramas de Caso de Uso UML](https://www.lucidchart.com/pages/pt/diagrama-de-caso-de-uso-uml)
- [Devmedia: Introdução à UML](https://www.devmedia.com.br/o-que-e-uml-e-diagramas-de-caso-de-uso-introducao-pratica-a-uml/23408)
- [Medium: Diagramas de Classe UML](https://medium.com/@highlanderfullstack/introdu%C3%A7%C3%A3o-aos-diagramas-de-classe-uml-6c5668ed5f49)

---

*Projeto desenvolvido para fins acadêmicos como parte da formação em Análise e Desenvolvimento de Sistemas.*
