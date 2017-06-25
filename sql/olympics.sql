CREATE TABLE Pessoa (
	PRIMARY KEY(Passaporte) NOT NULL,
	Cidade NOT NULL,
	Estado NOT NULL,
	Pais NOT NULL,
	Sexo NOT NULL,
	FOREIGN KEY (DataNascimento) NOT NULL,
	FOREIGN KEY (DataNascimento) REFERENCES Data(Dia, Mes, Ano) 
);
CREATE TABLE Preparador (
	PRIMARY KEY(Pessoa) NOT NULL,
	FOREIGN KEY(Pessoa) REFERENCES Pessoa(Passaporte),
	Email NOT NULL,
	Senha NOT NULL 
);
CREATE TABLE Atleta (
	PRIMARY KEY(Pessoa) NOT NULL,
	FOREIGN KEY(Pessoa) REFERENCES Pessoa(Passaporte),
	Peso NOT NULL,
	Altura NOT NULL,
	Regularidade NOT NULL,
	NPunicoes NOT NULL,
	FOREIGN KEY(Preparador) NOT NULL,
	FOREIGN KEY(Preparador) REFERENCES Preparador(Passaporte),
	FOREIGN KEY(Modalidade) NOT NULL,
	FOREIGN KEY(Modalidade) REFERENCES Modalidade(IDModalidade),
	FOREIGN KEY(Nacao) NOT NULL,
	FOREIGN KEY(Nacao) REFERENCES Nacao(NomeNacao) 
);
CREATE TABLE TelefonePessoa (
	PRIMARY KEY(Pessoa) NOT NULL,
	FOREIGN KEY(Pessoa) REFERENCES Pessoa(Passaporte),
	PRIMARY KEY(Telefone) NOT NULL
);
CREATE TABLE TelefoneMedico (
	PRIMARY KEY(Medico) NOT NULL,
	FOREIGN KEY(Medico) REFERENCES Medico(CRM),
	PRIMARY KEY(Telefone) NOT NULL,
	FOREIGN KEY(Telefone) REFERENCES Telefone(Pessoa, Telefone) 
);
CREATE TABLE RotinaTreino (
	PRIMARY KEY(IDRotina) NOT NULL,
	PRIMARY KEY(Preparador) NOT NULL,
	FOREIGN KEY(Preparador) REFERENCES Preparador(Passaporte),
	Duracao NOT NULL 
);
CREATE TABLE DiasTreino (
	PRIMARY KEY(RotinaTreino) NOT NULL,
	FOREIGN KEY(RotinaTreino) REFERENCES RotinaTreino(IDRotina, Preparador),
	PRIMARY KEY(DiaSemana) NOT NULL 
);
CREATE TABLE Preparo (
	PRIMARY KEY(IDPreparo) NOT NULL,
	DescricaoPreparo NOT NULL 
);
CREATE TABLE Recuperacao (
	PRIMARY KEY(IDRecuperacao) NOT NULL,
	DescricaoFisioterapia NOT NULL 
);
CREATE TABLE Treino (
	PRIMARY KEY(IDTreino) NOT NULL,
	DescricaoTreino NOT NULL 
);
CREATE TABLE PreparoRotina (
	PRIMARY KEY(RotinaTreino) NOT NULL,
	FOREIGN KEY(RotinaTreino) REFERENCES RotinaTreino(IDRotina, Preparador),
	PRIMARY KEY(Preparo) NOT NULL,
	FOREIGN KEY(Preparo) REFERENCES Preparo(IDPreparo) 
);
CREATE TABLE RecuperacaoRotina (
	PRIMARY KEY(RotinaTreino) NOT NULL,
	FOREIGN KEY(RotinaTreino) REFERENCES RotinaTreino(IDRotina, Preparador),
	PRIMARY KEY(Recuperacao) NOT NULL,
	FOREIGN KEY(Recuperacao) REFERENCES Recuperacao(IDRecuperacao)
);
CREATE TABLE TreinoRotina (
	PRIMARY KEY(RotinaTreino) NOT NULL,
	FOREIGN KEY(RotinaTreino) REFERENCES RotinaTreino(IDRotina)
	PRIMARY KEY(Treino) NOT NULL
	FOREIGN KEY(Treino) REFERENCES Treino(IDTreino) 
);
CREATE TABLE Modalidade (
	PRIMARY KEY(IDModalidade) NOT NULL,
	Nome NOT NULL,
	Descricao NOT NULL 
); 
CREATE TABLE Nacao (
	PRIMARY KEY(NomeNacao) NOT NULL,
	Continente NOT NULL,
	NAtletas NOT NULL,
	EsportePrincipal,
	Bandeira NOT NULL,
	Hino NOT NULL 
);
CREATE TABLE Medico (
	PRIMARY KEY(CRM) NOT NULL,
	Identidade NOT NULL,
	Nome NOT NULL,
	Cidade NOT NULL,
	Estado NOT NULL,
	Pais NOT NULL 
);
CREATE TABLE TestarDoping (
	PRIMARY KEY(Medico) NOT NULL,
	FOREIGN KEY(Medico) REFERENCES Medico(CRM),
	PRIMARY KEY(Atleta) NOT NULL,
	FOREIGN KEY(Atleta) REFERENCES Atleta(Passaporte),
	PRIMARY KEY(TesteDoping) NOT NULL,
	FOREIGN KEY(TesteDoping) REFERENCES TesteDoping(IDTeste)
);
CREATE TABLE Diagnostico (
	PRIMARY KEY(IDDiagnostico) NOT NULL,
	DescricaoDiagnostico NOT NULL
);
CREATE TABLE MetodoTratamento (
	PRIMARY KEY(IDMetodo) NOT NULL,
	DescricaoMetodo NOT NULL,
	DescricaoEfetividade 
); 
CREATE TABLE Atendimento (
	PRIMARY KEY(MedicoConsulta) NOT NULL,
	FOREIGN KEY(MedicoConsulta) REFERENCES Consulta(Medico),
	PRIMARY KEY(AtletaConsulta) NOT NULL,
	FOREIGN KEY(AtletaConsulta) REFERENCES Consulta(Atleta),
	PRIMARY KEY(DataConsulta) NOT NULL,
	FOREIGN KEY(DataConsulta) REFERENCES Data(Dia, Mes, Ano)
); 
CREATE TABLE Tratamento (
	PRIMARY KEY(Diagnostico) NOT NULL,
	FOREIGN KEY(Diagnostico) REFERENCES Diagnostico(IDDiagnostico),
	PRIMARY KEY(MetodoTratamento) NOT NULL,
	FOREIGN KEY(MetodoTratamento) REFERENCES MetodoTratamento(IDMetodo) 
);
CREATE TABLE Lesao (
	PRIMARY KEY(IDLesao) NOT NULL,
	Descricao NOT NULL 
);
CREATE TABLE LesaoMedico (
	PRIMARY KEY(Lesao) NOT NULL,
	FOREIGN KEY(Lesao) REFERENCES Lesao(IDLesao),
	PRIMARY KEY(Medico) NOT NULL,
	FOREIGN KEY(Medico) REFERENCES Medico(CRM)
);
CREATE TABLE LesaoAtleta (
	PRIMARY KEY(Lesao) NOT NULL,
	FOREIGN KEY(Lesao) REFERENCES Lesao(IDLesao),
	PRIMARY KEY(Atleta) NOT NULL,
	FOREIGN KEY(Atleta) REFERENCES Atleta(Passaporte)
);
CREATE TABLE TesteDoping (
	PRIMARY KEY(IDTeste) NOT NULL,
	FOREIGN KEY(Data) NOT NULL,
	FOREIGN KEY(Data) REFERENCES Data(Dia, Mes, Ano),
	Descricao,
	Resultado NOT NULL 
); 
CREATE TABLE Consulta (
	FOREIGN KEY(Data) NOT NULL,
	FOREIGN KEY(Data) REFERENCES Data(Dia, Mes, Ano),
	PRIMARY KEY(Atleta) NOT NULL,
	FOREIGN KEY(Atleta) REFERENCES Atleta(Passaporte),
	PRIMARY KEY(Medico) NOT NULL,
	FOREIGN KEY(Medico) REFERENCES Medico(CRM),
	DescricaoConsulta,
	Diagnostico NOT NULL,
	PRIMARY KEY(Diagnostico) NOT NULL,
	FOREIGN KEY(Diagnostico) REFERENCES Diagnostico(IDDiagnostico)
); 
CREATE TABLE Sintoma (
	PRIMARY KEY(DataConsulta) NOT NULL,
	FOREIGN KEY(DataConsulta) REFERENCES Consulta(Data),
	PRIMARY KEY(MedicoConsulta) NOT NULL,
	FOREIGN KEY(MedicoConsulta) REFERENCES Consulta(Medico),
	PRIMARY KEY(AtletaConsulta) NOT NULL,
	FOREIGN KEY(MedicoConsulta) REFERENCES Consulta(Atleta),
	PRIMARY KEY(Sintoma) NOT NULL 
);
CREATE TABLE Data (
	PRIMARY KEY(Dia) NOT NULL,
	PRIMARY KEY(Mes) NOT NULL,
	PRIMARY KEY(Ano) NOT NULL 
);