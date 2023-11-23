select distinct name from person_order
    join person p on person_order.person_id = p.id
order by name;