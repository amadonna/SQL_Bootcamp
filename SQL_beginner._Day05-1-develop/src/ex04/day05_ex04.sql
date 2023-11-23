create unique index idx_menu_unique on menu using btree (pizzeria_id, pizza_name);

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
select * from menu where pizza_name = 'cheese pizza'
                            and pizzeria_id = 1;