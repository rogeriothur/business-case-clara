with 
    source as (
        select
            id
            , name
        from {{ source('github', 'repos') }}
    )
    
    , renamed as (
        select
            id as repo_id
            , name
        from source
    )

    , dedup as (
        select
            *
            , row_number() over (partition by repo_id order by name) as row_num
        from renamed
    )

select
    repo_id
    , name
from dedup
where row_num = 1
