-- Adiciona clientes na tabela Clientes -> ver nas views ou inserts

create trigger ClubePaiva.checkCliente on ClubePaiva.Cliente
instead of insert
as
	begin
			declare @nome varchar(255);
			declare @telefone varchar(100);
			declare @email varchar(255);
			declare @numCc bigint;
			select @nome=nome, @telefone=telefone, @email=email, @numCc=numCc from inserted;
				if (([dbo].[checkCliente](@nome, @telefone, @email, @numCc) = 0))
					insert into ClubePaiva.Cliente(nome,telefone,email,numCc) values (@nome, @telefone, @email, @numCc);
				else
					raiserror('Já existe este cliente!',16,1);
	end
go

INSERT INTO ClubePaiva.Cliente VALUES ('Diana','(351) 918583780','rochadc00@ua.pt',2590000000)
GO

DROP TRIGGER Clube.checkCliente

----------------------------------------------------------------------
-- Adiciona funcionarios na tabela Funcionario -> ver nas views ou inserts

create trigger ClubePaiva.checkFuncionario on ClubePaiva.Funcionario
instead of insert
as
	begin
			declare @nome varchar(255);
			declare @telefone varchar(100);
			declare @email varchar(255);
			declare @numCc bigint;
			declare @numFunc bigint;
			declare @dataEntrada date;
			select @nome=nome, @telefone=telefone, @email=email, @numCc=numCc, @numFunc=numFunc, @dataEntrada=dataEntrada from inserted;
				if (([dbo].[checkFuncionario](@nome, @telefone, @email, @numCc, @numFunc, @dataEntrada) = 0))
					insert into ClubePaiva.Funcionario(nome,telefone,email,numCc,numFunc,dataEntrada) values (@nome, @telefone, @email, @numCc,@numFunc, @dataEntrada);
				else 
					raiserror('Já existe este funcionario!',16,1);
	end
go

INSERT INTO ClubePaiva.Funcionario VALUES ('J','(351) 91xxx5x','joa00@ua.pt',2590000010,51,'2022-08-23')
GO

DROP TRIGGER ClubePaiva.checkFuncionario


-----------------------------------------------------------
create trigger check_dates on ClubePaiva.RegistoDeAtividades
instead of insert
as 
	begin
			declare @dataReserva datetime;
			declare @dataAtividade datetime;

			select @dataReserva=dataReserva, @dataAtividade=dataAtividade from inserted;

			if @dataReserva > @dataAtividade 
				begin
					raiserror ('A data de atividade tem de ser depois da data de reserva!',16,1);
					rollback tran;
				end
	end
go

drop table check_dates;

insert into clubePaiva.RegistoDeAtividades (dataReserva,dataAtividade) values ('2022-06-12 15:43:08','2022-06-13 16:44:07')


/*
----------------------------------------------------------------------
-- Adiciona guia na tabela Guia -> ver nas views ou inserts

create trigger ClubePaiva.checkGuia on ClubePaiva.Funcionario
instead of insert
as
	begin
			declare @nome varchar(255);
			declare @telefone varchar(100);
			declare @email varchar(255);
			declare @numCc bigint;
			declare @numFunc bigint;
			declare @dataEntrada date;
			select @nome=nome, @telefone=telefone, @email=email, @numCc=numCc, @numFunc=numFunc, @dataEntrada=dataEntrada from inserted;
			if (([dbo].[checkFuncionario](@nome, @telefone, @email, @numCc, @numFunc, @dataEntrada) = 1))
				if (([dbo].[checkGuia](@numFunc) = 0))
					insert into ClubePaiva.Guia(numFunc) values (@numFunc);
				else
					raiserror('Já existe este funcionario como guia!',16,1);
			else 
					raiserror('Já existe este funcionario!',16,1);
	end
go

INSERT INTO ClubePaiva.Guia VALUES (1)
GO

DROP TRIGGER ClubePaiva.checkGuia

----------------------------------------------------------------------
-- Adiciona gerente na tabela Gerente -> ver nas views ou inserts

create trigger ClubePaiva.checkGerente on ClubePaiva.Gerente
instead of insert
as
	begin
			declare @nome varchar(255);
			declare @telefone varchar(100);
			declare @email varchar(255);
			declare @numCc bigint;
			declare @numFunc bigint;
			declare @dataEntrada date;
			select @nome=nome, @telefone=telefone, @email=email, @numCc=numCc, @numFunc=numFunc, @dataEntrada=dataEntrada from inserted;
			if (([dbo].[checkFuncionario](@nome, @telefone, @email, @numCc, @numFunc, @dataEntrada) = 1))
				if (([dbo].[checkGuia](@numFunc) = 1))
					if(([dbo].[checkGerente](@numFunc) = 0))
						insert into ClubePaiva.Gerente(numFunc) values (@numFunc);
					else 
						raiserror('Já existe este funcionario como gerente!',16,1);
				else 
					raiserror('Este funcionário é guia!',16,1);
			else 
					raiserror('Já existe este funcionario!',16,1);
	end
go

INSERT INTO ClubePaiva.Gerente VALUES (333)
GO

DROP TRIGGER ClubePaiva.checkGerente

*/

