{% macro generate_key(column) %}

md5(cast({{ column }} as string))

{% endmacro %}

{{ format_currency('total_due') }}