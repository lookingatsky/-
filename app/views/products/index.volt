
{{ content() }}

<div align="right">
    {{ link_to("products/new", "添加店铺", "class": "btn btn-primary") }}
</div>

{{ form("products/search") }}

<h2>搜索店铺</h2>

<fieldset>

{% for element in form %}
    {% if is_a(element, 'Phalcon\Forms\Element\Hidden') %}
		{{ element }}
    {% else %}
<div class="control-group">
		{{ element.label(['class': 'control-label']) }}
    <div class="controls">
			{{ element }}
    </div>
</div>
    {% endif %}
{% endfor %}
<div class="control-group">
    {{ submit_button("Search", "class": "btn btn-primary") }}
</div>

</fieldset>

</form>
