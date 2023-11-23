insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

select coalesce(u.name, 'not defined'),
       coalesce(u.lastname, 'not defined'),
       result.currensy_name,
       rate_to_usd * result.money as currency_in_usd
from (select tab_2.id, tab_2.currensy_name, tab_2.money, tab_2.updated, coalesce(tab_1.differ_up, tab_2.differ_up) all_differs
        from (select  currensy_t.b_id AS id, currensy_name, money, updated, min(updated - currensy_updated) as differ_up
                from (select b.user_id as b_id, b.money, b.updated,
                            c.name as currensy_name, c.updated as currensy_updated
                            from balance b join currency c on b.currency_id = c.id) currensy_t
                        where updated - currensy_updated > interval '0 days'
                        group by 1, 2, 3, 4) tab_1
        full join (select  currensy_t.b_id as id, currensy_name, money, updated, max(updated - currensy_updated) as differ_up
                from (select b.user_id as b_id, b.money, b.updated,
                            c.name as currensy_name, c.updated as currensy_updated
                            from balance b join currency c on b.currency_id = c.id) currensy_t
                        where updated - currensy_updated < interval '0 days'
                        group by 1, 2, 3, 4) tab_2
         on tab_1.id = tab_2.id
                and tab_1.currensy_name = tab_2.currensy_name
                and tab_1.money = tab_1.money
                and tab_1.updated = tab_2.updated) result
         left join "user" u on result.id = u.id
         left join currency cu on result.all_differs = (result.updated - cu.updated) and result.currensy_name = cu.name
order by 1 desc, 2, 3;


