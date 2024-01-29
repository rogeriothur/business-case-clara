with
    top10_active_users as (
        select
            actor_id
            , username
            , activity_count
        from {{ ref('active_users_activities') }}
        order by activity_count desc
        limit 10
    )

select *
from top10_active_users
order by activity_count desc
