CREATE TABLE Genero (
    Nome VARCHAR2(30),
        PRIMARY KEY (Nome)
);


CREATE TABLE Numero_do_Cartao_de_Credito (
    Numero_do_cartao NUMBER(16),
        PRIMARY KEY (Numero_do_cartao),
    Bandeira VARCHAR2(15),
    Codigo_de_seguranca NUMBER(3),
    Vencimento_do_cartao DATE,
    Nome VARCHAR2(50)
);


CREATE TABLE Conta_do_Deposito_Bancario (
    Conta NUMBER(6),
        PRIMARY KEY (Conta),
    Agencia NUMBER(5),
    Banco VARCHAR2(20),
    Nome_titular VARCHAR2(50),
    Sobrenome_titular VARCHAR2(50),
    CPF NUMBER(11)
);


CREATE TABLE Idade_Faixa_Etaria (
    Idade NUMBER,
        PRIMARY KEY (Idade),
        CHECK (Idade > 0),
    Faixa_Etaria NUMBER
        CHECK (Faixa_Etaria >= 0)
);


CREATE TABLE Pessoa (
    Nome VARCHAR2(50),
        PRIMARY KEY (Nome)
);


CREATE TABLE Serie (

    Nome VARCHAR2(100),
        PRIMARY KEY (Nome),

    Numero_temporadas NUMBER CHECK (Numero_temporadas >= 0),

    Classificacao NUMBER CHECK (Classificacao >= 0)
);


CREATE TABLE Dispositivo (

    Id NUMBER CHECK (Id >= 0),
        PRIMARY KEY (Id),

    Nome VARCHAR2(50),

    Sistema_operacional VARCHAR2(50)
);


CREATE TABLE Review (

    Id NUMBER CHECK (Id >= 0),
        PRIMARY KEY (Id),

    Nota NUMBER CHECK (Nota >= 0 AND Nota <= 10,

    Data_Nota DATE,

    Comentario VARCHAR2(300),

    Data_Comentario DATE
);


CREATE TABLE Temporada_Midia (

    Titulo_Midia VARCHAR2(100),
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,

    Numero_Temporada NUMBER CHECK (Numero_Temporada >= 0),
        PRIMARY KEY (Numero_Temporada),
        FOREIGN KEY (Numero_Temporada) REFERENCES Temporada(Numero) ON DELETE SET NULL
);


CREATE TABLE Perfil_Assiste_Midia (

    Alias_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Alias_fez_solicitacao_Perfil, '[a-zA-Z[:digit:]]+')
        ),
        PRIMARY KEY (Alias_Perfil),
        FOREIGN KEY (Alias_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,

    Nome_de_usuario_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Alias_fez_solicitacao_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        PRIMARY KEY (Nome_de_usuario_Perfil),
        FOREIGN KEY (Nome_de_usuario_Perfil) REFERENCES Perfil(Nome_usuario_Conta) ON DELETE SET NULL,

    Titulo_Midia VARCHAR2(100),
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,

    Id_Review NUMBER CHECK (Id_Review >= 0),
        FOREIGN KEY (Id_Review) REFERENCES Review(Id) ON DELETE SET NULL,

    Tempo NUMBER
);


CREATE TABLE Acesso (

    Timestamp_Acesso TIMESTAMP,
        PRIMARY KEY (Timestamp_Acesso),

    Nome_Dispositivo VARCHAR2(50),
        PRIMARY KEY (Nome_Dispositivo),
        FOREIGN KEY (Nome_Dispositivo) REFERENCES Dispositivo(Nome) ON DELETE SET NULL,

    Alias_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Alias_fez_solicitacao_Perfil, '[a-zA-Z[:digit:]]+')
        ),
        PRIMARY KEY (Alias_Perfil),
        FOREIGN KEY (Alias_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,

    Ip CHAR(15) CHECK (
        REGEXP_LIKE(Ip, '([[:digit:]]{1,3}\.){3}([[:digit:]]{1,3})')
    )
);


