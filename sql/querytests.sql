SELECT * FROM Acesso;
SELECT * FROM Amizade;
SELECT * FROM Amizade_Recomenda_Midia;
SELECT * FROM Assinatura;
SELECT * FROM Audio_Midia;
SELECT * FROM Cartao_de_Credito;
SELECT * FROM Conta;
SELECT * FROM Conta_Assina_Plano;
SELECT * FROM Conta_Deposito_Bancario;
SELECT * FROM Deposito_Bancario;
SELECT * FROM Dispositivo;
SELECT * FROM Forma_de_Pagamento;
SELECT * FROM Genero;
SELECT * FROM Gerencia;
SELECT * FROM Idade_Faixa_Etaria;
SELECT * FROM Legenda_Midia;
SELECT * FROM Midia;
SELECT * FROM Midia_Pertence_Genero;
SELECT * FROM Midia_Pertence_Temporada;
SELECT * FROM Numero_Cartao_de_Credito;
SELECT * FROM Numero_do_Cartao_de_Credito;
SELECT * FROM Pagamento;
SELECT * FROM Paypal;
SELECT * FROM Perfil;
SELECT * FROM Perfil_Assiste_Midia;
SELECT * FROM Perfil_Possui_Dispositivo;
SELECT * FROM Perfil_Prefere_Genero;
SELECT * FROM Perfil_Solicita_Amizade;
SELECT * FROM Pessoa;
SELECT * FROM Pessoa_Participa_Midia;
SELECT * FROM Pessoa_Participa_Serie;
SELECT * FROM Plano;
SELECT * FROM Publica;
SELECT * FROM Review;
SELECT * FROM Serie;
SELECT * FROM Serie_Pessoa;
SELECT * FROM Temporada;
SELECT * FROM Temporada_Midia;

/*
	Recupere os filmes na base de dados que atendam as preferências de legenda e
	idioma definidas por um dado perfil e que pelo menos um amigo tenha 
	assistido ou comentado
*/

-- SELECT DISTINCT AliasP, Preferencia_Legenda, Preferencia_Idioma FROM
-- 	Perfil P NATURAL JOIN Perfil_Assiste_Midia PAM WHERE P.Preferencia_Idioma IS NOT NULL;


SELECT * FROM
	(SELECT DISTINCT AliasP, Preferencia_Legenda, Preferencia_Idioma FROM
		Perfil P NATURAL JOIN Perfil_Assiste_Midia PAM WHERE P.Preferencia_Idioma IS NOT NULL) PER
	JOIN 
	(SELECT * FROM
		-- Recupera informações de audio e legenda de cada filme
		Perfil_Assiste_Midia PAM 
		JOIN (SELECT * FROM Midia MID 
			JOIN (SELECT AM.Titulo Titulo_Filme, AM.Idioma Idioma_Audio, LM.Idioma Idioma_Legenda FROM 
					Audio_Midia AM FULL OUTER JOIN Legenda_Midia LM ON AM.Titulo = LM.Titulo) RES
			ON MID.Titulo = Titulo_Filme) RES2
		
		ON PAM.Titulo_Midia = RES2.Titulo_Filme
		WHERE RES2.Tipo = 'Filme') RES3
	ON PER.AliasP = RES3.Alias_Perfil
	WHERE PER.Preferencia_Idioma = RES3.Idioma_Audio AND PER.Preferencia_Legenda = RES3.Idioma_Legenda;


-- SELECT * FROM
-- 	-- Recupera informações de audio e legenda de cada filme
-- 	Perfil_Assiste_Midia PAM 
-- 	JOIN (SELECT * FROM Midia MID 
-- 		JOIN (SELECT AM.Titulo Titulo_Filme, AM.Idioma Idioma_Audio, LM.Idioma Idioma_Legenda FROM 
-- 				Audio_Midia AM FULL OUTER JOIN Legenda_Midia LM ON AM.Titulo = LM.Titulo) RES
-- 		ON MID.Titulo = Titulo_Filme) RES2
	
-- 	ON PAM.Titulo_Midia = RES2.Titulo_Filme
-- 	WHERE RES2.Tipo = 'Filme';
