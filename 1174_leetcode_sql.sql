SELECT 
ROUND(SUM(CASE WHEN order_date=customer_pref_delivery_date THEN 1 ELSE 0 END)/COUNT(distinct customer_id)*100,2) AS immediate_percentage
FROM DELIVERY WHERE 
(customer_id, order_date) in (SELECT customer_id, min(order_date) from Delivery
group by customer_id)