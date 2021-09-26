/* insercao de dados na tabela voo */ 
 
insert into voo 
        values ('v1','800','845','Sao Paulo','Rio de Janeiro'); 
insert into voo 
        values ('v2','1000','1330','Sao Paulo','Salvador'); 
insert into voo 
        values ('v3','2200','2330','Porto Alegre','Sao Paulo'); 
insert into voo 
        values ('v5','1200','1345','Porto Alegre','Rio de Janeiro'); 
insert into voo 
        values ('v4','1100','1150','Porto Alegre','Florianopolis'); 
commit; 

/* insercao de dados na tabela piloto */ 
 
insert into piloto 
        values ('p1','Pedro','Rua Carlos Gomes, 607',to_date('03/03/1989','dd/mm/yyyy')); 
insert into piloto 
        values ('p4','Ronaldo','Rua 24 de outubro, 312/201',to_date('20/04/1980','dd/mm/yyyy')); 
insert into piloto 
        values ('p2','Paulo','Rua Nilo Peçanha, 804/203',to_date('13/11/1990','dd/mm/yyyy')); 
insert into piloto 
        values ('p3','Marcos','Rua Mariland, 645/302',to_date('12/07/1988','dd/mm/yyyy')); 
commit; 
 
/* insercao de dados na tabela execucao_voo */ 
 
insert into execucao_voo 
        values ('v1',to_date('18/06/2002','dd/mm/yyyy'),'p2',70); 
insert into execucao_voo 
        values ('v1',to_date('20/09/2002','dd/mm/yyyy'),'p2',200); 
insert into execucao_voo 
        values ('v3',to_date('10/08/2002','dd/mm/yyyy'),'p2',140); 
insert into execucao_voo 
        values ('v4',to_date('20/09/2002','dd/mm/yyyy'),'p4',100); 
insert into execucao_voo 
        values ('v3',to_date('11/11/2002','dd/mm/yyyy'),'p2',300); 
insert into execucao_voo 
        values ('v1',to_date('22/09/2002','dd/mm/yyyy'),'p1',110); 
insert into execucao_voo 
        values ('v5',to_date('20/09/2002','dd/mm/yyyy'),'p3',145); 
insert into execucao_voo 
        values ('v2',to_date('01/09/2002','dd/mm/yyyy'),'p4',350); 
insert into execucao_voo 
        values ('v1',to_date('23/09/2002','dd/mm/yyyy'),'p4',290); 
insert into execucao_voo 
        values ('v1',to_date('11/11/2002','dd/mm/yyyy'),'p4',125); 
insert into execucao_voo 
        values ('v5',to_date('10/11/2002','dd/mm/yyyy'),'p4',185); 
commit; 
 
 
/* insercao de dados na tabela cliente */ 
 
insert into cliente_p 
        values ('c1','Joao','Rua Freire Alemao, 83/501','(051) 330-9009'); 
insert into cliente_p 
        values ('c2','Luis','Rua Anita Garibaldi, 1001/703','(051) 330-1009'); 
insert into cliente_p 
        values ('c3','Carlos','Av. Carazinho', 120); 
insert into cliente_p 
        values ('c4','Maria','Av. Protasio Alves, 3244/303','(051) 333-7445'); 
commit; 
 
/* insercao de dados na tabela passagem */ 
 
insert into passagem 
        values ('v5',to_date('20/09/2002','dd/mm/yyyy'),'16a','c3',to_date('12/03/2002','dd/mm/yyyy')); 
insert into passagem 
        values ('v1',to_date('20/09/2002','dd/mm/yyyy'),'16b','c4',to_date('15/05/2002','dd/mm/yyyy')); 
insert into passagem 
        values ('v1',to_date('18/06/2002','dd/mm/yyyy'),'24b','c3',to_date('12/03/2002','dd/mm/yyyy')); 
insert into passagem 
        values ('v3',to_date('10/08/2002','dd/mm/yyyy'),'13a','c4',to_date('10/05/2002','dd/mm/yyyy')); 
insert into passagem 
        values ('v4',to_date('20/09/2002','dd/mm/yyyy'),'19c','c3',to_date('13/06/2002','dd/mm/yyyy')); 
insert into passagem 
        values ('v3',to_date('10/08/2002','dd/mm/yyyy'),'1a','c1',to_date('20/03/2002','dd/mm/yyyy')); 
insert into passagem 
        values ('v3',to_date('11/11/2002','dd/mm/yyyy'),'2a','c2',to_date('12/09/2002','dd/mm/yyyy')); 
insert into passagem 
        values ('v5',to_date('20/09/2002','dd/mm/yyyy'),'21a','c1',to_date('05/04/2002','dd/mm/yyyy')); 
insert into passagem 
        values ('v5',to_date('10/11/2002','dd/mm/yyyy'),'11a','c3',to_date('15/04/2002','dd/mm/yyyy')); 
insert into passagem 
        values ('v4',to_date('20/09/2002','dd/mm/yyyy'),'19a','c2',to_date('02/06/2002','dd/mm/yyyy')); 
insert into passagem 
        values ('v1',to_date('11/11/2002','dd/mm/yyyy'),'5a','c3',to_date('23/06/2002','dd/mm/yyyy'));
commit;