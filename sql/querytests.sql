SELECT * FROM Pessoa;
SELECT * FROM Preparador;
SELECT * FROM Nacao;
SELECT * FROM Atleta;
SELECT * FROM TelefonePessoa;
SELECT * FROM Medico;
SELECT * FROM TelefoneMedico;
SELECT * FROM RotinaTreino;
SELECT * FROM DiasTreino;
SELECT * FROM Preparo;
SELECT * FROM Recuperacao;
SELECT * FROM Treino;
SELECT * FROM PreparoRotina;
SELECT * FROM RecuperacaoRotina;
SELECT * FROM TreinoRotina;
SELECT * FROM TesteDoping;
SELECT * FROM TestarDoping;
SELECT * FROM MetodoTratamento;
SELECT * FROM Diagnostico;
SELECT * FROM Consulta;
SELECT * FROM Atendimento;
SELECT * FROM Tratamento;
SELECT * FROM Lesao;
SELECT * FROM LesaoMedico;
SELECT * FROM LesaoAtleta;
SELECT * FROM Sintoma;

/*	1 liste todos os atletas (nome, documento de identificação, nacionalidade 
	e data de nascimento) da modalidade A, que foram atendidos pelo médico B e 
	são treinados pelo treinador C, em que A, B e C são definidos pelo usuário
*/
SELECT A.Pessoa BATATAPORTE, P.Nome, Pe.Nome Preparador, A.Nacao, P.DataNascimento, M.Nome Modalidade, Me.Nome Medico, Me.CRM FROM 
	-- Get Atleta by Modalidade
	Atleta A JOIN Modalidade M ON A.Modalidade = M.IDModalidade
			-- Find all Atleta names
			JOIN Pessoa P ON A.Pessoa = P.Passaporte
			-- Find all Preparador names
			JOIN Pessoa Pe ON A.Preparador = Pe.Passaporte
			-- Connect Atleta and Medico by Atendimento relation
			JOIN Atendimento At ON At.AtletaConsulta = A.Pessoa JOIN Medico Me ON Me.CRM = At.MedicoConsulta 
	-- These values should be replaced by variables in code
	WHERE M.Nome = 'Salto triplo' OR Me.Nome = 'Gi medico' OR Pe.Nome = 'Gi preparador';

/*	2 liste todos os médicos que atenderam pelo menos X atletas de uma nação N, 
	juntamente ao número total de atletas que atenderam, em que X e N são 
	definidos pelo usuário 
*/
SELECT M.Nome FROM
	Atleta A JOIN Atendimento At ON At.AtletaConsulta = A.Pessoa 
			JOIN Medico M ON M.CRM = At.MedicoConsulta
	WHERE A.Nacao = 'Alemanha' GROUP BY M.Nome HAVING COUNT(*) >= 4;

/*	4 identifique os treinadores com o maior número de atletas em situação
	irregular devido ao doping, exibindo os resultados da razão entre o número 
	de atletas irregulares pelo total de atletas treinados pelo mesmo treinador 
*/
SELECT AT.Nome, AT.NAtletas, COALESCE(AI.NAtletasIrreg, 0), COALESCE(AI.NAtletasIrreg/AT.NAtletas, 0) AS RAZAO FROM 
SELECT * FROM 
	(SELECT P.Nome FROM
		Preparador Pr JOIN Pessoa P ON Pr.Pessoa = P.Passaportes);

-- Metodo codigo modular
SELECT AT.Nome, AT.NAtletas, COALESCE(AI.NAtletasIrreg, 0), COALESCE(AI.NAtletasIrreg/AT.NAtletas, 0) AS RAZAO FROM 
	(SELECT Pe.Nome, COUNT(*) AS NAtletas FROM 
		-- Get Atleta by Modalidade
		(Atleta A JOIN Modalidade M ON A.Modalidade = M.IDModalidade
				-- Find all Atleta names
				JOIN Pessoa P ON A.Pessoa = P.Passaporte
				-- Find all Preparador names
				JOIN Pessoa Pe ON A.Preparador = Pe.Passaporte)
				GROUP BY Pe.Nome) AT
	LEFT OUTER JOIN
	(SELECT Pe.Nome, COUNT(*) AS NAtletasIrreg FROM 
		-- Get Atleta by Modalidade
		Atleta A JOIN Modalidade M ON A.Modalidade = M.IDModalidade
				-- Find all Atleta names
				JOIN Pessoa P ON A.Pessoa = P.Passaporte
				-- Find all Preparador names
				JOIN Pessoa Pe ON A.Preparador = Pe.Passaporte
				WHERE A.Regularidade = 1 GROUP BY Pe.Nome) AI
	ON AT.Nome = AI.Nome ORDER BY AI.NAtletasIrreg ASC;

SELECT * FROM Preparador JOIN Atleta ON Preparador.Pessoa = Atleta.Preparador; 

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