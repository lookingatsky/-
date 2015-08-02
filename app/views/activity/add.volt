{{ content() }}

<!--引入富文本编辑器-->
{{ stylesheet_link('css/simditor/simditor.css') }}

{{ javascript_include('js/simditor/module.js') }}		
{{ javascript_include('js/simditor/hotkeys.js') }}	
{{ javascript_include('js/simditor/simditor.js') }}


{{ form("activity/add") }}
    <div class="input-append date" id="datetimepicker" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
        <input class="span2" size="16" type="text" value="12-02-2012">
        <span class="add-on"><i class="icon-remove"></i></span>
        <span class="add-on"><i class="icon-th"></i></span>
    </div>    
	
    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("products/search", "&larr; 返 回") }}
        </li>
        <li class="pull-right">
            {{ submit_button("保 存", "class": "btn btn-success") }}
        </li>
    </ul>	
	
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
	margin-left:20px;
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
<!--
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=u3wn5UIKKoI8TUDUhbtb1I0E"></script>
<div id="milkMap" style="width:400px;height:300px;"></div>
<script type="text/javascript">
// 创建地图实例
var map = new BMap.Map("milkMap");          
// 创建点坐标
var point = new BMap.Point(116.330599,39.95536);  
// 初始化地图，设置中心点坐标和地图级别                
map.centerAndZoom("北京",13);
// 创建标注
var marker = new BMap.Marker(point); 
// 将标注添加到地图中         
map.addOverlay(marker);                     
marker.enableDragging();
var infoWindow = new BMap.InfoWindow("<p><a target='_blank' title='粟摄影' alt='粟摄影' href='http://www.ui-love.com/su/'><img src='http://ui-love.com/static/img/subslogan.jpg' /></a></p><p style='font-size:12px;'>欢迎光临<b>粟摄影</b>的官方网站>></p><p style='font-size:12px;'>电话:010-8888 6666</p><p style='font-size:12px;'>地址:北京市海淀区XX门XX街道XXX村子</p>");  // 创建信息窗口对象
marker.addEventListener("click", function(){  
//给标注添加点击事件      
this.openInfoWindow(infoWindow);
});
</script>
-->

<!---->

<script>
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