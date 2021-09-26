create table voo 
( num_voo  char(10)  not null, 
  hora_part  char(4)    not null, 
  hora_cheg  char(4)    not null, 
  cidade_part  char(20) not null, 
  cidade_cheg char(20) not null, 
  primary key (num_voo)); 
 
create table piloto 
( cod_piloto char(10) not null, 
  nome  char(30) not null, 
  endereco char(50) not null, 
  data_admissao   date  not null, 
  primary key (cod_piloto)); 
   
create table execucao_voo 
( num_voo  char(10) not null, 
  data  date  not null, 
  cod_piloto char(15) not null, 
  n_lugares integer  not null, 
  primary key (num_voo,data), 
  foreign key (num_voo) references voo); 
 
 
create table cliente_p 
( cod_cli char(10) not null, 
  nome  char(30) not null, 
  endereco char(50) not null,  
  telefone char(20), 
  primary key (cod_cli)); 
 
create table passagem 
( num_voo  char(10) not null, 
  data  date  not null, 
  poltrona char(3)  not null, 
  cod_cli  char(10), 
  data_reserva date,  
  primary key (num_voo, data, poltrona), 
  foreign key (num_voo, data) references execucao_voo, 
  foreign key (cod_cli) references cliente_p);