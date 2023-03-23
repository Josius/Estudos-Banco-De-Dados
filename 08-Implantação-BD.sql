-- Cria BD
create database db_faculdade;

use db_faculdade;

-- Cria tabelas
create table Departamento(
    cod_departamento smallserial primary key,
    nome varchar(20) not null,
);

create table Professor(
    cod_professor smallserial primary key,
    nome varchar(20) not null,
    sobrenome varchar(50) not null,
    status_prof boolean not null,
    cod_departamento smallserial,
    constraint fk_cod_departamento foreign key (cod_departamento) references Departamento (cod_departamento)
);

create table Curso(
    cod_curso smallserial primary key,
    nome varchar(40) not null,
    cod_departamento smallserial,
    constraint fk_cod_departamento foreign key (cod_departamento) references Departamento (cod_departamento)
);

create table Turma(
    cod_turma smallserial primary key,
    periodo varchar(5) not null,
    num_alunos smallint not null,
    data_inicio date not null,
    data_fim date not null,
    cod_curso smallserial,
    constraint fk_cod_curso foreign key (cod_curso) references Curso (cod_curso)
);

create table Disciplina(
    cod_disciplina smallserial primary key,
    nome varchar(30) not null,
    descricao varchar(200),
    num_alunos smallint not null,
    carga_horaria smallint not null,
    cod_departamento smallserial,
    cod_disciplina_depende smallserial,
    constraint fk_cod_departamento foreign key (cod_departamento) references Departamento (cod_departamento)
    constraint fk_cod_disciplina_depende foreign key (cod_disciplina_depende) references Disciplina (cod_disciplina)
);

create table Prof_Disciplina(
    cod_professor smallserial not null,
    cod_disciplina smallserial not null,
    primary key (cod_professor, cod_disciplina)
    constraint fk_cod_professor foreign key (cod_professor) references Professor (cod_professor)
    constraint fk_cod_disciplina foreign key (cod_disciplina) references Disciplina (cod_disciplina)
);

create table Curso_Disciplina(
    cod_curso smallserial not null,
    cod_disciplina smallserial not null,
    primary key (cod_curso, cod_disciplina)
    constraint fk_cod_curso_disci foreign key (cod_curso) references Curso (cod_curso)
    constraint fk_cod_disciplina_disci foreign key (cod_disciplina) references Disciplina (cod_disciplina)
);

-- CONTINUAR NA TABELA ALUNO - FAZER ALTERAÇÃO NA MODELAGEM LÓGICA E IMGS
create table Aluno(
    RA 
);




