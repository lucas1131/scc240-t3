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

/* Pessoas Preparadores */
INSERT INTO Pessoa VALUES ('123cdxPP', 'Airo preparador', 'Guarulhos', 'São Paulo', 'Brasil', 'M', '13-DEC-1996');
INSERT INTO Pessoa VALUES ('321xdcPP', 'Gi preparador', 'Ribeirão Preto', 'São Paulo', 'Brasil', 'F', '28-DEC-1996');
INSERT INTO Pessoa VALUES ('70r741PP', 'Jurg preparador', 'São Paulo', 'São Paulo', 'Brasil', 'M', '13-DEC-1996');

/* Pessoas Atletas */
INSERT INTO Pessoa VALUES ('123cdxAA', 'Airo atleta', 'Guarulhos', 'São Paulo', 'Brasil', 'M', '13-DEC-1996');
INSERT INTO Pessoa VALUES ('321xdcAA', 'Gi atleta', 'Ribeirão Preto', 'São Paulo', 'Brasil', 'F', '28-DEC-1996');
INSERT INTO Pessoa VALUES ('70r741AA', 'Jurg atleta', 'São Paulo', 'São Paulo', 'Brasil', 'M', '13-DEC-1996');

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

INSERT INTO Preparador VALUES ('Airo preparador', 'lucassoares1793@gmail.com', '123456789aA!');
INSERT INTO Preparador VALUES ('Gi preparador', 'xofanna@gimail.com', '123456789aA@');
INSERT INTO Preparador VALUES ('Jurg preparador', 'tortao@jureg.jurg', '123456789aA#');

/*
INSERT INTO Modalidade VALUES (	IDModalidade NUMBER,
	PRIMARY KEY(IDModalidade),
	Nome VARCHAR2(30) NOT NULL,
	Descricao VARCHAR2(4000) NOT NULL 
);
*/

INSERT INTO Modalidade VALUES (1, 'Arremeço de peso', 'O objetivo é arremessar o mais longe possível uma bola de metal maciço. Para os homens, o peso tem 7,260 kg; para as mulheres, 4 kg. No arremesso, o atleta mantém o braço flexionado, apoiando o peso junto ao pescoço. Deve permanecer dentro de um círculo com 2,1 metros de diâmetro.');
INSERT INTO Modalidade VALUES (2, '100 Metros Borboleta', '100 Metros Borboleta é a modalidade de velocidade do estilo mariposa da natação.');
INSERT INTO Modalidade VALUES (3, 'Salto triplo', 'O Triplo Salto é uma combinação de três saltos sucessivos que terminam com a queda numa caixa de areia. A prova inicia-se com uma corrida de impulso. ');

/*
INSERT INTO Nacao VALUES (	NomeNacao VARCHAR2(50),
	PRIMARY KEY(NomeNacao),
	Continente VARCHAR(16) NOT NULL,
	NAtletas NUMBER NOT NULL,
	EsportePrincipal VARCHAR(60),
	Bandeira BLOB,
	Hino BLOB
);
*/

INSERT INTO Nacao VALUES ('Brasil', 'America do Sul', 50, 'Futebol', NULL, NULL);
INSERT INTO Nacao VALUES ('Alemanha', 'Europa', 60, 'Futebol', NULL, NULL);
INSERT INTO Nacao VALUES ('Estados Unidos', 'America do Norte', 75, NULL, NULL);

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

INSERT INTO Atleta VALUES ('123cdxPP', 1, Brasil, '123cdxAA', 100.0, 2.00, 1, 0);
INSERT INTO Atleta VALUES ('321xdcPP', 1, Alemanha, '321xdcAA', 80.0, 1.80, 1, 0);
INSERT INTO Atleta VALUES ('70r741PP', 1, Estados Unidos, '70r741AA', 120.0, 1.70, 1, 0);

/*
INSERT INTO TelefonePessoa VALUES (
	Pessoa CHAR(8),
		FOREIGN KEY (Pessoa) REFERENCES Pessoa(Passaporte) ON DELETE CASCADE,

	PRIMARY KEY(Pessoa, Telefone),

	Telefone NUMBER CHECK (Telefone > 0)	
);
*/

