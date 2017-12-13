INSERT INTO Plano VALUES ('Super Premium', 30.00, 'UHD 4k', 10, 8, 'Melhor plano 10/10');
INSERT INTO Plano VALUES ('Só Premium Mesmo', 20.00, 'FHD 1080p', 6, 8, 'Segundo melhor plano, ainda 10/10');
INSERT INTO Plano VALUES ('Plano Bom', 15.00, 'HD 720p', 6, 8, 'Terceiro melhor plano, aqui é tudo 10/10');
INSERT INTO Plano VALUES ('Sua Internet é Ruim, Né?', 10.00, '480p', 6, 8, 'Melhore seu plano de internet');
INSERT INTO Plano VALUES ('Como Você Sobrevive Com Essa Internet?', 5.00, '240p', 6, 8, 'Meus pêsames');

INSERT INTO Forma_de_Pagamento VALUES ('P');
INSERT INTO Forma_de_Pagamento VALUES ('C');
INSERT INTO Forma_de_Pagamento VALUES ('D');

INSERT INTO Genero VALUES ('Comédia');
INSERT INTO Genero VALUES ('Terror');
INSERT INTO Genero VALUES ('Romance');
INSERT INTO Genero VALUES ('Ficção Científica');
INSERT INTO Genero VALUES ('Suspense');

INSERT INTO Numero_Cartao_de_Credito VALUES ('C', 1111111111111111);
INSERT INTO Numero_Cartao_de_Credito VALUES ('C', 2222222222222222);
INSERT INTO Numero_Cartao_de_Credito VALUES ('C', 3333333333333333);
INSERT INTO Numero_Cartao_de_Credito VALUES ('C', 4444444444444444);
INSERT INTO Numero_Cartao_de_Credito VALUES ('C', 5555555555555555);

INSERT INTO Conta_do_Deposito_Bancario VALUES (354670, 12345, 'Banco do Brasil', 'Victor', 'Luis Forbes', 0051314517);
INSERT INTO Conta_do_Deposito_Bancario VALUES (684540, 35467, 'Bradesco', 'José Augusto', 'Noronha', 05880216527);
INSERT INTO Conta_do_Deposito_Bancario VALUES (135665, 68454, 'Santander', 'Valéria', 'Maia Lobo Menezes', 00498289599);
INSERT INTO Conta_do_Deposito_Bancario VALUES (490207, 12213, 'City Bank', 'Roberta', 'Tonello', 05880236551);
INSERT INTO Conta_do_Deposito_Bancario VALUES (133441, 25478, 'Caixa Econômica', 'Marcelo', 'Manzato', 00736512345);

-- Aqui são números, não precisa de strings
INSERT INTO Idade_Faixa_Etaria VALUES (25, 18);
INSERT INTO Idade_Faixa_Etaria VALUES (11, 14);
INSERT INTO Idade_Faixa_Etaria VALUES (34, 18);
INSERT INTO Idade_Faixa_Etaria VALUES (19, 16);
INSERT INTO Idade_Faixa_Etaria VALUES (15, 10);

-- Pessoas que participam de séries ou filmes
INSERT INTO Pessoa VALUES ('Gebariel Nacismento');
INSERT INTO Pessoa VALUES ('José Otávio Edmilson');
INSERT INTO Pessoa VALUES ('Letícia Tina Sakurai');
INSERT INTO Pessoa VALUES ('Otávio Luis Aguiar');
INSERT INTO Pessoa VALUES ('Airo Soares');

-- Aqui é o nome da série e não das pessoas :v
-- Número de temporada e classificação são NUMBER não VARCHAR2
INSERT INTO Serie VALUES ('Friends', 10, 18);
INSERT INTO Serie VALUES ('How I Met Your Mother', 8, 18);
INSERT INTO Serie VALUES ('Stranger Things', 2, 10);
INSERT INTO Serie VALUES ('How to Get Away with Murder', 4, 16);
INSERT INTO Serie VALUES ('Lost', 6, 10);

