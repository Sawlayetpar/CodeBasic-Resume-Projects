# request 4

use gdb023;

select
	segment,
    count(distinct case when sales.fiscal_year = 2020 then p.product_code end) as unique_products_2020,
    count(distinct case when sales.fiscal_year = 2021 then p.product_code end) as unique_products_2021,
    (count(distinct case when sales.fiscal_year = 2021 then p.product_code end) -  count(distinct case when sales.fiscal_year = 2020 then p.product_code end)) different# / count(distinct case when sales.fiscal_year = 2020 then p.product end)*100 as percentage_difference
from
	fact_sales_monthly sales
join
	 dim_product p on sales.product_code = p.product_code
group by
	p.segment
;