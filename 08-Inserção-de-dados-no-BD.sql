-- Para reiniciar a numeração das chaves primárias
TRUNCATE Departamento RESTART IDENTITY CASCADE;
-- Carga de Dados para Testes
INSERT INTO
    Departamento (nome)
VALUES
    ('Ciências Humanas'),
    ('Matemática'),
    ('Biológicas'),
    ('Estágio');

INSERT INTO
    Professor (
        nome,
        sobrenome,
        status_prof,
        cod_departamento
    )
VALUES
    ('Fábio', 'dos Reis', false, 2),
    ('Sophie', 'Allemand', true, 1),
    ('Monica', 'Barroso', true, 3);

INSERT INTO
    Curso (nome, cod_departamento)
VALUES
    ('Matemática', 2),
    ('Psicologia', 1),
    ('Análise de Sistemas', 2),
    ('Biologia', 3),
    ('História', 1),
    ('Engenharia', 2);

INSERT INTO
    Turma (
        periodo,
        num_alunos,
        data_inicio,
        data_fim,
        cod_curso
    )
VALUES
    ('Manhã', 20, '2016-05-12', '2017-10-15', 2),
    ('Noite', 10, '2014-05-12', '2020-03-05', 1),
    ('Tarde', 15, '2012-05-12', '2014-05-10', 3);

INSERT INTO
    Disciplina (
        nome,
        descricao,
        num_alunos,
        carga_horaria,
        cod_departamento
    )
VALUES
    (
        'Raciocínio Lógico',
        'Desenvolver o raciocínio lógico',
        50,
        1200,
        2
    ),
    (
        'Psicologia Cognitiva',
        'Entender o funcionamento do aprendizado',
        30,
        1400,
        1
    ),
    (
        'Programação em C',
        'Aprender uma linguagem de programação',
        20,
        1200,
        2
    ),
    (
        'Eletrônica Digital',
        'Funcionamento de circuitos digitais',
        30,
        300,
        2
    );

INSERT INTO
    Aluno (
        nome,
        sobrenome,
        CPF,
        status_aluno,
        email,
        whatsapp,
        sexo,
        cod_curso,
        cod_turma
    )
VALUES
    (
        'Marcos',
        'Aurelio Martins',
        14278914536,
        true,
        'marcosaurelio@gmail.com',
        946231249,
        'M',
        3,
        2
    ),
    (
        'Gabriel',
        'Fernando de Almeida',
        14470954536,
        true,
        'gabrielalmeida@yahoo.com',
        941741247,
        'M',
        1,
        1
    ),
    (
        'Beatriz',
        'Sonia Meneguel',
        1520984537,
        true,
        'batrizmene@hotmail.com',
        945781412,
        'F',
        3,
        3
    ),
    (
        'Jorge',
        'Soares',
        14223651562,
        true,
        'jorgesoares@gmail.com',
        925637857,
        'M',
        4,
        3
    ),
    (
        'Ana Paula',
        'Ferretti',
        32968914522,
        true,
        'anapaulaferretti@hotmail.com',
        974267423,
        'F',
        5,
        3
    ),
    (
        'Mônica',
        'Yamaguti',
        32988914510,
        true,
        'monyamaguti@outlook.com',
        932619560,
        'F',
        6,
        2
    );

INSERT INTO
    Aluno_Disci (RA, cod_disciplina)
VALUES
    (3, 1),
    (1, 2),
    (2, 3),
    (4, 3),
    (5, 4),
    (6, 1);

INSERT INTO
    Curso_Disciplina(cod_curso, cod_disciplina)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (6, 4);

INSERT INTO
    Prof_Disciplina(cod_professor, cod_disciplina)
VALUES
    (2, 1),
    (1, 2),
    (3, 3),
    (2, 4);

INSERT INTO
    Historico (RA, data_inicio, data_fim)
VALUES
    (2, '2016-05-12', '2017-10-15'),
    (3, '2014-05-12', '2020-03-05'),
    (1, '2010-05-12', '2012-05-10');

INSERT INTO
    Tipo_Logradouro (tipo_logradouro)
VALUES
    ('Rua'),
    ('Avenida'),
    ('Alameda'),
    ('Travessa');

INSERT INTO
    Endereco (
        cod_tipo_logradouro,
        nome,
        numero,
        CEP,
        complemento,
        bairro,
        cidade,
        estado,
        RA
    )
VALUES
    (1, 'das Giestas', 255, 02854000, 'Casa 02', 'Jd. Flor Verde', 'Bagulhos', 'SX', 2),
    (3, 'Lorena', 10, 02945000, 'Apto 15', 'Alapleurina', 'Xubatão', 'XP', 3),
    (2, 'do Cursino', 1248, 0851040, '', 'Dois', 'Cuiatá', 'SX',  1),
    (1, 'das Heras', 495, 03563142, '', 'Filhos do Morro', 'Xis Paulo', 'XP',  4),
    (3, 'Santos', 1856, 04523963, '', 'Vírgula', 'Acento', 'CF', 5),
    (4, 'Matão', 206, 04213650, '', 'Circunflexo', 'Círculo', 'O', 6);

INSERT INTO
    Filiacao (
        nome_completo_mae,
        nome_completo_pai,
        RA
    )
VALUES
    (
        'Maria Aparecida',
        'Marcio Aurelio',
        1
    ),
    (
        'Fernanda Almeida',
        'Adão Almeida',
        2
    ),
    (
        'Gabriella Meneguel',
        'Samuel Meneguel',
        3
    ),
    (
        'Maria Richter',
        'João Soares',
        4
    ),
    (
        'Ana Hoffbahn',
        'Marcio Ferretti',
        5
    ),
    (
        'Fernanda Yamaguti',
        'Wilson Oliveira',
        6
    );