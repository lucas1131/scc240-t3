-- Até acesso

INSERT INTO Plano VALUES ('Super Premium', 30.00, 'Ultra HD 4k', 10, 8, 'Melhor plano 10/10');
INSERT INTO Plano VALUES ('Só Premium Mesmo', 20.00, 'Full HD 1080p', 6, 8, 'Segundo melhor plano, ainda 10/10');
INSERT INTO Plano VALUES ('Plano Bom', 15.00, 'HD 720p', 6, 8, 'Terceiro melhor plano, aqui é tudo 10/10');
INSERT INTO Plano VALUES ('Sua Internet é Ruim, Né?', 10.00, '480p', 6, 8, 'Melhore seu plano de internet');
INSERT INTO Plano VALUES ('Como Você Sobrevive Com Essa Internet?', 5.00, '240p', 6, 8, 'Meus pêsames');

INSERT INTO Conta_Assina_Plano VALUES ('Super Premium', 'leticia_rina');
INSERT INTO Conta_Assina_Plano VALUES ('Só Premium Mesmo', 'jureg_monteiro');
INSERT INTO Conta_Assina_Plano VALUES ('Plano Bom', 'mr_pinoquio');
INSERT INTO Conta_Assina_Plano VALUES ('Como Você Sobrevive Com Essa Internet?', 'g_guimaraes');
INSERT INTO Conta_Assina_Plano VALUES ('Sua Internet é Ruim, Né?', 'kawaiiro');

INSERT INTO Assinatura VALUES ('10-NOV-2016', 'Super Premium', 'leticia_rina');
INSERT INTO Assinatura VALUES ('10-DEZ-2016', 'Só Premium Mesmo', 'jureg_monteiro');
INSERT INTO Assinatura VALUES ('10-JAN-2016', 'mr_pinoquio');
INSERT INTO Assinatura VALUES ('10-OUT-2016', 'Como Você Sobrevive Com Essa Internet?', 'g_guimaraes');
INSERT INTO Assinatura VALUES ('10-ABR-2016', 'Sua Internet é Ruim, Né?', 'kawaiiro');

INSERT INTO Pagamento VALUES ('123', '10-NOV-2017', 'Super Premium', 'leticia_rina', 30.0, 30);
INSERT INTO Pagamento VALUES ('456', '10-DEZ-2017', 'Só Premium Mesmo', 'jureg_monteiro', 20.0, 0);
INSERT INTO Pagamento VALUES ('666', '10-JAN-2017', 'mr_pinoquio', 15.0, 330);
INSERT INTO Pagamento VALUES ('323', '10-OUT-2017', 'Como Você Sobrevive Com Essa Internet?', 'g_guimaraes', 10.0, 60);
INSERT INTO Pagamento VALUES ('171', '10-ABR-2017', 'Sua Internet é Ruim, Né?', 'kawaiiro', 5.0, 240);

INSERT INTO Conta VALUES ('leticia_rina', 'P', 'batataDoce', 'João da Silva', 12345678901, 'jao@servidorx.com');
INSERT INTO Conta VALUES ('jureg_monteiro', 'P', 'queroFeriasMeAjudaDeus', 'José da Silva', 43215678097, 'jose@servidorx.com');
INSERT INTO Conta VALUES ('mr_pinoquio', 'P', 'nossaSenhoraDo5Bola', 'Maria da Silva', 67890854372, 'maria@servidorx.com');
INSERT INTO Conta VALUES ('g_guimaraes', 'P', 'meLivraiDasDps', 'Enzo da Silva', 12348765012, 'enzo@servidorx.com');
INSERT INTO Conta VALUES ('kawaiiro', 'P', 'olhaOsNaboVindo', 'Valentina da Silva', 10273849273, 'valentina@servidorx.com');

--Ver nomes

INSERT INTO Deposito_Bancario VALUES ('P', NULL, NULL); 
INSERT INTO Deposito_Bancario VALUES ('P', NULL, NULL); 
INSERT INTO Deposito_Bancario VALUES ('P', NULL, NULL); 
INSERT INTO Deposito_Bancario VALUES ('P', NULL, NULL); 
INSERT INTO Deposito_Bancario VALUES ('P', NULL, NULL); 

INSERT INTO Numero_Cartao_de_Credito VALUES ('P', NULL);
INSERT INTO Numero_Cartao_de_Credito VALUES ('P', NULL);
INSERT INTO Numero_Cartao_de_Credito VALUES ('P', NULL);
INSERT INTO Numero_Cartao_de_Credito VALUES ('P', NULL);
INSERT INTO Numero_Cartao_de_Credito VALUES ('P', NULL);

