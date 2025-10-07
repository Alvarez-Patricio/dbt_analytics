{% macro cents_to_dollars(column_name, decimals=2) -%}
    round({{ column_name }}/100 as amount_dollars, {{ decimals }})
{%- endmacro %}