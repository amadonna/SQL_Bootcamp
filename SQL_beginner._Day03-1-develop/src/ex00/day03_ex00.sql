select pizza_name, price, pizzeria.name as pizzeria_name, visit_date from  person_visits
    join person_order on person_visits.visit_date = person_order.order_date
    join person on person_visits.person_id = person.id
    join menu on menu.pizzeria_id =  person_visits.pizzeria_id
    join pizzeria on person_visits.pizzeria_id = pizzeria.id
where person.name = 'Kate' and price between 800 and 1000
order by pizza_name, price, pizzeria_name ;