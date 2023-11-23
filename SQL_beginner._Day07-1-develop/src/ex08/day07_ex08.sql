select p.address, p2.name as name, count(*) as count_of_orders
from person_order
    join person p on person_order.person_id = p.id
    join menu m on person_order.menu_id = m.id
    join pizzeria p2 on m.pizzeria_id = p2.id
group by p2.name, p.address
order by address, name;