<?php use Phalcon\Tag as Tag ?>
{{ content() }}
<style type="text/css">
body{
	background:#f7f7f7;
}
.test_p>li{
	background:rgba(0, 0, 0, 0) url("../img/bootstrap/bg.png") no-repeat scroll -105px -957px;
	text-indent:24px;
}
.test_p>li:hover{
	background-position:-105px -939px;
	color:#e84a01;
	text-indent:24px;
}
.searchInfo{
	width:80%;
	min-height:200px;
	margin:30px auto 30px auto;
	background:#fff;
	border:1px solid #e7e7e7;
	border-radius:2px;
	color:#686e71;
}

.searchInfoList{
	width:80%;
	margin:auto;
	background:#fff;
	border:1px solid #e7e7e7;
	border-radius:2px;
	color:#686e71;
}
.searchInfoList>div:nth-of-type(1){
	line-height:50px;
	border-bottom:1px solid #ddd;
	width:90%;
	margin:auto;
}
.searchInfoList>div:nth-of-type(1)>a{
	cursor:pointer;
	font-size:20px;
}
.searchInfoList>div:nth-of-type(1)>a:hover{
	text-decoration:none;
	color:#5cb85c;
}
.searchInfoList>div:nth-of-type(1)>span{
	color:#5cb85c;
}
.searchInfoList>div:nth-of-type(3){
	line-height:50px;
	width:90%;
	margin:auto;
}
.searchInfoList>div>ul{
	margin:auto;
	padding:0;
	width:90%;
	list-style-type:none;
}
.searchInfoList>div>ul>li{
	height:170px;
	width:100%;
	border-bottom:1px solid #ddd;
}
.searchInfoList>div>ul>li:hover{
	background:#f7f7f7;
}
.searchInfoList>div>ul>li>div{
	height:140px;
	padding:15px 0;
}
.infoImage{
	width:329px;
	height:140px;
	overflow:hidden;
}
.infoContent{
	width:460px;
	height:140px;
	margin-left:15px;
	font-family:"微软雅黑";
}
.infoContent>a{
	height:24px;
	line-height:24px;
	color:#333;
	font-size:18px;
	font-family:"微软雅黑";
	font-weight:700;
}
.infoContent>label{
	font-family:"微软雅黑";
	font-size:14px;
	color:#333;
	line-height:24px;
}
.infoContent>a:hover{
	color:#5cb85c;
	text-decoration:none;
}
.infoContent>p{
	margin:10px auto;
	height:24px;
	color:#999;
}
.infoContent>p>label:nth-of-type(1){
	width:24px;
	height:24px;
	margin:0;
	padding:0;
	background:rgba(0, 0, 0, 0) url("../img/bootstrap/bg.png") no-repeat scroll 5px -902px;
}
.infoContent>p>label:nth-of-type(2){
	line-height:24px;
	width:430px;
}
.fLeft{
	float:left;
}
.fRight{
	float:right;
}
.clear{
	clear:both;
}
.infoContent>div{
	height:50px;
	color:#999;
}
.telephone>label:nth-of-type(1){
	width:37px;
	height:37px;
	background:rgba(0, 0, 0, 0) url("../img/bootstrap/bg.png") no-repeat scroll -92px -106px;
}
.telephone>label:nth-of-type(2){
	height:37px;
	line-height:37px;
}
.housePrice{
	height:50px;
	color:#999;
}
.housePrice>label{
	width:300px;
	height:37px;
	line-height:37px;	
}
.housePrice>label>span{
	color:#5cb85c;
}
.viconFrameInputKeyword{
	height:80px;
	width:90%;
	margin:auto;
	border-bottom:1px solid #ddd;
}
.viconFrameInputKeyword>input{
	width:300px;
	height:30px;
	margin-top:25px;
	line-height:30px;
	border:1px solid #ddd;
}
.viconFrameInputKeyword>label:nth-of-type(2){
	height:40px;
	line-height:40px;
	margin-top:20px;
	padding-left:30px;
	padding-right:10px;
	font-weight:100;
	color:#888;
	border-radius:2px;
	border:1px solid #ddd;
	text-align:center;
	cursor:pointer;
	background:rgba(0, 0, 0, 0) url("../img/bootstrap/bg.png") no-repeat scroll -103px -844px;
}
.viconFrameInputType{
	width:90%;
	margin:auto auto 20px auto;
}
.viconFrameInputType>ul{
	marign:0px;
	padding:0px;
	list-style-type:none;
}
.viconFrameInputType>ul>li{
	height:30px;
	line-height:30px;
	border-bottom:1px dashed #ddd;
}
.viconFrameInputType label{
	width:100px;
	height:20px;
	line-height:20px;
	font-weight:100;
	color:#000;
	cursor:pointer;
	background:rgba(0, 0, 0, 0) url("../img/bootstrap/bg2.png") no-repeat scroll -347px -1162px;	
}
.viconFrameInputType input[type="checkbox"]{
	visibility:hidden;
	margin-left:10px;
}
.viconFrameInputType .currentCheck{
	background-position:-347px -1197px;
}
.infoListPager label{
	background:#fff;
	border:1px solid #ddd;
	height:30px;
	font-size:14px;
	font-weight:100;
	line-height:30px;
	padding:auto 10px auto 10px;
	color:#666;
	padding-right:10px;
	padding-left:10px;
	cursor:pointer;
}
</style>
<div class="searchInfo">
<form action="/index/list" class="mapForm" method="post">
			<div class="viconFrameInputKeyword">
				<input type="text" name="keywords" value="<?php if(isset($searchWords)){ echo $searchWords; }else{ echo '搜索一下'; } ?>" />
				<label><?php echo Tag::submitButton(array("点击搜索", "class" => "btn btn-success")) ?></label>
				<label class="fRight">
					地图搜索
				</label>
			</div>
			<div class="viconFrameInputType">
				<ul>
					<li>
						行业类型:
						<label class="currentCheck"><input type="checkbox" name="industry_type" value="default"/>全部</label>
						<label><input type="checkbox" name="industry_type" value="hotel"/>宾馆</label>
						<label><input type="checkbox" name="industry_type" value="cater"/>餐饮</label>
						<label><input type="checkbox" name="industry_type" value="life"/>生活娱乐</label>
					</li>
