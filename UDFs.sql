-- you can see this information at Programmability -> Functions -> Scalar-valued Functions

drop function dbo.checkCliente
drop function dbo.checkFuncionario
drop function dbo.checkGuia
drop function dbo.checkGerente
drop function dbo.checkAtividades
drop function dbo.checkDataAtividade
drop function dbo.checkEquipamento
/*drop function dbo.checkAtividadesAndData*/
drop function dbo.checkEquipamentoSelected

-- Verificar se o cliente já existe ou não

create function [dbo].checkCliente(@nome varchar(255), @telefone varchar(100), @email varchar(255), @numCc bigint) returns int
as
	begin
			if exists(select * from ClubePaiva.Cliente as c where c.nome = @nome and c.telefone = telefone and c.email = email and c.numCc = numCc )
				return 1;			
			return 0;
	end
go

-- Verificar se o funcionario já existe ou não

create function [dbo].checkFuncionario(@nome varchar(255), @telefone varchar(100), @email varchar(255), @numCc bigint, @numFunc bigint, @dataEntrada date) returns int
as
	begin
			if exists(select * from ClubePaiva.Funcionario as f where f.nome = @nome and f.telefone = telefone and f.email = email and f.numCc = numCc and f.numFunc = numFunc and f.dataEntrada = dataEntrada )
				return 1;
			return 0;
	end
go

-- Verificar se já pertence ao guia

create function [dbo].checkGuia(@numFunc bigint) returns int
as
	begin
			if exists(select * from ClubePaiva.Guia as g where g.numFunc = numFunc )
				return 1;
			return 0;
	end
go

-- Verificar se já pertence ao gerente

create function [dbo].checkGerente(@numFunc bigint) returns int
as
	begin
			if exists(select * from ClubePaiva.Gerente as gE where gE.numFunc = numFunc )
				return 1;
			return 0;
	end
go

-- Verificar se aquele horário, naquele dia, está ocupado com alguma atividade

create function [dbo].checkDataAtividade(@dataAtividade datetime) returns int
as
	begin
			if exists(select * from ClubePaiva.RegistoDeAtividades as rA where rA.dataAtividade = dataAtividade )
				return 1;
			return 0;
	end
go

-- Verificar se aquela atividade com aquele id já existe

create function [dbo].checkAtividades(@tipo varchar(255), @preco numeric,@numPessoas int,@guia bigint,@cliente bigint) returns int
as
	begin
			if exists(select * from ClubePaiva.Atividades as rA where rA.tipo=tipo and rA.preco=preco and rA.numPessoas=numPessoas and rA.guia=guia and rA.cliente=cliente )
				return 1;
			return 0;
	end
go


/* Verificar se aquela atividade já existe naquele horário

create function [dbo].checkAtividadesAndData(@tipo varchar(255), @dataAtividade datetime) returns int
as
	begin
			if exists(select * from ClubePaiva.RegistoDeAtividades as rA where rA.atividade = atividade union select from * ClubePaiva.Atividades as a where a.dataAtividade = dataAtividade) 

				return 1;
			return 0;
	end
go
*/

-- Verificar se aquele equipamento, naquele tamanho, está disponível

create function [dbo].checkEquipamento(@nomeEquipamento varchar(500), @stock bigint, @tamanho varchar(10)) returns int
as
	begin
			if exists(select * from ClubePaiva.Equipamento as e where e.nomeEquipamento = nomeEquipamento and e.stock = stock and e.tamanho = tamanho )
				return 1;
			return 0;
	end
go

-- Verificar o equipamento selecionado para uma atividade

create function [dbo].checkEquipamentoSelected(@idAtividade bigint, @nomeEquipamento varchar(500), @quantidade bigint, @tamanho varchar(10)) returns int
as
	begin
			if exists(select * from ClubePaiva.EquipamentoParaAtividades as eA where eA.idAtividade = idAtividade and eA.nomeEquipamento = nomeEquipamento and eA.quantidade = quantidade and eA.tamanho = tamanho )
				return 1;
			return 0;
	end
go




