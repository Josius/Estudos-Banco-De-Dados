-- Cria BD
create database db_faculdade;

use db_faculdade;

-- Cria tabelas
create table Departamento(
    cod_departamento smallserial primary key,
    nome varchar(20) not null
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
    data_fim date,
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
    constraint fk_cod_departamento foreign key (cod_departamento) references Departamento (cod_departamento),
    constraint fk_cod_disciplina_depende foreign key (cod_disciplina_depende) references Disciplina (cod_disciplina)
);

create table Prof_Disciplina(
    cod_professor smallserial not null,
    cod_disciplina smallserial not null,
    primary key (cod_professor, cod_disciplina),
    constraint fk_cod_professor foreign key (cod_professor) references Professor (cod_professor),
    constraint fk_cod_disciplina foreign key (cod_disciplina) references Disciplina (cod_disciplina)
);

create table Curso_Disciplina(
    cod_curso smallserial not null,
    cod_disciplina smallserial not null,
    primary key (cod_curso, cod_disciplina),
    constraint fk_cod_curso_disci foreign key (cod_curso) references Curso (cod_curso),
    constraint fk_cod_disciplina_disci foreign key (cod_disciplina) references Disciplina (cod_disciplina)
);

create table Aluno(
    RA serial primary key,
    nome varchar(20) not null,
    sobrenome varchar(50) not null,
    CPF varchar(11) not null unique,
    status_aluno boolean not null,
    email varchar(60) not null,
    whatsapp varchar(11),
    sexo varchar(1) not null,
    cod_curso smallserial,
    cod_turma smallserial,
    constraint fk_cod_curso_aluno foreign key (cod_curso) references Curso (cod_curso),
    constraint fk_turma_aluno foreign key (cod_turma) references Turma (cod_turma)
);

create table Aluno_Disci(
    RA serial not null,
    cod_disciplina smallserial not null,
    primary key(RA, cod_disciplina),
    constraint fk_RA_aluno foreign key (RA) references Aluno(RA),
    constraint fk_cod_disciplina_aluno foreign key (cod_disciplina) references Disciplina(cod_disciplina)
);

create table Historico(
    cod_historico smallserial primary key,
    RA serial not null,
    data_inicio date not null,
    data_fim date,
    constraint fk_cod_RA foreign key (RA) references Aluno(RA)
);

create table Disc_Hist(
    cod_historico smallserial not null,
    cod_disciplina smallserial not null,
    nota decimal not null,
    frequencia smallint not null,
    primary key(cod_historico, cod_disciplina),
    constraint fk_cod_historico foreign key (cod_historico) references Historico (cod_historico),
    constraint fk_cod_disciplina_histo foreign key (cod_disciplina) references Disciplina (cod_disciplina)
);

create table Tipo_Telefones(
    cod_tipo_telefone smallserial primary key,
    tipo_telefone varchar(12) not null
);

create table Telefones_Aluno(
    cod_telefone_aluno smallserial primary key,
    num_telefone varchar(11) not null,
    RA serial not null,
    cod_tipo_telefone smallserial not null,
    constraint fk_cod_RA_tel foreign key (RA) references Aluno (RA),
    constraint fk_cod_tipo_telefone foreign key (cod_tipo_telefone) references Tipo_Telefones(cod_tipo_telefone)
);

create table Tipo_Logradouro(
    cod_tipo_logradouro smallserial primary key,
    tipo_logradouro varchar(10) not null
);

create table Endereco(
    cod_endereco smallserial primary key,
    cod_tipo_logradouro smallserial not null,
    nome varchar(50) not null,
    numero varchar(6) not null,
    CEP varchar(8) not null,
    complemento varchar(40) not null,
    bairro varchar(40) not null,
    cidade varchar(40) not null,
    estado varchar(40) not null,
    RA serial not null,
    constraint fk_cod_RA_end foreign key (RA) references Aluno (RA),
    constraint fk_cod_tipo_logradouro foreign key (cod_tipo_logradouro) references Tipo_Logradouro (cod_tipo_logradouro)
);

create table Filiacao(
    cod_filiacao smallserial primary key,
    nome_completo_mae varchar(80) not null,
    nome_completo_pai varchar(80),
    RA serial not null,
    constraint fk_cod_RA_filiacao foreign key (RA) references Aluno (RA)
);