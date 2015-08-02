<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=u3wn5UIKKoI8TUDUhbtb1I0E"></script>
<div id="milkMap" style="width:100%;height:500px;"></div>
<script type="text/javascript">
// 创建地图实例
var map = new BMap.Map("milkMap");          
// 创建点坐标
var point = new BMap.Point(116.410392,39.919757);  
// 初始化地图，设置中心点坐标和地图级别    
            
map.centerAndZoom('{{ location }}',13);
map.enableScrollWheelZoom();
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