-- Ex1 - Qual o valor total de receita gerada por clientes de cada estado? 
-- Considere a base completa, com apenas pedidos entregues

select tb3.customer_state as estado,
       round(sum(tb1.price),2) as receita

from tb_order_items as tb1

left join tb_orders as tb2
on tb1.order_id = tb2.order_id

left join tb_customers as tb3
on tb2.customer_id = tb3.customer_id

where tb2.order_status = 'delivered'

group by tb3.customer_state

order by sum(tb1.price) desc 


-- Ex2 - Qual o valor total de receita gerada por sellers de cada estado? 
-- Considere a base completa, com apenas pedidos entregues

select tb2.seller_state as estado,
       round(sum(tb1.price),2) as receita

from tb_order_items as tb1

left join tb_sellers as tb2
on tb1.seller_id = tb2.seller_id

left join tb_orders as tb3
on tb1.order_id = tb3.order_id

where tb3.order_status = 'delivered'

group by tb2.seller_state

order by sum(tb1.price) desc

--Ex3 - Qual o peso médio dos produtos vendidos por sellers de cada estado? 
-- Considere apenas o ano de 2017 e pedidos entregues nesta análise.

select  tb3.seller_state as estado,
        round(avg(tb1.product_weight_g),2) as peso_medio

from tb_products as tb1

left join tb_order_items as tb2
on tb1.product_id = tb2.product_id

left join tb_sellers as tb3
on tb2.seller_id = tb3.seller_id

left join tb_orders as tb4
on tb2.order_id = tb4.order_id

where tb4.order_status = 'delivered'
and cast(strftime('%Y',tb4.order_purchase_timestamp) as int) = 2017

group by tb3.seller_state

order by avg(tb1.product_weight_g) desc