INSERT INTO Dispositivo VALUES (1, 'Gebariel Nacismento', 'Android');
INSERT INTO Dispositivo VALUES (2, 'José Otávio Edmilson', 'IOS');
INSERT INTO Dispositivo VALUES (3, 'Letícia Tina Sakurai', 'Android');
INSERT INTO Dispositivo VALUES (4, 'Otávio Luis Aguiar', 'MAC OS');
INSERT INTO Dispositivo VALUES (5, 'Airo Soares', 'Windows');

INSERT INTO Review VALUES (1, 6, '25-OCT-2016', 'Série muito boa! Melhor que Globo!', '25-OCT-2016');
INSERT INTO Review VALUES (2, 5, '13-DEC-2013', 'Melhor que já vi!', '16-DEC-2003');
INSERT INTO Review VALUES (3, 8, '05-APR-2005', 'Atores de primeira!', '20-MAY-2004');
INSERT INTO Review VALUES (4, 10, '18-JUN-2001', 'Roteiros muito bem escritos.', '19-JUN-2001');
INSERT INTO Review VALUES (5, 7, '22-APR-1996', 'Fraca. Esperava mais.', '22-MAY-1997');

INSERT INTO Midia VALUES ('Harry Potter and the Half-Blood Prince', 'Filme', 'hp6.png', '10-DEC-2017', 125, 'Heroi mata bandido', 18);
INSERT INTO Midia VALUES ('The Breakfast Club', 'Filme', 'breakfastclub.png', '10-DEC-2017', 62, 'Heroi mata bandido', 18);
INSERT INTO Midia VALUES ('Clube da Luta', 'Filme', 'fightclub.png', '10-DEC-2017', 70, 'Heroi mata bandido', 16);
INSERT INTO Midia VALUES ('Titanic', 'Filme', 'titanic.png', '10-DEC-2017', 84, 'Heroi mata bandido', 10);
INSERT INTO Midia VALUES ('Moonlight', 'Filme', 'moonlight.png', '10-DEC-2017', 56, 'Heroi mata bandido', 10);
INSERT INTO Midia VALUES ('E1S1', 'Episódio', 'friends.png', '10-DEC-2017', 60, 'Heroi mata bandido', 18);
INSERT INTO Midia VALUES ('E2S8', 'Episódio', 'howimet.png', '10-DEC-2017', 77, 'Heroi mata bandido', 16);
INSERT INTO Midia VALUES ('E3S1', 'Episódio', 'lost.png', '10-DEC-2017', 89, 'Heroi mata bandido', 16);
INSERT INTO Midia VALUES ('E1E4', 'Episódio', 'strangerthings.png', '10-DEC-2017', 57, 'Heroi mata bandido', 10);
INSERT INTO Midia VALUES ('E1S5', 'Episódio', 'howtogetaway.png', '10-DEC-2017', 94, 'Heroi mata bandido', 10);

INSERT INTO Temporada VALUES (1, 'Friends', 24);
INSERT INTO Temporada VALUES (2, 'Friends', 24);
INSERT INTO Temporada VALUES (3, 'Friends', 24);
INSERT INTO Temporada VALUES (4, 'Friends', 24);
INSERT INTO Temporada VALUES (5, 'Friends', 24);
INSERT INTO Temporada VALUES (6, 'Friends', 24);
INSERT INTO Temporada VALUES (7, 'Friends', 24);
INSERT INTO Temporada VALUES (8, 'Friends', 24);
INSERT INTO Temporada VALUES (9, 'Friends', 24);
INSERT INTO Temporada VALUES (10, 'Friends', 24);
INSERT INTO Temporada VALUES (1, 'How I Met Your Mother', 24);
INSERT INTO Temporada VALUES (2, 'How I Met Your Mother', 24);
INSERT INTO Temporada VALUES (3, 'How I Met Your Mother', 24);
INSERT INTO Temporada VALUES (4, 'How I Met Your Mother', 24);
INSERT INTO Temporada VALUES (5, 'How I Met Your Mother', 24);
INSERT INTO Temporada VALUES (6, 'How I Met Your Mother', 24);
INSERT INTO Temporada VALUES (1, 'Stranger Things', 8);
INSERT INTO Temporada VALUES (2, 'Stranger Things', 8);
INSERT INTO Temporada VALUES (1, 'How to Get Away with Murder', 15);
INSERT INTO Temporada VALUES (2, 'How to Get Away with Murder', 15);
INSERT INTO Temporada VALUES (3, 'How to Get Away with Murder', 15);
INSERT INTO Temporada VALUES (1, 'Lost', 17);
INSERT INTO Temporada VALUES (2, 'Lost', 17);
INSERT INTO Temporada VALUES (3, 'Lost', 17);
INSERT INTO Temporada VALUES (4, 'Lost', 17);
INSERT INTO Temporada VALUES (5, 'Lost', 17);

