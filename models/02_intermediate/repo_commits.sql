with
    events as (
        select
            repo_id
        from {{ ref('stg_github__events') }}
        where type = 'PushEvent'
    )

    , repo as (
        select
            repo_id
            , name
        from {{ ref('stg_github__repos') }}
    )

    , repo_commits as (
        select
            events.repo_id
            , repo.name
            , count(*) as commit_count
        from events
        left join repo on events.repo_id = repo.repo_id
        group by
            events.repo_id
            , repo.name
    )

select
    repo_id
    , name
    , commit_count
from repo_commits
