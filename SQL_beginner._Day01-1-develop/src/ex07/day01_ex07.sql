select order_date, (select concat(name, ' (age:', age, ')')) as person_information
from person_order join person on person.id = person_order.person_id
order by order_date, person_information;