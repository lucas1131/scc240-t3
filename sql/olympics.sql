-- Ano: Número inteiro positivo 
-- Bandeira: Arquivo de imagem da bandeira - arquivo binário de dados. 
-- Cidade: Nome de uma cidade para descrição de um endereço - {\it string} de até 128 caractéres. 
-- Continente: Possíveis continentes para as Nações (América do Norte, América do Sul, Europa, Ásia, África e Oceania) - {\it string} de até 16 caractéres. 
-- CRM: Código identificador de um médico - {\it string} composta de uma parte apenas numérica (de 4 a 10 dígitos) seguidos de uma barra e a sigla do estado de emissão. 
-- Dia: Número inteiro entre 1 e 31 
-- Descricao: Descrição detalhada de algo - texto.
-- DiaSemana: Nome dos dias da semana (Segunda-feira, Terça-feira, Quarta-feira, Quinta-feira, Sexta-feira, Sábado e Domingo) - {\it string} de até 13 caractéres. 
-- Email: {\it String} única - deve seguir uma formatação padrão de e-mail como por exemplo ``s/$\wedge$[a-zA-Z0-9.\_]+@[a-zA-Z]+(\textbackslash.[a-z]+)+\$//''. 
-- Estado: Nome de um estado para descrição de um endereço - {\it string} de até 128 caractéres. 
-- Identidade: Número de identidade (único) de um médico - número inteiro de 9 dígitos. 
-- ID: Número único identificador de uma classe ou objeto dentro do sistema - número inteiro. 
-- Inteiro: Número inteiro. 
-- Nome: {\it String} de 60 caracteres representando nome de algo ou alguém. 
-- Pais: Nome do país para descrição de um endereço - {\it string} de até 128 caractéres. 
-- Passaporte: Números de passaportes válidos no mundo - {\it string} de 8 caractéres contendo apenas letras e número. 
-- Mes: Número inteiro entre 1 e 12 
-- NumeroPositivo: Número real maior do que 0. 
-- Regularidade: Booleano que indica se o atleta está ou não regular. 
-- Resultado:  Resultado do teste de doping, apenas positivo ou negativo - valor {\it booleano}. 
-- Senha: {\it string} de 6 a 30 caratéres contendo pelo menos uma letra maiúscula, uma minúscula, um número e um caractére especial. 
-- Sexo: Caractére M ou F indicando o sexo da pessoa. 
-- Telefone: Telefones válidos contando código do país, DDD e o número do telefone em si - número inteiro de até 15 dígitos. 
-- Hino: Arquivo de música do hino - arquivo binário de dados.

DROP TABLE Pessoa;
DROP TABLE Preparador;
DROP TABLE Atleta;
-- DROP TABLE TelefonePessoa;
-- DROP TABLE TelefoneMedico;
-- DROP TABLE RotinaTreino;
-- DROP TABLE DiasTreino;
-- DROP TABLE Preparo;
-- DROP TABLE Recuperacao;
-- DROP TABLE Treino;
-- DROP TABLE PreparoRotina;
-- DROP TABLE RecuperacaoRotina;
-- DROP TABLE TreinoRotina;
-- DROP TABLE Modalidade;
DROP TABLE Nacao;
DROP TABLE Medico;
-- DROP TABLE TestarDoping;
DROP TABLE Diagnostico;
DROP TABLE MetodoTratamento;
-- DROP TABLE Atendimento;
-- DROP TABLE Tratamento;
-- DROP TABLE Lesao;
-- DROP TABLE LesaoMedico;
-- DROP TABLE LesaoAtleta;
-- DROP TABLE TesteDoping;
-- DROP TABLE Consulta;
-- DROP TABLE Sintoma;
-- DROP TABLE Data;

CREATE TABLE Pessoa (
    
	PRIMARY KEY (Passaporte),

    Passaporte CHAR(8),
	Cidade VARCHAR(30) NOT NULL,
	Estado VARCHAR(30) NOT NULL,
	Pais VARCHAR(30) NOT NULL,
	Sexo CHAR(1) NOT NULL,
	DataNascimento DATE
);

