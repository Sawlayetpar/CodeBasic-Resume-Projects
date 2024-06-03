# request 2

use gdb023;

select 	
	count(distinct case when fiscal_year = 2020 then product_code end) as unique_products_2020,
    count(distinct case fiscal_year when 2021 then product_code end) as unique_products_2021,
    (count(distinct case when fiscal_year = 2021 then product_code end) - count(distinct case fiscal_year when 2020 then product_code end))/count(distinct case fiscal_year when 2020 then product_code end)*100 as percentage_changes
from fact_sales_monthly;
