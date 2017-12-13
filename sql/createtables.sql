CREATE TABLE Plano (
    Nome VARCHAR2(50),
        PRIMARY KEY (Nome),
    Preco REAL,
    Qualidade VARCHAR2(10),
    Videos_simultaneos NUMBER,
    Numero_de_perfis NUMBER,
    Outras_descricoes VARCHAR2(500)
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


CREATE TABLE Forma_de_Pagamento (
    Metodo CHAR(1) CHECK (Metodo IN ('P','C','D')),
        PRIMARY KEY (Metodo)
);


CREATE TABLE Publica (
    Id NUMBER CHECK(Id >= 0),
        PRIMARY KEY (Id),
    
    Nota NUMBER CHECK (Nota >= 0 OR Nota <= 10),
    
    Data_nota DATE,
    
    Comentario VARCHAR2(300),
    
    Data_comentario DATE
);


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


-- CREATE TABLE Conta_do_Deposito_Bancario (
--     Conta NUMBER(6),
--         PRIMARY KEY (Conta),
--     Agencia NUMBER(5),
--     Banco VARCHAR2(20),
--     Nome_titular VARCHAR2(50),
--     Sobrenome_titular VARCHAR2(50),
--     CPF NUMBER(11)
-- );


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

    Nota NUMBER CHECK (Nota >= 0 AND Nota <= 10),

    Data_Nota DATE,

    Comentario VARCHAR2(300),

    Data_Comentario DATE
);


CREATE TABLE Temporada (

    Numero NUMBER CHECK (Numero >= 0),

    Nome_Serie VARCHAR(100),
        FOREIGN KEY (Nome_Serie) REFERENCES Serie(Nome) ON DELETE SET NULL,

    Numero_de_episodios NUMBER CHECK (Numero_de_episodios >= 0),
        PRIMARY KEY (Numero, Nome_Serie)
);


CREATE TABLE Temporada_Midia (

    Titulo_Midia VARCHAR2(100),
    Nome_Serie_Temporada VARCHAR(100),
    Numero_Temporada NUMBER CHECK (Numero_Temporada >= 0),
        PRIMARY KEY (Titulo_Midia, Numero_Temporada),

        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
        FOREIGN KEY (Nome_Serie_Temporada, Numero_Temporada) 
            REFERENCES Temporada(Nome_Serie, Numero) ON DELETE SET NULL
);


CREATE TABLE Conta (
    
    Nome_de_usuario VARCHAR2(50) CHECK (
            REGEXP_LIKE(Nome_de_usuario, '[a-zA-Z_[:digit:]]+')
        ),
        PRIMARY KEY (Nome_de_usuario),
    
    Forma_de_Pagamento CHAR NOT NULL,
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Metodo) ON DELETE SET NULL,
    
    Senha VARCHAR2(20),
    Nome VARCHAR2(50),
    CPF NUMBER,
    Email VARCHAR2(50)CHECK (
            REGEXP_LIKE(Email, '^[a-zA-Z_\.[:digit:]]+@([a-zA-Z[:digit:]]+\.[a-zA-Z]+)+$')
        ),
    Data_de_nascimento DATE
);


CREATE TABLE Perfil (
    
    AliasP VARCHAR2(20)
        CHECK (REGEXP_LIKE(AliasP, '[a-zA-Z[:digit:]]+')),
    
    Nome_usuario_Conta VARCHAR2(20)
        CHECK (REGEXP_LIKE(Nome_usuario_Conta, '[a-zA-Z_[:digit:]]+')),
        FOREIGN KEY (Nome_usuario_Conta) REFERENCES Conta(Nome_de_usuario) ON DELETE SET NULL,
    
    Idade_Faixa_Etaria NUMBER NOT NULL
        CHECK (Idade_Faixa_Etaria > 0),
        FOREIGN KEY (Idade_Faixa_Etaria) REFERENCES Idade_Faixa_Etaria(Idade) ON DELETE SET NULL,
    
    Preferencia_qualidade VARCHAR2(50),
    Preferencia_legenda VARCHAR2(50),
    Preferencia_idioma VARCHAR2(50),
    
        PRIMARY KEY (AliasP, Nome_usuario_Conta)
);


