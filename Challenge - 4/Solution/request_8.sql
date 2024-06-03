# request 8

use gdb023;

select 
case 
when date between "2020-01-01" and "2020-03-31" then "Q1"
when date between "2020-04-01" and "2020-06-30" then "Q2" 
when date between "2020-07-01" and "2020-09-30" then "Q3" 
when date between "2020-10-01" and "2020-12-31" then "Q4" 
end as quarter,
sum(sold_quantity) as total_sold_quantity,

min(date) as start_date,
max(date) as end_date
from 
fact_sales_monthly
where
date between "2020-01-01" and "2020-12-31"
group by
quarter

#limit 5
;
#'3704398'
select * from fact_sales_monthly
where date = "2020-03-01";
