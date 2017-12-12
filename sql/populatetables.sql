
INSERT INTO Forma_de_Pagamento VALUES ('P');
INSERT INTO Forma_de_Pagamento VALUES ('C');
INSERT INTO Forma_de_Pagamento VALUES ('D');

INSERT INTO Genero VALUES('Comédia');
INSERT INTO Genero VALUES('Terror');
INSERT INTO Genero VALUES('Romance');
INSERT INTO Genero VALUES('Ficção Científica');
INSERT INTO Genero VALUES('Suspense');

-- Pessoas que participam de séries ou filmes
INSERT INTO Pessoa VALUES ('Daniel Radcliffe');
INSERT INTO Pessoa VALUES ('John Hughes');
INSERT INTO Pessoa VALUES ('Brad Pitt');
INSERT INTO Pessoa VALUES ('Leonardo DiCaprio');
INSERT INTO Pessoa VALUES ('Barry Jenkins');
INSERT INTO Pessoa VALUES ('Jennifer Aniston');
INSERT INTO Pessoa VALUES ('Josh Radnor');
INSERT INTO Pessoa VALUES ('The Duffer Brothers');
INSERT INTO Pessoa VALUES ('Peter Nowalk');
INSERT INTO Pessoa VALUES ('Jeffrey Lieber');
INSERT INTO Pessoa VALUES ('Bonnie Wright');
INSERT INTO Pessoa VALUES ('Carl Reed');
INSERT INTO Pessoa VALUES ('Art Linson');
INSERT INTO Pessoa VALUES ('Jon Landau');
INSERT INTO Pessoa VALUES ('Jaden Piner');
INSERT INTO Pessoa VALUES ('Kevin S. Bright');
INSERT INTO Pessoa VALUES ('Michael J. Fox');
INSERT INTO Pessoa VALUES ('Cindy Holland');
INSERT INTO Pessoa VALUES ('Katie Findlay');
INSERT INTO Pessoa VALUES ('J. J. Abrams');

-- Aqui é o nome da série e não das pessoas :v
-- Número de temporada e classificação são NUMBER não VARCHAR2
INSERT INTO Serie VALUES('Friends', 10, 18);
INSERT INTO Serie VALUES('How I Met Your Mother', 8, 18);
INSERT INTO Serie VALUES('Stranger Things', 2, 10);
INSERT INTO Serie VALUES('How to Get Away with Murder', 4, 16);
INSERT INTO Serie VALUES('Lost', 6, 10);

-- Aqui são números, não precisa de strings
INSERT INTO Idade_Faixa_Etaria VALUES(10, 10);
INSERT INTO Idade_Faixa_Etaria VALUES(12, 12);
INSERT INTO Idade_Faixa_Etaria VALUES(16, 16);
INSERT INTO Idade_Faixa_Etaria VALUES(18, 18);
INSERT INTO Idade_Faixa_Etaria VALUES(19, 18);
INSERT INTO Idade_Faixa_Etaria VALUES(20, 18);
INSERT INTO Idade_Faixa_Etaria VALUES(21, 18);

INSERT INTO Plano VALUES ('Super Premium', 30.00, 'UHD 4k', 10, 8, 'Melhor plano 10/10');
INSERT INTO Plano VALUES ('Só Premium Mesmo', 20.00, 'FHD 1080p', 6, 8, 'Segundo melhor plano, ainda 10/10');
INSERT INTO Plano VALUES ('Plano Bom', 15.00, 'HD 720p', 6, 8, 'Terceiro melhor plano, aqui é tudo 10/10');
INSERT INTO Plano VALUES ('Sua Internet é Ruim, Né?', 10.00, '480p', 6, 8, 'Melhore seu plano de internet');
INSERT INTO Plano VALUES ('Como Você Sobrevive Com Essa Internet?', 5.00, '240p', 6, 8, 'Meus pêsames');

