select name,
       count(*) as count_of_orders,
       round(avg(price)) as average_price,
       max(price) as max_price,
       min(price) as min_price
from person_order
join menu m on person_order.menu_id = m.id
join pizzeria p on m.pizzeria_id = p.id
group by name
order by name;