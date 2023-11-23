select name, sum(count) as total_count from
((select p2.name as name, count(p2.name) as count, 'order' as action_type  from person_order
    join menu m on m.id = person_order.menu_id
    join pizzeria p2 on m.pizzeria_id = p2.id
group by p2.name
order by count desc limit 3)
union all
(select name, count(name) as count , 'visit' as actio_type from person_visits
    join pizzeria p on person_visits.pizzeria_id = p.id
group by name
order by  count desc limit 3)) as all_1
group by name
order by total_count desc, name;