INSERT INTO Conta VALUES ('leticia_rina', 'P', 'batataDoce', 'Leticia Tina', 12345678901, 'leticiatina@gmail.com', '13-DEC-1996');
INSERT INTO Conta VALUES ('mr_pinoquio', 'P', 'queroFeriasAjudaDeus', 'Mr Pinoquio', 43215678097, 'jose@gmail.com', '13-DEC-1998');
INSERT INTO Conta VALUES ('jureg_monteiro', 'P', 'nossaSenhoraDo5Bola', 'Jureg Monteiro', 67890854372, 'jureg@meu.pantado.com', '13-DEC-2000');
INSERT INTO Conta VALUES ('kawaiiro', 'P', 'meLivraiDasDps', 'Kawaiiro', 12348765012, 'lucassoares1793@gmail.com', '13-DEC-2002');
INSERT INTO Conta VALUES ('g_guimaraes', 'P', 'olhaOsNaboVindo', 'Giovanna Guimaraes', 10273849273, 'deusasombriadastrevastrevosas@gmail.com', '13-DEC-2004');

INSERT INTO Conta_Assina_Plano VALUES ('Super Premium', 'leticia_rina');
INSERT INTO Conta_Assina_Plano VALUES ('Só Premium Mesmo', 'mr_pinoquio');
INSERT INTO Conta_Assina_Plano VALUES ('Plano Bom', 'jureg_monteiro');
INSERT INTO Conta_Assina_Plano VALUES ('Como Você Sobrevive Com Essa Internet?', 'kawaiiro');
INSERT INTO Conta_Assina_Plano VALUES ('Sua Internet é Ruim, Né?', 'g_guimaraes');

INSERT INTO Assinatura VALUES ('10-NOV-2016', 'Super Premium', 'leticia_rina');
INSERT INTO Assinatura VALUES ('10-DEC-2016', 'Só Premium Mesmo', 'mr_pinoquio');
INSERT INTO Assinatura VALUES ('10-JAN-2016', 'Plano Bom', 'jureg_monteiro');
INSERT INTO Assinatura VALUES ('10-OCT-2016', 'Como Você Sobrevive Com Essa Internet?', 'kawaiiro');
INSERT INTO Assinatura VALUES ('10-APR-2016', 'Sua Internet é Ruim, Né?', 'g_guimaraes');

INSERT INTO Numero_do_Cartao_de_Credito VALUES(1111111111111111, 'ELO', 123, '11-SEP-2001', 'Gebariel Nacismento');
INSERT INTO Numero_do_Cartao_de_Credito VALUES(2222222222222222, 'CIELO', 456, '29-APR-1994', 'José Otávio Edmilson');
INSERT INTO Numero_do_Cartao_de_Credito VALUES(3333333333333333, 'VISAPAY', 789, '24-DEC-2017', 'Letícia Tina Sakurai');
INSERT INTO Numero_do_Cartao_de_Credito VALUES(4444444444444444, 'MASTERCARD', 345, '15-DEC-2017', 'Otávio Luis Aguiar');
INSERT INTO Numero_do_Cartao_de_Credito VALUES(5555555555555555, 'SODEXO', 666, '30-JAN-2018', 'Airo Soares');

INSERT INTO Conta_do_Deposito_Bancario VALUES(354670, 12345, 'Banco do Brasil', 'Victor', 'Luis Forbes', 0051314517);
INSERT INTO Conta_do_Deposito_Bancario VALUES(684540, 35467, 'Bradesco', 'José Augusto', 'Noronha', 05880216527);
INSERT INTO Conta_do_Deposito_Bancario VALUES(135665, 68454, 'Santander', 'Valéria', 'Maia Lobo Menezes', 00498289599);
INSERT INTO Conta_do_Deposito_Bancario VALUES(490207, 12213, 'City Bank', 'Roberta', 'Tonello', 05880236551);
INSERT INTO Conta_do_Deposito_Bancario VALUES(133441, 25478, 'Caixa Econômica', 'Marcelo', 'Manzato', 00736512345);

