

CREATE TABLE ClubePaiva.Cliente (
	Nome VARCHAR(255) NOT NULL,
	telefone VARCHAR(100) not null,
	email VARCHAR(255) not null,
	num_cc BIGINT NOT NULL,

	PRIMARY KEY (num_cc)			
);

 

create table ClubePaiva.funcionario(
	nome VARCHAR(255) not null,
	numFunc BIGINT not null,

	primary key (numFunc)
);



create table ClubePaiva.Guia(
	horario datetime,
	numFunc BIGINT not null FOREIGN KEY REFERENCES ClubePaiva.funcionario(numFunc),
	primary key(numFunc)
);


create table ClubePaiva.Gerente(
	numFunc BIGINT not null FOREIGN KEY REFERENCES  ClubePaiva.funcionario(numFunc),
	dataEntrada datetime not null,

	primary key(numFunc)
);

CREATE TABLE ClubePaiva.RegistodeAtividade(
	idReserva BIGINT not null,
	dataAluguer datetime NOT NULL,
	cliente BIGINT NOT NULL FOREIGN KEY REFERENCES ClubePaiva.Cliente(num_cc),
	nomeAtividade VARCHAR(255) NOT NULL,

	primary key(idReserva)
);



create table ClubePaiva.TipoEquipamento(
	nome_equipamento VARCHAR(255) NOT NULL,
	stock BIGINT not null,
	tamanho int not null,
	primary key(nome_equipamento)

);


create table ClubePaiva.Equipamento(
	idEquipamento VARCHAR(255) NOT NULL,
	tipo VARCHAR(255) NOT NULL FOREIGN KEY REFERENCES ClubePaiva.TipoEquipamento(nome_equipamento),
	primary key(idEquipamento)
);


create table ClubePaiva.TipoAtividade(
	nome VARCHAR(255) NOT NULL,
	epoca datetime NOT NULL,
	equipamento VARCHAR(255) NOT NULL FOREIGN KEY REFERENCES ClubePaiva.equipamento(idEquipamento),
	primary key(nome)
);



create table ClubePaiva.Atividade(
	idAtividade Bigint not null,
	tipo VARCHAR(255) NOT NULL FOREIGN KEY REFERENCES ClubePaiva.TipoAtividade(nome),
	preco numeric not null, 
	num_pessoas int not null,
	guia bigint not null FOREIGN KEY REFERENCES ClubePaiva.Guia(numFunc),

	primary key(idAtividade)

);
