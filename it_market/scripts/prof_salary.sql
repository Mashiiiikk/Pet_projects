select rank() over (partition by experience_level order by avg_salary desc) as rank_level, *
from (select profession, region, experience_level, count(*) as count_prof, 
			round(avg((salary_to_rub + salary_from_rub)/2),0) as avg_salary,
			min(salary_from_rub) as min_salary, max(salary_to_rub) as max_salary
		from it_market
		group by profession, region, experience_level) grouped
order by rank_level, experience_level 

