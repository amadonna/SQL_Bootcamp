--session 1:
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--session 2:
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--session1 :
update pizzeria set rating = 1.5 where id = 1;

--session2 :
update pizzeria set rating = 1.6 where id = 2;

--session1 :
update pizzeria set rating = 1.7 where id = 2;

--session2 :
update pizzeria set rating = 1.8 where id = 1;

--session 1:
commit;

--session 2:
commit;
