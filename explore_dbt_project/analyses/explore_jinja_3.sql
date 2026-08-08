--incremental load example
--set incremental load flag to 1 to indicate its incremental load
--
{% set incremental_load = 1 %}
{% set last_load_id = 3 %}

--select few columns only from the model
{% set column_names=["sales_id","date_sk","gross_amount"] %}

  select {% for each_column_name in column_names -%}
            {{- each_column_name -}}
            {%- if not loop.last -%} ,
            {%- endif -%}
         {% endfor %}   
    from {{ref('bronze_sales')}}
    {%- if incremental_load ==1 %}
        where date_sk> {{ last_load_id }}
    {% endif%}