CREATE TABLE Perfil_Possui_Dispositivo (

    Id_Dispositivo NUMBER CHECK (Id_Dispositivo >= 0),
        PRIMARY KEY (Id_Dispositivo),
        FOREIGN KEY (Id_Dispositivo) REFERENCES Id_Dispositivo(Id) ON DELETE SET NULL,

    Alias_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Alias_fez_solicitacao_Perfil, '[a-zA-Z[:digit:]]+')
        ),
        PRIMARY KEY (Alias_Perfil),
        FOREIGN KEY (Alias_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,

    Nome_de_usuario_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Alias_fez_solicitacao_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        PRIMARY KEY (Nome_de_usuario_Perfil),
        FOREIGN KEY (Nome_de_usuario_Perfil) REFERENCES Perfil(Nome_usuario_Conta) ON DELETE SET NULL
);


CREATE TABLE Amizade (

    Id NUMBER CHECK (Id >= 0),
        PRIMARY KEY (Id),

    Alias_fez_solicitacao_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Alias_fez_solicitacao_Perfil, '[a-zA-Z[:digit:]]+')
        ),
        PRIMARY KEY (Alias_fez_solicitacao_Perfil),
        FOREIGN KEY (Alias_fez_solicitacao_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,

    Nome_de_usuario_fez_solicitacao_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Alias_fez_solicitacao_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        PRIMARY KEY (Nome_de_usuario_fez_solicitacao_Perfil),
        FOREIGN KEY (Nome_de_usuario_fez_solicitacao_Perfil) REFERENCES Perfil(Nome_de_usuario) ON DELETE SET NULL,

    Alias_recebe_solicitacao_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Alias_fez_solicitacao_Perfil, '[a-zA-Z[:digit:]]+')
        ),
        PRIMARY KEY (Alias_recebe_solicitacao_Perfil),
        FOREIGN KEY (Alias_recebe_solicitacao_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,

    Nome_de_usuario_recebe_solicitacao_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Alias_fez_solicitacao_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        PRIMARY KEY (Nome_de_usuario_recebe_solicitacao_Perfil),
        FOREIGN KEY (Nome_de_usuario_recebe_solicitacao_Perfil) REFERENCES Perfil(Nome_de_usuario) ON DELETE SET NULL
);


CREATE TABLE Amizade_Recomenda_Midia (

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

    Comentario_de_recomendacao VARCHAR2(300)
);


CREATE TABLE Temporada (

    Numero NUMBER CHECK (Numero >= 0),
        PRIMARY KEY (Numero),

    Nome_Serie VARCHAR(100) NOT NULL,
        FOREIGN KEY (Nome_Serie) REFERENCES Serie(Nome) ON DELETE SET NULL,

    Numero_de_episodios NUMBER CHECK (Numero_de_episodios >= 0)
);


CREATE TABLE Midia_Pessoa (
    Titulo_Midia VARCHAR2(100),
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    Nome_Pessoa VARCHAR2(50),
        PRIMARY KEY (Nome_Pessoa),
        FOREIGN KEY (Nome_Pessoa) REFERENCES Pessoa(Nome) ON DELETE SET NULL,
    Diretor VARCHAR2(50),
    Ator VARCHAR2(50)
);


CREATE TABLE Serie_Pessoa (
    Nome_Serie VARCHAR2(100),
        PRIMARY KEY (Nome_Serie),
        FOREIGN KEY (Nome_Serie) REFERENCES Serie(Nome) ON DELETE SET NULL,
    Nome_Pessoa VARCHAR(50),
        PRIMARY KEY (Nome_Pessoa),
        FOREIGN KEY (Nome_Pessoa) REFERENCES Pessoa(Nome) ON DELETE SET NULL,
        --checar tabela serie
    Diretor VARCHAR(50),
    Ator VARCHAR2(50)
);


