create table ClubePaiva.Cliente (
	nome VARCHAR(255) not null,
	telefone VARCHAR(100) not null,
	email VARCHAR(255) not null,
	NIF BIGINT not null,
	PRIMARY KEY (NIF)			
);


create table ClubePaiva.Funcionario(
	nome VARCHAR(255) not null,
	telefone VARCHAR(100) not null,
	email VARCHAR(100) not null,
	NIF BIGINT not null,
	numFunc BIGINT identity(1,1),
	dataEntrada date not null,	/* importante para ter uma noção de há quanto tempo trabalha na empresa */

	PRIMARY KEY (numFunc)
);

create table ClubePaiva.Guia(
	nome  VARCHAR(255) not null,
	numFunc BIGINT FOREIGN KEY REFERENCES ClubePaiva.Funcionario(numFunc),
	
	PRIMARY KEY(numFunc)
);


create table ClubePaiva.Gerente(
	nome  VARCHAR(255) not null,
	numFunc BIGINT FOREIGN KEY REFERENCES  ClubePaiva.Funcionario(numFunc), /* só existe um único gerente de atividades */

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
	idAtividade BIGINT not null identity(1,1), 
	dataReserva datetime not null,	/* data em que foi feita a reserva da atividade */
	dataAtividade datetime not null, /* data da atividade */
	cliente BIGINT not null FOREIGN KEY REFERENCES ClubePaiva.Cliente(NIF),
	tipo varchar(255) not null, 
	preco numeric not null, 
	numPessoas int not null,
	guia bigint FOREIGN KEY REFERENCES ClubePaiva.Guia(numFunc),

	PRIMARY KEY(idAtividade) /*mudei*/
);


create table ClubePaiva.EquipamentoDisponível(
	nomeEquipamento VARCHAR(500) not null, /* fato, botas, capacete, luzes, etc */
	stock BIGINT not null,	/* tamanhos ou material que se encontram disponíveis */
	tamanho VARCHAR(10) not null, /* xs, s, m, l, xl, xxl, xxxl*/

	PRIMARY KEY(nomeEquipamento,tamanho),
);

create table ClubePaiva.EquipamentoParaAtividades(
	idAtividade bigint not null FOREIGN KEY (idAtividade) REFERENCES ClubePaiva.RegistoDeAtividades(idAtividade),
	nomeEquipamento varchar(500) not null,
	quantidade bigint not null,
	tamanho varchar(10) not null,

	PRIMARY KEY(idAtividade,nomeEquipamento,tamanho)
);

