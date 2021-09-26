-- a) Recuperar os nomes de clientes que não voaram para o Rio de Janeiro no dia 20/09/02. 
-- NOME 
-- Luis 

SELECT nome
from cliente_p
where nome not in (
        SELECT a.nome
        from cliente_p a,
            passagem b,
            voo c
        where c.cidade_cheg = 'Rio de Janeiro'
            and a.cod_cli = b.cod_cli
            and b.num_voo = c.num_voo
    )

 
-- b) Para cada vôo que o piloto Paulo tenha comandado, recuperar a cidade de partida e a data do vôo, 
-- bem como o número de passagens marcadas. Mostrar somente os vôos com menos de 500 passagens. 
-- CIDADE_PART          DATA     COUNT(COD_CLI) 
-- Sao Paulo            18/06/02              1 
-- Sao Paulo            20/09/02              1 
-- Porto Alegre         10/08/02              2 
-- Porto Alegre         11/11/02              1 

select cidade_part,
    b.data,
    count(cod_cli)
from voo a,
    execucao_voo b,
    passagem c,
    piloto d
where a.num_voo = b.num_voo
    and b.num_voo = c.num_voo
    and b.data = c.data
    and b.cod_piloto = d.cod_piloto
    and nome = 'Paulo'
group by cidade_part,
    b.data
having count(*) < 500
 
-- c) Obter a cidade de partida e a data do último vôo que o piloto Paulo tenha comandado. 
-- CIDADE_PART          DATA 
-- Porto Alegre         11/11/02 

select a.cidade_part,
    b.data
from voo a,
    execucao_voo b,
    piloto c
where a.num_voo = b.num_voo
    and b.cod_piloto = (
        select cod_piloto
        from piloto
        where nome = 'Paulo'
    )
group by b.data,
    a.cidade_part
order by b.data desc
limit 1

 
-- d) Recuperar o código e nome de clientes que marcaram passagem em pelo menos todos os vôos 
-- comandados pelo piloto Ronaldo, que saíram de Porto Alegre. 
-- COD_CLI    NOME 
-- c3         Carlos 

select nome,
	cod_cli
from cliente_p
where not exists (
		select a.num_voo,
			b.data
		from voo a,
			execucao_voo b,
			piloto c
		where a.num_voo = b.num_voo
			and b.cod_piloto = c.cod_piloto
			and nome = 'Ronaldo'
			and cidade_part = 'Porto Alegre'
		except
		select a.num_voo,
			a.data
		from execucao_voo a,
			passagem b
		where a.num_voo = b.num_voo
			and a.data = b.data
			and cod_cli = cliente_p.cod_cli
	)

 
-- e) Recuperar o código e nome de clientes que marcaram passagem em pelo menos todos os vôos 
-- comandados pelo piloto Ronaldo, que saíram de Porto Alegre. Selecionar somente aqueles clientes 
-- que tenham mais de uma passagem marcada até o final do ano em vôos ainda não executados. 
-- COD_CLI    NOME 
-- c3         Carlos

select nome,
    cod_cli
from cliente_p
where not exists(
        select a.num_voo,
            b.data
        from voo a,
            execucao_voo b,
            piloto c
        where a.num_voo = b.num_voo
            and b.cod_piloto = c.cod_piloto
            and nome = 'Ronaldo'
            and cidade_part = 'Porto Alegre'
        except
        select a.num_voo,
            a.data
        from execucao_voo a,
            passagem b,
            (
                select cod_cli,
                    count(*) as qtde
                from execucao_voo a,
                    passagem b
                where a.num_voo = b.num_voo
                    and a.data = b.data
                group by cod_cli
                having count(*) > 1
            ) as Total
        where a.num_voo = b.num_voo
            and b.cod_cli = Total.cod_cli
            and a.data = b.data
            and b.cod_cli = cliente_p.cod_cli
            and a.data <= '2002-12-31'
            and a.data >= '2002-03-01'
    )


--Outra forma de fazer

select nome,
    cod_cli
from cliente_p
where not exists(
        select aa.num_voo,
            bb.data
        from voo aa,
            execucao_voo bb,
            piloto c
        where aa.num_voo = bb.num_voo
            and bb.cod_piloto = c.cod_piloto
            and nome = 'Ronaldo'
            and cidade_part = 'Porto Alegre'
            and not exists (
                select a.num_voo,
                    a.data
                from execucao_voo a,
                    passagem b
                where a.num_voo = b.num_voo
                    and a.data = b.data
                    and bb.num_voo = a.num_voo
                    and bb.data = a.data
                    and cod_cli = cliente_p.cod_cli
            )
    )