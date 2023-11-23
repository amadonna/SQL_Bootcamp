select pizza_name, pp1.name as pizza_name_1, pp2.name as pizza_name_2, price
    from ( select m1.pizza_name , m1.pizzeria_id as p_id1, m2.pizzeria_id as p_id2, m1.price
                from menu as m1, menu as m2
                where
                m1.price = m2.price and m1.pizza_name = m2.pizza_name and m1.pizzeria_id > m2.pizzeria_id) as m
join pizzeria pp1 on m.p_id1 = pp1.id
join pizzeria pp2 on m.p_id2 = pp2.id
order by  pizza_name;
