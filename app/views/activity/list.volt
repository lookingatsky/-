{{ content() }}

<ul class="pager">
    <li class="previous">
        {{ name }} 活动列表
    </li>
    <li class="next">
        {{ link_to("activity/add", "创建活动") }}
    </li>
</ul>
{% for activities in page.items %}
    {% if loop.first %}
<table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
            <th width="70">序号</th>
            <th>标题</th>
            <th>地址</th>
            <th>时间</th>
			<th>发起人</th>
			<th>状态</th>
            <th colspan="2"></th>
        </tr>
    </thead>
    <tbody>
    {% endif %}
        <tr>
            <td>{{ activity.id }}</td>
            <td><a href="/infos/index/{{ activity.uid }}">{{ activity.name }}</a></td>
            <td>{{ activity.address }}</td>
            <td>{{ activity.telephone }}</td>
            <td>{{ activity.name }}</td>
			<td>{{ activity.status }}</td>
            <td width="7%">{{ link_to("products/edit/" ~ activity.id, '<i class="glyphicon glyphicon-edit"></i> 修 改', "class": "btn btn-default") }}</td>
            <td width="7%">{{ link_to("activity/add/" ~ activity.id, '<i class="glyphicon glyphicon-glass"></i> 活 动', "class": "btn btn-default") }}</td>
        </tr>
    {% if loop.last %}		
	</tbody>
    <tbody>
        <tr>
            <td colspan="7" align="right">
                <div class="btn-group">
                    {{ link_to("activitiy/list", '<i class="icon-fast-backward"></i> 首页', "class": "btn") }}
                    {{ link_to("activitiy/list?page=" ~ page.before, '<i class="icon-step-backward"></i> 上一页', "class": "btn") }}
                    {{ link_to("activitiy/list?page=" ~ page.next, '<i class="icon-step-forward"></i> 下一页', "class": "btn") }}
                    {{ link_to("activitiy/list?page=" ~ page.last, '<i class="icon-fast-forward"></i> 尾页', "class": "btn") }}
                    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    </tbody>	
</table>
    {% endif %}
{% else %}
    暂无活动
{% endfor %}