INSERT INTO TelefonePessoa VALUES ('123cdxPP', 33334444);
INSERT INTO TelefonePessoa VALUES ('321xdcPP', 12345678);
INSERT INTO TelefonePessoa VALUES ('70r741PP', 87654321);
INSERT INTO TelefonePessoa VALUES ('123cdxAA', 12312312);
INSERT INTO TelefonePessoa VALUES ('321xdcAA', 66666666);
INSERT INTO TelefonePessoa VALUES ('70r741AA', 25252525);

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

INSERT INTO Medico VALUES ('123456789aaa', 396440216, 'Airo medico', 'Guarulhos', 'São Paulo', 'Brasil');
INSERT INTO Medico VALUES ('987654321bbb', 825500244, 'Gi preparador', 'Ribeirão Preto', 'São Paulo', 'Brasil');
INSERT INTO Medico VALUES ('123987456ccc', 111222355, 'Jurg preparador', 'São Paulo', 'São Paulo', 'Brasil');

/*
INSERT INTO TelefoneMedico VALUES (
	Medico VARCHAR2(12),
		FOREIGN KEY(Medico) REFERENCES Medico(CRM) ON DELETE CASCADE,
	
	PRIMARY KEY(Medico, Telefone),

	Telefone NUMBER CHECK (Telefone > 0)
);
*/

INSERT INTO TelefoneMedico VALUES ('123456789aaa', 44443333);
INSERT INTO TelefoneMedico VALUES ('987654321bbb', 22224444);
INSERT INTO TelefoneMedico VALUES ('123987456ccc', 12121212);

/*
INSERT INTO RotinaTreino VALUES (	IDRotina NUMBER,
	Preparador CHAR(8),
	PRIMARY KEY(IDRotina, Preparador),
	FOREIGN KEY(Preparador) REFERENCES Preparador(Pessoa) ON DELETE CASCADE,
	Duracao NUMBER CHECK (Duracao > 0) NOT NULL 
);
*/

INSERT INTO RotinaTreino VALUES (1, '123cdxPP');
INSERT INTO RotinaTreino VALUES (2, '321xdcPP');
INSERT INTO RotinaTreino VALUES (3, '70r741PP');

/*
INSERT INTO DiasTreino VALUES (	RotinaTreino NUMBER,
	DiaSemana VARCHAR2(10) CHECK (
		DiaSemana IN ('Sunday', 'Monday', 'Tuesday', 'Wednessday', 
					'Thursday', 'Friday', 'Saturnday')
	),
	PRIMARY KEY(RotinaTreino, DiaSemana),
	FOREIGN KEY(RotinaTreino, Preparador) 
		REFERENCES RotinaTreino(IDRotina, Preparador) ON DELETE CASCADE
);
*/

INSERT INTO DiasTreino VALUES (Sunday, 1, '123cdxPP');
INSERT INTO DiasTreino VALUES (Monday, 2, '321xdcPP');
INSERT INTO DiasTreino VALUES (Friday, 3, '70r741PP');

/*
INSERT INTO Preparo VALUES (	IDPreparo NUMBER,
	PRIMARY KEY(IDPreparo),
	DescricaoPreparo VARCHAR2(4000) NOT NULL 
);
*/

INSERT INTO Preparo VALUES (1, 'TODO');
INSERT INTO Preparo VALUES (2, 'TODO');
INSERT INTO Preparo VALUES (3, 'TODO');

/*
INSERT INTO Recuperacao VALUES (	IDRecuperacao NUMBER,
	PRIMARY KEY(IDRecuperacao),
	DescricaoFisioterapia VARCHAR2(4000) NOT NULL 
);
*/

INSERT INTO Recuperacao VALUES (1, 'TODO');
INSERT INTO Recuperacao VALUES (2, 'TODO');
INSERT INTO Recuperacao VALUES (3, 'TODO');

/*
INSERT INTO Treino VALUES (	IDTreino NUMBER,
	PRIMARY KEY(IDTreino),
	DescricaoTreino VARCHAR2(4000) NOT NULL 
);
*/

INSERT INTO Treino VALUES (1, 'TODO');
INSERT INTO Treino VALUES (2, 'TODO');
INSERT INTO Treino VALUES (3, 'TODO');

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

INSERT INTO TesteDoping VALUES (1, 'TODO', 0);
INSERT INTO TesteDoping VALUES (2, 'TODO', 1);
INSERT INTO TesteDoping VALUES (3, 'TODO', 1);

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
