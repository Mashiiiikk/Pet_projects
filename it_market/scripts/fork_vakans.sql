with work_type as (select profession, work_format, count(*) as vacancies,
						round(avg((salary_to_rub+salary_from_rub)/2),0) as avg_salary,
						round(percentile_cont(0.25) within group (order by ((salary_to_rub+salary_from_rub)/2))::numeric,0) as v1,
						round(percentile_cont(0.5) within group (order by ((salary_to_rub+salary_from_rub)/2))::numeric,0) as median,
						round(percentile_cont(0.75) within group (order by ((salary_to_rub+salary_from_rub)/2))::numeric,0) as v3,
						min(salary_from_rub) as min_salary, max(salary_to_rub) as max_salary
					from it_market
					group by profession, work_format)
					
select profession, work_format, vacancies, avg_salary, median, v1, v3, (v3-v1) as iqr, min_salary, max_salary
from work_type
group by profession, work_format, vacancies, avg_salary, median, v1, v3, min_salary, max_salary 