-- (Titulo da midia, nome da série, número da temporada que o ep pertence)
INSERT INTO Temporada_Midia(Titulo_Midia, Nome_Serie_Temporada, Numero_Temporada) VALUES ('E1S1', NULL, 1);
INSERT INTO Temporada_Midia(Titulo_Midia, Nome_Serie_Temporada, Numero_Temporada) VALUES ('E2S8', 'How I Met Your Mother', 8);
INSERT INTO Temporada_Midia(Titulo_Midia, Nome_Serie_Temporada, Numero_Temporada) VALUES ('E3S1', 'Stranger Things', 2);
INSERT INTO Temporada_Midia(Titulo_Midia, Nome_Serie_Temporada, Numero_Temporada) VALUES ('E1E4', 'How to Get Away with Murder', 4);
INSERT INTO Temporada_Midia(Titulo_Midia, Nome_Serie_Temporada, Numero_Temporada) VALUES ('E1S5', 'Lost', 6);

INSERT INTO Conta VALUES ('José Otávio Edmilson', 'P', 'batataDoce', 'João da Silva', 12345678901, 'jao@servidorx.com', '13-DEC-1996');
INSERT INTO Conta VALUES ('Otávio Luis Aguiar', 'P', 'queroFeriasAjudaDeus', 'José da Silva', 43215678097, 'jose@servidorx.com', '13-DEC-1998');
INSERT INTO Conta VALUES ('Letícia Tina Sakurai', 'P', 'nossaSenhoraDo5Bola', 'Maria da Silva', 67890854372, 'maria@servidorx.com', '13-DEC-2000');
INSERT INTO Conta VALUES ('Gebariel Nacismento', 'P', 'meLivraiDasDps', 'Enzo da Silva', 12348765012, 'enzo@servidorx.com', '13-DEC-2002');
INSERT INTO Conta VALUES ('Airo Soares', 'P', 'olhaOsNaboVindo', 'Valentina da Silva', 10273849273, 'valentina@servidorx.com', '13-DEC-2004');

INSERT INTO Perfil VALUES ('leticiarina', 'leticia_rina', 18, 'Full HD', 'Japonês', 'Inglês');
INSERT INTO Perfil VALUES ('mrpinoquio', 'mr_pinoquio', 18, 'HD', 'Português', 'Inglês');
INSERT INTO Perfil VALUES ('juregmonteiro', 'jureg_monteiro', 18, 'HD', 'Inglês', 'Português');
INSERT INTO Perfil VALUES ('kawaiiro', 'kawaiiro', 18, 'Low quality', 'Inglês', 'Espanhol');
INSERT INTO Perfil VALUES ('gguimaraes', 'g_guimaraes', 18, 'Normal', 'Espanhol', 'Inglês');

INSERT INTO Amizade VALUES (1, 'leticiarina', 'leticia_rina', 'mrpinoquio', 'mr_pinoquio');
INSERT INTO Amizade VALUES (2, 'mrpinoquio', 'mr_pinoquio', 'juregmonteiro', 'jureg_monteiro');
INSERT INTO Amizade VALUES (3, 'kawaiiro', 'kawaiiro', 'gguimaraes', 'g_guimaraes');
INSERT INTO Amizade VALUES (4, 'juregmonteiro', 'jureg_monteiro', 'kawaiiro', 'kawaiiro');
INSERT INTO Amizade VALUES (5, 'gguimaraes', 'g_guimaraes', 'leticiarina', 'leticia_rina');

