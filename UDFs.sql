-- you can see this information at Programmability -> Functions -> Scalar-valued Functions

drop function dbo.checkCliente
drop function dbo.checkFuncionario  
drop function dbo.checkEquipamento 
drop function dbo.checkEquipamentoSelected 
drop function dbo.ClienteAtividades 
drop function dbo.checkAtividadeAndGuia 
drop function dbo.EquipamentoInStock 
drop function dbo.checkGuia
drop function dbo.checkGerente

-- Verificar se o cliente já existe ou não (triggers use)

create function [dbo].checkCliente(@NIF bigint) returns int
as
	begin
			if exists(select * from ClubePaiva.Cliente as c where c.NIF= @NIF )
				return 1;
			return 0;
	end
go

-- Verificar se o funcionario já existe ou não (triggers use)

create function [dbo].checkFuncionario(@NIF bigint,@nome varchar(255)) returns int
as
	begin
			if exists(select * from ClubePaiva.Funcionario as f where f.NIF= @NIF)
				return 1;
			return 0;
	end
go

/*
-- Verificar se o guia já existe ou não (triggers use)

create function [dbo].checkGuia(@numFunc bigint) returns int
as
	begin
			if exists(select * from ClubePaiva.Guia as g where g.numFunc= @numFunc)
				return 1;
			return 0;
	end
go


-- Verificar se o gerente já existe ou não (triggers use)

create function [dbo].checkGerente(@numfunc bigint) returns int
as
	begin
			if exists(select * from ClubePaiva.Gerente as gE where gE.numFunc= @numFunc)
				return 1;
			return 0;
	end
go
*/

-- Verificar se naquele horário existe alguma atividade, em que tipo de atividade consiste, o guia responsável e o id da atividade

create function [dbo].checkAtividadeAndGuia(@dataAtividade datetime) returns table
as
	return(select idAtividade,dataAtividade,tipo,guia
			from ClubePaiva.RegistoDeAtividades as d
			where d.dataAtividade = @dataAtividade)
go

--select * from dbo.checkAtividadeAndGuia('2022-08-10 17:00:00') 


-----------VER CLIENTES-----------------------

-- VER AS INFORMAÇÕES SOBRE A ATIVIDADE ASSOCIADO AO CLIENTE 
create function [dbo].ClienteAtividades(@cliente bigint) returns table
as 
	return(select c.NIF, c.nome, rA.idAtividade, rA.tipo ,rA.dataAtividade, rA.numPessoas,rA.preco
			from ClubePaiva.Cliente as c
			join ClubePaiva.RegistoDeAtividades as rA on c.NIF= rA.cliente
			where cliente = @cliente)
go


--select * from ClubePaiva.RegistoDeAtividades
--select * from dbo.ClienteAtividades(183014872)  


-- Verificar se aquele equipamento, naquele tamanho, está disponível (triggers use)

create function [dbo].checkEquipamento(@nomeEquipamento varchar(500), @quantidade bigint, @tamanho varchar(10)) returns int
as
	begin
			if exists(select * from ClubePaiva.EquipamentoDisponível as e where e.nomeEquipamento = @nomeEquipamento and e.stock >= @quantidade and e.tamanho = @tamanho )
				return 1;
			return 0;
	end
go

-- Verificar o equipamento que está disponível no stock

create function [dbo].EquipamentoInStock(@nomeEquipamento varchar(500)) returns table
as 
	return(select nomeEquipamento,stock, tamanho
			from ClubePaiva.EquipamentoDisponível as e
			where e.nomeEquipamento = @nomeEquipamento)
go

--select * from dbo.EquipamentoInStock('colete')  

-- Verificar se já há equipamento reservado para uma atividade (triggers use)

create function [dbo].checkEquipamentoSelected(@idAtividade bigint) returns int
as
	begin
			if exists(select * from ClubePaiva.EquipamentoParaAtividades as eA where eA.idAtividade = @idAtividade )
				return 1;
			return 0;
	end
go


-- Verificar o equipamento que está disponível no stock
/*
create function [dbo].QuantidadeEPessoas(@nomeEquipamento varchar(500)) returns table
as 
	return(select e.quantidade,e.nomeEquipamento, q.stock, q.nomeEquipamento
			from ClubePaiva.EquipamentoParaAtividades as e
			join ClubePaiva.EquipamentoDisponível as q on e.nomeEquipamento <= q.nomeEquipamento
			where e.nomeEquipamento = @nomeEquipamento)
go

select * from dbo.QuantidadeEPessoas('colete')  */