with month_status as (select date_trunc('month', date_posted::date)::date as month_part,
							count(*) as count_vacans
						from it_market
						group by month_part)

select month_part, count_vacans, lag(count_vacans) over (order by month_part) as pre_month,
		round((count_vacans - lag(count_vacans) over (order by month_part)) * 100.0/lag(count_vacans) over (order by month_part), 2) as month_growth,
		lag(count_vacans, 12) over (order by month_part) as year_ago,
		round((count_vacans - lag(count_vacans, 12) over (order by month_part)) * 100.0/lag(count_vacans, 12) over (order by month_part), 2) as year_growth
from month_status
order by month_part