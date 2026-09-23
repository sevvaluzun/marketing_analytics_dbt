{% macro calculate_ratio(numerator, denominator, decimals=4) %}

    round(
        ({{ numerator }} * 1.0) / nullif({{ denominator }}, 0),
        {{ decimals }}
    )

{% endmacro %}