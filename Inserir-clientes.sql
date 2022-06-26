/*-------------------- Tabelas de clientes -------------------------- */

INSERT INTO ClubePaiva.Cliente (nome,telefone,email,NIF)
VALUES
  ('Lucas Gill','(351) 912283587','auctor.odio.a@google.com',327082294),
  ('Madonna Burke','(351) 961276268','quam.a.felis@aol.com',743247154),
  ('Lila Watkins','(351) 924133500','erat.volutpat@google.edu',898107823),
  ('Kyle Paul','(351) 924131623','morbi.metus@yahoo.net',332477257),
  ('Hanae Kaufman','(351) 978508746','curabitur@icloud.couk',221103616),
  ('Lavinia Mathis','(351) 987369845','ut.eros@hotmail.org',665108046),
  ('Matthew Dalton','(351) 987294577','est.tempor@yahoo.edu',481419663);


INSERT INTO ClubePaiva.Cliente (nome,telefone,email,NIF)
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

INSERT INTO ClubePaiva.Funcionario (nome,NIF,telefone,email,dataEntrada)
VALUES

  ('Ana Soares',123456789,'918583780','a@mail.com','2021-06-18'),
  ('Paulo Cunha',123456789,'918583781','b@mail.com', '2021-06-18'),
  ('Diana Pires',123456789,'918583782','c@mail.com', '2021-06-18'),
  ('Francisco Cabral',123456789,'918583783','d@mail.com', '2021-06-18');
  

  SELECT SCOPE_IDENTITY() AS [Last-Inserted Identity Value];

select * from ClubePaiva.Funcionario

/*-------------------- Tabela de guias --------------------------*/

INSERT INTO ClubePaiva.Guia(nome,numFunc)
VALUES
	('Ana Soares',1),
	('Paulo Cunha',2),
	('Diana Pires',3);

select * from ClubePaiva.Guia

/*-------------------- Tabela de gerente --------------------------*/

INSERT INTO ClubePaiva.Gerente(nome,numFunc)
VALUES

  ('Francisco Cabral', 4);

select * from ClubePaiva.Gerente



INSERT INTO ClubePaiva.AtividadesExistentes(tipoID,nome_atividade,epoca,preco,numMaxPessoas)
VALUES
 (1,'canoas','verao',45.00,12),
 (2,'canoas','verao',40.00,24),
 (3,'canyoning','verao',65.00,12),
 (4,'canyoning','verao',60.00,24),
 (5,'rafting','inverno',240.00,1),
 (6,'rafting','inverno',200.00,2),
 (7,'rafting','inverno',80.00,12),
 (8,'rafting','inverno',70.00,20),
 (9,'rivertracking', 'verao',40.00,12),
 (10,'rivertracking', 'verao',35.00,24);


 
/*-------------------- Tabela de atividades --------------------------*/


INSERT INTO ClubePaiva.RegistoDeAtividades(dataReserva, dataAtividade, cliente, tipo,preco,numPessoas,guia)
VALUES
 (getdate(),'2022-06-11 12:00:00',820077185, 'canoas',254.00, 5, 1),
 (getdate(),'2022-06-20 13:00:00',183014872,'canyoning', 254.00, 5, 2),
 (getdate(),'2022-07-11 15:00:00',132400127,'rafting',254.00, 5, 3),
 (getdate(),'2022-08-10 17:00:00',145588537,'rivertracking', 254.00, 5, 1);
 
 SELECT SCOPE_IDENTITY() AS [Last-Inserted Identity Value];

 select * from ClubePaiva.RegistoDeAtividades;


/*-------------------- Tabela de equipamento -------------------------- */

INSERT INTO ClubePaiva.EquipamentoDisponível(nomeEquipamento,stock,tamanho)
VALUES
 ('colete',40,'S'),
 ('colete',40,'M'),
 ('colete',40,'L'),
 ('botins',10,'34'),
 ('botins',10,'36'),
 ('botins',10,'38'),
 ('botins',10,'40'),
 ('botins',10,'42'),
 ('botins',10,'44'),
 ('fato',30,'S'),
 ('fato',30,'M'),
 ('fato',30,'L'),
 ('camisola termica',10,'S'),
 ('camisola termica',10,'M'),
 ('camisola termica',10,'L'),
 ('impermiavel',10,'S'),
 ('impermiavel',10,'M'),
 ('impermiavel',10,'L'),
 ('capacete',40,'S'),
 ('capacete',40,'M'),
 ('capacete',40,'L'),
 ('arnes',10,'S'),
 ('arnes',10,'M'),
 ('arnes',10,'L');


select * from ClubePaiva.EquipamentoDisponível

/*-------------------- Tabela de equipamento para atividades -------------------------- */

INSERT INTO ClubePaiva.EquipamentoParaAtividades(idAtividade,nomeEquipamento,quantidade,tamanho)
VALUES
 (4,'colete',1,'S'),
 (1,'colete',2,'S'),
 (1,'colete',3,'M'),
 (2,'colete',4,'L');



select * from ClubePaiva.EquipamentoParaAtividades


