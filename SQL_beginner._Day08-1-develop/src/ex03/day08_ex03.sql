-- session 1:
BEGIN ISOLATION LEVEL READ COMMITTED;

-- session 2:
BEGIN ISOLATION LEVEL READ COMMITTED;

-- session 1:
select * from pizzeria where name = 'Pizza Hut';

--session2 :
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
commit;

--session1 :
select * from pizzeria where name = 'Pizza Hut';
commit;
select * from pizzeria where name = 'Pizza Hut';

-- session 2:
select * from pizzeria where name = 'Pizza Hut';





