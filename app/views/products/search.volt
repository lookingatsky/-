{{ content() }}

<ul class="pager">
<!--     <li class="previous">
        {{ link_to("products", "&larr; 返回") }}
    </li> -->
    <li class="next">
        {{ link_to("products/new", "创建店铺") }}
    </li>
</ul>
<style>
.table thead tr th{
	vertical-align:middle;
}
.table tbody tr td{
	vertical-align:middle;
}
.help-inline{
	position:relative;
	top:6px;
}
</style>
{% for BaiduApiInfo in page.items %}
    {% if loop.first %}
<table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
            <th>序号</th>
            <th>标题</th>
            <th>地址</th>
            <th>电话</th>
			<th>类别</th>
            <th colspan="2"></th>
        </tr>
    </thead>
    <tbody>
    {% endif %}
        <tr>
            <td>{{ BaiduApiInfo.id }}</td>
            <td><a href="/infos/index/{{ BaiduApiInfo.uid }}">{{ BaiduApiInfo.name }}</a></td>
            <td>{{ BaiduApiInfo.address }}</td>
            <td>{{ BaiduApiInfo.telephone }}</td>
            <td>{{ BaiduApiInfo.tag }}</td>
            <td width="7%">{{ link_to("products/edit/" ~ BaiduApiInfo.id, '<i class="glyphicon glyphicon-edit"></i> 修 改', "class": "btn btn-default") }}</td>
            <td width="7%">{{ link_to("activity/add/" ~ BaiduApiInfo.id, '<i class="glyphicon glyphicon-glass"></i> 活 动', "class": "btn btn-default") }}</td>
        </tr>
    {% if loop.last %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="7" align="right">
                <div class="btn-group">
                    {{ link_to("products/search", '<i class="icon-fast-backward"></i> 首页', "class": "btn") }}
                    {{ link_to("products/search?page=" ~ page.before, '<i class="icon-step-backward"></i> 上一页', "class": "btn") }}
                    {{ link_to("products/search?page=" ~ page.next, '<i class="icon-step-forward"></i> 下一页', "class": "btn") }}
                    {{ link_to("products/search?page=" ~ page.last, '<i class="icon-fast-forward"></i> 尾页', "class": "btn") }}
                    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    </tbody>
</table>
    {% endif %}
{% else %}
    没有店铺
{% endfor %}