INSERT INTO Dispositivo VALUES(1, 'Zenfone 5', 'Android');
INSERT INTO Dispositivo VALUES(2, 'Galaxy S3', 'IOS');
INSERT INTO Dispositivo VALUES(3, 'LG KP215', 'Android');
INSERT INTO Dispositivo VALUES(4, 'iPhone 5C', 'MAC OS');
INSERT INTO Dispositivo VALUES(5, 'Dell Inspiron', 'Windows');

INSERT INTO Review VALUES(1, 6, '25-OCT-2016', 'Série muito boa! Melhor que Globo!', '25-OCT-2016');
INSERT INTO Review VALUES(2, 5, '13-DEC-2013', 'Melhor que já vi!', '16-DEC-2003');
INSERT INTO Review VALUES(3, 8, '05-APR-2005', 'Atores de primeira!', '20-MAY-2004');
INSERT INTO Review VALUES(4, 10, '18-JUN-2001', 'Roteiros muito bem escritos.', '19-JUN-2001');
INSERT INTO Review VALUES(5, 7, '22-APR-1996', 'Fraca. Esperava mais.', '22-MAY-1997');

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


INSERT INTO Pagamento VALUES (123, '10-NOV-2016', 'Super Premium', 'leticia_rina', 30.0, 30);
INSERT INTO Pagamento VALUES (456, '10-DEC-2016', 'Só Premium Mesmo', 'mr_pinoquio', 20.0, 0);
INSERT INTO Pagamento VALUES (666, '10-JAN-2016', 'Plano Bom', 'jureg_monteiro', 15.0, 330);
INSERT INTO Pagamento VALUES (323, '10-OCT-2016', 'Como Você Sobrevive Com Essa Internet?', 'kawaiiro', 10.0, 60);
INSERT INTO Pagamento VALUES (171, '10-APR-2016', 'Sua Internet é Ruim, Né?', 'g_guimaraes', 5.0, 240);

INSERT INTO Perfil VALUES ('leticiarina', 'leticia_rina', 18, 'Full HD', 'Chinês', 'Koreano');
INSERT INTO Perfil VALUES ('mrpinoquio', 'mr_pinoquio', 18, 'HD', 'Português', 'Inglês');
INSERT INTO Perfil VALUES ('juregmonteiro', 'jureg_monteiro', 18, 'HD', 'Inglês', 'Português');
INSERT INTO Perfil VALUES ('kawaiiro', 'kawaiiro', 20, 'Low quality', 'Inglês', 'Espanhol');
INSERT INTO Perfil VALUES ('gguimaraes', 'g_guimaraes', 18, 'Normal', 'Japonês', 'Inglês');

INSERT INTO Acesso VALUES ('25-JUN-2015 09:23:50', 1, 'leticiarina', 'leticia_rina', '192.168.1.2');
INSERT INTO Acesso VALUES ('10-SEP-2016 01:19:23', 2, 'mrpinoquio',	'mr_pinoquio', '127.183.4.5');
INSERT INTO Acesso VALUES ('02-JAN-2017 12:01:35', 3, 'juregmonteiro', 'jureg_monteiro', '193.156.8.2');
INSERT INTO Acesso VALUES ('17-NOV-2014 05:57:00', 4, 'kawaiiro', 'kawaiiro', '174.185.4.1');
INSERT INTO Acesso VALUES ('21-MAY-2017 02:48:18', 5, 'gguimaraes', 'g_guimaraes', '139.177.7.2');

INSERT INTO Perfil_Possui_Dispositivo VALUES (1, 'leticiarina', 'leticia_rina');
INSERT INTO Perfil_Possui_Dispositivo VALUES (2, 'mrpinoquio', 'mr_pinoquio');
INSERT INTO Perfil_Possui_Dispositivo VALUES (3, 'kawaiiro', 'kawaiiro');
INSERT INTO Perfil_Possui_Dispositivo VALUES (4, 'gguimaraes', 'g_guimaraes');
INSERT INTO Perfil_Possui_Dispositivo VALUES (5, 'juregmonteiro', 'jureg_monteiro');

