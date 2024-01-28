with
    top10_repo_watch_events as (
        select
            repo_id
            , name
            , watch_event_count
        from {{ ref('repo_watch_events') }}
        order by watch_event_count desc
        limit 10
    )

select *
from top10_repo_watch_events
order by watch_event_count desc
