/* Análisis básico */

-- Ingresos totales

    SELECT SUM(total_amount) AS revenue
    FROM sales;

-- Unidades vendidas

    SELECT SUM(quantity) AS units_sold
    FROM sales;

-- Ingresos por género

    SELECT gender, SUM(total_amount) AS revenue
    FROM sales
    GROUP BY gender;

-- Ingresos por categoría

    SELECT product_category, SUM(total_amount) AS revenue
    FROM sales
    GROUP BY product_category;

-- Ingresos por mes

    SELECT 
    DATE_FORMAT(order_date, "%Y-%m") AS month,
    SUM(total_amount) AS revenue
    FROM sales
    GROUP BY month
    ORDER BY month;

/* Análisis profundo */

-- Crecimiento mes a mes MoM Growth

    SELECT 
        DATE_FORMAT(order_date, "%Y-%m") AS month,
        SUM(total_amount) AS revenue,
        LAG(SUM(total_amount)) OVER (ORDER BY DATE_FORMAT(order_date, "%Y-%m")) AS prev_revenue,
        (SUM(total_amount) - LAG(SUM(total_amount)) OVER (ORDER BY DATE_FORMAT(order_date, "%Y-%m")))
            / LAG(SUM(total_amount)) OVER (ORDER BY DATE_FORMAT(order_date, "%Y-%m")) * 100 AS growth_pct
    FROM sales
    GROUP BY month;

-- Ticket promedio

        SELECT 
        COUNT(DISTINCT transaction_id) AS transactions,
        SUM(total_amount) AS revenue,
        SUM(total_amount) / COUNT(DISTINCT transaction_id) AS avg_ticket
        FROM sales;

-- Top clientes (Pareto 80/20) exploración con 10 clientes

SELECT 
    customer_id,
    SUM(total_amount) AS revenue
FROM sales
GROUP BY customer_id
ORDER BY revenue DESC
LIMIT 10;

-- Top rangos editarios (Pareto 80/20) 

    WITH age_rev AS (
  SELECT 
    CASE
      WHEN age < 25 THEN 'Menores de 25'
      WHEN age BETWEEN 25 AND 34 THEN '25-34'
      WHEN age BETWEEN 35 AND 44 THEN '35-44'
      WHEN age BETWEEN 45 AND 54 THEN '45-54'
      ELSE '55+'
    END AS age_group,
    SUM(total_amount) AS revenue
  FROM sales
  GROUP BY age_group
),
ordered AS (
  SELECT *,
         SUM(revenue) OVER (ORDER BY revenue DESC) AS cum_revenue,
         SUM(revenue) OVER () AS total_revenue
  FROM age_rev
)
SELECT 
  age_group,
  revenue,
  cum_revenue,
  cum_revenue / total_revenue AS cum_pct
FROM ordered
ORDER BY revenue DESC;

-- Análisis de cohortes (edad)

SELECT 
    CASE 
        WHEN age < 25 THEN "Abajo de 25"
        WHEN age BETWEEN 25 AND 34 THEN "25-34"
        WHEN age BETWEEN 35 AND 44 THEN "35-44"
        ELSE "45+"
    END AS age_group,
    SUM(total_amount) AS revenue,
    COUNT(DISTINCT customer_id) AS customers,
    SUM(total_amount) / COUNT(DISTINCT customer_id) AS revenue_per_customer
FROM sales
GROUP BY age_group;

-- Precio promedio VS volumen

        SELECT 
        product_category,
        SUM(quantity) AS units_sold,
        AVG(price_per_unit) AS avg_price,
        SUM(total_amount) AS revenue
        FROM sales
        GROUP BY product_category;

-- Simulación financiera (Profit & Margin) (con un 60% de costos sobre los ingresos y un margen de ganancia del 40%)

    SELECT 
        product_category,
        SUM(total_amount) AS revenue,
        SUM(total_amount) * 0.6 AS cost,
        SUM(total_amount) - (SUM(total_amount) * 0.6) AS profit,
        (SUM(total_amount) - SUM(total_amount) * 0.6) / SUM(total_amount) * 100 AS margin_pct
    FROM sales
    GROUP BY product_category;

