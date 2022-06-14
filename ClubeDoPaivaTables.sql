create table ClubePaiva.Cliente (
	nome VARCHAR(255) not null,
	telefone VARCHAR(100) not null,
	email VARCHAR(255) not null,
	numCc BIGINT not null,
	PRIMARY KEY (numCc)			
);


create table ClubePaiva.Funcionario(
	nome VARCHAR(255) not null,
	telefone VARCHAR(100) not null,
	email VARCHAR(100) not null,
	numCc BIGINT not null,
	numFunc BIGINT not null,
	dataEntrada date not null,	/* importante para ter uma noção de há quanto tempo trabalha na empresa */

	PRIMARY KEY (numFunc)
);

create table ClubePaiva.Guia(
	numFunc BIGINT not null FOREIGN KEY REFERENCES ClubePaiva.Funcionario(numFunc),
	/* dataAtividade datetime not null FOREIGN KEY REFERENCES ClubePaiva.RegistoDeAtividades(dataAtividade),
	nomeAtividade VARCHAR(255) not null,
	cliente BIGINT not null FOREIGN KEY REFERENCES ClubePaiva.Cliente(nome,num_cc), */

	PRIMARY KEY(numFunc)
);


create table ClubePaiva.Gerente(
	numFunc BIGINT not null FOREIGN KEY REFERENCES  ClubePaiva.Funcionario(numFunc), /* só existe um único gerente de atividades */

	PRIMARY KEY(numFunc)
);


create table ClubePaiva.Atividades(
	idAtividade bigint not null,
	tipo VARCHAR(255) not null, 
	preco numeric not null, 
	numPessoas int not null,
	guia bigint not null FOREIGN KEY REFERENCES ClubePaiva.Guia(numFunc),
	cliente BIGINT not null FOREIGN KEY REFERENCES ClubePaiva.Cliente(numCc),

	PRIMARY KEY(idAtividade)
);

create table ClubePaiva.EquipamentoDisponível(
	nomeEquipamento VARCHAR(500) not null, /* fato, botas, capacete, luzes, etc */
	stock BIGINT not null,	/* tamanhos ou material que se encontram disponíveis */
	tamanho VARCHAR(10) not null, /* xs, s, m, l, xl, xxl, xxxl*/
	/*atividade varchar(255) not null FOREIGN KEY REFERENCES ClubePaiva.Atividades(tipo),*/
	PRIMARY KEY(nomeEquipamento,tamanho),
);


create table ClubePaiva.EquipamentoParaAtividades(
	idAtividade bigint not null FOREIGN KEY (idAtividade) REFERENCES ClubePaiva.Atividades(idAtividade),
	nomeEquipamento varchar(500) not null,
	quantidade bigint not null,
	tamanho varchar(10) not null,

	PRIMARY KEY(idAtividade,nomeEquipamento,tamanho)
);

create table ClubePaiva.RegistoDeAtividades(
	idAtividade BIGINT not null FOREIGN KEY REFERENCES ClubePaiva.Atividades(idAtividade), 
	dataReserva datetime not null,	/* data em que foi feita a reserva da atividade */
	dataAtividade datetime not null, /* data da atividade */
	/*horaAtividade time not null,*/
	PRIMARY KEY(idAtividade) /*mudei*/
);