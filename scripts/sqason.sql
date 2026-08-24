with season_table as (select case when date_part('month', date) in (1,2,12) then 'зима'
							when date_part('month', date) in (3,4,5) then 'весна'
							when date_part('month', date) in (6,7,8) then 'лето'
							else 'осень'
							end as season_part, 
							order_id
						from orders)
						
select season_part, count(st.order_id) as count_order, sum(total_sum) as total_revenue, 
	round(avg(total_sum),2) as avg_revenue
from season_table st
left join (select order_id, sum(revenue)::decimal as total_sum
			from order_item
			group by order_id) ot
on st.order_id = ot.order_id
group by st.season_part