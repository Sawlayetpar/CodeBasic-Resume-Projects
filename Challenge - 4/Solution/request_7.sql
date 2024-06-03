# request 7

use gdb023;

select
*
from 
fact_sales_monthly s
join 
fact_gross_price g on s.product_code = g.product_code
join 
dim_customer c on s.customer_code = c.customer_code
where 
s.fiscal_year = g.fiscal_year and c.customer = "Atliq Exclusive";


with temp as (
select
s.fiscal_year,
monthname(s.date) as months,
(s.sold_quantity * g.gross_price) as gross_sale,
c.customer as customer,
c.market as Market
from 
fact_sales_monthly s
join 
fact_gross_price g on s.product_code = g.product_code
join 
dim_customer c on s.customer_code = c.customer_code
where 
s.fiscal_year = g.fiscal_year and customer = "Atliq Exclusive"
)select 
months, fiscal_year, sum(gross_sale)
from temp
group by months, fiscal_year
;




with temp as (select (gross_price * sold_quantity) as GROSSSALE, c.customer, monthname(s.date) as months, s.fiscal_year
from dim_product p
join fact_gross_price on p.product_code = fact_gross_price.product_code
join fact_sales_monthly s on p.product_code = s.product_code
join dim_customer c on c.customer_code = s.customer_code
join fact_manufacturing_cost mc on p.product_code = mc.product_code
join fact_pre_invoice_deductions i on s.customer_code = c.customer_code

where s.fiscal_year = fact_gross_price.fiscal_year and s.fiscal_year = i.fiscal_year and s.fiscal_year = i.fiscal_year
group by c.customer, months, s.fiscal_year)
select * from temp
where customer = "Atliq Exclusive";