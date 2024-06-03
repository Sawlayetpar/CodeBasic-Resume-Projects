# request 6

use gdb023;

select
	i.customer_code,
    c.customer,
    i.pre_invoice_discount_pct
from 
fact_pre_invoice_deductions i
join
	dim_customer c on i.customer_code = c.customer_code
where
	i.fiscal_year = 2021 and c.market = "India"
order by
	i.pre_invoice_discount_pct desc
limit 5;