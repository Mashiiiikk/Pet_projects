select case 
		when quantity between 1 and 2 then '1-3 шт'
		when quantity between 4 and 5 then '4-5 шт'
		when quantity between 6 and 7 then '6-7 шт'
		when quantity between 8 and 9 then '8-9 шт'
		else '10+ шт'
		end as group_count,
		count(*) as count_products, round(avg(discount::decimal/quantity),4) as avg_discount_quantity
from order_item oi 
where quantity > 0
group by group_count 
order by count_products desc 