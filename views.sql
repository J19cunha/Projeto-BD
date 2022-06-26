drop view dbo.dataAtividades
drop view stock
drop view stockInUse
drop view NomeAtividades
drop view dbo.AtividadesRegistadas
drop view dbo.NIFclientes
drop view dbo.NIFfuncionarios

/* QUEREMOS VER OS NIF'S DOS CLIENTES */
create view [dbo].[NIFclientes] as select NIF,nome from ClubePaiva.Cliente
go
select * from dbo.NIFclientes;

/* QUEREMOS VER OS NIF'S DOS FUNCIONÁRIOS */
create view [dbo].[NIFfuncionarios] as select NIF,nome,numFunc from ClubePaiva.Funcionario
go
select * from dbo.NIFfuncionarios;

/* QUEREMOS VER ATIVIDADES POR ORDEM DE DATA DE ATIVIDADE */
create view [dbo].[AtividadesRegistadas] as select * from ClubePaiva.RegistoDeAtividades;
go
select * from dbo.AtividadesRegistadas;


/* QUEREMOS VER O REGISTO DE ATIVIDADES ATÉ AGORA */
create view [dbo].[dataAtividades] as select idAtividade, dataAtividade from ClubePaiva.RegistoDeAtividades
go
select * from dbo.dataAtividades;

/* QUEREMOS VER O EQUIPAMENTO DISPONÍVEL NO CLUBE DO PAIVA */
create view [dbo].[stock] as select * from ClubePaiva.EquipamentoDisponível
go
select * from dbo.stock
select * from ClubePaiva.EquipamentoParaAtividades /* ver o equipamento deste stock que está a ser utilizado para verificar se não existe mais material usado do que o que temos */

/* QUEREMOS VER O EQUIPAMENTO USADO NUMA ATIVIDADE */
create view [dbo].[stockInUse] as select nomeEquipamento,quantidade,tamanho from ClubePaiva.EquipamentoParaAtividades
go
select * from dbo.stockInUse

/* QUEREMOS VER O NOME DA ATIVIDADE ASSOCIADO AO ID */
create view [dbo].[NomeAtividades] as select tipoID, nome_atividade from ClubePaiva.AtividadesExistentes
go
select * from dbo.NomeAtividades;


