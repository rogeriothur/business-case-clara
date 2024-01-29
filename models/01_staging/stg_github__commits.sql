with 
    source as (
        select
            sha
            , event_id
        from {{ source('github', 'commits') }}
    )
    
select *
from source
