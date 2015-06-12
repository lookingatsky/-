
{{ content() }}
<style type="text/css">
body{
	background:#f7f7f7;
}
.infosFrame{
	width:80%;
	min-height:1000px;
	margin:30px auto 30px auto;
	background:#fff;
	border:1px solid #e7e7e7;
	border-radius:2px;
	color:#686e71;	
}
.infoMainImage{
	width:100%;
}
.infoListImage{
	width:100%;
}
.infosContentTitle>div:nth-of-type(1){
	height:60px;
	line-height:70px;
	font-weight:bold;
	font-size:18px;
	padding-left:30px;
}
.fLeft{
	float:left;
}
.fRight{
	float:right;
}
.infosList{
	width:293px;
	border:0px solid #000;
}
.infosList>div{
	margin:20px auto;
	line-height:30px;
}
.infosList>div>span{
	font-weight:bold;
	color:#5cb85c;
}
.codeFrame{
	width:90%;
	margin:auto;
	min-height:100px;
	border-bottom:1px solid #ddd;
}
.commentsFrame{
	width:90%;
	min-height:100px;
	border:0px solid #000;
	margin:20px auto;
	line-height:30px;
	border-bottom:1px solid #ddd;
}
#mapFrame{
	margin:20px auto;
	border:1px solid #ddd;
	width:90%;
	height:300px;
}
.ratingFrame{
	height:16px;
	width:85px;
	position:relative;
	top:8px;
	background:rgba(0, 0, 0, 0) url("/img/bootstrap/rating.png") no-repeat scroll 0px -141px;
}
.rating{
	height:16px;
	background:rgba(0, 0, 0, 0) url("/img/bootstrap/rating.png") no-repeat scroll 0px 0px;
}
.fRed{
	color:#ff0000;
}
.fBold{
	font-weight:bold;
}
.addressIcon{
	position:relative;
	top:3px;
	width:24px;
	height:24px;
	background:rgba(0, 0, 0, 0) url("/img/bootstrap/bg.png") no-repeat scroll 5px -902px;
}
.phoneIcon{
	position:relative;
	top:3px;
	width:37px;
	height:37px;
	background:rgba(0, 0, 0, 0) url("/img/bootstrap/bg.png") no-repeat scroll -92px -106px;	
}
.addressContent{
	width:264px;
}
.telephoneContent{
	width:251px;
}
.clear{
	clear:both;
}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=u3wn5UIKKoI8TUDUhbtb1I0E"></script>
<div align="right">
    {{ link_to("infos/new", "创建新的信息", "class": "btn btn-primary") }}
