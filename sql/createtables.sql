CREATE TABLE Forma_de_Pagamento(
    Metodo,
        PRIMARY KEY (Metodo)
);


CREATE TABLE Cartao_de_Credito(
    Forma_de_Pagamento,
        PRIMARY KEY (Forma_de_Pagamento),
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Metodo) ON DELETE SET NULL,
    Bandeira,
    Codigo_de_seguranca,
    Vencimento_do_cartao,
    Nome,
    Numero_do_cartao
);


CREATE TABLE Deposito_Bancario(
    Forma_de_Pagamento,
        PRIMARY KEY (Forma_de_Pagamento),
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Metodo) ON DELETE SET NULL,
    Conta,
    Agencia,
    Banco,
    Nome_titular,
    Sobrenome_titular,
    CPF
);


CREATE TABLE Paypal(
    Forma_de_Pagamento,
        PRIMARY KEY (Forma_de_Pagamento),
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Metodo) ON DELETE SET NULL,
    Senha,
    Email_paypal
);


CREATE TABLE Midia(
    Titulo,
        PRIMARY KEY (Titulo),
    Tipo NOT NULL,
    Thumbnail,
    Lancamento,
    Duracao,
    Sinopse,
    Classificacao
);


CREATE TABLE Perfil(
    Alias,
        PRIMARY KEY (Alias),
    Nome_usuario_Conta,
        PRIMARY KEY (Nome_usuario_Conta),
        FOREIGN KEY (Nome_usuario_Conta) REFERENCES Conta(Nome_de_usuario) ON DELETE SET NULL,
    Idade NOT NULL,
    Preferencia_qualidade,
    Preferencia_legenda,
    Preferencia_idioma,
    Faixa_etaria
);


CREATE TABLE Plano(
    Nome,
        PRIMARY KEY (Nome),
    Preco,
    Qualidade,
    Videos_simultaneos,
    Numero_de_perfis,
    Outras_descricoes
);


CREATE TABLE Conta_Assina_Plano(
    Nome_Plano,
        PRIMARY KEY (Nome_Plano),
        FOREIGN KEY (Nome_Plano) REFERENCES Plano(Nome) ON DELETE SET NULL,
    Nome_de_usuario_Conta,
        PRIMARY KEY (Nome_de_usuario_Conta),
        FOREIGN KEY (Nome_de_usuario_Conta) REFERENCES Conta(Nome_de_usuario) ON DELETE SET NULL
);


CREATE TABLE Assinatura(
    Data_vigor,
        PRIMARY KEY (Data_vigor),
    Nome_Plano,
        PRIMARY KEY (Nome_Plano),
        FOREIGN KEY (Nome_Plano) REFERENCES Plano(Nome) ON DELETE SET NULL,
    Nome_de_usuario_Conta,
        PRIMARY KEY (Nome_de_usuario_Conta),
        FOREIGN KEY (Nome_de_usuario_Conta) REFERENCES Conta(Nome_de_usuario) ON DELETE SET NULL
);


CREATE TABLE Pagamento(
    Codigo_da_fatura,
        PRIMARY KEY (Codigo_da_fatura),
    Data_vigor_Assinatura NOT NULL,
        FOREIGN KEY (Data_vigor_Assinatura) REFERENCES Assinatura(Data_vigor) ON DELETE SET NULL,
    Nome_Assinatura NOT NULL,
        FOREIGN KEY (Nome_Assinatura) REFERENCES Assinatura(Nome_Plano) ON DELETE SET NULL,
    Nome_de_usuario_Assinatura NOT NULL,
        FOREIGN KEY (Nome_de_usuario_Assinatura) REFERENCES Assinatura(Nome_de_usuario_Conta) ON DELETE SET NULL,
    Valor,
    Periodo
);


