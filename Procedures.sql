create procedure [dbo].[insertClientes](@nome varchar(255), @telefone varchar(100), @email varchar(255), @numCc bigint)
as
	begin
			insert into ClubePaiva.Cliente([nome],[telefone],[email],[numCc]) values (@nome, @telefone, @email, @numCc);
	end
go

execute dbo.insertClientes @nome = nome;