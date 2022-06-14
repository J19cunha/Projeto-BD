/*-------------------- Tabelas de clientes -------------------------- */

INSERT INTO ClubePaiva.Cliente (nome,telefone,email,numCc)
VALUES
  ('Lucas Gill','(351) 912283587','auctor.odio.a@google.com',327082294),
  ('Madonna Burke','(351) 961276268','quam.a.felis@aol.com',743247154),
  ('Lila Watkins','(351) 924133500','erat.volutpat@google.edu',898107823),
  ('Kyle Paul','(351) 924131623','morbi.metus@yahoo.net',332477257),
  ('Hanae Kaufman','(351) 978508746','curabitur@icloud.couk',221103616),
  ('Lavinia Mathis','(351) 987369845','ut.eros@hotmail.org',665108046),
  ('Matthew Dalton','(351) 987294577','est.tempor@yahoo.edu',481419663);


INSERT INTO ClubePaiva.Cliente (nome,telefone,email,numCc)
VALUES
  ('Ramona Suarez','(351) 96077827','arcu.imperdiet.ullamcorper@aol.net',689880995),
  ('Odette Sanford','(351) 952267411','cursus.luctus.ipsum@yahoo.org',896141312),
  ('Ciara Giles','(351) 918548334','nulla.eget.metus@protonmail.ca',518245134),
  ('Tyler Rush','(351) 931515691','phasellus.in.felis@protonmail.net',587810791),
  ('Hamish Walker','(351) 961746535','integer.vulputate.risus@outlook.edu',385361040),
  ('Cathleen Walter','(351) 927236937','ornare@protonmail.com',703072320),
  ('Maggy Gardner','(351) 978862346','cras.lorem@google.org',145588537),
  ('Adrian James','(351) 931510968','cursus.luctus@google.org',183014872),
  ('Christen Castaneda','(351) 968442446','sapien.cursus.in@yahoo.net',132400127),
  ('Briar Mcdowell','(351) 956242700','nunc@yahoo.com',820077185);

select * from ClubePaiva.Cliente

/*-------------------- Tabela de funcionarios --------------------------*/

INSERT INTO ClubePaiva.Funcionario (nome,numCc,telefone,email,numFunc,dataEntrada)
VALUES
  ('Ana Soares','123456789','918583780','a@mail.com',53,'2021-06-18'),
  ('Paulo Cunha','123456789','918583781','b@mail.com', 12,'2021-06-18'),
  ('Diana Pires','123456789','918583782','c@mail.com', 3,'2021-06-18'),
  ('Francisco Cabral','123456789','918583783','d@mail.com', 50,'2021-06-18'),
  ('Fernando Figueiredo','123456789','918583784' ,'e@mail.com', 44,'2021-06-18'),
  ('Camila Santos','123456789','918583785' ,'f@mail.com', 6,'2021-06-18'),
  ('Pedro Amaral','123456789','918583786' ,'g@mail.com', 14,'2021-06-18'),
  ('Tomás Amaral','123456789','918583787' ,'h@mail.com', 8,'2021-06-18'),
  ('Rita Dinis','123456789','918583788' ,'i@mail.com', 10,'2021-06-18');

select * from ClubePaiva.Funcionario

/*-------------------- Tabela de guias --------------------------*/

INSERT INTO ClubePaiva.Guia(numFunc)
VALUES

  (10),
  (14),
  (3),
  (12),
  (53),
  (50),
  (6),
  (8);

select * from ClubePaiva.Guia

/*-------------------- Tabela de gerente --------------------------*/

INSERT INTO ClubePaiva.Gerente(numFunc)
VALUES

  (44);

select * from ClubePaiva.Gerente


/*-------------------- Tabela de equipamento -------------------------- */

INSERT INTO ClubePaiva.EquipamentoDisponível(nomeEquipamento,stock,tamanho)
VALUES
 ('colete',5,'XS'),
 ('colete',10,'S'),
 ('colete',10,'M'),
 ('colete',10,'L'),
 ('colete',5,'XL');
 /*etc*/

select * from ClubePaiva.EquipamentoDisponível

/*-------------------- Tabela de equipamento para atividades -------------------------- */

INSERT INTO ClubePaiva.EquipamentoParaAtividades(idAtividade,nomeEquipamento,quantidade,tamanho)
VALUES
 (1,'colete',1,'XS'),
 (1,'colete',2,'S'),
 (2,'colete',3,'M'),
 (2,'colete',4,'L'),
 (3,'colete',2,'XL');
 /*etc*/

select * from ClubePaiva.EquipamentoParaAtividades


/*-------------------- Tabela de atividades --------------------------*/

INSERT INTO ClubePaiva.Atividades(idAtividade,tipo,preco,numPessoas,guia,cliente)
VALUES
 (1,'canoas', 254.00, 5, 10,327082294),
 (2,'canyoning',20.00, 3, 14,665108046),
 (3,'rivertracking',40.00, 6, 3,518245134),
 (4,'rafting', 120.00, 11, 12,145588537);
 

 select * from ClubePaiva.Atividades

 /*-------------------- Tabela de atividades registadas --------------------------*/

INSERT INTO ClubePaiva.RegistoDeAtividades(idAtividade,dataReserva,dataAtividade)
VALUES

 (1,'2022-06-11 13:41:00','2022-06-11 13:41:00'),
 (2,'2022-06-10 14:42:09','2022-06-10 14:42:09'),
 (3,'2022-06-12 15:43:08','2022-06-12 15:43:08'),
 (4,'2022-06-13 16:44:07','2022-06-13 16:44:07');

select * from ClubePaiva.RegistoDeAtividades