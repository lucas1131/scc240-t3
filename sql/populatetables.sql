/*
INSERT INTO Pessoa VALUES (	
	Passaporte CHAR(8),
		PRIMARY KEY (Passaporte),
	
	Nome VARCHAR(30) NOT NULL,
	Cidade VARCHAR(30) NOT NULL,
	Estado VARCHAR(30) NOT NULL,
	Pais VARCHAR(30) NOT NULL,
	Sexo CHAR(1) NOT NULL,
	DataNascimento DATE

	-- Date formats
	-- TO_DATE('05/02/80', 'DD/MM/RR')
	-- '02-SEP-1992'
);
*/

INSERT INTO Pessoa VALUES ('123cdx56', 'Airo', 'Guarulhos', 'São Paulo', 'Brasil', 'M', '13-DEC-1996');
INSERT INTO Pessoa VALUES ('321xdc65', 'Gi', 'Ribeirão Preto', 'São Paulo', 'Brasil', 'F', '28-DEC-1996');
INSERT INTO Pessoa VALUES ('70r74100', 'Jurg', 'São Paulo', 'São Paulo', 'Brasil', 'M', '13-DEC-1996');

/*
INSERT INTO Preparador VALUES (	
	Pessoa CHAR(8) PRIMARY KEY,
		FOREIGN KEY (Pessoa) REFERENCES Pessoa(Passaporte) ON DELETE CASCADE,

	Email VARCHAR(20) CHECK (
		REGEXP_LIKE(Email, '^[a-zA-Z0-9.\_]+@[a-zA-Z]+(\.[a-z]+)+$')
	) NOT NULL,
	Senha VARCHAR(20) NOT NULL 
);
*/

/*
INSERT INTO Modalidade VALUES (	IDModalidade NUMBER,
	PRIMARY KEY(IDModalidade),
	Nome VARCHAR2(30) NOT NULL,
	Descricao VARCHAR2(4000) NOT NULL 
);
*/

/*
INSERT INTO Nacao VALUES (	NomeNacao VARCHAR2(50),
	PRIMARY KEY(NomeNacao),
	Continente VARCHAR(16) NOT NULL,
	NAtletas NUMBER NOT NULL,
	EsportePrincipal VARCHAR(60),
	Bandeira BLOB NOT NULL,
	Hino BLOB NOT NULL 
);
*/

/*
INSERT INTO Atleta VALUES (
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
*/

/*
INSERT INTO TelefonePessoa VALUES (
	Pessoa CHAR(8),
		FOREIGN KEY (Pessoa) REFERENCES Pessoa(Passaporte) ON DELETE CASCADE,

	PRIMARY KEY(Pessoa, Telefone),

	Telefone NUMBER CHECK (Telefone > 0)	
);
*/

/*
INSERT INTO Medico VALUES (
	CRM VARCHAR2(12),
		PRIMARY KEY (CRM),

	Identidade NUMBER(9, 0) NOT NULL ,
	Nome VARCHAR2(100) NOT NULL,
	Cidade VARCHAR2(100) NOT NULL,
	Estado VARCHAR2(100) NOT NULL,
	Pais VARCHAR2(100) NOT NULL 
);
*/

/*
INSERT INTO TelefoneMedico VALUES (
	Medico VARCHAR2(12),
		FOREIGN KEY(Medico) REFERENCES Medico(CRM) ON DELETE CASCADE,
	
	PRIMARY KEY(Medico, Telefone),

	Telefone NUMBER CHECK (Telefone > 0)
);
*/

/*
INSERT INTO RotinaTreino VALUES (	IDRotina NUMBER,
	Preparador CHAR(8),
	PRIMARY KEY(IDRotina, Preparador),
	FOREIGN KEY(Preparador) REFERENCES Preparador(Pessoa) ON DELETE CASCADE,
	Duracao NUMBER CHECK (Duracao > 0) NOT NULL 
);
*/

/*
INSERT INTO DiasTreino VALUES (	RotinaTreino NUMBER,
	Preparador CHAR(8),
	DiaSemana VARCHAR2(10) CHECK (
		DiaSemana IN ('Sunday', 'Monday', 'Tuesday', 'Wednessday', 
					'Thursday', 'Friday', 'Saturnday')
	),
	PRIMARY KEY(RotinaTreino, DiaSemana),
	FOREIGN KEY(RotinaTreino, Preparador) 
		REFERENCES RotinaTreino(IDRotina, Preparador) ON DELETE CASCADE
);
*/

/*
INSERT INTO Preparo VALUES (	IDPreparo NUMBER,
	PRIMARY KEY(IDPreparo),
	DescricaoPreparo VARCHAR2(4000) NOT NULL 
);
*/

/*
INSERT INTO Recuperacao VALUES (	IDRecuperacao NUMBER,
	PRIMARY KEY(IDRecuperacao),
	DescricaoFisioterapia VARCHAR2(4000) NOT NULL 
);
*/

/*
INSERT INTO Treino VALUES (	IDTreino NUMBER,
	PRIMARY KEY(IDTreino),
	DescricaoTreino VARCHAR2(4000) NOT NULL 
);
*/

/*
INSERT INTO PreparoRotina VALUES (	
	RotinaTreino NUMBER,
	Preparador CHAR(8),
	Preparo NUMBER,
	
	PRIMARY KEY(RotinaTreino, Preparo),
	FOREIGN KEY(RotinaTreino, Preparador) 
		REFERENCES RotinaTreino(IDRotina, Preparador) 
		ON DELETE CASCADE,
	FOREIGN KEY(Preparo) REFERENCES Preparo(IDPreparo) ON DELETE CASCADE
);
*/

