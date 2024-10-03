{% macro create_contract(model) %}

    {%- set tbl_relation = api.Relation.create(
                database=this.database,
                schema=this.schema,
                identifier=model
            ) -%}

    {% set cols=adapter.get_columns_in_relation(tbl_relation) %}
models:
  - name: {{ model }}
    description: Order data, one row per order
    access: public
    config:
      group: revenue
      contract:
        enforced: true
    columns:
    {%- for col in cols %}
      - name: {{ col.name | lower }}
        data_type: {{ col.dtype | lower }}
    {%- endfor %}
    
{% endmacro %}