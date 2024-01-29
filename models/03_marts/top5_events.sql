with
    events as (
        select
            type
            , count(*) as quantity
        from {{ ref('stg_github__events') }}
        group by
            type
    )
select
    type
    , quantity
from events
order by quantity desc
limit 5