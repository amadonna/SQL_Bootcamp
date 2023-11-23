select id as menu_id from menu
where
not exists(select * from person_order where menu_id = menu.id)
order by menu_id;