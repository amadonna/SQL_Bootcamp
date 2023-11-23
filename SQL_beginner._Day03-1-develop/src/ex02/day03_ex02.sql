select pizza_name, price, pizzeria.name as pizzeria_name  from menu
    join pizzeria on menu.pizzeria_id = pizzeria.id
where menu.id not in  (select menu_id from person_order)
order by pizza_name, price;