CREATE TABLE Preparador (
	
	FOREIGN KEY (Pessoa) REFERENCES Pessoa(Passaporte),
	
	PRIMARY KEY (Pessoa),

	Email VARCHAR(20) CHECK (
		REGEXP_LIKE(Email, '^[a-zA-Z0-9.\_]+@[a-zA-Z]+(\.[a-z]+)+$')
	) NOT NULL,
	Senha VARCHAR(20) NOT NULL 
);


CREATE TABLE Atleta (

	FOREIGN KEY (Pessoa) REFERENCES Pessoa(Passaporte),
	FOREIGN KEY (Preparador) REFERENCES Preparador(Pessoa),
	-- FOREIGN KEY (Modalidade) REFERENCES Modalidade(IDModalidade),
	-- FOREIGN KEY (Nacao) REFERENCES Nacao(NomeNacao),
	
	PRIMARY KEY(Pessoa),
	
	Peso NUMBER CHECK (Peso > 0) NOT NULL,
	Altura NUMBER CHECK (Peso > 0) NOT NULL,
	Regularidade NOT NULL,
	NPunicoes NOT NULL
	
);

-- CREATE TABLE TelefonePessoa (
-- 	PRIMARY KEY(Pessoa, Telefone),
-- 	FOREIGN KEY(Pessoa) REFERENCES Pessoa(Passaporte)
-- );

-- CREATE TABLE TelefoneMedico (
-- 	PRIMARY KEY(Medico, Telefone),
-- 	FOREIGN KEY(Medico) REFERENCES Medico(CRM),
-- 	FOREIGN KEY(Telefone) REFERENCES Telefone(Pessoa, Telefone) 
-- );

-- CREATE TABLE RotinaTreino (
-- 	PRIMARY KEY(IDRotina, Preparador),
-- 	FOREIGN KEY(Preparador) REFERENCES Preparador(Passaporte),
-- 	Duracao NOT NULL 
-- );

-- CREATE TABLE DiasTreino (
-- 	PRIMARY KEY(RotinaTreino, DiaSemana),
-- 	FOREIGN KEY(RotinaTreino) REFERENCES RotinaTreino(IDRotina, Preparador)
-- );

-- CREATE TABLE Preparo (
-- 	PRIMARY KEY(IDPreparo),
-- 	DescricaoPreparo NOT NULL 
-- );

-- CREATE TABLE Recuperacao (
-- 	PRIMARY KEY(IDRecuperacao),
-- 	DescricaoFisioterapia NOT NULL 
-- );

-- CREATE TABLE Treino (
-- 	PRIMARY KEY(IDTreino),
-- 	DescricaoTreino NOT NULL 
-- );

-- CREATE TABLE PreparoRotina (
-- 	PRIMARY KEY(RotinaTreino, Preparo),
-- 	FOREIGN KEY(RotinaTreino) REFERENCES RotinaTreino(IDRotina, Preparador),
-- 	FOREIGN KEY(Preparo) REFERENCES Preparo(IDPreparo) 
-- );

-- CREATE TABLE RecuperacaoRotina (
-- 	PRIMARY KEY(RotinaTreino, Recuperacao),
-- 	FOREIGN KEY(RotinaTreino) REFERENCES RotinaTreino(IDRotina, Preparador),
-- 	FOREIGN KEY(Recuperacao) REFERENCES Recuperacao(IDRecuperacao)
-- );

-- CREATE TABLE TreinoRotina (
-- 	PRIMARY KEY(RotinaTreino, Treino),
-- 	FOREIGN KEY(RotinaTreino) REFERENCES RotinaTreino(IDRotina)
-- 	FOREIGN KEY(Treino) REFERENCES Treino(IDTreino) 
-- );

-- CREATE TABLE Modalidade (
-- 	PRIMARY KEY(IDModalidade),
-- 	Nome NOT NULL,
-- 	Descricao NOT NULL 
-- );

CREATE TABLE Nacao (
 	VARCHAR2(50) NomeNacao,
 	PRIMARY KEY(NomeNacao),
 	VARCHAR(16) Continente NOT NULL,
 	NUMBER NAtletas NOT NULL,
 	VARCHAR(60) EsportePrincipal,
 	BLOB Bandeira NOT NULL,
 	BLOB Hino NOT NULL 
);