CREATE TABLE Pessoa_Participa_Midia (
    Titulo_Midia VARCHAR2(100),
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    Nome_Pessoa VARCHAR2(50),
        PRIMARY KEY (Nome_Pessoa),
        FOREIGN KEY (Nome_Pessoa) REFERENCES Pessoa(Nome) ON DELETE SET NULL,
    Diretor VARCHAR2(50),
    Ator VARCHAR2(50)
);


CREATE TABLE Pessoa_Participa_Serie (
    Titulo_Midia VARCHAR2(100),
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    Nome_Pessoa VARCHAR2(50),
        PRIMARY KEY (Nome_Pessoa),
        FOREIGN KEY (Nome_Pessoa) REFERENCES Pessoa(Nome) ON DELETE SET NULL,
    Diretor VARCHAR2(50),
    Ator VARCHAR2(50)
);


CREATE TABLE Perfil (
    Alias VARCHAR2(20) VARCHAR2(20) 
        PRIMARY KEY (Alias),
        CHECK (REGEXP_LIKE(Alias, '[a-zA-Z[:digit:]]+')),
    Nome_usuario_Conta VARCHAR2(20)VARCHAR2(20),
        PRIMARY KEY (Nome_usuario_Conta),
        FOREIGN KEY (Nome_usuario_Conta) REFERENCES Conta(Nome_de_usuario) ON DELETE SET NULL,
        CHECK (REGEXP_LIKE(Nome_usuario_Conta, '[a-zA-Z_[:digit:]]+')),
    Idade_Faixa_Etaria NOT NULL NUMBER,
        FOREIGN KEY (Idade_Faixa_Etaria) REFERENCES Idade(Faixa_Etaria) ON DELETE SET NULL,
        CHECK (Idade_Faixa_Etaria > 0),
    Preferencia_qualidade VARCHAR2(50),
    Preferencia_legenda VARCHAR2(50),
    Preferencia_idioma VARCHAR2(50)
);


CREATE TABLE Deposito_Bancario (
    Forma_de_Pagamento VARCHAR2(20),
        PRIMARY KEY (Forma_de_Pagamento),
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Metodo) ON DELETE SET NULL,
    Conta_Deposito_Bancario NUMBER(6),
        FOREIGN KEY (Conta_Deposito_Bancario) REFERENCES Conta_Deposito_Bancario(Conta) ON DELETE SET NULL,
    Agencia_Deposito_Bancario NUMBER(5),
        FOREIGN KEY (Agencia_Deposito_Bancario) REFERENCES Agencia_Deposito_Bancario(Agencia) ON DELETE SET NULL
);


CREATE TABLE Cartao_de_Credito (
    Forma_de_Pagamento VARCHAR2(20),
        PRIMARY KEY (Forma_de_Pagamento),
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Metodo) ON DELETE SET NULL,
    Numero_do_cartao NUMBER(16),
        FOREIGN KEY (Numero_do_cartao) REFERENCES Numero_do_cartao(Numero_do_cartao) ON DELETE SET NULL
);


