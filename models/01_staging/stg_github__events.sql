with
    source as (
        select
            id
            , type
            , actor_id
            , repo_id
        from {{ source('github', 'events') }}
    )
    
    , renamed as (
        select
            id as event_id
            , type
            , actor_id
            , repo_id
        from source
    )

select
    event_id
    , type
    , actor_id
    , repo_id
from renamed
