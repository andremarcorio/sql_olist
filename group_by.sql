-- Descrição da tabela
PRAGMA table_info(tb_products)

-- Faça uma query que apresente o tamanho médio, máximo e mínimo da descrição do objeto por categoria.

select product_category_name as categoria,
       avg(product_description_lenght) as media_descricao,
       max(product_description_lenght) as maximo_descricao,
       min(product_description_lenght) as minimo_descricao

from tb_products

group by product_category_name

order by max(product_description_lenght) desc

-- Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria.

select product_category_name as categoria,
       round(avg(product_name_lenght),2) as media_nome,
       max(product_name_lenght) as maximo_nome,
       min(product_name_lenght) as minimo_nome

from tb_products

group by product_category_name

-- Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria. 
-- Considere apenas os objetos que tenham a descrição maior que 100.

select product_category_name as categoria,
       round(avg(product_name_lenght),2) as media_nome,
       max(product_name_lenght) as maximo_nome,
       min(product_name_lenght) as minimo_nome

from tb_products

where product_description_lenght > 100

group by product_category_name

-- Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria. 
-- Considere apenas os objetos que tenham a descrição maior que 100. 
-- Exiba apenas as categorias com tamanho médio de descrição do objeto maior que 500 caracteres.

select product_category_name as categoria,
       round(avg(product_name_lenght),2) as media_nome,
       max(product_name_lenght) as maximo_nome,
       min(product_name_lenght) as minimo_nome

from tb_products

where product_description_lenght > 100

group by product_category_name

having avg(product_description_lenght) > 500