INSERT INTO Perfil_Prefere_Genero VALUES ('jureg_monteiro', 'juregmonteiro', 'Comédia');
INSERT INTO Perfil_Prefere_Genero VALUES ('mr_pinoquio', 'mrpinoquio', 'Terror');
INSERT INTO Perfil_Prefere_Genero VALUES ('leticia_rina', 'leticiarina', 'Romance');
INSERT INTO Perfil_Prefere_Genero VALUES ('g_guimaraes', 'gguimaraes', 'Ficção científica');
INSERT INTO Perfil_Prefere_Genero VALUES ('kawaiiro', 'kawaiiro', 'Suspense');

INSERT INTO Perfil_Solicita_Amizade VALUES ('jureg_monteiro', 'juregmonteiro', 'kawaiiro', 'kawaiiro', 'T', '10-DEZ-2017');
INSERT INTO Perfil_Solicita_Amizade VALUES ('mr_pinoquio', 'mrpinoquio', 'leticia_rina', 'leticiarina', 'T', '10-DEZ-2017');
INSERT INTO Perfil_Solicita_Amizade VALUES ('leticia_rina', 'leticiarina', 'mr_pinoquio', 'mrpinoquio', 'T', '10-DEZ-2017');
INSERT INTO Perfil_Solicita_Amizade VALUES ('g_guimaraes', 'gguimaraes', 'mr_pinoquio', 'mrpinoquio', 'T', '10-DEZ-2017');
INSERT INTO Perfil_Solicita_Amizade VALUES ('kawaiiro', 'kawaiiro', 'jureg_monteiro', 'juregmonteiro', 'T', '10-DEZ-2017');

INSERT INTO Perfil_Assiste_Midia VALUES ('jureg_monteiro', 'juregmonteiro', 'Friends', 10, 600);
INSERT INTO Perfil_Assiste_Midia VALUES ('mr_pinoquio', 'mrpinoquio', 'How I Met Your Mother', 10, 120);
INSERT INTO Perfil_Assiste_Midia VALUES ('leticia_rina', 'leticiarina', 'Stranger Things', 10, 180);
INSERT INTO Perfil_Assiste_Midia VALUES ('g_guimaraes', 'gguimaraes', 'Lost', 10, 300);
INSERT INTO Perfil_Assiste_Midia VALUES ('kawaiiro', 'kawaiiro', 'How To Get Away With Murder', 10, 60);

INSERT INTO Publica VALUES (0, 10, '10-DEZ-2017', 'Muito bom, 10/10', '10-DEZ-2017-2017');
INSERT INTO Publica VALUES (1, 10, '10-DEZ-2017', 'Muito bom, 10/10', '10-DEZ-2017-2017');
INSERT INTO Publica VALUES (2, 10, '10-DEZ-2017', 'Muito bom, 10/10', '10-DEZ-2017-2017');
INSERT INTO Publica VALUES (3, 10, '10-DEZ-2017', 'Muito bom, 10/10', '10-DEZ-2017-2017');
INSERT INTO Publica VALUES (4, 10, '10-DEZ-2017', 'Muito bom, 10/10', '10-DEZ-2017-2017');

INSERT INTO Gerencia VALUES ('jureg_monteiro', 'juregmonteiro', 'Enzo1', 'juregmonteiro');
INSERT INTO Gerencia VALUES ('mr_pinoquio', 'mrpinoquio', 'Enzo2', 'mrpinoquio');
INSERT INTO Gerencia VALUES ('leticia_rina', 'leticiarina', 'Enzo3', 'leticiarina');
INSERT INTO Gerencia VALUES ('g_guimaraes', 'gguimaraes', 'Enzo4', 'gguimaraes');
INSERT INTO Gerencia VALUES ('kawaiiro', 'kawaiiro', 'Enzo5', 'kawaiiro');

INSERT INTO Audio_Midia VALUES ('~/Documents/Audio/Friends', 'Friends E01');
INSERT INTO Audio_Midia VALUES ('~/Documents/Audio/HIMYM', 'How I Met Your Mother E01');
INSERT INTO Audio_Midia VALUES ('~/Documents/Audio/StrangerThings', 'Stranger Things E01');
INSERT INTO Audio_Midia VALUES ('~/Documents/Audio/Lost', 'Lost E01');
INSERT INTO Audio_Midia VALUES ('~/Documents/Audio/HTGAWM', 'How To Get Away With Muder E01');

INSERT INTO Legenda_Midia VALUES ('~/Documents/Subtitle/Friends', 'Friends E01');
INSERT INTO Legenda_Midia VALUES ('~/Documents/Subtitle/HIMYM', 'How I Met Your Mother E01');
INSERT INTO Legenda_Midia VALUES ('~/Documents/Subtitle/StrangerThings', 'Stranger Things E01');
INSERT INTO Legenda_Midia VALUES ('~/Documents/Subtitle/Lost', 'Lost E01');
INSERT INTO Legenda_Midia VALUES ('~/Documents/Subtitle/HTGAWM', 'How To Get Away With Muder E01');

