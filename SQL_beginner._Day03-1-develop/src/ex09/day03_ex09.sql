
insert into person_visits (id, person_id, pizzeria_id, visit_date)
    values
            ((select max(person_visits.id) + 1 from person_visits),
            (select person.id from person where name = 'Denis'),
            (select pizzeria.id from pizzeria where name = 'Dominos'),
            '2022-02-24'),
            ((select max(person_visits.id) + 2 from person_visits),
            (select person.id from person where name = 'Irina'),
            (select pizzeria.id from pizzeria where name = 'Dominos'),
            '2022-02-24')