<!-- 					<li>排序字段:</li>
					<li>排序规则:</li> -->
					<li class="hotel">
						排序字段:
						<label class="currentCheck"><input type="checkbox" name="industry_type" value="default"/>全部</label>
						<label><input type="checkbox" name="sort_name" value="price"/>价格</label>
						<label><input type="checkbox" name="sort_name" value="total_score"/>好评</label>
						<label><input type="checkbox" name="sort_name" value="level"/>星级</label>						
						<label><input type="checkbox" name="sort_name" value="health_score"/>卫生</label>						
					</li>
					<li class="cater">
						排序字段:
						<label class="currentCheck"><input type="checkbox" name="industry_type" value="default"/>全部</label>
						<label><input type="checkbox" name="sort_name" value="taste_rating"/>口味</label>
						<label><input type="checkbox" name="sort_name" value="price"/>价格</label>
						<label><input type="checkbox" name="sort_name" value="overall_rating"/>好评</label>						
						<label><input type="checkbox" name="sort_name" value="service_rating"/>服务</label>						
					</li>
					<li class="life">
						排序字段:
						<label class="currentCheck"><input type="checkbox" name="industry_type" value="default"/>全部</label>
						<label><input type="checkbox" name="sort_name" value="price"/>价格</label>
						<label><input type="checkbox" name="sort_name" value="overall_rating"/>好评</label>
						<label><input type="checkbox" name="sort_name" value="comment_num"/>服务</label>						
					</li>
					<li>
						是否团购:
						<label class="currentCheck"><input type="checkbox" name="groupon" value="default"/>全部</label>
						<label><input type="checkbox" name="groupon" value="0"/>无</label>
						<label><input type="checkbox" name="groupon" value="1"/>有</label>
					</li>
					<li>
						是否打折:
						<label class="currentCheck"><input type="checkbox" name="groupon" value="default"/>全部</label>
						<label><input type="checkbox" name="groupon" value="0"/>无</label>
						<label><input type="checkbox" name="groupon" value="1"/>有</label>					
					</li>
				</ul>
			</div>