CREATE TABLE Conta(
    Nome_de_usuario,
        PRIMARY KEY (Nome_de_usuario),
    Forma_de_Pagamento NOT NULL,
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Forma_de_Pagamento) ON DELETE SET NULL,
    Senha,
    Nome,
    CPF,
    Email,
    Data_de_nascimento
);


CREATE TABLE Perfil_Prefere_Genero(
    Alias_Perfil,
        PRIMARY KEY (Alias_Perfil),
        FOREIGN KEY (Alias_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    Nome_de_usuario_Perfil,
        PRIMARY KEY (Nome_de_usuario_Perfil),
        FOREIGN KEY (Nome_de_usuario_Perfil) REFERENCES Perfil(Nome_usuario_Conta) ON DELETE SET NULL,
    Nome_Genero,
        PRIMARY KEY (Nome_Genero),
        FOREIGN KEY (Nome_Genero) REFERENCES Genero(Nome) ON DELETE SET NULL,
    Nota
);


CREATE TABLE Genero(
    Nome,
        PRIMARY KEY (Nome)
);


CREATE TABLE Perfil_Solicita_Amizade(
    Alias_fez_solicitacao_Perfil,
        PRIMARY KEY (Alias_fez_solicitacao_Perfil),
        FOREIGN KEY (Alias_fez_solicitacao_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    Nome_de_usuario_fez_solicitacao_Perfil,
        PRIMARY KEY (Nome_de_usuario_fez_solicitacao_Perfil),
        FOREIGN KEY (Nome_de_usuario_fez_solicitacao_Perfil) REFERENCES Perfil(Nome_de_usuario) ON DELETE SET NULL,
    Alias_recebe_solicitacao_Perfil,
        PRIMARY KEY (Alias_recebe_solicitacao_Perfil),
        FOREIGN KEY (Alias_recebe_solicitacao_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    Nome_de_usuario_recebe_solicitacao_Perfil,
        PRIMARY KEY (Nome_de_usuario_recebe_solicitacao_Perfil),
        FOREIGN KEY (Nome_de_usuario_recebe_solicitacao_Perfil) REFERENCES Perfil(Nome_de_usuario) ON DELETE SET NULL,
    Aceitou,
    Data_solicitacao
);


CREATE TABLE Perfil_Assiste_Midia(
    Alias_Perfil,
        PRIMARY KEY (Alias_Perfil),
        FOREIGN KEY (Alias_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    Nome_usuario_Perfil,
        PRIMARY KEY (Nome_usuario_Perfil),
        FOREIGN KEY (Nome_usuario_Perfil) REFERENCES Perfil(Nome_usuario_Conta) ON DELETE SET NULL,
    Titulo_Midia,
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    Id_Review,
        FOREIGN KEY (Id_Review) REFERENCES Review(Id) ON DELETE SET NULL,
    Tempo
);


CREATE TABLE Publica(
    Id,
        PRIMARY KEY (Id),
    Nota,
    Data_nota,
    Comentario,
    Data_comentario
);


-- TODO review
CREATE TABLE Gerencia(
    Alias_adulto_gerencia_Perfil NOT NULL,
        FOREIGN KEY (Alias_adulto_gerencia_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    Nome_usuario_adulto_gerencia_Perfil NOT NULL,
        FOREIGN KEY (Nome_usuario_adulto_gerencia_Perfil) REFERENCES Perfil(Nome_usuario_Conta) ON DELETE SET NULL,
    Alias_kids_gerenciado_Perfil,
        PRIMARY KEY (Alias_kids_gerenciado_Perfil),
        FOREIGN KEY (Alias_kids_gerenciado_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    Nome_usuario_kids_gerenciado_Perfil,
        PRIMARY KEY (Nome_usuario_kids_gerenciado_Perfil),
        FOREIGN KEY (Nome_usuario_kids_gerenciado_Perfil) REFERENCES Perfil(Nome_de_usuario_Conta) ON DELETE SET NULL
);


CREATE TABLE Audio_Midia(
    Audio,
        PRIMARY KEY (Audio),
    Titulo,
        PRIMARY KEY (Titulo),
        FOREIGN KEY (Titulo) REFERENCES Midia(Titulo) ON DELETE SET NULL 
);


CREATE TABLE Legenda_Midia(
    Legenda,
        PRIMARY KEY (Legenda),
    Titulo,
        PRIMARY KEYFOREIGN (Titulo) KEY KEYT) KEY REFERENCES ON DELETE SET NULL 
    Midia
);


CREATE TABLE Midia_Pertence_Genero(
    Titulo_Midia,
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    Nome_Genero,
        PRIMARY KEY (Nome_Genero),
        FOREIGN KEY (Nome_Genero) REFERENCES Genero(Nome) ON DELETE SET NULL
);


CREATE TABLE Midia_Pertence_Temporada(
    Titulo_Midia,
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    Numero_Temporada,
        PRIMARY KEY (Numero_Temporada),
        FOREIGN KEY (Numero_Temporada) REFERENCES Numero_Temporada(Numero) ON DELETE SET NULL
);


CREATE TABLE Temporada_Midia(
    Titulo_Midia,
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    Numero_Temporada,
        PRIMARY KEY (Numero_Temporada),
        FOREIGN KEY (Numero_Temporada) REFERENCES Temporada(Numero) ON DELETE SET NULL
);


CREATE TABLE Review(
    Id,
        PRIMARY KEY (Id),
    Nota,
    Data_Nota,
    Comentario,
    Data_Comentario
);


CREATE TABLE Perfil_Assiste_Midia(
    Alias_Perfil,
        PRIMARY KEY (Alias_Perfil),
        FOREIGN KEY (Alias_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    Nome_de_usuario_Perfil,
        PRIMARY KEY (Nome_de_usuario_Perfil),
        FOREIGN KEY (Nome_de_usuario_Perfil) REFERENCES Perfil(Nome_usuario_Conta) ON DELETE SET NULL,
    Titulo_Midia,
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    Id_Review,
        FOREIGN KEY (Id_Review) REFERENCES Review(Id) ON DELETE SET NULL,
    Tempo
);


CREATE TABLE Acesso(
    Timestamp,
        PRIMARY KEY (Timestamp),
    Nome_Dispositivo,
        PRIMARY KEY (Nome_Dispositivo),
        FOREIGN KEY (Nome_Dispositivo) REFERENCES Dispositivo(Nome) ON DELETE SET NULL,
    Alias_Perfil,
        PRIMARY KEY (Alias_Perfil),
        FOREIGN KEY (Alias_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    Ip
);


CREATE TABLE Perfil_Possui_Dispositivo(
    Id_Dispositivo,
        PRIMARY KEY (Id_Dispositivo),
        FOREIGN KEY (Id_Dispositivo) REFERENCES Id_Dispositivo(Id) ON DELETE SET NULL,
    Alias_Perfil,
        PRIMARY KEY (Alias_Perfil),
        FOREIGN KEY (Alias_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    Nome_de_usuario_Perfil,
        PRIMARY KEY (Nome_de_usuario_Perfil),
        FOREIGN KEY (Nome_de_usuario_Perfil) REFERENCES Perfil(Nome_usuario_Conta) ON DELETE SET NULL
);


CREATE TABLE Dispositivo(
    Id,
        PRIMARY KEY (Id),
    Nome,
    Sistema_operacional
);


CREATE TABLE Amizade(
    Id,
        PRIMARY KEY (Id),
    Alias_fez_solicitacao_Perfil,
        PRIMARY KEY (Alias_fez_solicitacao_Perfil),
        FOREIGN KEY (Alias_fez_solicitacao_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    Nome_de_usuario_fez_solicitacao_Perfil,
        PRIMARY KEY (Nome_de_usuario_fez_solicitacao_Perfil),
        FOREIGN KEY (Nome_de_usuario_fez_solicitacao_Perfil) REFERENCES Perfil(Nome_de_usuario) ON DELETE SET NULL,
    Alias_recebe_solicitacao_Perfil,
        PRIMARY KEY (Alias_recebe_solicitacao_Perfil),
        FOREIGN KEY (Alias_recebe_solicitacao_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    Nome_de_usuario_recebe_solicitacao_Perfil,
        PRIMARY KEY (Nome_de_usuario_recebe_solicitacao_Perfil),
        FOREIGN KEY (Nome_de_usuario_recebe_solicitacao_Perfil) REFERENCES Perfil(Nome_de_usuario) ON DELETE SET NULL
);


CREATE TABLE Amizade_Recomenda_Midia(
    Id_Amizade,
        PRIMARY KEY (Id_Amizade),
        FOREIGN KEY (Id_Amizade) REFERENCES Id_Amizade(Id) ON DELETE SET NULL,
    Alias_fez_solicitacao_Perfil,
        PRIMARY KEY (Alias_fez_solicitacao_Perfil),
        FOREIGN KEY (Alias_fez_solicitacao_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    Nome_de_usuario_fez_solicitacao_Perfil,
        PRIMARY KEY (Nome_de_usuario_fez_solicitacao_Perfil),
        FOREIGN KEY (Nome_de_usuario_fez_solicitacao_Perfil) REFERENCES Perfil(Nome_de_usuario) ON DELETE SET NULL,
    Alias_recebe_solicitacao_Perfil,
        PRIMARY KEY (Alias_recebe_solicitacao_Perfil),
        FOREIGN KEY (Alias_recebe_solicitacao_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    Nome_de_usuario_recebe_solicitacao_Perfil,
        PRIMARY KEY (Nome_de_usuario_recebe_solicitacao_Perfil),
        FOREIGN KEY (Nome_de_usuario_recebe_solicitacao_Perfil) REFERENCES Perfil(Nome_de_usuario) ON DELETE SET NULL,
    Titulo_Midia,
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    Comentario_de_recomendacao
);


CREATE TABLE Temporada(
    Numero,
        PRIMARY KEY (Numero),
    Nome_Serie NOT NULL,
        FOREIGN KEY (Nome_Serie) REFERENCES Serie(Nome) ON DELETE SET NULL,
    Numero_de_episodios
);


CREATE TABLE Serie(
    Nome,
        PRIMARY KEY (Nome),
    Numero_temporadas,
    Classificacao
);


CREATE TABLE Pessoa(
    Nome,
        PRIMARY KEY (Nome)
);


CREATE TABLE Midia_Pessoa(
    Titulo_Midia,
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    Nome_Pessoa,
        PRIMARY KEY (Nome_Pessoa),
        FOREIGN KEY (Nome_Pessoa) REFERENCES Pessoa(Nome) ON DELETE SET NULL,
    Diretor,
    Ator
);


CREATE TABLE Serie_Pessoa(
    Nome_Serie,
        PRIMARY KEY (Nome_Serie),
        FOREIGN KEY (Nome_Serie) REFERENCES Serie(Nome) ON DELETE SET NULL,
    Nome_Pessoa,
        PRIMARY KEY (Nome_Pessoa),
        FOREIGN KEY (Nome_Pessoa) REFERENCES Pessoa(Nome) ON DELETE SET NULL,
        --checar tabela serie
    Diretor,
    Ator
);


CREATE TABLE Pessoa_Participa_Midia(
    Titulo_Midia,
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    Nome_Pessoa,
        PRIMARY KEY (Nome_Pessoa),
        FOREIGN KEY (Nome_Pessoa) REFERENCES Pessoa(Nome) ON DELETE SET NULL,
    Diretor,
    Ator
);


CREATE TABLE Pessoa_Participa_Serie(
    Titulo_Midia,
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    Nome_Pessoa,
        PRIMARY KEY (Nome_Pessoa),
        FOREIGN KEY (Nome_Pessoa) REFERENCES Pessoa(Nome) ON DELETE SET NULL,
    Diretor,
    Ator
);


CREATE TABLE Perfil(
    Alias,
        PRIMARY KEY (Alias),

    Nome_usuario_Conta,
        PRIMARY KEY (Nome_usuario_Conta),
        FOREIGN KEY (Nome_usuario_Conta) REFERENCES Conta(Nome_de_usuario) ON DELETE SET NULL,
    Idade_Faixa_Etaria NOT NULL,
        FOREIGN KEY (Idade_Faixa_Etaria) REFERENCES Idade(Faixa_Etaria) ON DELETE SET NULL,
    Preferencia_qualidade,
    Preferencia_legenda,
    Preferencia_idioma
);


CREATE TABLE Idade_Faixa_Etaria(
    Idade,
        PRIMARY KEY (Idade),
    Faixa_Etaria
);


CREATE TABLE Deposito_Bancario(
    Forma_de_Pagamento,
        PRIMARY KEY (Forma_de_Pagamento),
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Metodo) ON DELETE SET NULL,
    Conta_Deposito_Bancario,
        FOREIGN KEY (Conta_Deposito_Bancario) REFERENCES Conta_Deposito_Bancario(Conta) ON DELETE SET NULL,
    Agencia_Deposito_Bancario,
        FOREIGN KEY (Agencia_Deposito_Bancario) REFERENCES Agencia_Deposito_Bancario(Agencia) ON DELETE SET NULL
);


CREATE TABLE Conta_do_Deposito_Bancario(
    Conta,
        PRIMARY KEY (Conta),
    Agencia,
    Banco,
    Nome_titular,
    Sobrenome_titular,
    CPF
);


CREATE TABLE Cartao_de_Credito(
    Forma_de_Pagamento,
        PRIMARY KEY (Forma_de_Pagamento),
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Metodo) ON DELETE SET NULL,
    Numero_do_cartao,
        FOREIGN KEY (Numero_do_cartao) REFERENCES Numero_do_cartao(Numero_do_cartao) ON DELETE SET NULL
);


CREATE TABLE Numero_do_Cartao_de_Credito(
    Numero_do_cartao,
        PRIMARY KEY (Numero_do_cartao),
    Bandeira,
    Codigo_de_seguranca,
    Vencimento_do_cartao,
    Nome
);



-- Exemplos

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
        FOREIGN KEY (Pessoa) REFERENCES Pessoa(Passaporte) ON DELETE SET NULL,
    Email VARCHAR(50) CHECK (
        REGEXP_LIKE(Email, '^[a-zA-Z0-9.\_]+@[a-zA-Z]+(\.[a-z]+)+$')
    ) NOT NULL,
    Senha VARCHAR(30) NOT NULL 
);

CREATE TABLE Atleta (
    Preparador CHAR(8),
        FOREIGN KEY (Preparador) REFERENCES Preparador(Pessoa) ON DELETE SET NULL,
    Modalidade NUMBER,
        FOREIGN KEY (Modalidade) REFERENCES Modalidade(IDModalidade) ON DELETE SET NULL,
    Nacao VARCHAR2(50),
        FOREIGN KEY (Nacao) REFERENCES Nacao(NomeNacao) ON DELETE SET NULL,
    Pessoa CHAR(8),
        PRIMARY KEY(Pessoa),
        FOREIGN KEY (Pessoa) REFERENCES Pessoa(Passaporte) ON DELETE SET NULL,
    Peso NUMBER CHECK (Peso > 0) NOT NULL,
    Altura NUMBER CHECK (Altura > 0) NOT NULL,
    Regularidade NUMBER(1, 0) NOT NULL,
    NPunicoes NUMBER CHECK (NPunicoes >= 0) NOT NULL
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
        REFERENCES RotinaTreino(IDRotina, Preparador) ON DELETE SET NULL
);