INSERT INTO Acesso VALUES ('25-JUN-2015 09:23:50', 'Zenfone 5', 'leticiarina', '192.168.1.2');
INSERT INTO Acesso VALUES ('10-SET-2016 00:19:23', 'Galaxy S3', 'mrpinoquio', '127.183.4.5');
INSERT INTO Acesso VALUES ('02-JAN-2017 18:01:35', 'LG KP215', 'kawaiiro', '193.156.8.2');
INSERT INTO Acesso VALUES ('17-NOV-2014 15:57:00', 'iPhone 5C', 'gguimaraes', '174.185.4.1');
INSERT INTO Acesso VALUES ('21-MAI-2017 22:48:18', 'Dell Inspiron', 'juregmonteiro', '139.177.7.2');

INSERT INTO Perfil_Assiste_Midia VALUES ('leticiarina', 'leticia_rina', 'Harry Potter and the Half-Blood Prince', 1, 1456);
INSERT INTO Perfil_Assiste_Midia VALUES ('mrpinoquio', 'mr_pinoquio', 'The Breakfast Club', 2, 2735);
INSERT INTO Perfil_Assiste_Midia VALUES ('juregmonteiro', 'jureg_monteiro', 'Clube da Luta', 3, 1523);
INSERT INTO Perfil_Assiste_Midia VALUES ('kawaiiro', 'kawaiiro', 'Titanic', 4, 1233);
INSERT INTO Perfil_Assiste_Midia VALUES ('gguimaraes', 'g_guimaraes', 'Moonlight', 5, 1822);

INSERT INTO Perfil_Possui_Dispositivo VALUES (1, 'leticiarina', 'leticia_rina');
INSERT INTO Perfil_Possui_Dispositivo VALUES (2, 'mrpinoquio', 'mr_pinoquio');
INSERT INTO Perfil_Possui_Dispositivo VALUES (3, 'kawaiiro', 'kawaiiro');
INSERT INTO Perfil_Possui_Dispositivo VALUES (4, 'gguimaraes', 'g_guimaraes');
INSERT INTO Perfil_Possui_Dispositivo VALUES (5, 'juregmonteiro', 'jureg_monteiro');

INSERT INTO Amizade_Recomenda_Midia VALUES (1, 'leticiarina', 'leticia_rina', 'mrpinoquio', 'mr_pinoquio', 'Stranger Things', 'Melhor série Pipi');
INSERT INTO Amizade_Recomenda_Midia VALUES (2, 'mrpinoquio', 'mr_pinoquio', 'juregmonteiro', 'jureg_monteiro', 'Lost', 'Assiste aí Jurg, muito bom');
INSERT INTO Amizade_Recomenda_Midia VALUES (3, 'kawaiiro', 'kawaiiro', 'gguimaraes', 'g_guimaraes');
INSERT INTO Amizade_Recomenda_Midia VALUES (4, 'juregmonteiro', 'jureg_monteiro', 'kawaiiro', 'kawaiiro', 'How I Met Your Mother', 'Marshall homão da porra');
INSERT INTO Amizade_Recomenda_Midia VALUES (5, 'gguimaraes', 'g_guimaraes', 'leticiarina', 'leticia_rina');

INSERT INTO Midia_Pessoa VALUES ('Harry Potter and the Half-Blood Prince', 'Daniel Radcliffe', 0, 1);
INSERT INTO Midia_Pessoa VALUES ('The Breakfast Club', 'John Hughes', 1, 0);
INSERT INTO Midia_Pessoa VALUES ('Clube da Luta', 'Brad Pitt', 0, 1);
INSERT INTO Midia_Pessoa VALUES ('Titanic', 'Leonardo DiCaprio', 0, 1);
INSERT INTO Midia_Pessoa VALUES ('Moonlight', 'Barry Jenkins', 1, 0);

INSERT INTO Serie_Pessoa VALUES ('Friends', 'Jennifer Aniston', 0, 1);
INSERT INTO Serie_Pessoa VALUES ('How I Met Your Mother', 'Josh Radnor', 0, 1);
INSERT INTO Serie_Pessoa VALUES ('Stranger Things', 'The Duffer Brothers', 1, 0);
INSERT INTO Serie_Pessoa VALUES ('How to Get Away with Murder', 'Peter Nowalk', 1, 0);
INSERT INTO Serie_Pessoa VALUES ('Lost', 'Jeffrey Lieber', 1, 0);