</div>
<div class="infosFrame">
<!-- 	{% for index,value in infos %}
		{% if value is scalar %}
			{{ index }}-----{{ value }}<br/>
		{% endif %}
	{%endfor%} -->
	<div class="infosContent">
		<div class="infosContentTitle">
			<div>{{ infos.name }}</div>
			<div class="container-fluid">
				<div class="col-md-8">
					<a href="#" class="thumbnail">
						<img src="/img/20150605/aesthetics_1.jpg" alt="{{ infos.name }}">
					</a>
				</div>
				<div class="infosList fRight">
					{% if infos.address is scalar %}
					<div>
						<div class="addressIcon fLeft"></div>
						<div class="fLeft addressContent">{{ infos.address }}</div>
						<div class="clear"></div>
					</div>
					{% endif %}
					{% if infos.tag is scalar %}
					<div>类型：{{ infos.tag }}</div>
					{% endif %}
					{% if infos.telephone is scalar %}
					<div>
						<div class="phoneIcon fLeft"></div>
						<div class="fLeft telephoneContent">{{ infos.telephone }}</div>
						<div class="clear"></div>
					</div>
					{% endif %}
					{% if infos.type == 'hotel' %}
					<div>酒店价格：<span>￥{{ infos.price }}</span></div>	
					{% endif %}
					{% if infos.type == 'cater' %}
					<div>人均消费：<span>￥{{ infos.price }}</span></div>	
					{% endif %}
					{% if infos.type == 'life' %}
					<div>人均消费：<span>￥{{ infos.price }}</span></div>	
					{% endif %}
					{% if infos.type == 'house' %}
					<div>房价：<span>￥{{ infos.price }}/坪</span></div>	
					{% endif %}				
				</div>
			</div>
			<div class="container-fluid">
				<div class="col-md-2 col-md-offset-0">
					<a class="thumbnail">
						<img src="/img/20150605/aesthetics_1-1.jpg" alt="{{ infos.name }}">
					</a>
				</div>
				<div class="col-md-2 col-md-offset-0">
					<a class="thumbnail">
						<img src="/img/20150605/aesthetics_2-1.jpg" alt="{{ infos.name }}">
					</a>
				</div>
				<div class="col-md-2 col-md-offset-0">
					<a class="thumbnail">
						<img src="/img/20150605/aesthetics_3-1.jpg" alt="{{ infos.name }}">
					</a>
				</div>
				<div class="col-md-2 col-md-offset-0">
					<a class="thumbnail">
						<img src="/img/20150605/aesthetics_4-1.jpg" alt="{{ infos.name }}">
					</a>
				</div>
			</div>
			
			<div class="codeFrame" >
				{% if infos.overall_rating is scalar %}
				<div>
				总体评分 
				<label class="ratingFrame" ><label class="rating" style="width:{{ infos.overall_rating*20 }}%;"></label></label> 
				<span class="fRed fBold">{{ infos.overall_rating }}分</span> 
				</div>
				{% endif %}
				{% if infos.taste_rating is scalar %}
				<div>
				口味评分 
				<label class="ratingFrame" ><label class="rating" style="width:{{ infos.taste_rating*20 }}%;"></label></label> 
				<span class="fRed fBold">{{ infos.taste_rating }}分</span> 
				</div>
				{% endif %}
				{% if infos.service_rating is scalar %}
				<div>
				服务评分 
				<label class="ratingFrame" ><label class="rating" style="width:{{ infos.service_rating*20 }}%;"></label></label> 
				<span class="fRed fBold">{{ infos.service_rating }}分</span> 
				</div>
				{% endif %}
				{% if infos.environment_rating is scalar %}
				<div>
				环境评分 
				<label class="ratingFrame" ><label class="rating" style="width:{{ infos.environment_rating*20 }}%;"></label></label> 
				<span class="fRed fBold">{{ infos.environment_rating }}分</span> 
				</div>
				{% endif %}
				{% if infos.facility_rating is scalar %}
				<div>
				星级（设备）评分 
				<label class="ratingFrame" ><label class="rating" style="width:{{ infos.facility_rating*20 }}%;"></label></label> 
				<span class="fRed fBold">{{ infos.facility_rating }}分</span> 
				</div>
				{% endif %}
				{% if infos.hygiene_rating is scalar %}
				<div>
				卫生评分 
				<label class="ratingFrame" ><label class="rating" style="width:{{ infos.hygiene_rating*20 }}%;"></label></label> 
				<span class="fRed fBold">{{ infos.hygiene_rating }}分</span> 
				</div>
				{% endif %}
				{% if infos.technology_rating is scalar %}
				<div>
				技术评分 
				<label class="ratingFrame" ><label class="rating" style="width:{{ infos.technology_rating*20 }}%;"></label></label> 
				<span class="fRed fBold">{{ infos.technology_rating }}分</span> 
				</div>
				{% endif %}
			</div>
			
			<!--评论区-->
			<div class="commentsFrame" >
				暂无评论
			</div>
			<!--地图显示区-->
			<div id="mapFrame"></div>
<script type="text/javascript">
window.onload = function(){
	function initMap(){
      createMap();//创建地图
      setMapEvent();//设置地图事件
      addMapControl();//向地图添加控件	
	}
	function createMap(){
		map = new BMap.Map("mapFrame"); 
		map.setMapStyle({style:'hardedge'});
		var point = new BMap.Point({{ infos.location_lng }},{{ infos.location_lat }});
		map.centerAndZoom(point,14);
		addMarker(point,'{{ infos.name }}');
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
		map.enableDoubleClickZoom();
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
}
</script>			
		</div>		
		<div class="infosContentRight">
		</div>	
	</div>
</div>

