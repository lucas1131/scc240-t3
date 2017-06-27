DROP TABLE TelefonePessoa;
DROP TABLE TelefoneMedico;
DROP TABLE DiasTreino;
DROP TABLE PreparoRotina;
DROP TABLE RecuperacaoRotina;
DROP TABLE TreinoRotina;
DROP TABLE TestarDoping;
DROP TABLE Atendimento;
DROP TABLE Tratamento;
DROP TABLE LesaoMedico;
DROP TABLE LesaoAtleta;
DROP TABLE TesteDoping;
DROP TABLE Sintoma;
DROP TABLE RotinaTreino;
DROP TABLE Preparo;
DROP TABLE Recuperacao;
DROP TABLE Treino;
DROP TABLE Lesao;
DROP TABLE Consulta;
DROP TABLE Atleta;
DROP TABLE Preparador;
DROP TABLE Modalidade;
DROP TABLE Nacao;
DROP TABLE Medico;
DROP TABLE Diagnostico;
DROP TABLE MetodoTratamento;
DROP TABLE Pessoa;

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

INSERT INTO Pessoa VALUES ('123cdxPP', 'Airo preparador', 'Guarulhos', 'São Paulo', 'Brasil', 'M', '13-DEC-1996');
INSERT INTO Pessoa VALUES ('321xdcPP', 'Gi preparador', 'Ribeirão Preto', 'São Paulo', 'Brasil', 'F', '28-DEC-1996');
INSERT INTO Pessoa VALUES ('70r741PP', 'Jurg preparador', 'São Paulo', 'São Paulo', 'Brasil', 'M', '13-DEC-1996');
INSERT INTO Pessoa VALUES ('123cdxAA', 'Airo atleta', 'Guarulhos', 'São Paulo', 'Brasil', 'M', '13-DEC-1996');
INSERT INTO Pessoa VALUES ('321xdcAA', 'Gi atleta', 'Ribeirão Preto', 'São Paulo', 'Brasil', 'F', '28-DEC-1996');
INSERT INTO Pessoa VALUES ('70r741AA', 'Jurg atleta', 'São Paulo', 'São Paulo', 'Brasil', 'M', '13-DEC-1996');

INSERT INTO Preparador VALUES ('123cdxPP', 'lucassoares1793@gmail.com', '123456789aA!');
INSERT INTO Preparador VALUES ('321xdcPP', 'xofanna@gimail.com', '123456789aA@');
INSERT INTO Preparador VALUES ('70r741PP', 'tortao@jureg.jurg', '123456789aA#');
INSERT INTO Modalidade VALUES (1, 'Arremeço de peso', 'O objetivo é arremessar o mais longe possível uma bola de metal maciço. Para os homens, o peso tem 7,260 kg; para as mulheres, 4 kg. No arremesso, o atleta mantém o braço flexionado, apoiando o peso junto ao pescoço. Deve permanecer dentro de um círculo com 2,1 metros de diâmetro.');
INSERT INTO Modalidade VALUES (2, '100 Metros Borboleta', '100 Metros Borboleta é a modalidade de velocidade do estilo mariposa da natação.');
INSERT INTO Modalidade VALUES (3, 'Salto triplo', 'O Triplo Salto é uma combinação de três saltos sucessivos que terminam com a queda numa caixa de areia. A prova inicia-se com uma corrida de impulso. ');

INSERT INTO Nacao VALUES ('Brasil', 'America do Sul', 50, NULL, NULL, NULL);
INSERT INTO Nacao VALUES ('Alemanha', 'Europa', 60, 'Futebol', NULL, NULL);
INSERT INTO Nacao VALUES ('Estados Unidos', 'America do Norte', 75, 'Basquete', NULL, NULL);

INSERT INTO Atleta VALUES ('321xdcPP', 1, 'Brasil', '123cdxAA', 100.0, 2.00, 1, 0);
INSERT INTO Atleta VALUES ('70r741PP', 2, 'Alemanha', '321xdcAA', 80.0, 1.80, 1, 1);
INSERT INTO Atleta VALUES ('123cdxPP', 3, 'Estados Unidos', '70r741AA', 120.0, 1.70, 1, 0);	

INSERT INTO TelefonePessoa VALUES ('123cdxPP', 33334444);
INSERT INTO TelefonePessoa VALUES ('321xdcPP', 12345678);
INSERT INTO TelefonePessoa VALUES ('70r741PP', 87654321);
INSERT INTO TelefonePessoa VALUES ('123cdxAA', 12312312);
INSERT INTO TelefonePessoa VALUES ('321xdcAA', 66666666);
INSERT INTO TelefonePessoa VALUES ('70r741AA', 25252525);

INSERT INTO Medico VALUES ('123456789aaa', 396440216, 'Airo medico', 'Guarulhos', 'São Paulo', 'Brasil');
INSERT INTO Medico VALUES ('987654321bbb', 825500244, 'Gi medico', 'Ribeirão Preto', 'São Paulo', 'Brasil');
INSERT INTO Medico VALUES ('123987456ccc', 111222355, 'Jurg medico', 'São Paulo', 'São Paulo', 'Brasil');

INSERT INTO TelefoneMedico VALUES ('123456789aaa', 44443333);
INSERT INTO TelefoneMedico VALUES ('987654321bbb', 22224444);
INSERT INTO TelefoneMedico VALUES ('123987456ccc', 12121212);

INSERT INTO RotinaTreino VALUES (1, '123cdxPP', 180);
INSERT INTO RotinaTreino VALUES (2, '321xdcPP', 240);
INSERT INTO RotinaTreino VALUES (3, '70r741PP', 150);

