create table person_audit
( created timestamp with time zone not null default (current_timestamp),
  type_event char(1) not null default 'I' constraint ch_type_event check (type_event in ('I', 'U', 'D')),
  row_id bigint not null,
  name varchar ,
  age integer,
  gender varchar,
  address varchar
  );

create or replace function fnc_trg_person_insert_audit() returns trigger as $$
    begin
        insert into person_audit (row_id, name, age, gender, address)
            values (new.id, new.name, new.age, new.gender, new.address);
            return new;
    end;
$$ language plpgsql;

create trigger trg_person_insert_audit after insert on person
    for each row execute procedure fnc_trg_person_insert_audit();
insert into person(id, name, age, gender, address)
values (10, 'Damir', 22, 'male', 'Irkutsk')