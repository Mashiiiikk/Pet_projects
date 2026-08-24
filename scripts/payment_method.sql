select payment_method, count(distinct order_id) as count_order, 
	sum(total_sum) as total_revenue, round(avg(total_sum)::decimal,2) as avg_total_sum
from orders o 
left join (select order_id, sum(revenue) as total_sum
			from order_item
			group by order_id) oi
using (order_id)
group by payment_method 