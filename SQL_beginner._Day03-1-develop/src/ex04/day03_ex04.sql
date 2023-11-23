select * from (select p.name as pizzeria_name
               from person_order
                        join person on person_order.person_id = person.id
                        join menu on person_order.menu_id = menu.id
                        join pizzeria p on menu.pizzeria_id = p.id
               where gender = 'female'
               except
               select p.name as pizzeria_name
               from person_order
                        join person on person_order.person_id = person.id
                        join menu on person_order.menu_id = menu.id
                        join pizzeria p on menu.pizzeria_id = p.id
               where gender = 'male' ) as a
               union
               (select p.name as pizzeria_name
               from person_order
                        join person on person_order.person_id = person.id
                        join menu on person_order.menu_id = menu.id
                        join pizzeria p on menu.pizzeria_id = p.id
               where gender = 'male'
               except
               select p.name as pizzeria_name
               from person_order
                        join person on person_order.person_id = person.id
                        join menu on person_order.menu_id = menu.id
                        join pizzeria p on menu.pizzeria_id = p.id
               where gender = 'female'
              )
order by pizzeria_name
;
