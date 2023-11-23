select address,
       cast((cast(max(age) as float) -
             (cast(min(age) as float) /
              cast(max(age) as float))) as dec(12, 2))
           as fromula,
       cast(avg(age) as dec(12, 2))
           as average,
       case
           when
               cast((cast(max(age) as float) -
                     (cast(min(age) as float) /
                      cast(max(age) as float))) as dec(12, 2))
                   > cast(avg(age) as dec(12, 2)) then true
            else false
end
from person
group by address
order by address;
