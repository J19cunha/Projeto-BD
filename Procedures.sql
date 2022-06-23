----------------------CLIENTE -------------------------



---VER TODOS OS CLIENTES----
CREATE PROCEDURE [dbo].[getClientes]
AS
	BEGIN
		SELECT * FROM ClubePaiva.Cliente
	END
GO

exec dbo.getClientes

--------Pesquisar cliente----------
create procedure [dbo].[searchClientes]( @NIF bigint)
as 
	select * from ClubePaiva.Cliente where NIF = @NIF
go
--drop procedure dbo.searchClientes
--EXEC dbo.searchClientes @NIF=183014872;



----INSERIR CLIENTES------
create procedure [dbo].[insertCliente](@nome varchar(255), @telefone varchar(100), @email varchar(255), @NIF bigint)
as
	
		begin
			insert into ClubePaiva.Cliente(nome,telefone,email,NIF) values (@nome, @telefone, @email, @NIF);
		end

go 

--exec [dbo].[insertCliente] @nome='Ines Santos',@telefone= '919535015',@email='inessantos@gmail.com',@NIF=327456892
--select * from ClubePaiva.Cliente


--drop procedure dbo.insertCliente

--------REMOVER CLIENTES
create procedure [dbo].[removeCliente](@NIF INT)
AS
	BEGIN
		delete from ClubePaiva.Cliente WHERE NIF = @NIF
	END
GO


drop procedure dbo.removeCliente

----------------------------------------------------------
----------------------FUNCIONARIO -------------------------






------------------REMOVER GUIA DA EMPRESA-------------

CREATE PROCEDURE [dbo].[removeGuia](@numFunc bigINT)
AS
	BEGIN
		if exists(select * from ClubePaiva.Guia as g where g.numfunc=@numFunc)
		begin
			exec dbo.updateGuia @numFunc=@numFunc;
			DELETE FROM ClubePaiva.Guia WHERE numFunc = @numFunc
			
		end
		else
			DELETE FROM ClubePaiva.Gerente WHERE numFunc = @numFunc

		DELETE FROM ClubePaiva.Funcionario WHERE numFunc = @numFunc
		
	END
GO

create procedure [dbo].[updateGuia](@numFunc bigint)
as
	begin
		declare @newFunc bigint;
 		set @newFunc= (select TOP 1 numFunc FROM ClubePaiva.Guia ORDER BY NEWID())
		
		update ClubePaiva.RegistoDeAtividades
		set guia = @newFunc where guia = @numFunc
	end

go

--select * from ClubePaiva.Funcionario
--select * from ClubePaiva.Guia
--select guia from ClubePaiva.RegistoDeAtividades 
s

--exec dbo.removeFuncionario @numFunc=2

--drop procedure dbo.removeFuncionario


------------CREATE GUIA AND FUNCIONARIO--------------------

create procedure [dbo].[createGuia](@nome varchar(255), @telefone varchar(100), @email varchar(255), @NIF bigint, @numFunc bigint out, @dataEntrada date)
as
		begin Transaction
		declare @idFunc as bigint;
		exec dbo.insertFuncionario @nome=@nome, @telefone=@telefone, @email=@email, @NIF=@NIF, @numFunc=@idFunc out, @dataEntrada=@dataEntrada;
		insert into ClubePaiva.Guia(nome,numFunc) values (@nome,@idFunc)
		set @numFunc = @idFunc;
		if @@ERROR !=0
		rollback tran
	else
		commit tran
go

declare @idFunc bigint;
exec dbo.createGuia @nome='diana', @telefone ='914193949',@email='joana21cunha@gmail.com',@NIF=257356894,@numFunc=@idFunc out,@dataEntrada='2021-06-18';

--select * from ClubePaiva.Funcionario
--select * from ClubePaiva.Guia--
drop procedure dbo.createGuia


------------Create GERENTE AND FUNCIONARIO-------------------

create procedure [dbo].[createGerente](@nome varchar(255), @telefone varchar(100), @email varchar(255), @NIF bigint, @numFunc bigint out, @dataEntrada date)
as
		begin Transaction
		declare @idFunc as bigint;
		exec dbo.insertFuncionario @nome=@nome, @telefone=@telefone, @email=@email, @NIF=@NIF, @numFunc=@idFunc out, @dataEntrada=@dataEntrada;
		insert into ClubePaiva.Gerente(nome,numFunc) values (@nome,@idFunc)
		set @numFunc = @idFunc;
		if @@ERROR !=0
		rollback tran
	else
		commit tran
go
drop procedure dbo.createGerente


declare @idFunc bigint;
exec dbo.createGerente @nome='Claudio', @telefone ='914193949',@email='joana21cunha@gmail.com',@NIF=257366457,@numFunc=@idFunc out,@dataEntrada='2021-06-18';


