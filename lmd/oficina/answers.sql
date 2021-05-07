-- a
-- SELECT * FROM Peca WHERE custoUnitario < 10 AND codigo LIKE '%98%';

-- b
-- SELECT Carro.matricula FROM Reparacao
-- JOIN Carro ON Reparacao.idCarro = Carro.idCarro
-- WHERE dataFim LIKE '2010-09-%';

-- c
-- SELECT Cliente.Nome FROM ReparacaoPeca
-- JOIN Reparacao ON ReparacaoPeca.idReparacao = Reparacao.idReparacao
-- JOIN Peca ON ReparacaoPeca.idPeca = Peca.idPeca
-- JOIN Cliente ON Reparacao.idCliente = Cliente.idCliente
-- WHERE Peca.custoUnitario > 10 ORDER BY Peca.custoUnitario DESC;

-- d
-- SELECT Cliente.Nome FROM Cliente
-- LEFT JOIN Carro ON Carro.idCliente = Cliente.idCliente WHERE Carro.idCliente IS NULL;

-- e
-- SELECT Carro.idCarro, COUNT(*) FROM Reparacao
-- JOIN Carro ON Carro.idCarro = Reparacao.idCarro GROUP BY Carro.idCarro
-- UNION
-- SELECT Carro.idCarro, 0 FROM Carro WHERE Carro.idCarro NOT IN (SELECT idCarro FROM Reparacao);

-- f
-- SELECT idCarro, SUM(julianday(dataFim) - julianday(dataInicio)) AS dias_irmao_dustini_corno FROM Reparacao GROUP BY idCarro;

-- g
-- SELECT
--     AVG(custoUnitario) AS custo_unitario_medio,
--     SUM(custoUnitario) AS valor_total,
--     SUM(quantidade) AS numero_de_unidades,
--     MIN(custoUnitario) AS mais_barata,
--     MAX(custoUnitario) AS mais_caro
-- FROM Peca;

-- h
-- SELECT especialidade, marca, MAX(tmp) FROM (
--     SELECT Especialidade.nome AS especialidade, Marca.nome AS marca, COUNT(Especialidade.nome) AS tmp FROM Reparacao
--         JOIN Carro ON Carro.idCarro = Reparacao.idCarro
--         JOIN Modelo ON Modelo.idModelo = Carro.idModelo
--         JOIN Marca ON Modelo.idMarca = Marca.idMarca
--         JOIN FuncionarioReparacao ON Reparacao.idReparacao = FuncionarioReparacao.idReparacao
--         JOIN Funcionario ON FuncionarioReparacao.idFuncionario = Funcionario.idFuncionario
--         JOIN Especialidade ON Funcionario.idEspecialidade = Especialidade.idEspecialidade GROUP BY especialidade, marca) GROUP BY marca;
    
-- i
-- SELECT * FROM (SELECT * FROM Reparacao, ReparacaoPeca WHERE Reparacao.idReparacao = ReparacaoPeca.idReparacao) AS tmp;
-- i. Qual	o	preço	total	de	cada	reparação