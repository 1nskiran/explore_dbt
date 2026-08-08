{%- set customer_names=["james","anu","jai","madan"] -%}

{%- for each_name in customer_names -%}
    {%- if each_name != "anu" -%}
        {{each_name}} is not a student
    {%- else -%}
        {{each_name}} is a student
    {% endif %}
{% endfor %}