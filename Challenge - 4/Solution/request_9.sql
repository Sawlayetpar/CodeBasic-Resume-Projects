# request 9
use gdb023;

with channel_sales as(
select 
	c.channel,
    sum(price.gross_price*sales.sold_quantity) as gross_sale
from
	fact_sales_monthly sales
join
	dim_customer c on sales.customer_code = c.customer_code
join
	fact_gross_price price on sales.product_code = price.product_code
where 
	sales.fiscal_year = price.fiscal_year and sales.fiscal_year = 2021
group by 
channel
    ),
total_sale as(
select 
sum(price.gross_price*sales.sold_quantity) as total_gross_sale
from
fact_sales_monthly sales
join
	fact_gross_price price on sales.product_code = price.product_code
where 
	sales.fiscal_year = price.fiscal_year and sales.fiscal_year = 2021    
)
select 
cs.channel,
cs.gross_sale,
(cs.gross_sale/ts.total_gross_sale)*100 as percentage_distribution
from
channel_sales cs
cross join
total_sale ts
;