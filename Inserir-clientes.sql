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

INSERT INTO ClubePaiva.Equipamento(nomeEquipamento,stock,tamanho)
VALUES
 ('colete',5,'XS'),
 ('botas',20,'38'),
 ('capacete',3,'XS');
 /*etc*/

select * from ClubePaiva.Equipamento 

/*-------------------- Tabela de tipo de atividades -------------------------- */

INSERT INTO ClubePaiva.TipoAtividade(nome,fatos,botas,capacete,luzes,colete)
VALUES
 ('canoas',5,5,5,0,5),
 ('canyoning',0,3,3,3,0),
 ('rivertracking',0,6,0,0,6),
 ('rafting',11,0,11,0,11);

select * from ClubePaiva.TipoAtividade 

/*-------------------- Tabela de atividades --------------------------*/

INSERT INTO ClubePaiva.Atividade(idAtividade,tipo,preço,numPessoas,guia,cliente)
VALUES
 (20, 'canoas', 254.00, 5, 10,327082294),
 (37,'canyoning',20.00, 3, 14,665108046),
 (43,'rivertracking',40.00, 6, 3,518245134),
 (68,'rafting', 120.00, 11, 12,145588537);
 

 select * from ClubePaiva.Atividade

 /*-------------------- Tabela de atividades registadas --------------------------*/

INSERT INTO ClubePaiva.RegistoDeAtividades(idReserva,dataReserva,dataAtividade)
VALUES

 (20, '2022-06-11 13:41:00','2022-06-11 13:41:00'),
 (37, '2022-06-10 14:42:09','2022-06-10 14:42:09'),
 (43, '2022-06-12 15:43:08','2022-06-12 15:43:08'),
 (68, '2022-06-13 16:44:07','2022-06-13 16:44:07');

select * from ClubePaiva.RegistoDeAtividades