CREATE TABLE Amizade (

    Id NUMBER CHECK (Id >= 0) UNIQUE,

    Alias_fez_solicitacao_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Alias_fez_solicitacao_Perfil, '[a-zA-Z[:digit:]]+')
        ),

    Nome_usuario_solicita_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Nome_usuario_solicita_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        FOREIGN KEY (Alias_fez_solicitacao_Perfil, Nome_usuario_solicita_Perfil) 
            REFERENCES Perfil(AliasP, Nome_usuario_Conta) ON DELETE SET NULL,

    Alias_solicitado_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Alias_solicitado_Perfil, '[a-zA-Z[:digit:]]+')
        ),

    Nome_usuario_solicitado_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Nome_usuario_solicitado_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        FOREIGN KEY (Alias_solicitado_Perfil, Nome_usuario_solicitado_Perfil) 
            REFERENCES Perfil(AliasP, Nome_usuario_Conta) ON DELETE SET NULL,
        
        PRIMARY KEY (Id, 
                    Alias_fez_solicitacao_Perfil, 
                    Nome_usuario_solicita_Perfil, 
                    Alias_solicitado_Perfil, 
                    Nome_usuario_solicitado_Perfil)
);


CREATE TABLE Acesso (

    Timestamp_Acesso TIMESTAMP,

    Id_Dispositivo NUMBER,
        FOREIGN KEY (Id_Dispositivo) REFERENCES Dispositivo(Id) ON DELETE SET NULL,

    Alias_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Alias_Perfil, '[a-zA-Z[:digit:]]+')
        ),

    Nome_usuario_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Nome_usuario_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        FOREIGN KEY (Alias_Perfil, Nome_usuario_Perfil) 
            REFERENCES Perfil(AliasP, Nome_usuario_Conta) ON DELETE SET NULL,

    Ip CHAR(15) CHECK (
        REGEXP_LIKE(Ip, '([[:digit:]]{1,3}\.){3}([[:digit:]]{1,3})')
    ),
        PRIMARY KEY (Timestamp_Acesso, Id_Dispositivo, Alias_Perfil)
);


CREATE TABLE Perfil_Assiste_Midia (

    Alias_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Alias_Perfil, '[a-zA-Z[:digit:]]+')
        ),

    Nome_de_usuario_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Nome_de_usuario_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        FOREIGN KEY (Alias_Perfil, Nome_de_usuario_Perfil) REFERENCES Perfil(AliasP, Nome_usuario_Conta) ON DELETE SET NULL,

    Titulo_Midia VARCHAR2(100),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,

    Id_Review NUMBER CHECK (Id_Review >= 0),
        FOREIGN KEY (Id_Review) REFERENCES Review(Id) ON DELETE SET NULL,

    Tempo NUMBER,
        
        PRIMARY KEY (Alias_Perfil, Nome_de_usuario_Perfil, Titulo_Midia)
);


