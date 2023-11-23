-- session 1:
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- session 2:
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- session 1:
select * from pizzeria where name = 'Pizza Hut';

--session2 :
update pizzeria set rating = 5.0 where name = 'Pizza Hut';
commit;

-- session 1:
select * from pizzeria where name = 'Pizza Hut';
commit;
select * from pizzeria where name = 'Pizza Hut';

-- session 2:
select * from pizzeria where name = 'Pizza Hut';
