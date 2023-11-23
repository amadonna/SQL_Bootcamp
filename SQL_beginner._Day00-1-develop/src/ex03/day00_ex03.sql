SELECT person_visits.person_id FROM person_visits 
WHERE visit_date between '2022-01-06' AND '2022-01-09'
OR person_id = 2
GROUP BY person_visits.person_id
ORDER BY person_visits.person_id DESC;