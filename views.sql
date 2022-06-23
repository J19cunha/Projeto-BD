drop view dbo.registoAtividades
drop view dbo.Atividades
drop view dbo.Cliente
drop view dbo.Guia
drop view dbo.Gerente;
drop view dbo.Funcionario;

create view [dbo].[NIFclientes] as select NIF from ClubePaiva.Cliente
select * from dbo.NIFclientes

/* QUEREMOS VER Atividade associada aquele registo AT� AGORA */
create view [dbo].[AtividadesRegistadas] as select * from ClubePaiva.RegistoDeAtividades ORDER BY dataAtividade;
GO
select * from dbo.AtividadesRegistadas;
drop view dbo.AtividadesRegistadas

/* QUEREMOS VER O REGISTO DE ATIVIDADES AT� AGORA */
create view [dbo].[dataAtividades] as select idAtividade, dataAtividade from ClubePaiva.RegistoDeAtividades
GO
drop view dbo.registoAtividades



/*QUEREMOS VER o nome da atividade associado ao id*/

create view [dbo].[NomeAtividades] as select tipoID, nome_atividade, preco from ClubePaiva.AtividadesExistentes
GO
select * from dbo.NomeAtividades;
drop view dbo.NomeAtividades

create view [dbo].[Guia] as select nome,numFunc from ClubePaiva.Guia
go


select * from dbo.registoAtividades;
select * from dbo.Atividades;
select * from dbo.Cliente;
select * from dbo.Guia;
select * from dbo.Gerente;
select * from dbo.Funcionario;