INSERT INTO Midia_Pertence_Genero VALUES ('Friends', 'Comédia'); 
INSERT INTO Midia_Pertence_Genero VALUES ('How I Met Your Mother', 'Comédia'); 
INSERT INTO Midia_Pertence_Genero VALUES ('Lost', 'Suspense'); 
INSERT INTO Midia_Pertence_Genero VALUES ('Stranger Things', 'Suspense'); 
INSERT INTO Midia_Pertence_Genero VALUES ('How To Get Away With Muder', 'Suspense'); 

INSERT INTO Midia_Pertence_Temporada VALUES ('Friends E01', 1);   
INSERT INTO Midia_Pertence_Temporada VALUES ('How I Met Your Mother E01', 1);   
INSERT INTO Midia_Pertence_Temporada VALUES ('Lost, E01', 1);   
INSERT INTO Midia_Pertence_Temporada VALUES ('Stranger Things E01', 1);   
INSERT INTO Midia_Pertence_Temporada VALUES ('How To Get Away With Muder E01', 1);   




/*


CREATE TABLE Midia_Pertence_Genero (
    Titulo_Midia VARCHAR2(100),
        PRIMARY KEY (Titulo_Midia),
        FOREIGN KEY (Titulo_Midia) REFERENCES Midia(Titulo) ON DELETE SET NULL,
    
    Nome_Genero VARCHAR2(30),
        PRIMARY KEY (Nome_Genero),
        FOREIGN KEY (Nome_Genero) REFERENCES Genero(Nome) ON DELETE SET NULL
);

CREATE TABLE Legenda_Midia (
    Legenda VARCHAR2(200),
        PRIMARY KEY (Legenda),
    
    Titulo VARCHAR2(100),
        PRIMARY KEY (Titulo),
        FOREIGN KEY (Titulo) REFERENCES Midia(Titulo) ON DELETE SET NULL 
);



CREATE TABLE Audio_Midia (
    Audio VARCHAR2(200),
        PRIMARY KEY (Audio),
    
    Titulo VARCHAR2(100),
        PRIMARY KEY (Titulo),
        FOREIGN KEY (Titulo) REFERENCES Midia(Titulo) ON DELETE SET NULL 
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

CREATE TABLE Publica (
    Id NUMBER CHECK(Id >= 0),
        PRIMARY KEY (Id),
    
    Nota NUMBER CHECK (Nota >= 0 OR Nota <= 10),
    
    Data_nota DATE,
    
    Comentario VARCHAR2(300),
    
    Data_comentario DATE
);




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

CREATE TABLE Deposito_Bancario (
    Forma_de_Pagamento VARCHAR2(20),
        PRIMARY KEY (Forma_de_Pagamento),
        FOREIGN KEY (Forma_de_Pagamento) REFERENCES Forma_de_Pagamento(Metodo) ON DELETE SET NULL,
    Conta_Deposito_Bancario NUMBER(6),
        FOREIGN KEY (Conta_Deposito_Bancario) REFERENCES Conta_Deposito_Bancario(Conta) ON DELETE SET NULL,
    Agencia_Deposito_Bancario NUMBER(5),
        FOREIGN KEY (Agencia_Deposito_Bancario) REFERENCES Agencia_Deposito_Bancario(Agencia) ON DELETE SET NULL
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

	Data_vigor DATE,
        PRIMARY KEY (Data_vigor),
    Nome_Plano VARCHAR2(50),
        PRIMARY KEY (Nome_Plano),
        FOREIGN KEY (Nome_Plano) REFERENCES Plano(Nome) ON DELETE SET NULL,
    Nome_de_usuario_Conta VARCHAR(50) CHECK(
        REGEXP_LIKE(Alias, '[a-zA-Z_[:digit:]]+')),
        PRIMARY KEY (Nome_de_usuario_Conta),
        FOREIGN KEY (Nome_de_usuario_Conta) REFERENCES Conta(Nome_de_usuario) ON DELETE SET NULL


--    Nome_Plano VARCHAR2(50),
--        PRIMARY KEY (Nome_Plano),
--        FOREIGN KEY (Nome_Plano) REFERENCES Plano(Nome) ON DELETE SET NULL,
--    Nome_de_usuario_Conta VARCHAR(50) CHECK (
--        REGEXP_LIKE (Nome_de_usuario_Conta, '[a-zA-Z_[:digit:]]+')
--        ),
--        PRIMARY KEY (Nome_de_usuario_Conta),
--        FOREIGN KEY (Nome_de_usuario_Conta) REFERENCES Conta(Nome_de_usuario) ON DELETE SET NULL


--    Nome VARCHAR2(50),
--        PRIMARY KEY (Nome),
--    Preco REAL,
--    Qualidade VARCHAR2(10),
--    Videos_simultaneos NUMBER,
--    Numero_de_perfis NUMBER,
--    Outras_descricoes VARCHAR2(500)

-- g_guimaraes
-- leticia_rina
-- mr_pinoquio
-- jureg_monteiro
-- kawaiiro