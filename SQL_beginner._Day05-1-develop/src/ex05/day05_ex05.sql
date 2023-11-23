create unique index idx_person_order_order_date on person_order using btree (person_id, menu_id)
    where order_date = '2022-01-01';

SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
select person_id, menu_id from  person_order where person_id = 1
  and menu_id = 1 and order_date = '2022-01-01';