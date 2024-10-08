-- Qual o tempo médio de vendas dos produtos?
-- Agrupar o produto por categoria

/* Selecionar campos e filtrar os pedidos entregues */
with tb1 as (
select t1.order_id as id_pedido,
       t2.product_id as id_produto,
       t3.product_category_name as categoria,
       date(t1.order_approved_at) as data_compra

from tb_orders as t1
left join tb_order_items as t2
on t1.order_id = t2.order_id

left join tb_products as t3
on t2.product_id = t3.product_id

where t1.order_status = 'delivered'
),

tb2 as (
select *,
       row_number() over(partition by id_produto, data_compra) as rn
from tb1
),

tb3 as (

select id_pedido,
       id_produto,
       categoria,
       data_compra,
       lag(data_compra) over(partition by id_produto order by data_compra) lag_data_compra
from tb2
where rn = 1
),

tb4 as (
select id_produto,
       categoria,
       julianday(data_compra) - julianday(lag_data_compra) as diff_dias

from tb3
where lag_data_compra is not null
)

select categoria,
       max(diff_dias) as maximo
from tb4
group by categoria
order by max(diff_dias) desc







