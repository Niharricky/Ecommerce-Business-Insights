use elcas;

use elcas;
CREATE TABLE ecommerce (
    product_id VARCHAR(50),
    product_name VARCHAR(255),
    category VARCHAR(100),
    price DECIMAL(10,2),
    discount INT,
    tax_rate INT,
    stock_level INT,
    supplier_id VARCHAR(50),
    customer_age_group VARCHAR(20),
    customer_location VARCHAR(100),
    country VARCHAR(100),
    customer_gender VARCHAR(10),
    shipping_cost DECIMAL(10,2),
    shipping_method VARCHAR(50),
    return_rate DECIMAL(5,2),
    seasonality VARCHAR(50),
    popularity_index INT,
    transaction_date DATE,
    total_revenue DECIMAL(12,2),
    order_month VARCHAR(7)
);

load data local infile "D:\\Python All\\Enterprise-Level Customer Analytics & Segmentation\\elcas_cleaned.csv"
into table ecommerce
fields	terminated by ","
enclosed by ""
lines terminated by "\n"
ignore 1 lines;







