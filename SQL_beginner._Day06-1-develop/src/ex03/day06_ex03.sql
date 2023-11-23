create unique index idx_person_discounts_unique on person_discounts using btree (pizzeria_id, person_id);

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
select * from person_discounts where person_id = 3 and pizzeria_id = 5;