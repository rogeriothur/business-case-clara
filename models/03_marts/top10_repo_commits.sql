with
    top10_repo_commits as (
        select
            repo_id
            , name
            , commit_count
        from {{ ref('repo_commits') }}
        order by commit_count desc
        limit 10
    )

select *
from top10_repo_commits
order by commit_count desc
