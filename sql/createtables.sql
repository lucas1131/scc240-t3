CREATE TABLE Pessoa (
	
	Passaporte CHAR(8),
		PRIMARY KEY (Passaporte),
	
	Nome VARCHAR(30) NOT NULL,
	Cidade VARCHAR(30) NOT NULL,
	Estado VARCHAR(30) NOT NULL,
	Pais VARCHAR(30) NOT NULL,
	Sexo CHAR(1) NOT NULL,
	DataNascimento DATE
);

CREATE TABLE Preparador (
	
	Pessoa CHAR(8) PRIMARY KEY,
		FOREIGN KEY (Pessoa) REFERENCES Pessoa(Passaporte) ON DELETE CASCADE,

	Email VARCHAR(50) CHECK (
		REGEXP_LIKE(Email, '^[a-zA-Z0-9.\_]+@[a-zA-Z]+(\.[a-z]+)+$')
	) NOT NULL,
	Senha VARCHAR(30) NOT NULL 
);

CREATE TABLE Modalidade (
	IDModalidade NUMBER,
	PRIMARY KEY(IDModalidade),
	Nome VARCHAR2(30) NOT NULL,
	Descricao VARCHAR2(4000) NOT NULL 
);

CREATE TABLE Nacao (
	NomeNacao VARCHAR2(50),
	PRIMARY KEY(NomeNacao),
	Continente VARCHAR(16) NOT NULL,
	NAtletas NUMBER NOT NULL,
	EsportePrincipal VARCHAR(60),
	Bandeira BLOB,
	Hino BLOB
);

CREATE TABLE Atleta (

	Preparador CHAR(8),
		FOREIGN KEY (Preparador) REFERENCES Preparador(Pessoa) ON DELETE CASCADE,
	
	Modalidade NUMBER,
		FOREIGN KEY (Modalidade) REFERENCES Modalidade(IDModalidade) ON DELETE CASCADE,
	
	Nacao VARCHAR2(50),
		FOREIGN KEY (Nacao) REFERENCES Nacao(NomeNacao) ON DELETE CASCADE,

	Pessoa CHAR(8),
		PRIMARY KEY(Pessoa),
		FOREIGN KEY (Pessoa) REFERENCES Pessoa(Passaporte) ON DELETE CASCADE,
	
	Peso NUMBER CHECK (Peso > 0) NOT NULL,
	Altura NUMBER CHECK (Altura > 0) NOT NULL,
	Regularidade NUMBER(1, 0) NOT NULL,
	NPunicoes NUMBER CHECK (NPunicoes >= 0) NOT NULL
	
);

CREATE TABLE TelefonePessoa (

	Pessoa CHAR(8),
		FOREIGN KEY (Pessoa) REFERENCES Pessoa(Passaporte) ON DELETE CASCADE,

	PRIMARY KEY(Pessoa, Telefone),

	Telefone NUMBER CHECK (Telefone > 0)	
);

CREATE TABLE Medico (

	CRM VARCHAR2(12),
		PRIMARY KEY (CRM),

	Identidade NUMBER(9, 0) NOT NULL ,
	Nome VARCHAR2(100) NOT NULL,
	Cidade VARCHAR2(100) NOT NULL,
	Estado VARCHAR2(100) NOT NULL,
	Pais VARCHAR2(100) NOT NULL 
);

CREATE TABLE TelefoneMedico (

	Medico VARCHAR2(12),
		FOREIGN KEY(Medico) REFERENCES Medico(CRM) ON DELETE CASCADE,
	
	PRIMARY KEY(Medico, Telefone),

	Telefone NUMBER CHECK (Telefone > 0)
);

CREATE TABLE RotinaTreino (
	IDRotina NUMBER,
	Preparador CHAR(8),
	PRIMARY KEY(IDRotina, Preparador),
	FOREIGN KEY(Preparador) REFERENCES Preparador(Pessoa) ON DELETE CASCADE,
	Duracao NUMBER CHECK (Duracao > 0) NOT NULL 
);

CREATE TABLE DiasTreino (
	RotinaTreino NUMBER,
	Preparador CHAR(8),
	DiaSemana VARCHAR2(10) CHECK (
		DiaSemana IN ('Sunday', 'Monday', 'Tuesday', 'Wednessday', 
					'Thursday', 'Friday', 'Saturnday')
	),
	PRIMARY KEY(RotinaTreino, DiaSemana),
	FOREIGN KEY(RotinaTreino, Preparador) 
		REFERENCES RotinaTreino(IDRotina, Preparador) ON DELETE CASCADE
);

CREATE TABLE Preparo (
	IDPreparo NUMBER,
	PRIMARY KEY(IDPreparo),
	DescricaoPreparo VARCHAR2(4000) NOT NULL 
);

CREATE TABLE Recuperacao (
	IDRecuperacao NUMBER,
	PRIMARY KEY(IDRecuperacao),
	DescricaoFisioterapia VARCHAR2(4000) NOT NULL 
);

CREATE TABLE Treino (
	IDTreino NUMBER,
	PRIMARY KEY(IDTreino),
	DescricaoTreino VARCHAR2(4000) NOT NULL 
);

CREATE TABLE PreparoRotina (
	
	RotinaTreino NUMBER,
	Preparador CHAR(8),
	Preparo NUMBER,
	
	PRIMARY KEY(RotinaTreino, Preparo),
	FOREIGN KEY(RotinaTreino, Preparador) 
		REFERENCES RotinaTreino(IDRotina, Preparador) 
		ON DELETE CASCADE,
	FOREIGN KEY(Preparo) REFERENCES Preparo(IDPreparo) ON DELETE CASCADE
);