CREATE TABLE Perfil_Possui_Dispositivo (

    Id_Dispositivo NUMBER CHECK (Id_Dispositivo >= 0),
    Alias_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Alias_Perfil, '[a-zA-Z[:digit:]]+')
        ),
    Nome_de_usuario_Perfil VARCHAR(20) CHECK (
            REGEXP_LIKE(Nome_de_usuario_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        FOREIGN KEY (Alias_Perfil, Nome_de_usuario_Perfil) 
            REFERENCES Perfil(AliasP, Nome_usuario_Conta) ON DELETE SET NULL,
        
        PRIMARY KEY (Nome_de_usuario_Perfil)
);


CREATE TABLE Amizade_Recomenda_Midia (

    Id_Amizade NUMBER CHECK (Id_Amizade >= 0),
        FOREIGN KEY (Id_Amizade) REFERENCES Amizade(Id) ON DELETE SET NULL,

    Alias_solicita_Perfil VARCHAR(20) 
        CHECK (REGEXP_LIKE(Alias_solicita_Perfil, '[a-zA-Z[:digit:]]+')),

    Nome_usuario_solicita_Perfil VARCHAR(20) 
        CHECK (REGEXP_LIKE(Nome_usuario_solicita_Perfil, '[a-zA-Z_[:digit:]]+')),
        FOREIGN KEY (Alias_solicita_Perfil, Nome_usuario_solicita_Perfil) 
            REFERENCES Perfil(AliasP, Nome_usuario_Conta) ON DELETE SET NULL,

    Alias_solicitado_Perfil
        CHECK (REGEXP_LIKE(Alias_solicitado_Perfil, '[a-zA-Z[:digit:]]+')),

    Nome_usuario_solicitado_Perfil
        CHECK (REGEXP_LIKE(Nome_usuario_solicitado_Perfil, '[a-zA-Z_[:digit:]]+')),
        FOREIGN KEY (Alias_solicitado_Perfil, Nome_usuario_solicitado_Perfil) 
            REFERENCES Perfil(AliasP, Nome_usuario_Conta) ON DELETE SET NULL,

    Titulo_Midia,
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,

    Comentario_de_recomendacao VARCHAR2(300),
        
        PRIMARY KEY (Id_Amizade, 
                    Alias_solicita_Perfil, 
                    Nome_usuario_solicita_Perfil, 
                    Alias_solicitado_Perfil, 
                    Nome_usuario_solicitado_Perfil, 
                    Titulo_Midia)
);


CREATE TABLE Serie_Pessoa (
    Nome_Serie VARCHAR2(100),
        FOREIGN KEY (Nome_Serie) REFERENCES Serie(Nome) ON DELETE SET NULL,
    Nome_Pessoa VARCHAR(50),
        FOREIGN KEY (Nome_Pessoa) REFERENCES Pessoa(Nome) ON DELETE SET NULL,
    Diretor VARCHAR(50),
    Ator VARCHAR2(50),
        PRIMARY KEY (Nome_Serie, Nome_Pessoa)
);


CREATE TABLE Pessoa_Participa_Midia (
    Titulo_Midia VARCHAR2(100),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    Nome_Pessoa VARCHAR2(50),
        FOREIGN KEY (Nome_Pessoa) REFERENCES Pessoa(Nome) ON DELETE SET NULL,
    Diretor CHAR CHECK (Diretor IN ('T', 'F')),
    Ator CHAR CHECK (Ator IN ('T', 'F')),
        PRIMARY KEY (Titulo_Midia, Nome_Pessoa)
);


CREATE TABLE Pessoa_Participa_Serie (
    Nome_Serie VARCHAR2(100),
        FOREIGN KEY (Nome_Serie) REFERENCES Serie(Nome) ON DELETE SET NULL,
    Nome_Pessoa VARCHAR2(50),
        FOREIGN KEY (Nome_Pessoa) REFERENCES Pessoa(Nome) ON DELETE SET NULL,
    Diretor CHAR CHECK (Diretor IN ('T', 'F')),
    Ator CHAR CHECK (Ator IN ('T', 'F')),
        PRIMARY KEY (Nome_Serie, Nome_Pessoa)
);


CREATE TABLE Conta_Deposito_Bancario (
    
    Forma_de_Pagamento CHAR CHECK (Forma_de_Pagamento IN ('P','C','D')),
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Metodo) ON DELETE SET NULL,
    
    Conta NUMBER(6),
    Agencia NUMBER(5),
        UNIQUE (Conta, Agencia),

    Banco VARCHAR2(20),
    Nome_titular VARCHAR2(50),
    Sobrenome_titular VARCHAR2(50),
    CPF NUMBER(11),
        
        PRIMARY KEY (Forma_de_Pagamento, Conta, Agencia)
);

CREATE TABLE Deposito_Bancario (
    Forma_de_Pagamento CHAR CHECK (Forma_de_Pagamento IN ('P','C','D')),
        PRIMARY KEY (Forma_de_Pagamento),
    Conta_Deposito_Bancario NUMBER(6),
    Agencia_Deposito_Bancario NUMBER(5),
        FOREIGN KEY (Forma_de_Pagamento, Conta_Deposito_Bancario, Agencia_Deposito_Bancario) 
            REFERENCES Conta_Deposito_Bancario(Forma_de_Pagamento, Conta, Agencia) ON DELETE SET NULL
);


CREATE TABLE Cartao_de_Credito (
    Numero_do_cartao NUMBER,
    Forma_de_Pagamento CHAR,
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Metodo) ON DELETE SET NULL,
    Bandeira VARCHAR(15),
    Codigo_de_seguranca NUMBER,
    Vencimento_do_cartao DATE,
    Nome VARCHAR(50),
        PRIMARY KEY (Numero_do_cartao, Forma_de_Pagamento)
);


