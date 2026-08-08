--this acts as macro
--'test' keyword is mandatory
--after 'test', the name of the test (can be same name as file name)
--macro is like python function
--this macro takes two arguments, model and column_name

{% test generic_non_negative_test(model,column_name) %}
select * from {{model}} where {{column_name}}<0
{% endtest %}