--------------------AUXILIAR PARA CREATE GUIA E CREATE FUNCIONARIO---------------------------
create procedure [dbo].[insertFuncionario](@nome varchar(255), @telefone varchar(100), @email varchar(255), @NIF bigint, @numFunc bigint OUT, @dataEntrada date)
as
	begin
			insert into ClubePaiva.Funcionario(nome,telefone,email,NIF,dataEntrada) values (@nome, @telefone, @email, @NIF,@dataEntrada);
			set @numFunc = SCOPE_IDENTITY()
	end
go 

drop procedure dbo.insertFuncionario

---------------------------------------------------
---------------ATIVIDADE----------------------------

------------------------ADICIONAR ATIVIDADE----------------------
CREATE PROCEDURE [dbo].[addAtividade](@idAtividade bigint out, @dataReserva datetime, @dataAtividade datetime,@cliente BIGINT,@tipo varchar(255),@preco numeric, @numPessoas int, @guia bigint)
AS
	BEGIN
		
		INSERT INTO ClubePaiva.RegistoDeAtividades(dataReserva, dataAtividade,cliente,tipo,preco,numPessoas,guia) values(@dataReserva, @dataAtividade,@cliente,@tipo,@preco, @numPessoas, @guia )
		
		set @idAtividade = SCOPE_IDENTITY()
	END
GO
drop procedure dbo.addAtividade
declare @idAtividade bigint





----------------ELIMINAR ATIVIDADE---------------------
CREATE PROCEDURE [dbo].[deleteAtividade](@idAtividade bigint)
AS
	BEGIN
		delete from ClubePaiva.RegistosDeAtividades where idAtividade = @idAtividade
	END
GO
drop procedure dbo.deleteAtividade




CREATE PROCEDURE [dbo].[addEquipamento](@idAtividade bigint, @nomeEquipamento VARCHAR(500),@quantidade bigint,@tamanho varchar(10))
as
	begin transaction

		declare @stock bigint;
		set @stock = (select e.stock from ClubePaiva.EquipamentoDisponível e where e.nomeEquipamento =@nomeEquipamento and e.tamanho = @tamanho)

		if @stock > @quantidade
			begin
				insert into ClubePaiva.EquipamentoParaAtividades(idAtividade,nomeEquipamento,quantidade,tamanho) values (@idAtividade,@nomeEquipamento, @quantidade,@tamanho)
				UPDATE ClubePaiva.EquipamentoDisponível
				set stock=stock-@quantidade where nomeEquipamento=@nomeEquipamento and tamanho=@tamanho
				commit tran
			end
		else
			begin
				raiserror('Não existe stock para esse equipamento!',16,1);
				rollback tran
			end
		
go
drop procedure dbo.addEquipamento

create procedure [dbo].[freeEquipamento](@idAtividade bigint)
as
	
	declare @nomeEquipamento varchar(500)
	declare @quantidade bigint
	declare @tamanho varchar(10)
	set @quantidade = (select ea.quantidade from ClubePaiva.EquipamentoParaAtividades ea where ea.idAtividade = @idAtividade)
	set @nomeEquipamento = (select ea.nomeEquipamento from ClubePaiva.EquipamentoParaAtividades ea where ea.idAtividade = @idAtividade)
	set @tamanho = (select ea.tamanho from ClubePaiva.EquipamentoParaAtividades ea where ea.idAtividade = @idAtividade)
	
	begin try
	begin transaction
		delete from ClubePaiva.EquipamentoParaAtividades where idAtividade=@idAtividade
		update ClubePaiva.EquipamentoDisponível
		set stock = stock+ @quantidade where nomeEquipamento =@nomeEquipamento and tamanho =@tamanho
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go
drop procedure dbo.freeEquipamento
select * from ClubePaiva.EquipamentoParaAtividades
select * from ClubePaiva.EquipamentoDisponível


create procedure dbo.getAtividades
AS
	begin
		select * from ClubePaiva.RegistoDeAtividades ORDER BY dataAtividade
	end

GO
exec dbo.getAtividades


CREATE PROCEDURE [dbo].[editPrice](@id bigint, @preco numeric)
AS
	BEGIN
		UPDATE ClubePaiva.AtividadesExistentes
		SET  preco = @preco WHERE tipoID = @id;
	END
GO
drop procedure dbo.editPrice
--EXEC dbo.editPrice @id=1, @preco = 200 


--
-------------------------------SEARCH IN TABLES-----------------------------



-----Ver informações de uma certa atividade registada-----

--CREATE PROCEDURE [dbo].[searchRegistoAtividade](@idAtividade bigint)
--AS
--	BEGIN
--		SELECT * FROM ClubePaiva.RegistoDeAtividades WHERE idAtividade = @idAtividade;
--	END
--GO
--exec dbo.searchRegistoAtividade @idAtividade=2;

--------------Ver informações do equipamento de cada atividade---------------

CREATE PROCEDURE [dbo].[searchEquipamento](@idAtividade bigint)
AS
	BEGIN
		SELECT * FROM ClubePaiva.EquipamentoParaAtividades WHERE idAtividade = @idAtividade;
	END
GO
--EXEC dbo.searchEquipamento @idAtividade=2;

