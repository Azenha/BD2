-- Seleções base
select * from pedido
select * from movimento

-- Criação da View v_TotalPedido
create or replace view v_TotalPedido as
select cod_cli,
    a.nro_ped,
    cast(sum(total_mov) as decimal(10, 2)) as "soma(total_mov)"
from pedido a,
    movimento b
where a.nro_ped = b.nro_ped
group by cod_cli,
    a.nro_ped
order by nro_ped

-- SELECT BASE
select * from v_TotalPedido

-- Criação da Function
create or replace function atualizarMovimento(char(10)) returns table (
        cod_cli char(10),
        nro_ped char(10),
        total_ped decimal(10, 2)
    ) as $$
update pedido
set total_ped = (
        select "soma(total_mov)"
        from v_TotalPedido
        where cod_cli = $1
    )
where cod_cli = $1;
select cod_cli,
    nro_ped,
    total_ped
from pedido
where cod_cli = $1;
$$ language SQL;

-- Drop da função
drop function atualizarMovimento

-- Select da função
select * from atualizarMovimento('c1')
