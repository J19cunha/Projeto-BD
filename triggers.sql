create trigger ClubePaiva.checkCliente on ClubePaiva.Cliente
instead of insert
as
	begin
			declare @nome varchar(255);
			declare @telefone varchar(100);
			declare @email varchar(255);
			declare @numCc bigint;
			select @nome=nome, @telefone=telefone, @email=email, @numCc=NIF from inserted;
				if (([dbo].[checkCliente](@numCc) = 0))
					insert into ClubePaiva.Cliente(nome,telefone,email,NIF) values (@nome, @telefone, @email, @numCc);
				else
					raiserror('Já existe este cliente!',16,1);
	end
go
DROP TRIGGER ClubePaiva.checkCliente

--INSERT INTO ClubePaiva.Cliente(nome,NIF,telefone,email) VALUES   ('Lucas Gill',327082294,'(351) 912283587','auctor.odio.a@google.com');

----------------------------------------------------------------------

create trigger ClubePaiva.checkFuncionario on ClubePaiva.Funcionario
instead of insert
as
	begin
			declare @nome varchar(255);
			declare @telefone varchar(100);
			declare @email varchar(255);
			declare @numCc bigint;
			declare @dataEntrada datetime;
			select @nome=nome, @telefone=telefone, @email=email, @numCc=NIF, @dataEntrada=dataEntrada from inserted;
				if (([dbo].[checkFuncionario](@numCc,@nome) = 0))
					insert into ClubePaiva.Funcionario(nome,telefone,email,NIF,dataEntrada) values (@nome, @telefone, @email, @numCc,@dataEntrada);
				else
					raiserror('Já existe este funcionario!',16,1);

	end
go
DROP TRIGGER ClubePaiva.checkFuncionario

--INSERT INTO ClubePaiva.Funcionario(nome,NIF,telefone,email,dataEntrada) VALUES ('Lucas Gill',327082290,'(351) 912283587','auctor.odio.a@google.com','2021-06-18');

----------------------------------------------------------------------
/*
create trigger ClubePaiva.checkGuia on ClubePaiva.Guia
instead of insert
as
	begin	
			declare @numFunc bigint;
			declare @nome varchar(255);
			declare @NIF bigint;
			select @nome=nome, @numFunc=numFunc, @NIF=NIF from ClubePaiva.Funcionario;
			if (([dbo].[checkFuncionario](@nome,@NIF) = 1))
				if (([dbo].[checkGuia](@numFunc) = 0))
					insert into ClubePaiva.Guia(nome,numFunc) values (@nome, @numFunc);
				else
					raiserror('Já existe este guia!',16,1);
			else
				raiserror('Não existe um funcionário com estas credenciais',16,1);
	end
go
DROP TRIGGER ClubePaiva.checkGuia

INSERT INTO ClubePaiva.Guia(nome,numFunc) VALUES ('Martuxa',11)
go
*/

-----------------------------------------------------------
-- Verificar se não estamos a inserir uma data errada
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

--INSERT INTO ClubePaiva.RegistoDeAtividades(dataReserva, dataAtividade, cliente, tipo,preco,numPessoas,guia) VALUES  ('2022-06-24 18:18:28','2022-06-20 12:00:00',820077185, 'canoas',254.00, 5, 1);

drop table check_dates;

---------------------------------------------------------------------------
-- 

create trigger ClubePaiva.checkEquipamento on ClubePaiva.EquipamentoParaAtividades
instead of insert
as
	begin
			declare @idAtividade bigint;
			declare @nomeEquipamento varchar(500);
			declare @quantidade bigint;
			declare @tamanho varchar(10);
			select @idAtividade=idAtividade, @nomeEquipamento=nomeEquipamento, @quantidade=quantidade, @tamanho=tamanho from inserted;
				if (([dbo].[checkEquipamento](@nomeEquipamento, @quantidade, @tamanho) = 1))
					insert into ClubePaiva.EquipamentoParaAtividades(idAtividade,nomeEquipamento,quantidade,tamanho) values (@idAtividade, @nomeEquipamento, @quantidade, @tamanho);
				else
					raiserror('Não existe equipamento disponível para esta atividade!',16,1);
	end
go
DROP TRIGGER ClubePaiva.checkEquipamento


--INSERT INTO ClubePaiva.EquipamentoParaAtividades(idAtividade,nomeEquipamento,quantidade,tamanho) VALUES  (3,'colete',100,'S')

---------------------------------------------------------------------------