INSERT INTO DiasTreino VALUES (1, '123cdxPP', 'Sunday');
INSERT INTO DiasTreino VALUES (2, '321xdcPP', 'Monday');
INSERT INTO DiasTreino VALUES (3, '70r741PP', 'Friday');

INSERT INTO Preparo VALUES (1, 'O atleta realiza cerca de 10m de alongamento e 30m de corrida para aquecimento antes de qualquer treino.');
INSERT INTO Preparo VALUES (2, 'O atleta realiza cerca de 15m de alongamento e 20m de corrida para aquecimento antes de qualquer treino.');
INSERT INTO Preparo VALUES (3, 'O atleta realiza cerca de 20m de alongamento e 40m de corrida para aquecimento antes de qualquer treino.');

INSERT INTO Recuperacao VALUES (1, 'O Atleta realizou 10 sessões de fisioterapia');
INSERT INTO Recuperacao VALUES (2, 'O Atleta realizou 15 sessões com o psicólogo');
INSERT INTO Recuperacao VALUES (3, 'O Atleta permaneceu afastado, em repouso, por um período de um mês');

INSERT INTO Treino VALUES (1, 'Musculação');
INSERT INTO Treino VALUES (2, 'Agachamento');
INSERT INTO Treino VALUES (3, 'Flexões');

INSERT INTO PreparoRotina VALUES (1, '123cdxPP', 1);
INSERT INTO PreparoRotina VALUES (2, '321xdcPP', 2);
INSERT INTO PreparoRotina VALUES (3, '70r741PP', 3);

INSERT INTO RecuperacaoRotina VALUES (1, '123cdxPP', 1);
INSERT INTO RecuperacaoRotina VALUES (2, '321xdcPP', 2);
INSERT INTO RecuperacaoRotina VALUES (3, '70r741PP', 3);

INSERT INTO TreinoRotina VALUES (1, '123cdxPP', 1);
INSERT INTO TreinoRotina VALUES (2, '321xdcPP', 2);
INSERT INTO TreinoRotina VALUES (3, '70r741PP', 3);

INSERT INTO TesteDoping VALUES (1, 'Exame de sangue', 0);
INSERT INTO TesteDoping VALUES (2, 'Exame de urina', 0);
INSERT INTO TesteDoping VALUES (3, 'Exame de sangue e urina', 0);

INSERT INTO TestarDoping VALUES ('123456789aaa', '123cdxAA', 1);
INSERT INTO TestarDoping VALUES ('987654321bbb', '321xdcAA', 2);
INSERT INTO TestarDoping VALUES ('123987456ccc', '70r741AA', 3);

INSERT INTO MetodoTratamento VALUES (1, 'Ingerir medicação receitada', 'Muito efetivo');
INSERT INTO MetodoTratamento VALUES (2, 'Repouso', 'Pouco Efetivo');
INSERT INTO MetodoTratamento VALUES (3, 'Placebo', 'Inútil');

INSERT INTO Diagnostico VALUES (1, 'TODO');
INSERT INTO Diagnostico VALUES (2, 'TODO');
INSERT INTO Diagnostico VALUES (3, 'TODO');

INSERT INTO Consulta VALUES ('08-AUG-2017', '123cdxAA', '123456789aaa', 1, 'O Atleta de passaporte 123cdxPP foi atendido pelo médico de CRM 123456789aaa. Quadro não urgente');
INSERT INTO Consulta VALUES ('12-AUG-2017', '321xdcAA', '987654321bbb', 2, 'O Atleta de passaporte 321xdcPP foi atendido pelo médico de CRM 987654321bbb. Quadro urgente');
INSERT INTO Consulta VALUES ('30-JUL-2017', '70r741AA', '123987456ccc', 3, 'O Atleta de passaporte 321xdcPP foi atendido pelo médico de CRM 123987456ccc. Quadro não urgente');

INSERT INTO Atendimento VALUES ('123cdxAA', '123456789aaa', '08-AUG-2017');
INSERT INTO Atendimento VALUES ('321xdcAA', '987654321bbb', '12-AUG-2017');
INSERT INTO Atendimento VALUES ('70r741AA', '123987456ccc', '30-JUL-2017');

INSERT INTO Tratamento VALUES (1, 1);
INSERT INTO Tratamento VALUES (2, 2);
INSERT INTO Tratamento VALUES (3, 3);

INSERT INTO Lesao VALUES (1, 'Fratura no fêmur');
INSERT INTO Lesao VALUES (2, 'Rompimento do tendão');
INSERT INTO Lesao VALUES (3, 'Fratura no pé');

INSERT INTO LesaoMedico VALUES (1, '123456789aaa');
INSERT INTO LesaoMedico VALUES (2, '987654321bbb');
INSERT INTO LesaoMedico VALUES (3, '123987456ccc');

INSERT INTO LesaoAtleta VALUES (1, '123cdxAA');
INSERT INTO LesaoAtleta VALUES (2, '321xdcAA');
INSERT INTO LesaoAtleta VALUES (3, '70r741AA');

INSERT INTO Sintoma VALUES ('08-AUG-2017', '123456789aaa', '123cdxAA', 'TODO');
INSERT INTO Sintoma VALUES ('12-AUG-2017', '987654321bbb', '321xdcAA', 'TODO');
INSERT INTO Sintoma VALUES ('30-JUL-2017', '123987456ccc', '70r741AA', 'TODO');

COMMIT;