select product_category, sum(revenue) as total_revenue, count(order_id) as order_count, 
	sum(quantity) as total_quantity, avg(revenue) as avg_revenue, 
	round(avg(discount::decimal/quantity),4) as avg_discount_quantity
from order_item
group by product_category 
order by total_revenue desc