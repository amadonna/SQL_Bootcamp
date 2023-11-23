create function fnc_persons_female() returns SETOF person
as $$
    select * from person where gender = 'female';
$$ language SQL;

create function fnc_persons_male() returns SETOF person
as $$
    select * from person where gender = 'male';
$$ language SQL;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();
