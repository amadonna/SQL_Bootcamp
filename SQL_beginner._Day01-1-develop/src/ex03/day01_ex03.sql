select order_date, person_id  from person_order
intersect
select visit_date, person_id from person_visits
order by order_date, person_id desc;