CREATE TABLE Numero_Cartao_de_Credito (
    Forma_de_Pagamento CHAR,
        PRIMARY KEY (Numero_do_cartao, Forma_de_Pagamento),
    Numero_do_cartao NUMBER(16),
        FOREIGN KEY (Numero_do_cartao, Forma_de_Pagamento) 
            REFERENCES Cartao_de_Credito(Numero_do_cartao, Forma_de_Pagamento) ON DELETE SET NULL
);


CREATE TABLE Perfil_Prefere_Genero (


    Alias_Perfil VARCHAR2(20) CHECK (
            REGEXP_LIKE(Alias_Perfil, '[a-zA-Z[:digit:]]+')
        ),
    
    Nome_de_usuario_Perfil VARCHAR2(20) CHECK (
            REGEXP_LIKE(Nome_de_usuario_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        FOREIGN KEY (Alias_Perfil, Nome_de_usuario_Perfil) 
            REFERENCES Perfil(AliasP, Nome_usuario_Conta) ON DELETE SET NULL,
    
    Nome_Genero VARCHAR2(30),
        FOREIGN KEY (Nome_Genero) REFERENCES Genero(Nome) ON DELETE SET NULL,
    
    Nota NUMBER CHECK (Nota >= 0 AND Nota <= 10),
        PRIMARY KEY (Alias_Perfil, Nome_de_usuario_Perfil, Nome_Genero)
);


CREATE TABLE Perfil_Solicita_Amizade (
    Alias_solicita_Perfil VARCHAR2(20) CHECK (
            REGEXP_LIKE(Alias_solicita_Perfil, '[a-zA-Z[:digit:]]+')
        ),
    
    Nome_usuario_solicita_Perfil VARCHAR2(20) CHECK (
            REGEXP_LIKE(Nome_usuario_solicita_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        FOREIGN KEY (Alias_solicita_Perfil, Nome_usuario_solicita_Perfil) 
            REFERENCES Perfil(AliasP, Nome_usuario_Conta) ON DELETE SET NULL,

    Alias_solicitado_Perfil VARCHAR2(20) CHECK (
            REGEXP_LIKE(Alias_solicitado_Perfil, '[a-zA-Z[:digit:]]+')
        ),
    
    Nome_usuario_solicitado_Perfil VARCHAR2(20) CHECK (
            REGEXP_LIKE(Nome_usuario_solicitado_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        FOREIGN KEY (Alias_solicitado_Perfil, Nome_usuario_solicitado_Perfil) 
            REFERENCES Perfil(AliasP, Nome_usuario_Conta) ON DELETE SET NULL,
    
    Aceitou CHAR(1) CHECK (
        Aceitou IN ('T', 'F')
    ),
    
    Data_solicitacao DATE,

    PRIMARY KEY (Alias_solicita_Perfil, 
                Nome_usuario_solicita_Perfil,
                Alias_solicitado_Perfil, 
                Nome_usuario_solicitado_Perfil)
);


CREATE TABLE Gerencia (
    Alias_gerencia_Perfil VARCHAR2(20) CHECK (
            REGEXP_LIKE(Alias_gerencia_Perfil, '[a-zA-Z[:digit:]]+')
        ),
    
    Usuario_gerencia_Perfil VARCHAR2(20) CHECK (
            REGEXP_LIKE(Usuario_gerencia_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        FOREIGN KEY (Alias_gerencia_Perfil, Usuario_gerencia_Perfil) 
            REFERENCES Perfil(AliasP, Nome_usuario_Conta) ON DELETE SET NULL,

    Alias_kids_gerenciado_Perfil VARCHAR2(20) CHECK (
            REGEXP_LIKE(Alias_kids_gerenciado_Perfil, '[a-zA-Z[:digit:]]+')
        ),
    
    Usuario_kids_gerenciado_Perfil VARCHAR2(20) CHECK (
            REGEXP_LIKE(Usuario_kids_gerenciado_Perfil, '[a-zA-Z_[:digit:]]+')
        ),
        FOREIGN KEY (Alias_kids_gerenciado_Perfil, Usuario_kids_gerenciado_Perfil) 
            REFERENCES Perfil(AliasP, Nome_usuario_Conta) ON DELETE SET NULL,

        PRIMARY KEY (Alias_kids_gerenciado_Perfil, Usuario_kids_gerenciado_Perfil)
);


CREATE TABLE Audio_Midia (
    Audio VARCHAR2(200),
    Idioma VARCHAR2(200),
    Titulo VARCHAR2(100),
        FOREIGN KEY (Titulo) REFERENCES Midia(Titulo) ON DELETE SET NULL,
        
        PRIMARY KEY (Audio, Idioma, Titulo)
);


CREATE TABLE Legenda_Midia (
    Legenda VARCHAR2(200),
    Idioma VARCHAR2(200),
    Titulo VARCHAR2(100),
        FOREIGN KEY (Titulo) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    
        PRIMARY KEY (Legenda, Idioma, Titulo)
);


CREATE TABLE Midia_Pertence_Genero (
    Titulo_Midia VARCHAR2(100),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    Nome_Genero VARCHAR2(30),
        FOREIGN KEY (Nome_Genero) REFERENCES Genero(Nome) ON DELETE SET NULL,

        PRIMARY KEY (Titulo_Midia, Nome_Genero)
);


CREATE TABLE Midia_Pertence_Temporada (
    Titulo_Midia VARCHAR2(100),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    Nome_Serie_Temporada VARCHAR2(100),
    Numero_Temporada NUMBER CHECK (Numero_Temporada >= 0),
        FOREIGN KEY (Nome_Serie_Temporada, Numero_Temporada) REFERENCES Temporada(Nome_Serie, Numero) ON DELETE SET NULL,

        PRIMARY KEY (Titulo_Midia, Numero_Temporada)
);


CREATE TABLE Paypal (
    Forma_de_Pagamento CHAR,
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Metodo) ON DELETE SET NULL,
    Senha VARCHAR2(20),
    Email_paypal VARCHAR(50),
        PRIMARY KEY (Forma_de_Pagamento, Email_paypal)
);


CREATE TABLE Conta_Assina_Plano ( 
    Nome_Plano VARCHAR2(50),
        FOREIGN KEY (Nome_Plano) REFERENCES Plano(Nome) ON DELETE SET NULL,
    Nome_usuario_Conta VARCHAR2(50) 
        CHECK(REGEXP_LIKE(Nome_usuario_Conta, '[a-zA-Z_[:digit:]]+')),
        FOREIGN KEY (Nome_usuario_Conta) REFERENCES Conta(Nome_de_usuario) ON DELETE SET NULL,
        
        PRIMARY KEY (Nome_Plano, Nome_usuario_Conta)
);


CREATE TABLE Assinatura (
    Data_vigor DATE,
    Nome_Plano VARCHAR2(50),
    Nome_usuario_Conta VARCHAR2(50)
        CHECK(REGEXP_LIKE(Nome_usuario_Conta, '[a-zA-Z_[:digit:]]+')),

        FOREIGN KEY (Nome_Plano) REFERENCES Plano(Nome) ON DELETE SET NULL,
        FOREIGN KEY (Nome_usuario_Conta) REFERENCES Conta(Nome_de_usuario) ON DELETE SET NULL,
        PRIMARY KEY (Data_vigor, Nome_Plano, Nome_usuario_Conta)

);


CREATE TABLE Pagamento (

    Codigo_da_fatura NUMBER CHECK (Codigo_da_fatura >= 0),
        PRIMARY KEY (Codigo_da_fatura),
    
    Data_vigor_Assinatura DATE NOT NULL,
    Nome_Plano_Assinatura VARCHAR2(50) NOT NULL,
    Nome_usuario_Assinatura VARCHAR2(50) NOT NULL
        CHECK(REGEXP_LIKE(Nome_usuario_Assinatura, '[a-zA-Z_[:digit:]]+')),

        FOREIGN KEY (Data_vigor_Assinatura, Nome_Plano_Assinatura, Nome_usuario_Assinatura)
            REFERENCES Assinatura(Data_vigor, Nome_Plano, Nome_usuario_Conta),
    Valor REAL,
    Periodo NUMBER
);

