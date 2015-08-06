{{ content() }}

<!--引入富文本编辑器-->
{{ stylesheet_link('css/simditor/simditor.css') }}

{{ javascript_include('js/simditor/module.js') }}		
{{ javascript_include('js/simditor/hotkeys.js') }}	
{{ javascript_include('js/simditor/simditor.js') }}

<!--引入时间选择器-->
{{ stylesheet_link('css/bootstrap-datetimepicker.min.css') }}	
{{ javascript_include('js/bootstrap-datetimepicker.js') }}	

{{ form("activity/add") }}



	
    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("products/search", "&larr; 返 回") }}
        </li>
        <li class="pull-right">
            {{ submit_button("保 存", "class": "btn btn-success") }}
        </li>
    </ul>	
<div class="form-group">
	<label for="dtp_input1">选择时间</label>
<br />
	<div class="input-group date form_datetime col-md-5" data-date="2015-08-05T00:00:00Z" data-date-format="yyyy MM dd - HH:ii p" data-link-field="dtp_input1">
		<input class="form-control" size="16" type="text" value="" readonly>
		<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
	</div>
	<input type="hidden" id="dtp_input1" value="" />
</div> 
	
	<div class="form-group">
		<label for="title">选择省市</label><br />
		{{ select('provinceId','class':'form-control', provinces, 'using': ['id', 'area_name'],'useEmpty': true, 'emptyText': '请选择省', 'emptyValue': '@') }}
		<select class="form-control" id="cityId" name="cityId"></select>
		<div class="clear"></div>
	</div>	
	
<style>
.form-control{
	width:400px;
}
#provinceId{
	width:200px;
	float:left;
}
#cityId{
	width:200px;
	display:none;
	float:left;
	margin-left:5px;
}
.clear{
	clear:both;
}	
.mapFrame{
	position:fixed;
	top:100px;
	left:600px;
	z-index:1001;
	border:1px solid #aaa;
	text-align:center;
	background:#fff;
	display:none;
}
.mapTitle{
	height:50px;
	line-height:50px;
}
.mapIframe{
	width:600px;
	height:300px;
	border-top:1px solid #ddd;
	border-bottom:1px solid #ddd;	
}
.mapSubmit{
	margin-top:10px;
	height:50px;	
}
</style>
<!---->

<script>
    $('.form_datetime').datetimepicker({
        //language:  'fr',
		language:  'zh-CN',
		format: 'yyyy-mm-dd hh:ii',
        weekStart: 7,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
$(function(){
	var editor = new Simditor({
		textarea: $('#arrangement'),
		placeholder:'这里输入内容',
		toolbarFloat:false
	});
	
	$("#provinceId").change(function(){
		var areaID = $(this).val();
		var areaName = $(this).find("option:selected").text();
		$(".titleProvince").html(areaName);
		if(areaID != '@'){
				$.post('/activity/area/',{
					level:1,
					id:areaID
				},function(data){
					json1 = eval("(" + data + ")");
					var html = "<option value='@'>请选择市</option>";
					$.each(json1,function(i,j){
						html += "<option class='city_area' value='"+j.id+"'>"+j.area_name+"</option>";
					})
					$("#cityId").html('');
					$("#cityId").append(html);
					//console.log(json1[0].area_name);
				})	
			if(areaName == '北京市' || areaName == '天津市' || areaName == '上海市' || areaName == '重庆市' ){
				$(".mapIframe").attr('src','/activity/map/'+areaName);
				$(".shadows").show();
				$(".mapFrame").show();			
			}else{
				$("#cityId").show();			
			}
		}else{
		
		}
	})
	
	$("#cityId").change(function(){
		var areaID = $(this).val();
		var areaName = $(this).find("option:selected").text();
		$(".titleCity").html(areaName);	
		if(areaID != '@'){
			if(areaName != '市辖区' && areaName != '县'){
				$(".mapIframe").attr('src','/activity/map/'+areaName);
				$(".shadows").show();
				$(".mapFrame").show();				
			}		
		}else{
		
		}

	})
	
	$(".closeMap").click(function(){
		$(".shadows").hide();
		$(".mapFrame").hide();	
	})
})	
</script>



    <fieldset>

    {% for element in form %}
        {% if is_a(element, 'Phalcon\Forms\Element\Hidden') %}
            {{ element }}
        {% else %}
            <div class="form-group">
                {{ element.label() }}
                {{ element.render(['class': 'form-control']) }}
            </div>
        {% endif %}
    {% endfor %}

    </fieldset>

</form>
	
<div class="shadows"></div>
<div class="mapFrame">
	<div class="mapTitle"><span class="titleProvince">北京市</span> <span class="titleCity">市辖区</span></div>
	<iframe scrolling="no" frameborder="0" class="mapIframe" src="/activity/map/北京"></iframe>
	<div class="mapSubmit">
		<div class="btn btn-primary">保存该点为活动坐标</div>
		<div class="btn btn-warning closeMap">取 消</div>
	</div>
</div>