</form>
</div>

<div class="searchInfoList">
<?php
        if(isset($mapDatas)){
?>
	<div>
		找到 <span><?php echo $mapDatas['total']; ?></span> 条符合要求的记录 
		<a class="fRight">&uarr;</a>
	</div>
	<div>
		<ul>
		<?php foreach($mapDatas['results'] as $k=>$v){ ?>		
			<li>
				<div>
					<div class="infoImage fLeft"><img src="../img/20150605/aesthetics_4-1.jpg" /></div>
					<div class="infoContent fLeft">
						
							<a href="/infos/index/<?php echo $v['uid']; ?>">	
								<?php echo $v['name'];?>
							</a>
							<label class="fRight">
								<?php $types=explode(';',$v['detail_info']['tag']); 
								foreach($types as $key=>$val){
								?>
								<span>
								<?php echo $val;?>
								</span>
								 &nbsp;
								<?php } ?>
							</label>
						
						<p>
							<label class="fLeft"></label>
							<label class="fLeft"><?php echo $v['address'];?></label>
						</p>
						<?php if(isset($v['telephone'])){ ?>
						<div class="telephone">
							<label class="fLeft"></label>
							<label class="fLeft"><?php echo $v['telephone'];?></label>
						</div>
						<?php } ?>
						
						
						<!--房产-->
						<?php if(isset($v['detail_info']['type']) && $v['detail_info']['type'] == 'house' && isset($v['detail_info']['price'])){ ?>
						<div class="housePrice">
							<label class="fLeft">均价：<span>￥<?php echo $v['detail_info']['price'];?></span>/平</label>
						</div>
						<?php } ?>						
						<!--美食-->
						<?php if(isset($v['detail_info']['type']) && $v['detail_info']['type'] == 'cater' && isset($v['detail_info']['price'])){ ?>
						<div class="housePrice">
							<label class="fLeft">人均消费：<span>￥<?php echo $v['detail_info']['price'];?></label>
						</div>
						<?php } ?>
						<!--酒店-->
						<?php if(isset($v['detail_info']['type']) && $v['detail_info']['type'] == 'hotel' && isset($v['detail_info']['price'])){ ?>
						<div class="housePrice">
							<label class="fLeft">房间价格：<span>￥<?php echo $v['detail_info']['price'];?></label>
						</div>
						<?php } ?>
						
						
					</div>
				</div>
			</li>
		<?php } ?> 	
		</ul>
	</div>
	<?php }else{ ?>
	<div>
		找到 <span>0</span> 条符合要求的记录
	</div>
	<div>
	</div>	
	<?php } ?>
<!--分页-->	
<?php if(isset($listPager['index'])){ ?>		
<script type="text/javascript">
$(function(){
var current = parseInt(<?php echo $listPager['index']; ?>);
var total = parseInt(<?php echo $listPager['total']; ?>);
	$(".pageIndex").click(function(){
		if(current != 1){
			$(".mapForm").attr("action","/index/list/1");
			$(".mapForm").submit();
		}
	})
	$(".pagepPrevious").click(function(){
		if(current != 1){
			$(".mapForm").attr("action","/index/list/"+(current-1));
			$(".mapForm").submit();		
		}	
	})
	$(".pageNext").click(function(){
		if(current != total){
			$(".mapForm").attr("action","/index/list/"+(current+1));
			$(".mapForm").submit();	
		}
	})
	$(".pageLast").click(function(){
		if(current != total){
			$(".mapForm").attr("action","/index/list/"+total);
			$(".mapForm").submit();	
		}	
	})
})
</script>
<div class="infoListPager">
	<label class="pageIndex">首页</label>
	<label class="pagepPrevious">上一页</label>
	<label>
	<?php echo $listPager['index']; ?>
	</label>
	<label class="pageNext">下一页</label>
	<label class="pageLast">尾页</label>
</div>
<?php } ?>
</div>	

