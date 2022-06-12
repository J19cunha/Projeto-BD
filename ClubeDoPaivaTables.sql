drop table ClubePaiva.RegistoDeAtividades
drop table ClubePaiva.Atividade
drop table ClubePaiva.TipoAtividade
drop table ClubePaiva.Equipamento
drop table ClubePaiva.Gerente
drop table ClubePaiva.Guia
drop table ClubePaiva.Cliente
drop table ClubePaiva.Funcionario;


create table ClubePaiva.Cliente (
	nome VARCHAR(255) not null,
	numCc BIGINT not null,
	telefone VARCHAR(100) not null,
	email VARCHAR(255) not null,

	PRIMARY KEY (numCc)			
);


create table ClubePaiva.Funcionario(
	nome VARCHAR(255) not null,
	numCc BIGINT not null,
	telefone VARCHAR(100) not null,
	email VARCHAR(100) not null,
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

/*todo o material disponivel ate o momento*/

create table ClubePaiva.Equipamento(
	nomeEquipamento VARCHAR(500) not null, /* fato, botas, capacete, luzes, etc */
	stock BIGINT not null,	/* tamanhos ou material que se encontram disponíveis */
	tamanho VARCHAR(10) not null, /* xs, s, m, l, xl, xxl, xxxl*/

	UNIQUE(nomeEquipamento)
);

/* acho que é meio insignificante esta
create table ClubePaiva.Equipamento(
	idEquipamento int not null,
	tipo VARCHAR(255) not null FOREIGN KEY REFERENCES ClubePaiva.TipoEquipamento(nome_equipamento),
	
	PRIMARY KEY(idEquipamento)
);*/

/* nesta tabela precisa-se de ganhar uma noção de quanto material é necessário para a atividade em específico
	* acho que criar tabelas para canoas, canyoning, rafting e rivertracking é melhor para que o material aqui
	* especificado não fosse do geral de atividades
*/

create table ClubePaiva.TipoAtividade(
	nome VARCHAR(255) not null, /* canoas, rafting, canyoning e rivertracking */
	fatos int not null,
	botas int not null,
	capacete int not null,
	luzes int not null,
	colete int not null,
	/*etc provavelmente*/
	/*equipamento VARCHAR(500) not null FOREIGN KEY REFERENCES ClubePaiva.Equipamento(nome_equipamento),*/
	
	PRIMARY KEY(nome)
);


create table ClubePaiva.Atividade(
	idAtividade Bigint not null,	/* identifica a atividade */
	tipo VARCHAR(255) not null FOREIGN KEY REFERENCES ClubePaiva.TipoAtividade(nome),
	preço numeric not null, 
	numPessoas int not null,
	guia bigint not null FOREIGN KEY REFERENCES ClubePaiva.Guia(numFunc),
	cliente BIGINT not null, /*FOREIGN KEY REFERENCES ClubePaiva.Cliente(numCc)*/

	PRIMARY KEY(idAtividade)
);

/*-------------------- Tabela com todas as atividades alguma vez realizadas ou por realizar ------------------*/
CREATE TABLE ClubePaiva.RegistoDeAtividades(
	idReserva BIGINT not null FOREIGN KEY REFERENCES ClubePaiva.Atividade(idAtividade),
	dataReserva datetime not null,	/* data em que foi feita a reserva da atividade */
	dataAtividade datetime not null, /* data da atividade */

	PRIMARY KEY(dataAtividade)
);