INSERT INTO Amizade VALUES (1, 'leticiarina', 'leticia_rina', 'mrpinoquio', 'mr_pinoquio');
INSERT INTO Amizade VALUES (2, 'mrpinoquio', 'mr_pinoquio', 'juregmonteiro', 'jureg_monteiro');
INSERT INTO Amizade VALUES (3, 'kawaiiro', 'kawaiiro', 'gguimaraes', 'g_guimaraes');
INSERT INTO Amizade VALUES (4, 'juregmonteiro', 'jureg_monteiro', 'kawaiiro', 'kawaiiro');
INSERT INTO Amizade VALUES (5, 'gguimaraes', 'g_guimaraes', 'leticiarina', 'leticia_rina');

INSERT INTO Amizade_Recomenda_Midia VALUES (1, 'leticiarina', 'leticia_rina', 'mrpinoquio', 'mr_pinoquio', 'Stranger Things', 'Melhor série Pipi');
INSERT INTO Amizade_Recomenda_Midia VALUES (2, 'mrpinoquio', 'mr_pinoquio', 'juregmonteiro', 'jureg_monteiro', 'Lost', 'Assiste aí Jurg, muito bom');
INSERT INTO Amizade_Recomenda_Midia VALUES (3, 'kawaiiro', 'kawaiiro', 'gguimaraes', 'g_guimaraes');
INSERT INTO Amizade_Recomenda_Midia VALUES (4, 'juregmonteiro', 'jureg_monteiro', 'kawaiiro', 'kawaiiro', 'How I Met Your Mother', 'Marshall homão da porra');
INSERT INTO Amizade_Recomenda_Midia VALUES (5, 'gguimaraes', 'g_guimaraes', 'leticiarina', 'leticia_rina');

INSERT INTO Midia_Pessoa VALUES ('Harry Potter and the Half-Blood Prince', 'Daniel Radcliffe', 'F', 'T');
INSERT INTO Midia_Pessoa VALUES ('The Breakfast Club', 'John Hughes', 'T', 'F');
INSERT INTO Midia_Pessoa VALUES ('Clube da Luta', 'Brad Pitt', 'F', 'T');
INSERT INTO Midia_Pessoa VALUES ('Titanic', 'Leonardo DiCaprio', 'F', 'T');
INSERT INTO Midia_Pessoa VALUES ('Moonlight', 'Barry Jenkins', 'T', 'F');

INSERT INTO Pessoa_Participa_Midia VALUES ('Harry Potter and the Half-Blood Prince', 'Bonnie Wright', 'F', 'T');
INSERT INTO Pessoa_Participa_Midia VALUES ('The Breakfast Club', 'Carl Reed', 'F', 'T');
INSERT INTO Pessoa_Participa_Midia VALUES ('Clube da Luta', 'Art Linson', 'T', 'F');
INSERT INTO Pessoa_Participa_Midia VALUES ('Titanic', 'Jon Landau', 'T', 'F');
INSERT INTO Pessoa_Participa_Midia VALUES ('Moonlight', 'Jaden Piner', 'F', 'T');

INSERT INTO Pessoa_Participa_Serie VALUES ('Friends', 'Kevin S. Bright', 'T', 'F');
INSERT INTO Pessoa_Participa_Serie VALUES ('How I Met Your Mother', 'Michael J. Fox', 'F', 'T');
INSERT INTO Pessoa_Participa_Serie VALUES ('Stranger Things', 'Cindy Holland', 'T', 'F');
INSERT INTO Pessoa_Participa_Serie VALUES ('How to Get Away with Murder', 'Katie Findlay', 'F', 'T');
INSERT INTO Pessoa_Participa_Serie VALUES ('Lost', 'J. J. Abrams', 'T', 'F');

-- Falta tabela de mídia pra conseguir inserir
-- (Titulo da midia, nome da série, número da temporada que o ep pertence)
INSERT INTO Temporada_Midia	VALUES('Episodio 1 season 1', NULL, 1);
INSERT INTO Temporada_Midia	VALUES('E2S8', 'How I Met Your Mother', 8);
INSERT INTO Temporada_Midia	VALUES('E3S1', 'Stranger Things', 2);
INSERT INTO Temporada_Midia	VALUES('E1E4', 'How to Get Away with Murder', 4);
INSERT INTO Temporada_Midia	VALUES('E1S5', 'Lost', 6);