CREATE TABLE RecuperacaoRotina (
	
	RotinaTreino NUMBER,
	Preparador CHAR(8),
	Recuperacao NUMBER,
	
	PRIMARY KEY(RotinaTreino, Recuperacao),
	FOREIGN KEY(RotinaTreino, Preparador) 
		REFERENCES RotinaTreino(IDRotina, Preparador) 
		ON DELETE CASCADE,
	FOREIGN KEY(Recuperacao) REFERENCES Recuperacao(IDRecuperacao) ON DELETE CASCADE
);

CREATE TABLE TreinoRotina (
	
	RotinaTreino NUMBER,
	Preparador CHAR(8),
	Treino NUMBER,
	
	PRIMARY KEY(RotinaTreino, Treino),
	FOREIGN KEY(RotinaTreino, Preparador) 
		REFERENCES RotinaTreino(IDRotina, Preparador) 
		ON DELETE CASCADE,
	FOREIGN KEY(Treino) REFERENCES Treino(IDTreino) ON DELETE CASCADE
);

CREATE TABLE TesteDoping (
	IDTeste NUMBER PRIMARY KEY,
	Descricao VARCHAR2(4000),
	Resultado NUMBER(1, 0) NOT NULL 
);

CREATE TABLE TestarDoping (

	Medico VARCHAR2(12),
	Atleta CHAR(8), 
	TesteDoping NUMBER,

	PRIMARY KEY(Medico, Atleta, TesteDoping),

	FOREIGN KEY(Medico) REFERENCES Medico(CRM) ON DELETE CASCADE,
	FOREIGN KEY(Atleta) REFERENCES Atleta(Pessoa) ON DELETE CASCADE,
	FOREIGN KEY(TesteDoping) REFERENCES TesteDoping(IDTeste) ON DELETE CASCADE
);

CREATE TABLE MetodoTratamento (
	IDMetodo NUMBER PRIMARY KEY,
	DescricaoMetodo VARCHAR2(4000) NOT NULL,
	DescricaoEfetividade VARCHAR2(4000)
);

CREATE TABLE Diagnostico (
	IDDiagnostico NUMBER PRIMARY KEY,
	DescricaoDiagnostico VARCHAR2(4000) NOT NULL
);

CREATE TABLE Consulta (
	Data DATE,
	Atleta CHAR(8),
	Medico VARCHAR2(12),
	Diagnostico NUMBER,
	DescricaoConsulta VARCHAR(4000),

	PRIMARY KEY(Atleta, Medico, Data),
	FOREIGN KEY(Atleta) REFERENCES Atleta(Pessoa) ON DELETE CASCADE,
	FOREIGN KEY(Medico) REFERENCES Medico(CRM) ON DELETE CASCADE,
	FOREIGN KEY(Diagnostico) REFERENCES Diagnostico(IDDiagnostico) ON DELETE SET NULL
);

CREATE TABLE Atendimento (

	AtletaConsulta CHAR(8),
	MedicoConsulta VARCHAR2(12),
	DataConsulta DATE,

	PRIMARY KEY(AtletaConsulta, MedicoConsulta, DataConsulta),
	FOREIGN KEY(AtletaConsulta, MedicoConsulta, DataConsulta) 
		REFERENCES Consulta(Atleta, Medico, Data)
		ON DELETE CASCADE
);

CREATE TABLE Tratamento (

	Diagnostico NUMBER,
	MetodoTratamento NUMBER,

	PRIMARY KEY(Diagnostico, MetodoTratamento),

	FOREIGN KEY(Diagnostico) REFERENCES Diagnostico(IDDiagnostico) ON DELETE CASCADE, 
	FOREIGN KEY(MetodoTratamento) REFERENCES MetodoTratamento(IDMetodo) ON DELETE CASCADE
);

CREATE TABLE Lesao (
	IDLesao NUMBER PRIMARY KEY,
	Descricao VARCHAR2(4000) NOT NULL 
);

CREATE TABLE LesaoMedico (
	
	Lesao NUMBER, 
	Medico VARCHAR2(12),

	PRIMARY KEY(Lesao, Medico),

	FOREIGN KEY(Lesao) REFERENCES Lesao(IDLesao),
	FOREIGN KEY(Medico) REFERENCES Medico(CRM)
);

CREATE TABLE LesaoAtleta (

	Lesao NUMBER, 
	Atleta CHAR(8),

	PRIMARY KEY(Lesao, Atleta),

	FOREIGN KEY(Lesao) REFERENCES Lesao(IDLesao) ON DELETE CASCADE,
	FOREIGN KEY(Atleta) REFERENCES Atleta(Pessoa) ON DELETE CASCADE
);

CREATE TABLE Sintoma (

	DataConsulta DATE,
	MedicoConsulta VARCHAR2(12),
	AtletaConsulta CHAR(8),
	Sintoma VARCHAR(4000),

	PRIMARY KEY(DataConsulta, MedicoConsulta, AtletaConsulta),

	FOREIGN KEY(DataConsulta, MedicoConsulta, AtletaConsulta) 
		REFERENCES Consulta(Data, Medico, Atleta) 
		ON DELETE CASCADE
);

-- See all tables
-- SELECT table_name FROM user_tables;
