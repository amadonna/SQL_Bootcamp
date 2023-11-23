select cur_name.name as name,
       lastname,
       type,
       volume,
       currency_name,
       coalesce(rate_to_usd, 1) as last_to_rate,
       coalesce(volume * rate_to_usd, volume) as total_volume_in_usd
        from (select
                u_vol.name,
                 u_vol.lastname,
                 u_vol.type,
                 u_vol.volume,
                 coalesce(c.name, 'not defined') as currency_name,
                 u_vol.currency_id
                    from (select
                           coalesce(name, 'not defined') as name,
                           coalesce(lastname, 'not defined') as lastname,
                           type,
                           sum(money) as volume,
                           currency_id
                                from "user"
                                full join balance  on balance.user_id = id
                                group by type,  coalesce(lastname, 'not defined'),coalesce(name, 'not defined'), currency_id) u_vol
                    left join currency as c on c.id = u_vol.currency_id
                    group by u_vol.name, u_vol.lastname, u_vol.type,u_vol.volume, coalesce(c.name, 'not defined'), u_vol.currency_id) cur_name
        left join (select currency.id, name, rate_to_usd, lastdate
            from (select id, max(updated) as lastdate from currency group by id) cur_0
            left join currency on cur_0.lastdate = currency.updated and cur_0.id = currency.id) r_1
            on r_1.id = cur_name.currency_id
order by 1 desc , 2, 3;