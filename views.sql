drop view dbo.registoAtividades
drop view dbo.Atividades
drop view dbo.Cliente
drop view dbo.Guia
drop view dbo.Gerente;
drop view dbo.Funcionario;

/* QUEREMOS VER O REGISTO DE ATIVIDADES AT� AGORA */
create view [dbo].[registoAtividades] as select idAtividade, dataAtividade from ClubePaiva.RegistoDeAtividades
GO

/* QUEREMOS VER AS ATIVIDADES ASSOCIADAS AO REGISTO */
create view [dbo].[Atividades] as select idAtividade, tipo,preco, guia from ClubePaiva.Atividades
GO

/* QUEREMOS AGORA SABER A INFORMA��O DOS CLIENTES ASSOCIADOS �S ATIVIDADES VISTAS*/
create view [dbo].[Cliente] as select nome,NIF from ClubePaiva.Cliente
GO

/* QUEREMOS AGORA SABER A INFORMA��O DO GUIA ASSOCIADO �S ATIVIDADES*/
/* merda disto � que para ver o nome temos de ir a funcionario,e nao guia*/
create view [dbo].[Guia] as select numFunc from ClubePaiva.Guia
GO

/* QUEREMOS AGORA SABER A INFORMA��O DO GERENTE ASSOCIADO �S ATIVIDADES*/
/* merda disto � que para ver o nome temos de ir a funcionario,e nao guia*/
create view [dbo].[Gerente] as select numFunc from ClubePaiva.Gerente
GO

/* QUEREMOS AGORA SABER A INFORMA��O DOS FUNCIONARIOS*/
/* merda disto � que para ver o nome temos de ir a funcionario,e nao guia*/
create view [dbo].[Funcionario] as select nome,numFunc from ClubePaiva.Funcionario
GO

select * from dbo.registoAtividades;
select * from dbo.Atividades;
select * from dbo.Cliente;
select * from dbo.Guia;
select * from dbo.Gerente;
select * from dbo.Funcionario;

/*podemos inserir mais views para ver a informa��o que desejamos mas meio worthless*/

select idAtividade,tipo,guia from Atividades where idAtividade=4;
