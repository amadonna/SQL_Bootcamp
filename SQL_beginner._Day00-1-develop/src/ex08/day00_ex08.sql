select * from person_order
where person_order.id % 2 = 0
order by person_order.id
;