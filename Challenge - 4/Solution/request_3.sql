# request 3
use gdb023;

select
	segment,
    count(distinct(product)) as product_count
from
	dim_product
group by segment
order by product_count DESC;