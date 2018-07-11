-- https://en.wikibooks.org/wiki/SQL_Exercises/Planet_Express 
-- 7.1 Who receieved a 1.5kg package?
    -- The result is "Al Gore's Head".
    
select
    c.name
from
    package as p
    join client as c on p.recipient = c.accountnumber
where
    p.weight = 1.5
;
-- 7.2 What is the total weight of all the packages that he sent?

select
    sum(weight)
from
    package as p
where
    p.sender in (
                      select
                          p2.recipient
                      from
                          package as p2
                      where
                          p2.weight = 1.5
                     )
;