INSERT INTO Pessoa_Participa_Midia VALUES ('Harry Potter and the Half-Blood Prince', 'Bonnie Wright', 0, 1);
INSERT INTO Pessoa_Participa_Midia VALUES ('The Breakfast Club', 'Carl Reed', 0, 1);
INSERT INTO Pessoa_Participa_Midia VALUES ('Clube da Luta', 'Art Linson', 1, 0);
INSERT INTO Pessoa_Participa_Midia VALUES ('Titanic', 'Jon Landau', 1, 0);
INSERT INTO Pessoa_Participa_Midia VALUES ('Moonlight', 'Jaden Piner', 0, 1);

INSERT INTO Pessoa_Participa_Serie VALUES ('Friends', 'Kevin S. Bright', 1, 0);
INSERT INTO Pessoa_Participa_Serie VALUES ('How I Met Your Mother', 'Michael J. Fox', 0, 1);
INSERT INTO Pessoa_Participa_Serie VALUES ('Stranger Things', 'Cindy Holland', 1, 0);
INSERT INTO Pessoa_Participa_Serie VALUES ('How to Get Away with Murder', 'Katie Findlay', 0, 1);
INSERT INTO Pessoa_Participa_Serie VALUES ('Lost', 'J. J. Abrams', 1, 0);

INSERT INTO Conta_Deposito_Bancario VALUES ('D', 111111, 12345, 'Banco do Brasil', 'José Augusto', 'Noronha', 05880216527);
INSERT INTO Conta_Deposito_Bancario VALUES ('D', 222222, 67890, 'Bradesco', 'Letícia', 'Rina Sakurai', 00023116522);
INSERT INTO Conta_Deposito_Bancario VALUES ('D', 333333, 23456, 'Santander', 'Lucas', 'Alexandre Soares', 00666645287);
INSERT INTO Conta_Deposito_Bancario VALUES ('D', 444444, 34567, 'Caixa Econômica', 'Giovanna', 'Guimarães Rosa', 02123665984);
INSERT INTO Conta_Deposito_Bancario VALUES ('D', 555555, 45678, 'Banco do Brasil', 'Rafael', 'Monteiro', 01145485877);

INSERT INTO Cartao_de_Credito VALUES (1111111111111111, 'ELO', 123, '11-SEP-2001', 'Gebariel Nacismento');
INSERT INTO Cartao_de_Credito VALUES (2222222222222222, 'CIELO', 456, '29-APR-1994', 'José Otávio Edmilson');
INSERT INTO Cartao_de_Credito VALUES (3333333333333333, 'VISAPAY', 789, '24-DEC-2017', 'Letícia Tina Sakurai');
INSERT INTO Cartao_de_Credito VALUES (4444444444444444, 'MASTERCARD', 345, '15-DEC-2017', 'Otávio Luis Aguiar');
INSERT INTO Cartao_de_Credito VALUES (5555555555555555, 'SOSEXO', 666, '30-JAN-2018', 'Airo Soares');

INSERT INTO Numero_Cartao_de_Credito VALUES ('C', 1111111111111111);
INSERT INTO Numero_Cartao_de_Credito VALUES ('C', 2222222222222222);
INSERT INTO Numero_Cartao_de_Credito VALUES ('C', 3333333333333333);
INSERT INTO Numero_Cartao_de_Credito VALUES ('C', 4444444444444444);
INSERT INTO Numero_Cartao_de_Credito VALUES ('C', 5555555555555555);

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

INSERT INTO Gerencia VALUES ('jureg_monteiro', 'juregmonteiro', 'Enzo1', 'juregmonteiro');
INSERT INTO Gerencia VALUES ('mr_pinoquio', 'mrpinoquio', 'Enzo2', 'mrpinoquio');
INSERT INTO Gerencia VALUES ('leticia_rina', 'leticiarina', 'Enzo3', 'leticiarina');
INSERT INTO Gerencia VALUES ('g_guimaraes', 'gguimaraes', 'Enzo4', 'gguimaraes');
INSERT INTO Gerencia VALUES ('kawaiiro', 'kawaiiro', 'Enzo5', 'kawaiiro');

