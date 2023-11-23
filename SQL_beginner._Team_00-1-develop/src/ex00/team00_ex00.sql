create table route (
    point1 varchar,
    point2 varchar,
    cost   integer
);

insert into route values ('a', 'b', 10);
insert into route values ('b', 'a', 10);
insert into route values ('a', 'c', 15);
insert into route values ('c', 'a', 15);
insert into route values ('a', 'd', 20);
insert into route values ('d', 'a', 20);
insert into route values ('b', 'c', 35);
insert into route values ('c', 'b', 35);
insert into route values ('b', 'd', 25);
insert into route values ('d', 'b', 25);
insert into route values ('c', 'd', 30);
insert into route values ('d', 'c', 30);

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
order by 1, 2;
