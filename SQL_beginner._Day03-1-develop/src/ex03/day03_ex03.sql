select * from (select  pizzeria.name as pizzeria_name from person_visits
        join person on person_visits.person_id = person.id
        join pizzeria on person_visits.pizzeria_id = pizzeria.id
            where gender = 'female'
    except all
               select  pizzeria.name  as pizzeria_name  from person_visits
        join person on person_visits.person_id = person.id
        join pizzeria on person_visits.pizzeria_id = pizzeria.id
            where gender = 'male') as a
    union all
              (select  pizzeria.name as pizzeria_name from person_visits
        join person on person_visits.person_id = person.id
        join pizzeria on person_visits.pizzeria_id = pizzeria.id
            where gender = 'male'
    except all
            select  pizzeria.name  as pizzeria_name from person_visits
        join person on person_visits.person_id = person.id
        join pizzeria on person_visits.pizzeria_id = pizzeria.id
            where gender = 'female')
order by pizzeria_name;