INSERT INTO Audio_Midia VALUES ('/var/oracle/Audio/Friends', 'Friends E01');
INSERT INTO Audio_Midia VALUES ('/var/oracle/Audio/HIMYM', 'How I Met Your Mother E01');
INSERT INTO Audio_Midia VALUES ('/var/oracle/Audio/StrangerThings', 'Stranger Things E01');
INSERT INTO Audio_Midia VALUES ('/var/oracle/Audio/Lost', 'Lost E01');
INSERT INTO Audio_Midia VALUES ('/var/oracle/Audio/HTGAWM', 'How To Get Away With Muder E01');

INSERT INTO Legenda_Midia VALUES ('/var/oracle/Subtitle/Friends', 'Friends E01');
INSERT INTO Legenda_Midia VALUES ('/var/oracle/Subtitle/HIMYM', 'How I Met Your Mother E01');
INSERT INTO Legenda_Midia VALUES ('/var/oracle/Subtitle/StrangerThings', 'Stranger Things E01');
INSERT INTO Legenda_Midia VALUES ('/var/oracle/Subtitle/Lost', 'Lost E01');
INSERT INTO Legenda_Midia VALUES ('/var/oracle/Subtitle/HTGAWM', 'How To Get Away With Muder E01');

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

INSERT INTO Paypal VALUES ('P', 'zikadorole', 'xovana@gmail.com');
INSERT INTO Paypal VALUES ('P', 'airoboylindo', 'airomello@hotmail.com');
INSERT INTO Paypal VALUES ('P', 'tinabinarina', 'ahmano@bol.com.br');
INSERT INTO Paypal VALUES ('P', 'pipidourado', 'pipizones@gmail.com');
INSERT INTO Paypal VALUES ('P', 'lolzinfoda', 'ritogomes@gmail.com');

INSERT INTO Conta_Assina_Plano VALUES ('Super Premium', 'José Otávio Edmilson');
INSERT INTO Conta_Assina_Plano VALUES ('Só Premium Mesmo', 'Otávio Luis Aguiar');
INSERT INTO Conta_Assina_Plano VALUES ('Plano Bom', 'Letícia Tina Sakurai');
INSERT INTO Conta_Assina_Plano VALUES ('Como Você Sobrevive Com Essa Internet?', 'Gebariel Nacismento');
INSERT INTO Conta_Assina_Plano VALUES ('Sua Internet é Ruim, Né?', 'Airo Soares');

INSERT INTO Assinatura VALUES ('10-NOV-2016', 'Super Premium', 'José Otávio Edmilson');
INSERT INTO Assinatura VALUES ('10-DEC-2016', 'Só Premium Mesmo', 'Otávio Luis Aguiar');
INSERT INTO Assinatura VALUES ('10-JAN-2016', 'Plano Bom', 'Letícia Tina Sakurai');
INSERT INTO Assinatura VALUES ('10-OCT-2016', 'Como Você Sobrevive Com Essa Internet?', 'Gebariel Nacismento');
INSERT INTO Assinatura VALUES ('10-APR-2016', 'Sua Internet é Ruim, Né?', 'Airo Soares');

-- No parent key
INSERT INTO Pagamento VALUES (123, '10-NOV-2017', 'Super Premium', 'José Otávio Edmilson', 30.0, 30);
INSERT INTO Pagamento VALUES (456, '10-DEZ-2017', 'Só Premium Mesmo', 'Otávio Luis Aguiar', 20.0, 0);
INSERT INTO Pagamento VALUES (666, '10-JAN-2017', 'Letícia Tina Sakurai', 15.0, 330);
INSERT INTO Pagamento VALUES (323, '10-OUT-2017', 'Como Você Sobrevive Com Essa Internet?', 'Gebariel Nacismento', 10.0, 60);
INSERT INTO Pagamento VALUES (171, '10-ABR-2017', 'Sua Internet é Ruim, Né?', 'Airo Soares', 5.0, 240);

COMMIT;