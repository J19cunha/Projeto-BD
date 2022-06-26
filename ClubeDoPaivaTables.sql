create table ClubePaiva.Cliente (
	nome varchar(255) not null,
	telefone varchar(100) not null,
	email varchar(255) not null,
	NIF bigint not null,
	PRIMARY KEY (NIF)			
);

create table ClubePaiva.Funcionario(
	nome varchar(255) not null,
	telefone varchar(100) not null,
	email varchar(100) not null,
	NIF bigint not null,
	numFunc bigint identity(1,1),
	dataEntrada date not null,	/* importante para ter uma noção de há quanto tempo trabalha na empresa */

	PRIMARY KEY (numFunc)
);

create table ClubePaiva.Guia(
	nome  varchar(255) not null,
	numFunc bigint FOREIGN KEY REFERENCES ClubePaiva.Funcionario(numFunc),
	
	PRIMARY KEY(numFunc)
);


create table ClubePaiva.Gerente(
	nome  varchar(255) not null,
	numFunc bigint FOREIGN KEY REFERENCES  ClubePaiva.Funcionario(numFunc), /* só existe um único gerente de atividades */

	PRIMARY KEY(numFunc)
);

create table ClubePaiva.AtividadesExistentes(
	tipoID bigint not null,
	nome_atividade varchar(255) not null,
	epoca varchar(255) not null,
	preco numeric,
	numMaxPessoas int not null,
	primary key(tipoID, nome_atividade)
);

create table ClubePaiva.RegistoDeAtividades(
	idAtividade bigint not null identity(1,1), 
	dataReserva datetime not null,	/* data em que foi feita a reserva da atividade */
	dataAtividade datetime not null, /* data da atividade */
	cliente bigint not null FOREIGN KEY REFERENCES ClubePaiva.Cliente(NIF),
	tipo varchar(255) not null, 
	preco numeric not null, 
	numPessoas int not null,
	guia bigint FOREIGN KEY REFERENCES ClubePaiva.Guia(numFunc),

	PRIMARY KEY(idAtividade) /*mudei*/
);


create table ClubePaiva.EquipamentoDisponível(
	nomeEquipamento varchar(500) not null, /* fato, botas, capacete, luzes, etc */
	stock bigint not null,	/* tamanhos ou material que se encontram disponíveis */
	tamanho varchar(10) not null, /* xs, s, m, l, xl, xxl, xxxl*/

	PRIMARY KEY(nomeEquipamento,tamanho),
);

create table ClubePaiva.EquipamentoParaAtividades(
	idReserva bigint identity(1,1),
	idAtividade bigint not null FOREIGN KEY (idAtividade) REFERENCES ClubePaiva.RegistoDeAtividades(idAtividade),
	nomeEquipamento varchar(500) not null,
	quantidade bigint not null,
	tamanho varchar(10) not null,

	PRIMARY KEY(idReserva)
);

