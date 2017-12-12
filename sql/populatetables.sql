INSERT INTO Acesso VALUES ('25-JUN-2015 09:23:50', 'Zenfone 5', 'leticiarina', '192.168.1.2');
INSERT INTO Acesso VALUES ('10-SET-2016 00:19:23', 'Galaxy S3', 'mrpinoquio', '127.183.4.5');
INSERT INTO Acesso VALUES ('02-JAN-2017 18:01:35', 'LG KP215', 'kawaiiro', '193.156.8.2');
INSERT INTO Acesso VALUES ('17-NOV-2014 15:57:00', 'iPhone 5C', 'gguimaraes', '174.185.4.1');
INSERT INTO Acesso VALUES ('21-MAI-2017 22:48:18', 'Dell Inspiron', 'juregmonteiro', '139.177.7.2');

INSERT INTO Perfil_Possui_Dispositivo VALUES ('1', 'leticiarina', 'leticia_rina');
INSERT INTO Perfil_Possui_Dispositivo VALUES ('2', 'mrpinoquio', 'mr_pinoquio');
INSERT INTO Perfil_Possui_Dispositivo VALUES ('3', 'kawaiiro', 'kawaiiro');
INSERT INTO Perfil_Possui_Dispositivo VALUES ('4', 'gguimaraes', 'g_guimaraes');
INSERT INTO Perfil_Possui_Dispositivo VALUES ('5', 'juregmonteiro', 'jureg_monteiro');

INSERT INTO Amizade VALUES ('1', 'leticiarina', 'leticia_rina', 'mrpinoquio', 'mr_pinoquio');
INSERT INTO Amizade VALUES ('2', 'mrpinoquio', 'mr_pinoquio', 'juregmonteiro', 'jureg_monteiro');
INSERT INTO Amizade VALUES ('3', 'kawaiiro', 'kawaiiro', 'gguimaraes', 'g_guimaraes');
INSERT INTO Amizade VALUES ('4', 'juregmonteiro', 'jureg_monteiro', 'kawaiiro', 'kawaiiro');
INSERT INTO Amizade VALUES ('5', 'gguimaraes', 'g_guimaraes', 'leticiarina', 'leticia_rina');


INSERT INTO Amizade_Recomenda_Midia VALUES ('1', 'leticiarina', 'leticia_rina', 'mrpinoquio', 'mr_pinoquio', 'Stranger Things', 'Melhor série Pipi');
INSERT INTO Amizade_Recomenda_Midia VALUES ('2', 'mrpinoquio', 'mr_pinoquio', 'juregmonteiro', 'jureg_monteiro', 'Lost', 'Assiste aí Jurg, muito bom');
INSERT INTO Amizade_Recomenda_Midia VALUES ('3', 'kawaiiro', 'kawaiiro', 'gguimaraes', 'g_guimaraes');
INSERT INTO Amizade_Recomenda_Midia VALUES ('4', 'juregmonteiro', 'jureg_monteiro', 'kawaiiro', 'kawaiiro', 'How I Met Your Mother', 'Marshall homão da porra');
INSERT INTO Amizade_Recomenda_Midia VALUES ('5', 'gguimaraes', 'g_guimaraes', 'leticiarina', 'leticia_rina');

INSERT INTO Temporada VALUES ('1', 'Friends', '24');
INSERT INTO Temporada VALUES ('6', 'How I Met Your Mother', '24');
INSERT INTO Temporada VALUES ('1', 'Stranger Things', '8');
INSERT INTO Temporada VALUES ('3', 'How to Get Away with Murder', '15');
INSERT INTO Temporada VALUES ('5', 'Lost', '17');

INSERT INTO Midia_Pessoa VALUES ('Harry Potter and the Half-Blood Prince', 'Daniel Radcliffe', '0', '1');
INSERT INTO Midia_Pessoa VALUES ('The Breakfast Club', 'John Hughes', '1', '0');
INSERT INTO Midia_Pessoa VALUES ('Clube da Luta', 'Brad Pitt', '0', '1');
INSERT INTO Midia_Pessoa VALUES ('Titanic', 'Leonardo DiCaprio', '0', '1');
INSERT INTO Midia_Pessoa VALUES ('Moonlight', 'Barry Jenkins', '1', '0');

INSERT INTO Serie_Pessoa VALUES ('Friends', 'Jennifer Aniston', '0', '1');
INSERT INTO Serie_Pessoa VALUES ('How I Met Your Mother', 'Josh Radnor', '0', '1');
INSERT INTO Serie_Pessoa VALUES ('Stranger Things', 'The Duffer Brothers', '1', '0');
INSERT INTO Serie_Pessoa VALUES ('How to Get Away with Murder', 'Peter Nowalk', '1', '0');
INSERT INTO Serie_Pessoa VALUES ('Lost', 'Jeffrey Lieber', '1', '0');

INSERT INTO Pessoa_Participa_Midia VALUES ('Harry Potter and the Half-Blood Prince', 'Bonnie Wright', '0', '1');
INSERT INTO Pessoa_Participa_Midia VALUES ('The Breakfast Club', 'Carl Reed', '0', '1');
INSERT INTO Pessoa_Participa_Midia VALUES ('Clube da Luta', 'Art Linson', '1', '0');
INSERT INTO Pessoa_Participa_Midia VALUES ('Titanic', 'Jon Landau', '1', '0');
INSERT INTO Pessoa_Participa_Midia VALUES ('Moonlight', 'Jaden Piner', '0', '1');

INSERT INTO Pessoa_Participa_Serie VALUES ('Friends', 'Kevin S. Bright', '1', '0');
INSERT INTO Pessoa_Participa_Serie VALUES ('How I Met Your Mother', 'Michael J. Fox', '0', '1');
INSERT INTO Pessoa_Participa_Serie VALUES ('Stranger Things', 'Cindy Holland', '1', '0');
INSERT INTO Pessoa_Participa_Serie VALUES ('How to Get Away with Murder', 'Katie Findlay', '0', '1');
INSERT INTO Pessoa_Participa_Serie VALUES ('Lost', 'J. J. Abrams', '1', '0');

INSERT INTO Perfil VALUES ('leticiarina', 'leticia_rina', '18', 'Full HD', 'Japonês', 'Inglês');
INSERT INTO Perfil VALUES ('mrpinoquio', 'mr_pinoquio', '18', 'HD', 'Português', 'Inglês');
INSERT INTO Perfil VALUES ('juregmonteiro', 'jureg_monteiro', '18', 'HD', 'Inglês', 'Português');
INSERT INTO Perfil VALUES ('kawaiiro', 'kawaiiro', '18', 'Low quality', 'Inglês', 'Espanhol');
INSERT INTO Perfil VALUES ('gguimaraes', 'g_guimaraes', '18', 'Normal', 'Espanhol', 'Inglês');