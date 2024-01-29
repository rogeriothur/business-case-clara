{% test positive_values(model, column_name) %}

    with validation as (
        select
            {{ column_name }} as positive_value
        from {{ model }}
    )

    , validation_erros as (
        select
            positive_value
        from validation
        where positive_value <= 0
    )

    select *
    from validation_erros

{% endtest %}
