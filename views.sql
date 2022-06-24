drop view dbo.registoAtividades
drop view dbo.Atividades
drop view dbo.Cliente
drop view dbo.Guia
drop view dbo.Gerente;
drop view dbo.Funcionario;

create view [dbo].[NIFclientes] as select NIF from ClubePaiva.Cliente
select * from dbo.NIFclientes

/* QUEREMOS VER Atividade associada aquele registo ATÉ AGORA */
create view [dbo].[AtividadesRegistadas] as select * from ClubePaiva.RegistoDeAtividades ORDER BY dataAtividade;
GO
select * from dbo.AtividadesRegistadas;
drop view dbo.AtividadesRegistadas

/* QUEREMOS VER O REGISTO DE ATIVIDADES ATÉ AGORA */
create view [dbo].[dataAtividades] as select idAtividade, dataAtividade from ClubePaiva.RegistoDeAtividades
GO
drop view dbo.registoAtividades

create view dbo.stock as select * from ClubePaiva.EquipamentoDisponível
select * from dbo.stock
select * from ClubePaiva.EquipamentoParaAtividades

/*QUEREMOS VER o nome da atividade associado ao id*/

create view [dbo].[NomeAtividades] as select tipoID, nome_atividade, preco from ClubePaiva.AtividadesExistentes
GO
select * from dbo.NomeAtividades;
drop view dbo.NomeAtividades






select * from dbo.equipamento;
select * from dbo.registoAtividades;
select * from dbo.Atividades;
select * from dbo.Cliente;
select * from dbo.Guia;
select * from dbo.Gerente;
select * from dbo.Funcionario;

