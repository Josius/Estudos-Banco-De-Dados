-- TESTES FINAS E CORREÇÕES

-- Alterando campo nota da tabela Disc_Hist para NUMERIC ao invés de DECIMAL
alter table Disc_Hist alter column nota type numeric(4,2);

-- Inserir alguns dados de disciplinas e notas nos históricos, que estavam faltando
INSERT INTO Disc_Hist (cod_historico, cod_disciplina, nota, frequencia)
VALUES
(1, 2, 7, 6), -- Marcos - Psicologia Cognitiva (cod 2)
(2, 3, 8.5, 2), -- Beatriz - Programação em C (cod 3)
(3, 1, 6.8, 8); -- Gabriel - Raciocínio Lógico (cod 1)

-- Inserir dados de tipos de telefones e os telefones dos alunos
INSERT INTO Tipo_Telefones (tipo_telefone)
VALUES
('Res'),
('Com'),
('Cel'),
('Rec');

INSERT INTO Telefones_Aluno (RA, cod_tipo_telefone, num_telefone)
VALUES
(1, 1, 28467853),
(2, 1, 24653298),
(2, 3, 996324521),
(3, 1, 36549875),
(3, 3, 994532165),
(4, 1, 21956345),
(4, 3, 986321452),
(5, 1, 24569832),
(5, 2, 23854696),
(6, 1, 27698753);

-- Consultas para testes

-- 1. RAs, Nomes e Sobrenomes dos Alunos, Nomes dos Cursos e Períodos das Turmas, ordenados pelo primeiro nome de aluno:
SELECT A.RA, A.nome, A.sobrenome, T.periodo, C.nome
FROM Aluno A
INNER JOIN Curso C
ON C.Cod_Curso = A.Cod_Curso
INNER JOIN Turma T
ON A.Cod_Turma = T.Cod_Turma
ORDER BY A.Nome;

-- 2. Todas as disciplinas cursadas por um aluno, com suas respectivas notas:
-- Aluno: RA 3 (Beatriz)
SELECT A.Nome, A.Sobrenome, D.Nome, DH.Nota
FROM Aluno A
INNER JOIN Aluno_Disci AD
ON A.RA = AD.RA
INNER JOIN Disciplina D
ON D.Cod_Disciplina = AD.Cod_Disciplina
INNER JOIN Historico H
ON A.RA = H.RA
INNER JOIN Disc_Hist DH
ON H.Cod_Historico = DH.Cod_Historico
WHERE A.RA = 3;

-- 3. Nomes e sobrenomes dos professores, e disciplinas que ministram com suas cargas horárias:
SELECT CONCAT(P.Nome, ' ', P.Sobrenome) AS Docente,
D.Nome, D.Carga_Horaria
FROM Professor P
INNER JOIN Prof_Disciplina PD
ON P.Cod_Professor = PD.Cod_Professor
INNER JOIN Disciplina D
ON D.Cod_Disciplina = PD.Cod_Disciplina
ORDER BY D.Nome;

-- 4. Gerar "relatório" com nomes, sobrenomes, CPF dos alunos, tipos e números de telefones e endereços completos.
SELECT CONCAT(A.Nome, ' ', A.Sobrenome) AS Aluno, A.CPF, T.Num_Telefone, CONCAT(TL.Tipo_Logradouro, ' ', E.Nome, ', ', E.Numero) AS Logradouro, E.Complemento, E.CEP
FROM Aluno A
INNER JOIN Telefones_Aluno T
ON A.RA = T.RA
INNER JOIN Endereco E
ON A.RA = E.RA
INNER JOIN Tipo_Logradouro TL
ON TL.Cod_Tipo_Logradouro = E.Cod_Tipo_Logradouro;

-- 5. Listar as disciplinas, indicando seus departamentos, cursos e professores
SELECT Di.Nome, C.Nome,
CONCAT(P.Nome, ' ', P.Sobrenome) AS Docente, De.Nome
FROM Disciplina Di
INNER JOIN Departamento De
ON Di.Cod_Departamento = De.Cod_Departamento
INNER JOIN Prof_Disciplina PD
ON Di.Cod_Disciplina = PD.Cod_Disciplina
INNER JOIN Professor P
ON P.Cod_Professor = PD.Cod_Professor
INNER JOIN Curso_Disciplina CD
ON Di.Cod_Disciplina = CD.Cod_Disciplina
INNER JOIN Curso C
ON C.Cod_Curso = CD.Cod_Curso
ORDER BY Di.Nome;