with
    events as (
        select
            event_id
            , actor_id
        from {{ ref('stg_github__events') }}
        where type in ('PullRequestEvent', 'PushEvent')
    )

    , users as (
        select
            actor_id
            , username
        from {{ ref('stg_github__actors') }}
    )

    , active_users_activities as (
        select
            events.actor_id
            , users.username
            , count(*) activity_count
        from events
        left join users on events.actor_id = users.actor_id
        group by
            events.actor_id
            , users.username
    )

select
    actor_id
    , username
    , activity_count
from active_users_activities