CREATE TABLE Perfil_Prefere_Genero (
    Alias_Perfil VARCHAR2(20) CHECK (
        REGEXP_LIKE(Alias_Perfil, '[a-zA-Z[:digit:]]+')
        ),
        PRIMARY KEY (Alias_Perfil),
        FOREIGN KEY (Alias_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    
    Nome_de_usuario_Perfil VARCHAR2(20) CHECK (
        REGEXP_LIKE(Nome_de_usuario_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        PRIMARY KEY (Nome_de_usuario_Perfil),
        FOREIGN KEY (Nome_de_usuario_Perfil) REFERENCES Perfil(Nome_usuario_Conta) ON DELETE SET NULL,
    
    Nome_Genero VARCHAR2(30),
        PRIMARY KEY (Nome_Genero),
        FOREIGN KEY (Nome_Genero) REFERENCES Genero(Nome) ON DELETE SET NULL,
    
    Nota NUMBER CHECK (Nota >= 0 OR Nota <= 10)
);


CREATE TABLE Perfil_Solicita_Amizade (
    Alias_fez_solicitacao_Perfil VARCHAR2(20) CHECK (
        REGEXP_LIKE(Alias_fez_solicitacao_Perfil, '[a-zA-Z[:digit:]]+')
        ),
        PRIMARY KEY (Alias_fez_solicitacao_Perfil),
        FOREIGN KEY (Alias_fez_solicitacao_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    
    Nome_de_usuario_fez_solicitacao_Perfil VARCHAR2(20) CHECK (
        REGEXP_LIKE(Nome_de_usuario_fez_solicitacao_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        PRIMARY KEY (Nome_de_usuario_fez_solicitacao_Perfil),
        FOREIGN KEY (Nome_de_usuario_fez_solicitacao_Perfil) REFERENCES Perfil(Nome_de_usuario) ON DELETE SET NULL,
    
    Alias_recebe_solicitacao_Perfil VARCHAR2(20) CHECK (
        REGEXP_LIKE(Alias_fez_solicitacao_Perfil, '[a-zA-Z[:digit:]]+')
        ),
        PRIMARY KEY (Alias_recebe_solicitacao_Perfil),
        FOREIGN KEY (Alias_recebe_solicitacao_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    
    Nome_de_usuario_recebe_solicitacao_Perfil VARCHAR2(20) CHECK (
        REGEXP_LIKE(Nome_de_usuario_recebe_solicitacao_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        PRIMARY KEY (Nome_de_usuario_recebe_solicitacao_Perfil),
        FOREIGN KEY (Nome_de_usuario_recebe_solicitacao_Perfil) REFERENCES Perfil(Nome_de_usuario) ON DELETE SET NULL,
    
    Aceitou CHAR(1) CHECK (
        Aceitou IN ('T', 'F')
    ),
    
    Data_solicitacao DATE 
);


CREATE TABLE Perfil_Assiste_Midia (
    Alias_Perfil VARCHAR2(20) CHECK (
        REGEXP_LIKE(Alias_Perfil, '[a-zA-Z[:digit:]]+')
        ),
        PRIMARY KEY (Alias_Perfil),
        FOREIGN KEY (Alias_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    
    Nome_usuario_Perfil VARCHAR2(20) CHECK (
        REGEXP_LIKE(Nome_usuario_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        PRIMARY KEY (Nome_usuario_Perfil),
        FOREIGN KEY (Nome_usuario_Perfil) REFERENCES Perfil(Nome_usuario_Conta) ON DELETE SET NULL,
    
    Titulo_Midia VARCHAR2(50),
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    
    Id_Review NUMBER CHECK(Id_Review >= 0),
        FOREIGN KEY (Id_Review) REFERENCES Review(Id) ON DELETE SET NULL,
    
    Tempo NUMBER CHECK(Tempo >= 0)
);


CREATE TABLE Publica (
    Id NUMBER CHECK(Id >= 0),
        PRIMARY KEY (Id),
    
    Nota NUMBER CHECK (Nota >= 0 OR Nota <= 10),
    
    Data_nota DATE,
    
    Comentario VARCHAR2(300),
    
    Data_comentario DATE
);


CREATE TABLE Gerencia (
    Alias_adulto_gerencia_Perfil VARCHAR2(20) CHECK (
        REGEXP_LIKE(Alias_adulto_gerencia_Perfil, '[a-zA-Z[:digit:]]+')
        ),
        Alias_adulto_gerencia_Perfil NOT NULL,
        FOREIGN KEY (Alias_adulto_gerencia_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    
    Nome_usuario_adulto_gerencia_Perfil VARCHAR2(20) CHECK (
        REGEXP_LIKE(Nome_usuario_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        Nome_usuario_adulto_gerencia_Perfil NOT NULL,
        FOREIGN KEY (Nome_usuario_adulto_gerencia_Perfil) REFERENCES Perfil(Nome_usuario_Conta) ON DELETE SET NULL,
    
    Alias_kids_gerenciado_Perfil VARCHAR2(20) CHECK (
        REGEXP_LIKE(Alias_kids_gerenciado_Perfil, '[a-zA-Z[:digit:]]+')
        ),
        PRIMARY KEY (Alias_kids_gerenciado_Perfil),
        FOREIGN KEY (Alias_kids_gerenciado_Perfil) REFERENCES Perfil(Alias) ON DELETE SET NULL,
    
    Nome_usuario_kids_gerenciado_Perfil VARCHAR2(20) CHECK (
        REGEXP_LIKE(Alias_kids_gerenciado_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        PRIMARY KEY (Nome_usuario_kids_gerenciado_Perfil),
        FOREIGN KEY (Nome_usuario_kids_gerenciado_Perfil) REFERENCES Perfil(Nome_de_usuario_Conta) ON DELETE SET NULL
);


CREATE TABLE Audio_Midia (
    Audio VARCHAR2(200),
        PRIMARY KEY (Audio),
    
    Titulo VARCHAR2(100),
        PRIMARY KEY (Titulo),
        FOREIGN KEY (Titulo) REFERENCES Midia(Titulo) ON DELETE SET NULL 
);


CREATE TABLE Legenda_Midia (
    Legenda VARCHAR2(200),
        PRIMARY KEY (Legenda),
    
    Titulo VARCHAR2(100),
        PRIMARY KEY (Titulo),
        FOREIGN KEY (Titulo) REFERENCES Midia(Titulo) ON DELETE SET NULL 
);


CREATE TABLE Midia_Pertence_Genero (
    Titulo_Midia VARCHAR2(100),
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    
    Nome_Genero VARCHAR2(30),
        PRIMARY KEY (Nome_Genero),
        FOREIGN KEY (Nome_Genero) REFERENCES Genero(Nome) ON DELETE SET NULL
);


CREATE TABLE Midia_Pertence_Temporada (
    Titulo_Midia VARCHAR2(100),
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
  
    Numero_Temporada NUMBER CHECK (Numero_Temporada >= 0),
        PRIMARY KEY (Numero_Temporada),
        FOREIGN KEY (Numero_Temporada) REFERENCES Numero_Temporada(Numero) ON DELETE SET NULL
);

CREATE TABLE Forma_de_Pagamento (
    Metodo VARCHAR2(1), CHECK (Metodo IN('P','C','D')),
        PRIMARY KEY (Metodo)
);


CREATE TABLE Cartao_de_Credito (
    Forma_de_Pagamento VARCHAR2(1),
        PRIMARY KEY (Forma_de_Pagamento),
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Metodo) ON DELETE SET NULL,
    Bandeira VARCHAR(15),
    Codigo_de_seguranca NUMBER,
    Vencimento_do_cartao DATE,
    Nome VARCHAR(50),
    Numero_do_cartao NUMBER
);


CREATE TABLE Deposito_Bancario (
    Forma_de_Pagamento VARCHAR2(1),
        PRIMARY KEY (Forma_de_Pagamento),
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Metodo) ON DELETE SET NULL,
    Conta NUMBER,
    Agencia NUMBER,
    Banco VARCHAR2(30),
    Nome_titular VARCHAR2(50),
    Sobrenome_titular VARCHAR2(50),
    CPF NUMBER
);


CREATE TABLE Paypal (
    Forma_de_Pagamento VARCHAR2(1),
        PRIMARY KEY (Forma_de_Pagamento),
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Metodo) ON DELETE SET NULL,
    Senha VARCHAR2(20),
    Email_paypal VARCHAR(50)
);


CREATE TABLE Midia (
    Titulo VARCHAR(50),
        PRIMARY KEY (Titulo),
    Tipo VARCHAR2(20) NOT NULL,
    Thumbnail VARCHAR2(200),
    Lancamento DATE,
    Duracao NUMBER,
    Sinopse VARCHAR2(500),
    Classificacao NUMBER
);


CREATE TABLE Perfil (
    Alias VARCHAR2(20) CHECK (
        REGEXP_LIKE(Alias, '[a-zA-Z[:digit:]]+')
),
        PRIMARY KEY (Alias),
    Nome_usuario_Conta VARCHAR(50) CHECK(
        REGEXP_LIKE(Alias, '[a-zA-Z_[:digit:]]+')
),
        PRIMARY KEY (Nome_usuario_Conta),
        FOREIGN KEY (Nome_usuario_Co
            nta) REFERENCES Conta(Nome_de_usuario) ON DELETE SET NULL,
    Idade NUMBER NOT NULL,
    Preferencia_qualidade VARCHAR2(10),
    Preferencia_legenda VARCHAR2(20),
    Preferencia_idioma VARCHAR2(20),
    Faixa_etaria NUMBER CHECK (Faixa_etaria >= 0)
);


CREATE TABLE Plano (
    Nome VARCHAR2(50),
        PRIMARY KEY (Nome),
    Preco REAL,
    Qualidade VARCHAR2(10),
    Videos_simultaneos NUMBER,
    Numero_de_perfis NUMBER,
    Outras_descricoes VARCHAR2(500)
);


CREATE TABLE Conta_Assina_Plano (
    Nome_Plano VARCHAR2(50),
        PRIMARY KEY (Nome_Plano),
        FOREIGN KEY (Nome_Plano) REFERENCES Plano(Nome) ON DELETE SET NULL,
    Nome_de_usuario_Conta VARCHAR(50) CHECK(
        REGEXP_LIKE(Alias, '[a-zA-Z_[:digit:]]+')),
        PRIMARY KEY (Nome_de_usuario_Conta),
        FOREIGN KEY (Nome_de_usuario_Conta) REFERENCES Conta(Nome_de_usuario) ON DELETE SET NULL
);


CREATE TABLE Assinatura (
    Data_vigor DATE,
        PRIMARY KEY (Data_vigor),
    Nome_Plano VARCHAR2(50),
        PRIMARY KEY (Nome_Plano),
        FOREIGN KEY (Nome_Plano) REFERENCES Plano(Nome) ON DELETE SET NULL,
    Nome_de_usuario_Conta VARCHAR(50) CHECK(
        REGEXP_LIKE(Alias, '[a-zA-Z_[:digit:]]+')),
        PRIMARY KEY (Nome_de_usuario_Conta),
        FOREIGN KEY (Nome_de_usuario_Conta) REFERENCES Conta(Nome_de_usuario) ON DELETE SET NULL
);


CREATE TABLE Pagamento (
    Codigo_da_fatura NUMBER CHECK(Codigo_da_fatura > 0),
        PRIMARY KEY (Codigo_da_fatura),
    Data_vigor_Assinatura DATE NOT NULL,
        FOREIGN KEY (Data_vigor_Assinatura) REFERENCES Assinatura(Data_vigor) ON DELETE SET NULL,
    Nome_Assinatura VARCHAR2(50) NOT NULL,
        FOREIGN KEY (Nome_Assinatura) REFERENCES Assinatura(Nome_Plano) ON DELETE SET NULL,
    Nome_de_usuario_Assinatura VARCHAR(50) CHECK(
        REGEXP_LIKE(Alias, '[a-zA-Z_[:digit:]]+')) NOT NULL,
        FOREIGN KEY (Nome_de_usuario_Assinatura) REFERENCES Assinatura(Nome_de_usuario_Conta) ON DELETE SET NULL,
    Valor REAL,
    Periodo NUMBER
);


CREATE TABLE Conta (
    Nome_de_usuario VARCHAR(50) CHECK(
        REGEXP_LIKE(Alias, '[a-zA-Z_[:digit:]]+')),
        PRIMARY KEY (Nome_de_usuario),
    Forma_de_Pagamento VARCHAR2(1) NOT NULL,
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Forma_de_Pagamento) ON DELETE SET NULL,
    Senha VARCHAR2(20),
    Nome VARCHAR2(50),
    CPF NUMBER,
    Email VARCHAR2(50),
    Data_de_nascimento DATE
);