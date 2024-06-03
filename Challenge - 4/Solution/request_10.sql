# request 10

use gdb023;

WITH product_sales AS (
    SELECT
        dp.division,
        dp.product_code,
        dp.product,
        SUM(fsm.sold_quantity) AS total_sold_quantity
    FROM
        dim_product dp
    JOIN
        fact_sales_monthly fsm ON dp.product_code = fsm.product_code
    WHERE
        fsm.fiscal_year = 2021
    GROUP BY
        dp.division, dp.product_code, dp.product
),
ranked_products AS (
    SELECT
        division,
        product_code,
        product,
        total_sold_quantity,
        DENSE_RANK() OVER (PARTITION BY division ORDER BY total_sold_quantity DESC) AS rank_order
    FROM
        product_sales
)
SELECT
    division,
    product_code,
    product,
    total_sold_quantity,
    rank_order
FROM
    ranked_products
WHERE
    rank_order <= 3
ORDER BY
    division,
    rank_order
;
 