/*
INSERT INTO RecuperacaoRotina VALUES (	
	RotinaTreino NUMBER,
	Preparador CHAR(8),
	Recuperacao NUMBER,
	
	PRIMARY KEY(RotinaTreino, Recuperacao),
	FOREIGN KEY(RotinaTreino, Preparador) 
		REFERENCES RotinaTreino(IDRotina, Preparador) 
		ON DELETE CASCADE,
	FOREIGN KEY(Recuperacao) REFERENCES Recuperacao(IDRecuperacao) ON DELETE CASCADE
);
*/

/*
INSERT INTO TreinoRotina VALUES (	
	RotinaTreino NUMBER,
	Preparador CHAR(8),
	Treino NUMBER,
	
	PRIMARY KEY(RotinaTreino, Treino),
	FOREIGN KEY(RotinaTreino, Preparador) 
		REFERENCES RotinaTreino(IDRotina, Preparador) 
		ON DELETE CASCADE,
	FOREIGN KEY(Treino) REFERENCES Treino(IDTreino) ON DELETE CASCADE
);
*/

/*
INSERT INTO TesteDoping VALUES (	IDTeste NUMBER PRIMARY KEY,
	Descricao VARCHAR2(4000),
	Resultado NUMBER(1, 0) NOT NULL 
);
*/

/*
INSERT INTO TestarDoping VALUES (
	Medico VARCHAR2(12),
	Atleta CHAR(8), 
	TesteDoping NUMBER,

	PRIMARY KEY(Medico, Atleta, TesteDoping),

	FOREIGN KEY(Medico) REFERENCES Medico(CRM) ON DELETE CASCADE,
	FOREIGN KEY(Atleta) REFERENCES Atleta(Pessoa) ON DELETE CASCADE,
	FOREIGN KEY(TesteDoping) REFERENCES TesteDoping(IDTeste) ON DELETE CASCADE
);
*/

/*
INSERT INTO MetodoTratamento VALUES (	IDMetodo NUMBER PRIMARY KEY,
	DescricaoMetodo VARCHAR2(4000) NOT NULL,
	DescricaoEfetividade VARCHAR2(4000)
);
*/

/*
INSERT INTO Diagnostico VALUES (	IDDiagnostico NUMBER PRIMARY KEY,
	DescricaoDiagnostico VARCHAR2(4000) NOT NULL,
	MetodoTratamento NUMBER,
		FOREIGN KEY(MetodoTratamento) 
		REFERENCES MetodoTratamento(IDMetodo) ON DELETE CASCADE
);
*/

/*
INSERT INTO Consulta VALUES (	Data DATE,
	Atleta CHAR(8),
	Medico VARCHAR2(12),
	Diagnostico NUMBER,
	DescricaoConsulta VARCHAR(4000),

	PRIMARY KEY(Atleta, Medico, Data),
	FOREIGN KEY(Atleta) REFERENCES Atleta(Pessoa) ON DELETE CASCADE,
	FOREIGN KEY(Medico) REFERENCES Medico(CRM) ON DELETE CASCADE,
	FOREIGN KEY(Diagnostico) REFERENCES Diagnostico(IDDiagnostico) ON DELETE SET NULL
);
*/

/*
INSERT INTO Atendimento VALUES (
	AtletaConsulta CHAR(8),
	MedicoConsulta VARCHAR2(12),
	DataConsulta DATE,

	PRIMARY KEY(AtletaConsulta, MedicoConsulta, DataConsulta),
	FOREIGN KEY(AtletaConsulta, MedicoConsulta, DataConsulta) 
		REFERENCES Consulta(Atleta, Medico, Data)
		ON DELETE CASCADE
);
*/

/*
INSERT INTO Tratamento VALUES (
	Diagnostico NUMBER,
	MetodoTratamento NUMBER,

	PRIMARY KEY(Diagnostico, MetodoTratamento),

	FOREIGN KEY(Diagnostico) REFERENCES Diagnostico(IDDiagnostico) ON DELETE CASCADE, 
	FOREIGN KEY(MetodoTratamento) REFERENCES MetodoTratamento(IDMetodo) ON DELETE CASCADE
);
*/

/*
INSERT INTO Lesao VALUES (	IDLesao NUMBER PRIMARY KEY,
	Descricao VARCHAR2(4000) NOT NULL 
);
*/

/*
INSERT INTO LesaoMedico VALUES (	
	Lesao NUMBER, 
	Medico VARCHAR2(12),

	PRIMARY KEY(Lesao, Medico),

	FOREIGN KEY(Lesao) REFERENCES Lesao(IDLesao),
	FOREIGN KEY(Medico) REFERENCES Medico(CRM)
);
*/

/*
INSERT INTO LesaoAtleta VALUES (
	Lesao NUMBER, 
	Atleta CHAR(8),

	PRIMARY KEY(Lesao, Atleta),

	FOREIGN KEY(Lesao) REFERENCES Lesao(IDLesao) ON DELETE CASCADE,
	FOREIGN KEY(Atleta) REFERENCES Atleta(Pessoa) ON DELETE CASCADE
);
*/

/*
INSERT INTO Sintoma VALUES (
	DataConsulta DATE,
	MedicoConsulta VARCHAR2(12),
	AtletaConsulta CHAR(8),
	Sintoma VARCHAR(4000),

	PRIMARY KEY(DataConsulta, MedicoConsulta, AtletaConsulta),

	FOREIGN KEY(DataConsulta, MedicoConsulta, AtletaConsulta) 
		REFERENCES Consulta(Data, Medico, Atleta) 
		ON DELETE CASCADE
);
*/

-- See all tables
-- SELECT table_name FROM user_tables;
