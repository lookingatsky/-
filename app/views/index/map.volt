<?php use Phalcon\Tag as Tag ?>
{{ content() }}
<style type="text/css">
.viconFrame{
	width:100%;
	background:url('../img/20150605/kv.jpg');
	height:516px;
	background-repeat:no-repeat;
	font-family:"微软雅黑";
}
.viconFrameInput{
	width:900px;
	height:400px;
	position:relative;
	margin:auto;
	top:-350px;
}
.viconFrameInputBg{
	width:900px;
	height:400px;
	//background:#fff;
	position:relative;
	top:50px;
	margin:auto;
	border-radius:10px;
	filter:alpha(opacity=50);
	-moz-opacity:0.5;
	-khtml-opacity:0.5;
	opacity:0.5; 
	z-index:0;
}
.viconFrameInput>h2{
	position:relative;
	top:30px;
	left:50px;
	color:#5bb75b;
}
.viconFrameInput>div:nth-of-type(1){
	width:470px;
	height:100xp;
	position:relative;
	left:350px;
	top:30px;
}
.viconFrameInput>div:nth-of-type(2){
	position:relative;
	left:30px;
	top:50px;
	width:850px;
	height:280px;
}
.viconFrameInput>div>label{
	width:100px;
	line-height:30px;
	text-align:center;
	float:right;
	color:#fff;
	border-radius:5px;
}
.viconFrameInput>div>input{
	width:300px;
	height:30px;
	line-height:30px;
	border-radius:5px;
	border:1px solid #5bb75b;
}
#l-map{
	border-radius:5px;
	box-shadow:3px 3px 3px #000;
}
</style>

<script type="text/javascript">  
window.onload = function(){
   //创建和初始化地图函数：
    function initMap(){
      createMap();//创建地图
      setMapEvent();//设置地图事件
      addMapControl();//向地图添加控件
   //   addMapOverlay();//向地图添加覆盖物
    }
    function createMap(){ 
		map = new BMap.Map("l-map"); 
		map.centerAndZoom("北京",14);
		map.setMapStyle({style:'hardedge'});
	  
<?php
        if(isset($mapDatas)){
            foreach($mapDatas as $k=>$v){ 
				
?>
		var point = new BMap.Point(<?php echo $v->location->lng; ?>,<?php echo $v->location->lat; ?>);
		//var marker1 = new BMap.Marker(new BMap.Point(<?php echo $v->location->lng; ?>,<?php echo $v->location->lat; ?>),14);  //创建标注
		addMarker(point,<?php echo "'".$v->name."'"; ?>);// 将标注添加到地图中
		//创建信息窗口
		//var infoWindow1 = new BMap.InfoWindow(<?php echo "'".$v->name."'"; ?>);
		//marker1.addEventListener("click", function(){this.openInfoWindow(infoWindow1);});
<?php 
			}
        } 
?>			
    }
	
	function addMarker(point,infos){
	  var marker = new BMap.Marker(point);
	  map.addOverlay(marker);
	  var infoWindow = new BMap.InfoWindow(infos);
	  marker.addEventListener("click",function(){
		this.openInfoWindow(infoWindow);
	  });
	}
	
    function setMapEvent(){
      map.enableScrollWheelZoom();
      map.enableKeyboard();
      map.enableDragging();
      map.enableDoubleClickZoom()
    }
		
    function addClickHandler(target,window){
      target.addEventListener("click",function(){
        target.openInfoWindow(window);
      });
    }
	
    function addMapOverlay(){
    }
    //向地图添加控件
    function addMapControl(){
      var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
      scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
      map.addControl(scaleControl);
      var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
      map.addControl(navControl);
	  
      //var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:true});
      //map.addControl(overviewControl);
    }
	
    var map;
      initMap();
};

/*	// 百度地图API功能
	var map = new BMap.Map("l-map");
	var point = new BMap.Point(116.404, 39.915);
	map.centerAndZoom(point, 15);
	// 编写自定义函数,创建标注
	function addMarker(point){
	  var marker = new BMap.Marker(point);
	  map.addOverlay(marker);
	}
	// 随机向地图添加25个标注
	var bounds = map.getBounds();
	var sw = bounds.getSouthWest();
	var ne = bounds.getNorthEast();
	var lngSpan = Math.abs(sw.lng - ne.lng);
	var latSpan = Math.abs(ne.lat - sw.lat);
	for (var i = 0; i < 25; i ++) {
		var point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7));
		addMarker(point);
	}
	
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 4);
	map.enableScrollWheelZoom();

	var MAX = 10;
	var markers = [];
	var pt = null;
	var i = 0;
	for (; i < MAX; i++) {
	   pt = new BMap.Point(Math.random() * 40 + 85, Math.random() * 30 + 21);	
	};
*/	
</script>
		
	

{{ form('index/index','class':'mapForm','method':'post') }}
	<div class="viconFrame">
		<div class="viconFrameInputBg"></div>
		<div class="viconFrameInput">
		<h2>搜索信息</h2>
			<div>
				<input type="text" name="keywords" value="" /> 
				<label><?php echo Tag::submitButton(array("点击搜索", "class" => "btn btn-success")) ?></label>
			</div>
			
			<div id="l-map"></div> 	
			
		</div>
	</div>
</form>
<div class="jumbotron">
    <h1>Welcome to INVO</h1>
    <p>INVO is a revolutionary application to create invoices online for free.
    Receive online payments from your clients and improve your cash flow</p>
    <p>{{ link_to('register', 'Try it for Free &raquo;', 'class': 'btn btn-primary btn-large btn-success') }}</p>
</div>

