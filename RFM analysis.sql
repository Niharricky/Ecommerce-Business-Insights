use elcas;
CREATE VIEW rfm_base AS
SELECT
    customer_age_group AS segment,
    MAX(transaction_date) AS last_purchase_date,
    COUNT(*) AS frequency,
    SUM(total_revenue) AS monetary
FROM ecommerce
GROUP BY customer_age_group;

CREATE VIEW rfm_metrics AS
SELECT
    segment,
    DATEDIFF(CURDATE(), last_purchase_date) AS recency,
    frequency,
    monetary
FROM rfm_base;

CREATE VIEW rfm_scores AS
SELECT
    segment,
    monetary,
    NTILE(4) OVER (ORDER BY recency ASC) AS R_score,
    NTILE(4) OVER (ORDER BY frequency DESC) AS F_score,
    NTILE(4) OVER (ORDER BY monetary DESC) AS M_score
FROM rfm_metrics;



CREATE VIEW rfm_final AS
SELECT
    segment,
    monetary,
    R_score,
    F_score,
    M_score,
    CONCAT(R_score, F_score, M_score) AS rfm_score,
    CASE
        WHEN CONCAT(R_score, F_score, M_score) = '444' THEN 'Champions'
        WHEN R_score >= 3 AND F_score >= 3 THEN 'Loyal Customers'
        WHEN M_score = 4 THEN 'Big Spenders'
        WHEN R_score = 1 THEN 'At Risk'
        ELSE 'Others'
    END AS customer_segment
FROM rfm_scores;

SELECT * FROM rfm_final;




