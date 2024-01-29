with 
    source as (
        select
            id
            , username
        from {{ source('github', 'actors') }}
    )
    
    , renamed as (
        select
            id as actor_id
            , username
        from source
    )

    , dedup as (
        select
            *
            , row_number() over (partition by actor_id order by username) as row_num
        from renamed
    )

select
    actor_id
    , username
from dedup
where row_num = 1
