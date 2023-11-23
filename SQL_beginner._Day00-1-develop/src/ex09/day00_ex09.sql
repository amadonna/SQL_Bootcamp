SELECT  (SELECT person.name FROM 
		  person  WHERE person.id = pv.person_id) AS person_name,
	     (SELECT pizzeria.name FROM 
		  pizzeria  WHERE pizzeria.id = pv.pizzeria_id)AS pizzeria_name	 
FROM (SELECT * FROM person_visits 
	  WHERE person_visits.visit_date between '2022-01-07' and '2022-01-09') AS pv
ORDER BY person_name , pizzeria_name DESC
;