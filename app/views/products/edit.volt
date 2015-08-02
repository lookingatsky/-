
{{ form("products/save", 'role': 'form') }}

    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("products/search", "&larr; 返 回") }}
        </li>
        <li class="pull-right">
            {{ submit_button("保 存", "class": "btn btn-success") }}
        </li>
    </ul>

    {{ content() }}

    <h2>修改记录</h2>
<style>
h2{
	text-align:left;	
}
.form_title{
	margin:5px 15px 5px auto;
}
.form-control{
	width:300px;
}

#mapFrame{
	margin:20px auto;
	border:1px solid #ddd;
	width:300px;
	height:100px;
}
.changeLocation{
	width:100px;
	height:30px;
	line-height:30px;
	margin:20px;
	border:1px solid #ddd;
	background:#eee;
}
.changeLocationCancle{
	width:100px;
	height:30px;
	line-height:30px;
	display:none;
	margin:20px auto 20px 20px;
	border:1px solid #ddd;
	background:#eee;
}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=u3wn5UIKKoI8TUDUhbtb1I0E"></script>
<script>
$(function(){
	function initMap(){
      createMap();//创建地图
      setMapEvent();//设置地图事件
      addMapControl();//向地图添加控件	
	}
	function createMap(){
		map = new BMap.Map("mapFrame"); 
		map.setMapStyle({style:'hardedge'});
		var point = new BMap.Point(116.410392,39.919757);
		map.centerAndZoom("北京",13);
		addMarker(point,"this is a test");
	}
	
	function addMarker(point,infos){
		var myIcon = new BMap.Icon("../../img/bootstrap/mapIcon.png",   
		new BMap.Size(200, 230), {      
		// 指定定位位置。     
		// 当标注显示在地图上时，其所指向的地理位置距离图标左上      
		// 角各偏移7像素和25像素。您可以看到在本例中该位置即是     
		// 图标中央下端的尖角位置。      
		anchor: new BMap.Size(200,230),        
		});        
		// 创建标注对象并添加到地图     
		var marker = new BMap.Marker(point, {icon: myIcon});      
		map.addOverlay(marker); 
		
//		var marker = new BMap.Marker(point);
//		map.addOverlay(marker);
		var infoWindow = new BMap.InfoWindow(infos);
		marker.addEventListener("click",function(){
			this.openInfoWindow(infoWindow);
		});
	}

	function setMapEvent(){
		map.enableScrollWheelZoom();
		map.enableKeyboard();
		map.enableDragging();
		map.disableDoubleClickZoom()
		//map.enableDoubleClickZoom();
		map.addEventListener("dblclick", function (e) {
			if(confirm("确定改点为标记点吗？")){
				map.clearOverlays();
				console.log(e.point.lng);
				var point = new BMap.Point(e.point.lng,e.point.lat);
				addMarker(point,'不知道在哪');
				
				$("#mapFrame").stop(true).animate({"width":"300px","height":"100px"},500);
				$(".changeLocation").show();
				$(".changeLocationCancle").hide();
				
				$.post('products/changelocation',{
					lng:e.point.lng,
					lat:e.point.lat
				},function(data){
					if(!data){
						alert("保存坐标失败！");
					}
				});		
			}else{
				
			}
/*			map.getLocation(e.point, function (rs) {
				showLocationInfo(e.point, rs);
			*/
		});
	}
	function addMapControl(){
		var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
		scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
		map.addControl(scaleControl);
		var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
		map.addControl(navControl);	
	}
	var map;
	initMap();
	
	
	$(".changeLocationCancle").click(function(){
		$(this).hide();
		$(".changeLocation").show();
		$("#mapFrame").stop(true).animate({"width":"300px","height":"100px"},500);	
	})
	
	$(".changeLocation").click(function(){
		$(this).hide();
		$(".changeLocationCancle").show();
		$("#mapFrame").stop(true).animate({"width":"85%","height":"300px"},500);
	})
})	
</script>
			<!--地图显示区-->
			<div id="mapFrame" class="f_left"></div> 
			<div class="changeLocation f_left">修改坐标</div>
			<div class="changeLocationCancle f_left">取 消</div>
			<div class="clear"></div>
    <fieldset>

        {% for element in form %}
            {% if is_a(element, 'Phalcon\Forms\Element\Hidden') %}
				<div class="form-group">
                {{ element }}
				</div>
            {% else %}
                <div class="form-group">
					<div class="form_title f_left">
                    {{ element.label() }}:
					</div>
					<div class="form_insert f_left">
                    {{ element.render(['class': 'form-control']) }}
					</div>
					<div class="clear"></div>
                </div>
            {% endif %}
        {% endfor %}

    </fieldset>

</form>
