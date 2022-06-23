-- you can see this information at Programmability -> Functions -> Scalar-valued Functions

drop function dbo.checkCliente
drop function dbo.checkFuncionario
drop function dbo.checkGuia
drop function dbo.checkGerente
drop function dbo.checkAtividades
drop function dbo.checkDataAtividade
drop function dbo.checkEquipamento
drop function dbo.checkAtividadeinData
drop function dbo.checkEquipamentoSelected

-- Verificar se o cliente já existe ou não

create function [dbo].checkCliente(@NIF bigint) returns int
as
	begin
			if exists(select * from ClubePaiva.Cliente as c where c.NIF= @NIF )
			begin
				return 1;
			end
			return 0;
	end
go

-- Verificar se o funcionario já existe ou não

create function [dbo].checkFuncionario(@nome varchar(255), @telefone varchar(100), @email varchar(255), @NIF bigint, @numFunc bigint, @dataEntrada date) returns int
as
	begin
			if exists(select * from ClubePaiva.Funcionario as f where f.nome = @nome and f.telefone = telefone and f.email = email and f.NIF = NIF and f.numFunc = numFunc and f.dataEntrada = dataEntrada )
				return 1;
			return 0;
	end
go





/* Verificar se aquela atividade já existe naquele horário*/

create function [dbo].checkAtividadeinData(@dataAtividade datetime,@tipo varchar(255)) returns int
as
	begin
			if exists(select * from ClubePaiva.RegistoDeAtividades as rA where (rA.dataAtividade = @dataAtividade and rA.tipo=@tipo) )
				return 1;
			
			return 0;
	end
go

create function [dbo].checkClienteinAtividades(@cliente bigint) returns int
as 
	begin
		if exists (select * from ClubePaiva.RegistoDeAtividades as rA where (ra.cliente=@cliente))
			return 1
		return 0
	end
go


--select * from dbo.atividadesCliente(898107823)  


-----------VER CLIENTES-----------------------
create function [dbo].ClienteAtividades(@cliente bigint) returns table
as 
	return(select c.NIF, c.nome, rA.idAtividade, rA.tipo ,rA.dataAtividade, rA.numPessoas,rA.preco
			from ClubePaiva.Cliente as c
			join ClubePaiva.RegistoDeAtividades as rA on c.NIF= rA.cliente
			where cliente = @cliente)
go


SELECT * from ClubePaiva.RegistoDeAtividades
drop function dbo.getClientesComAtividades
--select * from dbo.ClienteAtividades(132400127)  



select * from ClubePaiva.Cliente

-- Verificar se aquele equipamento, naquele tamanho, está disponível

create function [dbo].checkEquipamento(@nomeEquipamento varchar(500), @quantidade bigint, @tamanho varchar(10)) returns int
as
	begin
			if exists(select * from ClubePaiva.EquipamentoDisponível as e where e.nomeEquipamento = @nomeEquipamento and e.stock >= @quantidade and e.tamanho = @tamanho )
				return 1;
			return 0;
	end
go



-- Verificar se já há equipamento reservado para uma atividade

create function [dbo].checkEquipamentoSelected(@idAtividade bigint) returns int
as
	begin
			if exists(select * from ClubePaiva.EquipamentoParaAtividades as eA where eA.idAtividade = @idAtividade )
				return 1;
			return 0;
	end
go
