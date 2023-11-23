drop trigger trg_person_insert_audit on person;
drop trigger trg_person_update_audit on person;
drop trigger trg_person_delete_audit on person;

drop function fnc_trg_person_insert_audit;
drop function fnc_trg_person_update_audit;
drop function fnc_trg_person_delete_audit;

truncate person_audit;

create function fnc_trg_person_audit () returns trigger
as $$
    begin
        if (TG_OP = 'DELETE')
            then insert into person_audit (type_event, row_id, name, age, gender, address)
                values ('D',  old.id, old.name, old.age, old.gender, old.address);
        elsif (TG_OP = 'UPDATE')
            then insert into person_audit (type_event, row_id, name, age, gender, address)
                values ('U', old.id, old.name, old.age, old.gender, old.address);
        elsif (TG_OP = 'INSERT')
            then insert into person_audit (type_event, row_id, name, age, gender, address)
                values ('I', new.id, new.name, new.age, new.gender, new.address);
        end if;
        return  old;
    end;
$$ language  plpgsql;

create trigger trg_person_update_audit after insert or update or delete on person
    for each row execute procedure fnc_trg_person_audit();

insert into person (id, name, age, gender, address)
    values (10,'Damir', 22, 'male', 'Irkutsk');
update person set name  = 'Bulat' where id = 10;
update person set name  = 'Damir' where id = 10;
delete from person where id = 10;

