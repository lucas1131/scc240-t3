INSERT INTO Plano VALUES ('Super Premium', 30.00, 'Ultra HD 4k', 10, 8, 'Melhor plano 10/10');
INSERT INTO Plano VALUES ('Só Premium Mesmo', 20.00, 'Full HD 1080p', 6, 8, 'Segundo melhor plano, ainda 10/10');
INSERT INTO Plano VALUES ('Plano Bom', 15.00, 'HD 720p', 6, 8, 'Terceiro melhor plano, aqui é tudo 10/10');
INSERT INTO Plano VALUES ('Sua Internet é Ruim, Né?', 10.00, '480p', 6, 8, 'Melhore seu plano de internet');
INSERT INTO Plano VALUES ('Como Você Sobrevive Com Essa Internet?', 5.00, '240p', 6, 8, 'Meus pêsames');

INSERT INTO Conta_Assina_Plano VALUES ('Super Premium', 'José Otávio Edmilson');
INSERT INTO Conta_Assina_Plano VALUES ('Só Premium Mesmo', 'Otávio Luis Aguiar');
INSERT INTO Conta_Assina_Plano VALUES ('Plano Bom', 'Letícia Tina Sakurai');
INSERT INTO Conta_Assina_Plano VALUES ('Como Você Sobrevive Com Essa Internet?', 'Gebariel Nacismento');
INSERT INTO Conta_Assina_Plano VALUES ('Sua Internet é Ruim, Né?', 'Airo Soares');

INSERT INTO Assinatura VALUES ('10-NOV-2016', 'Super Premium', 'José Otávio Edmilson');
INSERT INTO Assinatura VALUES ('10-DEZ-2016', 'Só Premium Mesmo', 'Otávio Luis Aguiar');
INSERT INTO Assinatura VALUES ('10-JAN-2016', 'Letícia Tina Sakurai');
INSERT INTO Assinatura VALUES ('10-OUT-2016', 'Como Você Sobrevive Com Essa Internet?', 'Gebariel Nacismento');
INSERT INTO Assinatura VALUES ('10-ABR-2016', 'Sua Internet é Ruim, Né?', 'Airo Soares');

INSERT INTO Pagamento VALUES ('123', '10-NOV-2017', 'Super Premium', 'José Otávio Edmilson', 30.0, 30);
INSERT INTO Pagamento VALUES ('456', '10-DEZ-2017', 'Só Premium Mesmo', 'Otávio Luis Aguiar', 20.0, 0);
INSERT INTO Pagamento VALUES ('666', '10-JAN-2017', 'Letícia Tina Sakurai', 15.0, 330);
INSERT INTO Pagamento VALUES ('323', '10-OUT-2017', 'Como Você Sobrevive Com Essa Internet?', 'Gebariel Nacismento', 10.0, 60);
INSERT INTO Pagamento VALUES ('171', '10-ABR-2017', 'Sua Internet é Ruim, Né?', 'Airo Soares', 5.0, 240);

INSERT INTO Conta VALUES ('José Otávio Edmilson', 'P', 'batataDoce', 'João da Silva', 12345678901, 'jao@servidorx.com');
INSERT INTO Conta VALUES ('Otávio Luis Aguiar', 'P', 'queroFeriasMeAjudaDeus', 'José da Silva', 43215678097, 'jose@servidorx.com');
INSERT INTO Conta VALUES ('Letícia Tina Sakurai', 'P', 'nossaSenhoraDo5Bola', 'Maria da Silva', 67890854372, 'maria@servidorx.com');
INSERT INTO Conta VALUES ('Gebariel Nacismento', 'P', 'meLivraiDasDps', 'Enzo da Silva', 12348765012, 'enzo@servidorx.com');
INSERT INTO Conta VALUES ('Airo Soares', 'P', 'olhaOsNaboVindo', 'Valentina da Silva', 10273849273, 'valentina@servidorx.com');





-- P 
-- D
-- C




/*  

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

-- Gebariel Nacismento
-- José Otávio Edmilson
-- Letícia Tina Sakurai
-- Otávio Luis Aguiar
-- Airo Soares