select name
from pizzeria
where
name not in
(select name from person_visits join pizzeria on pizzeria.id = person_visits.pizzeria_id);

select name
from pizzeria
where
not exists
(select * from person_visits where pizzeria.id = person_visits.pizzeria_id);