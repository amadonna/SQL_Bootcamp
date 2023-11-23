select pizzeria.name from person_visits
    join person p on person_visits.person_id = p.id
    join pizzeria on person_visits.pizzeria_id = pizzeria.id
where p.name = 'Andrey'
except
select  p2.name as pizzeria_name from person_order
    join person p on p.id = person_order.person_id
    join menu m on person_order.menu_id = m.id
    join pizzeria p2 on m.pizzeria_id = p2.id
where p.name = 'Andrey';