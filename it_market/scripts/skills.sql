with total as (select count(*) as total_count
				from it_market),

	skills as (select profession, unnest(string_to_array(key_skills, ',')) as skill_vacans
				from it_market)
				
select profession, trim(lower(skill_vacans)) as skill, count(skill_vacans) as skill_count,
	round(100.0 * count(skill_vacans)/total_count,2) as prc,
	dense_rank() over (order by trim(lower(skill_vacans))) as rank_skills
from skills s
cross join total t
group by profession, skill, total_count
order by rank_skills