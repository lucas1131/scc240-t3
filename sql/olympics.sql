CREATE TABLE Pessoa (
	PRIMARY KEY(Passaporte) NOT NULL,
	Cidade NOT NULL,
	Estado NOT NULL,
	Pais NOT NULL,
	Sexo NOT NULL,
	DataNascimento (fk) NOT NULL 
);
CREATE TABLE Preparador (
	PRIMARY KEY(Pessoa) (fk) NOT NULL,
	Email NOT NULL,
	Senha NOT NULL 
);
CREATE TABLE Atleta (
	PRIMARY KEY(Pessoa) (fk) NOT NULL,
	Peso NOT NULL,
	Altura NOT NULL,
	Regularidade NOT NULL,
	NPunicoes NOT NULL,
	Preparador (fk) NOT NULL,
	Modalidade (fk) NOT NULL,
	Nacao (fk) NOT NULL 
);
CREATE TABLE TelefonePessoa (
	PRIMARY KEY(Pessoa) (fk) NOT NULL,
	PRIMARY KEY(Telefone) (fk) NOT NULL 
);
CREATE TABLE TelefoneMedico (
	PRIMARY KEY(Medico) (fk) NOT NULL,
	PRIMARY KEY(Telefone) (fk) NOT NULL 
);
CREATE TABLE RotinaTreino (
	PRIMARY KEY(IDRotina) NOT NULL,
	PRIMARY KEY(Preparador) (fk) NOT NULL,
	Duracao NOT NULL 
);
CREATE TABLE PreparadorRotina (
	PRIMARY KEY(RotinaTreino) (fk) NOT NULL,
	PRIMARY KEY(Preparador) (fk) NOT NULL 
);
CREATE TABLE DiasTreino (
	PRIMARY KEY(Rotina) (fk) NOT NULL,
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
	PRIMARY KEY(RotinaTreino) (fk) NOT NULL,
	PRIMARY KEY(Preparo) (fk) NOT NULL 
);
CREATE TABLE RecuperacaoRotina (
	PRIMARY KEY(RotinaTreino) (fk) NOT NULL,
	PRIMARY KEY(Recuperacao) (fk) NOT NULL 
);
CREATE TABLE TreinoRotina (
	PRIMARY KEY(RotinaTreino) (fk) NOT NULL,
	PRIMARY KEY(Treino) (fk) NOT NULL 
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
	PRIMARY KEY(Medico) (fk) NOT NULL,
	PRIMARY KEY(Atleta) (fk) NOT NULL,
	PRIMARY KEY(TesteDoping) (fk) NOT NULL 
);
CREATE TABLE Diagnostico (
	PRIMARY KEY(IDDiagnostico) NOT NULL,
	DescricaoDiagnostico NOT NULL,
	MetodoTratamento (fk) NOT NULL 
);
CREATE TABLE MetodoTratamento (
	PRIMARY KEY(IDMetodo) NOT NULL,
	DescricaoMetodo NOT NULL,
	DescricaoEfetividade 
); 
CREATE TABLE Atendimento (
	PRIMARY KEY(Medico) (fk) NOT NULL,
	PRIMARY KEY(Atleta) (fk) NOT NULL,
	PRIMARY KEY(DataConsulta) (fk) NOT NULL,
	PRIMARY KEY(MedicoConsulta) (fk) NOT NULL,
	PRIMARY KEY(AtletaConsulta) (fk) NOT NULL 
); 
CREATE TABLE Tratamento (
	PRIMARY KEY(Diagnostico) (fk) NOT NULL,
	PRIMARY KEY(MetodoTratamento) (fk) NOT NULL 
);
CREATE TABLE Lesao (
	PRIMARY KEY(IDLesao) NOT NULL,
	Descricao NOT NULL 
);
CREATE TABLE LesaoMedico (
	PRIMARY KEY(Lesao) (fk) NOT NULL,
	PRIMARY KEY(Medico) (fk) NOT NULL 
);
CREATE TABLE LesaoAtleta (
	PRIMARY KEY(Lesao) (fk) NOT NULL,
	PRIMARY KEY(Atleta) (fk) NOT NULL 
);
CREATE TABLE TesteDoping (
	PRIMARY KEY(IDTeste) NOT NULL,
	Data (fk) NOT NULL,
	Descricao,
	Resultado NOT NULL 
); 
CREATE TABLE Consulta (
	PRIMARY KEY(Data) (fk) NOT NULL,
	PRIMARY KEY(Atleta) (fk) NOT NULL,
	PRIMARY KEY(Medico) (fk) NOT NULL,
	DescricaoConsulta,
	Diagnostico (fk) NOT NULL 
); 
CREATE TABLE Sintoma (
	PRIMARY KEY(DataConsulta) (fk) NOT NULL,
	PRIMARY KEY(MedicoConsulta) (fk) NOT NULL,
	PRIMARY KEY(AtletaConsulta) (fk) NOT NULL,
	PRIMARY KEY(Sintoma) NOT NULL 
);
CREATE TABLE Data (
	PRIMARY KEY(Dia) NOT NULL,
	PRIMARY KEY(Mes) NOT NULL,
	PRIMARY KEY(Ano) NOT NULL 
);