CREATE TABLE Medico (
 	VARCHAR2(12) (CRM),
 	PRIMARY KEY (CRM),

 	NUMBER(9,0) Identidade NOT NULL,
 	VARCHAR2(100) Nome NOT NULL,
 	VARCHAR2(100) Cidade NOT NULL,
 	VARCHAR2(100) Estado NOT NULL,
 	VARCHAR2(100) Pais NOT NULL 
);

-- CREATE TABLE TestarDoping (
-- 	PRIMARY KEY(Medico, Atleta, TesteDoping),
-- 	FOREIGN KEY(Medico) REFERENCES Medico(CRM),
-- 	FOREIGN KEY(Atleta) REFERENCES Atleta(Passaporte),
-- 	FOREIGN KEY(Teste Doping) REFERENCES TesteDoping(IDTeste)
-- );

CREATE TABLE Diagnostico (
 	PRIMARY KEY NUMBER (IDDiagnostico),
 	VARCHAR2(4000) DescricaoDiagnostico NOT NULL
);

CREATE TABLE MetodoTratamento (
 	PRIMARY KEY NUMBER (IDMetodo),
 	VARCHAR2(4000) DescricaoMetodo NOT NULL,
 	VARCHAR2(4000) DescricaoEfetividade
);

--CREATE TABLE Atendimento (
-- 	PRIMARY KEY(MedicoConsulta, AtletaConsulta, DataConsulta),
-- 	FOREIGN KEY(MedicoConsulta) REFERENCES Consulta(Medico),
-- 	FOREIGN KEY(AtletaConsulta) REFERENCES Consulta(Atleta),
-- 	FOREIGN KEY(DataConsulta) REFERENCES Data(Dia, Mes, Ano)
-- );

-- CREATE TABLE Tratamento (
-- 	PRIMARY KEY(Diagnostico, MetodoTratamento),
-- 	FOREIGN KEY(Diagnostico) REFERENCES Diagnostico(IDDiagnostico),
-- 	FOREIGN KEY(MetodoTratamento) REFERENCES MetodoTratamento(IDMetodo) 
-- );

CREATE TABLE Lesao (
 	PRIMARY KEY NUMBER (IDLesao),
 	VARCHAR2(4000) Descricao NOT NULL 
);

-- CREATE TABLE LesaoMedico (
-- 	PRIMARY KEY(Lesao, Medico),
-- 	FOREIGN KEY(Lesao) REFERENCES Lesao(IDLesao),
-- 	FOREIGN KEY(Medico) REFERENCES Medico(CRM)
-- );

-- CREATE TABLE LesaoAtleta (
-- 	PRIMARY KEY(Lesao, Atleta),
-- 	FOREIGN KEY(Lesao) REFERENCES Lesao(IDLesao),
-- 	FOREIGN KEY(Atleta) REFERENCES Atleta(Passaporte)
-- );

CREATE TABLE TesteDoping (
 	PRIMARY KEY NUMBER (IDTeste),
 	VARCHAR2(4000) Descricao,
 	NUMBER(1,0) Resultado NOT NULL 
);

CREATE TABLE Consulta (
 	Date Data,
 	Atleta CHAR(8),
 	Medico VARCHAR2(12),
 	NUMBER Diagnostico,

 	PRIMARY KEY(Atleta, Medico, Diagnostico) NOT NULL,
	FOREIGN KEY(Atleta) REFERENCES Atleta(Passaporte),
 	FOREIGN KEY(Medico) REFERENCES Medico(CRM),
 	FOREIGN KEY(Diagnostico) REFERENCES Diagnostico(IDDiagnostico),
 	DescricaoConsulta VARCHAR(4000)
);

-- CREATE TABLE Sintoma (
-- 	PRIMARY KEY(DataConsulta, MedicoConsulta, AtletaConsulta, Sintoma),
-- 	FOREIGN KEY(DataConsulta) REFERENCES Consulta(Data),
-- 	FOREIGN KEY(MedicoConsulta) REFERENCES Consulta(Medico),
-- 	FOREIGN KEY(MedicoConsulta) REFERENCES Consulta(Atleta)
-- );
