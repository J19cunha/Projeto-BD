----------------------CLIENTE -------------------------

create procedure [dbo].[insertCliente](@nome varchar(255), @telefone varchar(100), @email varchar(255), @NIF bigint)
as
	begin
			insert into ClubePaiva.Cliente(nome,telefone,email,NIF) values (@nome, @telefone, @email, @NIF);
	end
go 

drop procedure dbo.insertCliente

create procedure [dbo].[removeCliente](@NIF INT)
AS
	BEGIN
		delete from ClubePaiva.Cliente WHERE NIF = @NIF
	END
GO
EXEC dbo.removeCliente @NIF=689880995

drop procedure dbo.removeCliente

----------------------------------------------------------
----------------------FUNCIONARIO -------------------------


create procedure [dbo].[insertFuncionario](@nome varchar(255), @telefone varchar(100), @email varchar(255), @NIF bigint, @numFunc bigint, @dataEntrada date)
as
	begin
			insert into ClubePaiva.Funcionario(nome,telefone,email,NIF,numFunc,dataEntrada) values (@nome, @telefone, @email, @NIF,@numFunc,@dataEntrada);
	end
go 

drop procedure dbo.insertFuncionario


CREATE PROCEDURE [dbo].[removeFuncionario](@numFunc INT)
AS
	BEGIN
		DELETE FROM ClubePaiva.Funcionario WHERE numFunc = @numFunc
	END
GO

drop procedure dbo.removeFuncionario



---------------------------------------------------
---------------ATIVIDADE----------------------------
CREATE PROCEDURE [dbo].[addAtividade](@tipo varchar(255), @preco numeric, @numPessoas int, @guia bigint)
AS
	BEGIN
		INSERT INTO ClubePaiva.Atividades(tipo,preco,numPessoas,guia)
		SELECT @tipo, @preco, @numPessoas, @guia
	END
GO


CREATE PROCEDURE [dbo].[insertRegisto](@idAtividade bigint )
AS
	BEGIN
		INSERT INTO ClubePaiva.RegistoDeAtividades(idAtividade) VALUES (@idAtividade);
	END
GO

CREATE PROCEDURE [dbo].[editPrice](@id INT, @preco numeric)
AS
	BEGIN
		UPDATE ClubePaiva.Atividades
		SET  preco = @preco WHERE idAtividade = @id;
	END
GO
--EXEC dbo.editPrice @id=1, @preco = 200 

-----------------------------------------------------

CREATE PROCEDURE [dbo].[getLastAtividadeID]
AS
	BEGIN
		declare @lastID integer;
		SET @lastID = (Select MAX(idAtividade) FROM ClubePaiva.Atividades);
		print @lastID
		return @lastID
	END
GO

drop procedure dbo.getLastAtividadeID

--EXEC dbo.getLastAtividadeID 

/*
CREATE PROCEDURE [dbo].[getAtividadeByRegisto](@idAtividade bigint)
AS
    BEGIN
        select * from ClubePaiva.Atividades join ClubePaiva.RegistoDeAtividades on CLubePaiva.RegistoDeAtividades.idAtividade = CLubePaiva.Atividades.idAtividade where idAtividade=@idAtividade;
    END
GO


drop procedure dbo.getAtividadeinRegisto
EXEC dbo.getAtividadeinRegisto @idAtividade=2*/

-- information about a cliente using NIF

create procedure [dbo].[searchClientes]( @NIF bigint)
as 
select * from ClubePaiva.Cliente where NIF = @NIF
go

EXEC dbo.searchClientes @NIF=183014872;

-- last maximum id

select max(idAtividade) from ClubePaiva.Atividades

--
-------------------------------SEARCH IN TABLES-----------------------------

CREATE PROCEDURE [dbo].[getClientes]
AS
	BEGIN
		SELECT * FROM ClubePaiva.Cliente
	END
GO

drop procedure dbo.getClientes

CREATE PROCEDURE [dbo].[searchAtividade](@idAtividade bigint)
AS
	BEGIN
		SELECT * FROM ClubePaiva.Atividades WHERE idAtividade = @idAtividade;
	END
GO

CREATE PROCEDURE [dbo].[searchRegistoAtividade](@idAtividade bigint)
AS
	BEGIN
		SELECT * FROM ClubePaiva.RegistoDeAtividades WHERE idAtividade = @idAtividade;
	END
GO

CREATE PROCEDURE [dbo].[searchEquipamento](@idAtividade bigint)
AS
	BEGIN
		SELECT * FROM ClubePaiva.EquipamentoParaAtividades WHERE idAtividade = @idAtividade;
	END
GO
--EXEC dbo.searchEquipamento @idAtividade=2;