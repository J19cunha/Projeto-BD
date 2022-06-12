drop view dbo.registoAtividades
drop view dbo.Atividades
drop view dbo.Cliente
drop view dbo.Guia

/* QUEREMOS VER O REGISTO DE ATIVIDADES AT� AGORA */
create view [dbo].[registoAtividades] as select idReserva, dataAtividade from ClubePaiva.RegistoDeAtividades
GO

/* QUEREMOS VER AS ATIVIDADES ASSOCIADAS AO REGISTO */
create view [dbo].[Atividades] as select idAtividade, guia,cliente from ClubePaiva.Atividade
GO

/* QUEREMOS AGORA SABER A INFORMA��O DOS CLIENTES ASSOCIADOS �S ATIVIDADES VISTAS*/
create view [dbo].[Cliente] as select nome,numCc from ClubePaiva.Cliente
GO

/* QUEREMOS AGORA SABER A INFORMA��O DO GUIA ASSOCIADO �S ATIVIDADES*/
/* merda disto � que para ver o nome temos de ir a funcionario,e nao guia*/
create view [dbo].[Guia] as select nome,numFunc from ClubePaiva.Funcionario
GO

select * from dbo.registoAtividades;
select * from dbo.Atividades;
select * from dbo.Cliente;
select * from dbo.Guia;

/*podemos inserir mais views para ver a informa��o que desejamos mas meio worthless*/