
  select  person.name as person_name, pizza_name, pizzeria.name as pizzeria_name from
      person_order
      join menu on menu.id = person_order.menu_id
          join person on person.id = person_order.person_id
  join pizzeria on pizzeria.id = menu.pizzeria_id
order by person_name, pizza_name, pizzeria_name;