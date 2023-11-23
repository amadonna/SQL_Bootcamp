select per.name as name, pizza_name,  price, round(price - price * person_discounts.discount_price * 0.01) as discount_price, p.name as pizzeria_name
from person_discounts
    join person per on person_discounts.person_id = per.id
    join pizzeria p on person_discounts.pizzeria_id = p.id
    join menu m on p.id = m.pizzeria_id
order by name, pizza_name;