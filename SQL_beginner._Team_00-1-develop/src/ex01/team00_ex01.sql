with recursive maps as (
	select array[point1, point2] as tour, point1, point2, cost, cost all_sum, 1 as level
	from route
	where point1 = 'a'
	union
	select maps.tour || route.point2 as tour,
	route.point1, route.point2, route.cost,
	maps.all_sum + route.cost as all_sum, level + 1
	from maps join route on  maps.point2 = route.point1
	where level = 3 or route.point2 <> all (maps.tour)
)
select all_sum as total_cost, tour
from maps
where level = 4 and all_sum = (select min(all_sum) from maps where level = 4)
union all
select all_sum as total_cost, tour
from maps
where tour[5] = 'a' and all_sum = (select max(all_sum) from maps where level = 4 and tour[5] = 'a')
order by 1, 2;


