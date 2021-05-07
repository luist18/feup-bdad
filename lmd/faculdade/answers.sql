-- P1
-- SELECT nr FROM aluno;

-- P2
-- SELECT cod, Design FROM cadeira WHERE curso = 'AC';

-- P3
-- SELECT DISTINCT aluno.Nome as nome FROM aluno NATURAL JOIN prof;

-- P4
-- SELECT DISTINCT aluno.Nome as nome FROM aluno, prof WHERE aluno.Nome NOT IN (SELECT Nome FROM prof);

-- P5
-- SELECT Nome from aluno
-- UNION
-- SELECT Nome from prof;

-- P6
-- SELECT DISTINCT aluno.Nome as nome FROM aluno
-- JOIN prova ON aluno.nr = prova.nr
-- WHERE prova.cod = 'TS1';

-- P7
-- SELECT DISTINCT aluno.Nome as nome FROM aluno
-- JOIN prova ON aluno.nr = prova.nr
-- JOIN cadeira ON prova.cod = cadeira.cod
-- WHERE cadeira.curso = 'IS';

-- P8
-- SELECT helper.Nome FROM (SELECT *, COUNT(DISTINCT prova.cod) AS approved FROM aluno
-- JOIN prova ON aluno.nr = prova.nr
-- JOIN cadeira ON prova.cod = cadeira.cod
-- WHERE cadeira.curso = 'IS' AND prova.nota >= 9.5 GROUP BY aluno.nr) AS helper
-- WHERE helper.approved = (SELECT COUNT(DISTINCT cadeira.cod) FROM cadeira WHERE cadeira.curso = 'IS');

-- P9
-- SELECT MAX(nota) FROM prova;

-- P10
-- SELECT AVG(nota) FROM prova;

-- P11
-- SELECT COUNT(*) FROM aluno;

-- P12
-- SELECT cadeira.curso, COUNT(*) AS cadeiras FROM cadeira GROUP BY cadeira.curso;

-- P13
-- SELECT prova.nr, COUNT(*) AS provas FROM prova GROUP BY prova.nr;

-- P14
-- SELECT AVG(provas) FROM (SELECT prova.nr, COUNT(*) AS provas FROM prova GROUP BY prova.nr);

-- P15
-- SELECT Nome, AVG(nota_max) FROM (SELECT aluno.Nome, aluno.nr, prova.cod, MAX(prova.nota) AS nota_max FROM aluno
-- JOIN prova ON aluno.nr = prova.nr
-- WHERE prova.nota >= 9.5 GROUP BY aluno.nr, prova.cod) GROUP BY Nome;

-- P16
-- SELECT aluno.Nome, aluno.nr, prova.cod, MAX(prova.nota) AS nota_max FROM aluno
-- JOIN prova ON aluno.nr = prova.nr GROUP BY prova.cod;
