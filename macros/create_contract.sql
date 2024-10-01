{% macro create_contract(model) %}

    {%- set tbl_relation = api.Relation.create(
                database=this.database,
                schema=this.schema,
                identifier=model
            ) -%}

    {% set cols=adapter.get_columns_in_relation(tbl_relation) %}
models:
  - name: {{ model }}
    access: public
    config:
      contract:
        enforced: true
    columns:
    {%- for col in cols %}
      - name: {{ col.name | lower }}
        data_type: {{ col.dtype | lower }}
    {%- endfor %}
    
{% endmacro %}