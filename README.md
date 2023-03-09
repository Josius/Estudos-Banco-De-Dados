# Estudos Banco de Dados
## **Fonte de Estudos: [Bóson Treinamentos](https://www.youtube.com/playlist?list=PLucm8g_ezqNoNHU8tjVeHmRGBFnjDIlxD)**
### **Tecnologias usadas**
- [brModelo v3.31](http://www.sis4.com/brModelo/index.html) - ferramenta para criação da modelagem do BD, tanto conceitual quanto relacional.

## **Banco de dados para gerenciamento de uma faculdade** 
- controle centralizado de alunos, professores, cursos, disciplinas, histórico escolar e turmas

## **Aula 00 - Criação das entidades** 
! [aula 00](00-DER-facu.png)

## **Aula 01 - Criação das entidades** 
! [aula 00](01-DER-facu-com-atributos.png)
## **Entidades** 
### **Professor** 
#### **Atributos:** 
- <u>Cod_Professor</u>
- Nome
- Sobrenome
- Cod_Departamento
- Status
### **Departamento** 
#### **Atributos:** 
- <u>Cod_Departamento</u>
- Nome
### **Curso** 
#### **Atributos:** 
- <u>Cod_Curso</u>
- Nome
- Cod_Departamento
### **Aluno** 
#### **Atributos:** 
- <u>RA</u>
- Nome
- Sobrenome
- Endereço
- Cod_Curso
- *Telefone
- Status
- Filiação
- Sexo
- *Contato
- Cod_Turma
- CPF
### **Disciplina** 
#### **Atributos:** 
- <u>Cod_Disciplina</u>
- Nome
- Descrição
- Cod_Departamento
- Num_Alunos
- Carga_Horária 
### **Turma** 
#### **Atributos:** 
- <u>Cod_Turma</u>
- Período
- Cod_Curso
- Num_Alunos
- Data_Início
- Data_Fim
### **Histórico** 
#### **Atributos:** 
- <u>Cod_Historico</u>
- Notas
- Média
- Frequência
- Período_Realização
- RA
- Cod_Disciplina