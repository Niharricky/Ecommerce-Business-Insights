SELECT * FROM elcas.ecommerce limit 10;

-- 1.Total Revenue
select sum(total_revenue) as Total_Revenue from ecommerce;

-- 2. Revenue by gender
select customer_gender , sum(total_revenue) as total_spend from ecommerce group by customer_gender order by total_spend desc limit 10;

-- 3.Top Locations by Revenue
select customer_location,country,sum(total_revenue) as revenue from ecommerce group by customer_location,country order by revenue desc limit 10;

-- 4.Best-Selling Categories
select category, sum(total_revenue) as Total_revenue from ecommerce group by category order by Total_revenue desc;

-- 5. Seasonal Performance
select seasonality,sum(total_revenue) as revenue from ecommerce group by seasonality order by Revenue desc ;

-- 6. Shipping Method Impact
select shipping_method, round(avg(total_revenue),2) as avg_total_value from ecommerce group by shipping_method;

-- 7.High Return Rate Categories
select category,round(avg(return_rate),3) as avg_return_rate from ecommerce group by category order by avg_return_rate desc;

-- 8.Inventory Risk (Low Stock + High Popularity) 
select product_id,product_name,stock_level,popularity_index from ecommerce where stock_level<20 order by popularity_index desc; 

-- 9.Monthly Revenue Trend
SELECT order_month, SUM(total_revenue) AS revenue
FROM ecommerce
GROUP BY order_month
ORDER BY order_month;

-- 10.Top Customer Segments by Average Order Value
select customer_age_group,customer_gender, avg(total_revenue) as avg_revenue from ecommerce group by customer_gender,customer_age_group order by avg_revenue desc ;

-- 11.Revenue Contribution by Location (%)
select customer_location,sum(total_revenue) as revenue , 
ROUND(SUM(total_revenue) * 100 /(SELECT SUM(total_revenue) FROM ecommerce), 2
    ) AS revenue_percentage from ecommerce group by customer_location order by revenue desc ;
    
-- 12.Revenue vs Return Rate (Risky Products)
SELECT
    product_name,
    SUM(total_revenue) AS revenue,
    AVG(return_rate) AS avg_return_rate
FROM ecommerce
GROUP BY product_name
HAVING avg_return_rate > 0.25
ORDER BY revenue DESC;

