# request 1
use gdb023;

select market
from dim_customer
where 
(customer = "Atliq Exclusive") and (region = "APAC")
;