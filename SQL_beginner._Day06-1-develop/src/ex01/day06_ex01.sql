insert into person_discounts (id, person_id, pizzeria_id, discount_price)
    select ROW_NUMBER( ) OVER ( ) AS id ,
    m.person_id,
    m.pizzeria_id,
    m.discount
    from
    (select person_id, pizzeria_id,
           case
        when (count(pizzeria_id)) = 1
            then 10.5
        when (count(pizzeria_id)) = 2
            then 22
        else 30
        end  as discount from person_order join menu m on person_order.menu_id = m.id
    group by person_id, pizzeria_id ) as m
;
