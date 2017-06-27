/*
1-liste todos os atletas (nome, documento de identificação, nacionalidade e data
	de nascimento) da modalidade A, que foram atendidos pelo médico B e são 
	treinados pelo treinador C, em que A, B e C são definidos pelo usuário
2-liste todos os médicos que atenderam pelo menos X atletas de uma nação N, 
	juntamente ao número total de atletas que atenderam, em que X e N são 
	definidos pelo usuário
3-liste a quantidade de todos os treinos que aconteceram nos períodos matutino, 
	vespertino e noturno, juntamente ao número de atletas que treinaram em cada 
	período
4-identifique os treinadores com o maior número de atletas em situação irregular
	devido ao doping, exibindo os resultados da razão entre o número de atletas
	irregulares pelo total de atletas treinados pelo mesmo treinador
*/

SELECT * FROM Pessoa;
SELECT * FROM Preparador;
SELECT * FROM Modalidade;
SELECT * FROM Nacao;
SELECT * FROM Atleta;
SELECT * FROM TelefonePessoa;
SELECT * FROM Medico;
SELECT * FROM TelefoneMedico;
SELECT * FROM RotinaTreino;
SELECT * FROM TelefoneMedico;

SELECT Pessoa.*, Preparador.Email, Preparador.Senha FROM 
    (Preparador LEFT OUTER JOIN Pessoa ON Preparador.Pessoa = Pessoa.Passaporte);

SELECT Atleta.MODALIDADE MODALIDADE,
Atleta.NACAO NACAO,
Atleta.PESSOA PESSOA,
Atleta.PESO PESO, Atleta.ALTURA ALTURA, Atleta.REGULARIDADE REGULARIDADE, Atleta.NPUNICOES NPUNICOES,
Pessoa.* FROM (
		Pessoa 
	RIGHT OUTER JOIN Atleta ON Atleta.Pessoa = Pessoa.Passaporte
    LEFT OUTER JOIN Preparador ON Preparador.Pessoa = Pessoa.Passaporte
);

SELECT * FROM (
		Pessoa 
	RIGHT OUTER JOIN Atleta ON Atleta.Pessoa = Pessoa.Passaporte
    LEFT OUTER JOIN Preparador ON Preparador.Pessoa = Pessoa.Passaporte
);

-- SELECT Atleta.PREPARADOR PREPARADOR,
-- Atleta.MODALIDADE MODALIDADE,
-- Atleta.NACAO NACAO,
-- Atleta.PESSOA PASSPRT_ATLETA,
-- Atleta.PESO PESO,
-- Atleta.ALTURA ALTURA,
-- Atleta.REGULARIDADE REGULAR,
-- Atleta.NPUNICOES PUNICOES,
-- Pessoa.NOME NOME,
-- Pessoa.CIDADE CIDADE,
-- Pessoa.ESTADO ESTADO,
-- Pessoa.PAIS PAIS,
-- Pessoa.SEXO SEXO,
-- Pessoa.DATANASCIMENTO DATANASCIMENTO,
-- Preparador.PESSOA PASSPRT_PREPAR,
-- Preparador.EMAIL EMAIL,
-- Preparador.SENHA SENHA FROM (
SELECT * FROM (
	Atleta JOIN
    (Preparador LEFT OUTER JOIN Pessoa 
    	ON Preparador.Pessoa = Pessoa.Passaporte AS Prep)
    ON Atleta.Preparador = Preparador.Pessoa
);


--------------------------------------------------------------------------------
-- By mike
-- 1 ) Liste  todos  os  atletas  (nome,  documento  de  identificação,  nacionalidade e data de nascimento) da modalidade A, que foram atendidos pelo médico B e são treinados pelo treinador C, em que A, B e C são definidos pelo usuário”; 
SELECT A.NOME, A.PASSAPORTE, A.NACAO, A.NASCIMENTO 
    FROM ATLETA A JOIN MODALIDADEATLETA MA ON A.PASSAPORTE=MA.ATLETA
                JOIN MODALIDADEESPORTIVA ME ON MA.MODALIDADE=ME.ID
                JOIN ATLETAMEDICOATENDE AMT ON AMT.ATLETA = A.PASSAPORTE
                JOIN MEDICO M ON M.ID=AMT.MEDICO
                JOIN PREPARADORATLETA PA ON PA.ATLETA=A.PASSAPORTE
                JOIN PREPARADOR P ON PA.PREPARADOR=P.PASSAPORTE
        WHERE (ME.NOME='Futebol' AND M.NOME='Rafoso' AND P.NOME='Rodrigo Mello');
-- ME = MODALIDADE, M = MEDICO, P = PREPARADOR

-- 2) liste todos os médicos que atenderam pelo menos X atletas  de uma nação N, juntamente ao número total de atletas que atenderam, em que X e  são definidos pelo usuário
SELECT M.NOME, COUNT(*) AS ATLETAS_ATENDIDOS
    FROM MEDICO M JOIN ATLETAMEDICOATENDE AMA ON M.ID=AMA.MEDICO
                JOIN ATLETA A ON A.PASSAPORTE=AMA.ATLETA
        WHERE (A.NACAO='Brasil') -- NAÇÃO N
        GROUP BY M.NOME
        HAVING COUNT(*) >= 1; -- ATLETAS X


-- 4) Identifique os treinadores com o maior número de atletas em situação irregular  devido  ao  doping,
--    exibindo  os  resultados  da  razão  entre  o  número  de  atletas irregulares pelo total de atletas treinados pelo mesmo treinador

SELECT NAT.NOME, NAT.N_ATLETAS_TREINADOS, COALESCE(NAI.N_ATLETAS_IRREGULARES,0),COALESCE(NAI.N_ATLETAS_IRREGULARES/NAT.N_ATLETAS_TREINADOS, 0) AS RAZAO
FROM
    (SELECT P.NOME, COUNT(*) AS N_ATLETAS_TREINADOS
        FROM PREPARADOR P
        GROUP BY P.NOME) NAT
LEFT JOIN        
    (SELECT P.NOME, COUNT(*) AS N_ATLETAS_IRREGULARES
        FROM PREPARADOR P JOIN PREPARADORATLETA PA ON P.PASSAPORTE = PA.PREPARADOR
                          JOIN EXAMEDEDOPING ED ON PA.ATLETA = ED.ATLETA
        WHERE ED.DESRICAODOSRESULTADOS LIKE '%positivo%'
        GROUP BY P.NOME) NAI
ON NAT.NOME = NAI.NOME
ORDER BY NAI.N_ATLETAS_IRREGULARES ASC;

COMMIT;