SELECT * FROM Pagamento;
SELECT * FROM Assinatura;
SELECT * FROM Conta_Assina_Plano;
SELECT * FROM Paypal;
SELECT * FROM Midia_Pertence_Temporada;
SELECT * FROM Midia_Pertence_Genero;
SELECT * FROM Legenda_Midia;
SELECT * FROM Audio_Midia;
SELECT * FROM Gerencia;
SELECT * FROM Perfil_Solicita_Amizade;
SELECT * FROM Perfil_Prefere_Genero;
SELECT * FROM Numero_Cartao_de_Credito;
SELECT * FROM Cartao_de_Credito;
SELECT * FROM Deposito_Bancario;
SELECT * FROM Conta_Deposito_Bancario;
SELECT * FROM Pessoa_Participa_Serie;
SELECT * FROM Pessoa_Participa_Midia;
SELECT * FROM Serie_Pessoa;
SELECT * FROM Amizade_Recomenda_Midia;
SELECT * FROM Perfil_Possui_Dispositivo;
SELECT * FROM Perfil_Assiste_Midia;
SELECT * FROM Acesso;
SELECT * FROM Amizade;
SELECT * FROM Perfil;
SELECT * FROM Conta;
SELECT * FROM Temporada_Midia;
SELECT * FROM Temporada;
SELECT * FROM Review;
SELECT * FROM Dispositivo;
SELECT * FROM Serie;
SELECT * FROM Pessoa;
SELECT * FROM Idade_Faixa_Etaria;
SELECT * FROM Numero_do_Cartao_de_Credito;
SELECT * FROM Genero;
SELECT * FROM Publica;
SELECT * FROM Forma_de_Pagamento;
SELECT * FROM Midia;
SELECT * FROM Plano;

/*
	Recupere os filmes na base de dados que atendam as preferências de legenda e
	idioma definidas por um dado perfil e que pelo menos um amigo tenha 
	assistido ou comentado
*/