SELECT (SELECT person.name FROM person 
		WHERE person.id = person_order.person_id) AS NAME ,
CASE WHEN 
	(SELECT person.name FROM person WHERE person.id = person_order.person_id) = 'Denis'
	then true
	else false
end AS check_name FROM person_order
WHERE (person_order.menu_id = 13 
	   OR person_order.menu_id = 14 
	   OR person_order.menu_id = 18)
AND person_order.order_date = '2022-01-07'
;