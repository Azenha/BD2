-- Resposta b)
select cidade_part, b.data, count(cod_cli)-- as "passagens marcadas"
from voo a, execucao_voo b, passagem c, piloto d
where a.num_voo = b.num_voo and        -- JOIN entre voo e execucao_voo
      b.num_voo = c.num_voo and        -- JOIN entre execucao_voo e passagem
	  b.data    = c.data    and        
	  b.cod_piloto = d.cod_piloto and  -- Join entre execucao_voo e piloto
	  nome = 'Paulo' 
group by cidade_part, b.data
having count(*) < 500


-- Resposta e)
select nome, cod_cli from cliente_p
where not exists(
select a.num_voo, b.data from voo a , execucao_voo b, piloto c
	    where a.num_voo = b.num_voo and b.cod_piloto = c.cod_piloto 
	    and nome = 'Ronaldo'    and cidade_part='Porto Alegre'  
except
select a.num_voo, a.data from execucao_voo a, passagem b,
	  (select cod_cli, count(*) as qtde from execucao_voo a, passagem b
	    where a.num_voo = b.num_voo and a.data    = b.data
        group by cod_cli
        having count(*) > 1) as Total
	    where a.num_voo = b.num_voo     and 
	          b.cod_cli = Total.cod_cli and
		      a.data    = b.data        and 
	          b.cod_cli = cliente_p.cod_cli and
	          a.data   <= '2002-12-31' and a.data >= '2002-03-01'  -- simula hoje
)

select cod_prod, max(preco) from produto
group by cod_prod
having max(preco) = (select max(preco) from produto)

--Outra forma de fazer
select nome, cod_cli from cliente_p
where not exists(
select aa.num_voo, bb.data from voo aa , execucao_voo bb, piloto c
	    where aa.num_voo = bb.num_voo and bb.cod_piloto = c.cod_piloto 
	    and nome = 'Ronaldo'    and cidade_part='Porto Alegre'  
        and not exists 
        (select a.num_voo, a.data from execucao_voo a, passagem b
	    where a.num_voo = b.num_voo  and 
		      a.data    = b.data     and
	    	  bb.num_voo = a.num_voo and 
		      bb.data    = a.data    and 
		      cod_cli = cliente_p.cod_cli
		 ))