INSERT INTO Perfil_Assiste_Midia VALUES('leticiarina', 'leticia_rina', 'Harry Potter and the Half-Blood Prince', 1, 1456);
INSERT INTO Perfil_Assiste_Midia VALUES('mrpinoquio', 'mr_pinoquio', 'The Breakfast Club', 2, 2735);
INSERT INTO Perfil_Assiste_Midia VALUES('juregmonteiro', 'jureg_monteiro', 'Clube da Luta', 3, 1523);
INSERT INTO Perfil_Assiste_Midia VALUES('kawaiiro', 'kawaiiro', 'Titanic', 4, 1233);
INSERT INTO Perfil_Assiste_Midia VALUES('gguimaraes', 'g_guimaraes', 'Moonlight', 5, 1822);


INSERT INTO Midia_Pertence_Genero VALUES ('Friends', 'Comédia'); 
INSERT INTO Midia_Pertence_Genero VALUES ('How I Met Your Mother', 'Comédia'); 
INSERT INTO Midia_Pertence_Genero VALUES ('Lost', 'Suspense'); 
INSERT INTO Midia_Pertence_Genero VALUES ('Stranger Things', 'Suspense'); 
INSERT INTO Midia_Pertence_Genero VALUES ('How To Get Away With Muder', 'Suspense'); 

INSERT INTO Numero_Cartao_de_Credito VALUES('C',1111111111111111);
INSERT INTO Numero_Cartao_de_Credito VALUES('C',2222222222222222);
INSERT INTO Numero_Cartao_de_Credito VALUES('C',3333333333333333);
INSERT INTO Numero_Cartao_de_Credito VALUES('C',4444444444444444);
INSERT INTO Numero_Cartao_de_Credito VALUES('C',5555555555555555);

INSERT INTO Paypal VALUES('P','zikadorole','xovana@gmail.com');
INSERT INTO Paypal VALUES('P','airoboylindo','airomello@hotmail.com');
INSERT INTO Paypal VALUES('P','tinabinarina','ahmano@bol.com.br');
INSERT INTO Paypal VALUES('P','pipidourado','pipizones@gmail.com');
INSERT INTO Paypal VALUES('P','lolzinfoda','ritogomes@gmail.com');

INSERT INTO Perfil_Prefere_Genero VALUES('leticiarina','leticia_rina','Comédia',7);
INSERT INTO Perfil_Prefere_Genero VALUES('mrpinoquio','mr_pinoquio','Ficção Científica',8);
INSERT INTO Perfil_Prefere_Genero VALUES('juregmonteiro','jureg_monteiro','Suspense',5);
INSERT INTO Perfil_Prefere_Genero VALUES('kawaiiro','kawaiiro','Terror',8);
INSERT INTO Perfil_Prefere_Genero VALUES('gguimaraes','g_guimaraes','Comédia',10);

INSERT INTO Perfil_Solicita_Amizade VALUES ('jureg_monteiro', 'juregmonteiro', 'kawaiiro', 'kawaiiro', 'T', '10-DEZ-2017');
INSERT INTO Perfil_Solicita_Amizade VALUES ('mr_pinoquio', 'mrpinoquio', 'leticia_rina', 'leticiarina', 'T', '10-DEZ-2017');
INSERT INTO Perfil_Solicita_Amizade VALUES ('leticia_rina', 'leticiarina', 'mr_pinoquio', 'mrpinoquio', 'T', '10-DEZ-2017');
INSERT INTO Perfil_Solicita_Amizade VALUES ('g_guimaraes', 'gguimaraes', 'mr_pinoquio', 'mrpinoquio', 'T', '10-DEZ-2017');
INSERT INTO Perfil_Solicita_Amizade VALUES ('kawaiiro', 'kawaiiro', 'jureg_monteiro', 'juregmonteiro', 'T', '10-DEZ-2017');

COMMIT;