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


CREATE TABLE Genero (
    Nome VARCHAR2(30),
        PRIMARY KEY (Nome)
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


-- TODO review
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