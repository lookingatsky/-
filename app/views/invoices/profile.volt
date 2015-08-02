
{{ content() }}
<!-- 
<div class="profile left">
    {{ form('invoices/profile', 'id': 'profileForm', 'onbeforesubmit': 'return false') }}
        <div class="clearfix">
            <label for="name">帐号:</label>
            <div class="input">
                {{ text_field("name", "size": "30", "class": "span6") }}
                <div class="alert" id="name_alert">
                    <strong>Warning!</strong> Please enter your full name
                </div>
            </div>
        </div>
        <div class="clearfix">
            <label for="email">邮箱:</label>
            <div class="input">
                {{ text_field("email", "size": "30", "class": "span6") }}
                <div class="alert" id="email_alert">
                    <strong>Warning!</strong> Please enter your email
                </div>
            </div>
        </div>
        <div class="clearfix">
            <input type="button" value="Update" class="btn btn-primary btn-large btn-info" onclick="Profile.validate()">
            &nbsp;
            {{ link_to('invoices/index', 'Cancel') }}
        </div>
    </form>
</div> -->
<style>
.left_frame{
	width:15%;
	margin:20px 20px 20px 0px;
	border:1px solid #ddd;
	border-radius:5px;
}
.right_frame{
	width:80%;
	margin:20px auto;
	min-height:400px;
	border:1px solid #ddd;
	border-radius:5px;
}
.image_frame{
	margin:20px;
	width:160px;
	height:160px;
	padding:4px;
	background:#ccc;
	box-shadow:1px 1px 2px #000;
	border:1px solid #aaa;
}
.info_frame{
	margin:20px;
	width:160px;
	height:160px;
	padding:4px;
}
.info_frame ul{
	list-style:none;
	padding:0;
	margin:0;
}
.info_frame ul li{
	text-align:left;
	line-height:30px;
}
.image_frame img{
	width:150px;
	height:150px;
	border:1px solid #aaa;
}
.image_frame .image_frame_inner{
	width:150px;
	height:150px;
	overflow:hidden;
}
.change_image{
	position:relative;
	width:150px;
	height:150px;
	top:0px;
	background:#000;
	filter:aphal(opacity=40);
	opacity:0.5;
	line-height:150px;
	cursor:pointer;
}
.alt_in ul{
	margin:0;
	padding:0;
	list-style:none;
}
.alt_in li{
	width:102px;
	height:102px;
	border:1px solid #ccc;
	margin-left:10px;
	margin-bottom:15px;
	cursor:pointer;
}
.alt_in .active{
	border:1px solid red;
}
.new_infos{
	width:95%;
	line-height:30px;
	color:#555;
	border:1px solid #ccc;	
}
.change_infos{
	width:130px;
	line-height:30px;
	border:1px solid #ccc;
	margin:20px 20px auto;
	cursor:pointer;
}
.change_infos i{
	position:absolute;
	width:15px;
	height:15px;
	margin-top:8px;
	border:0px solid #000;
	background-position:469px -72px;
	background-image:url(../img/bootstrap/glyphicons-halflings.png);
}

</style>
<script>
$(function(){
var flag = 0;	
	$(".change_infos").hover(function(){
		$(this).css("background","#eee");	
	},function(){
		$(this).css("background","#fff");
	})
	
	$(".alt_in").find("li").click(function(){
		$(this).siblings().removeClass('active');
		$(this).addClass('active');
	})
	
	$(".alt_b").find(".btn-success").click(function(){
		if($(".alt_in").find(".active").find("img").attr("src") !== 'undefined'){
			var imgSrc = $(".alt_in").find(".active").find("img").attr("src");
			$.post('/invoices/changeimage/',{
				id:{{ id }},
				imgsrc:imgSrc
			},function(data){
				$(".image_frame").find("img").eq(0).attr("src",imgSrc);
			})
			$(".protocol_out").fadeOut();
			$(".shadows").hide();
		}else{
			alert("请先选择头像");
		}
		$(".image_frame").find(".change_image").animate({'top':'0px'},500);
	})
	
	$(".alt_b").find(".btn-default").click(function(){
		$(".protocol_out").fadeOut();
		$(".shadows").hide();
		flag = 0
		$(".image_frame").find(".change_image").animate({'top':'0px'},500);	
	})
	
	$(".alt_close").click(function(){
		$(".protocol_out").fadeOut();
		$(".shadows").hide();
		flag = 0
		$(".image_frame").find(".change_image").animate({'top':'0px'},500);
	})

	$(".image_frame").hover(function(){
		$(".image_frame").find(".change_image").stop(true).animate({'top':'-150px'},500);
	},function(){
		if(flag == 0){
			$(".image_frame").find(".change_image").stop(true).animate({'top':'0px'},500);
		}
	})

	$(".change_image").click(function(){
		flag = 1;
		$(".image_frame").find(".change_image").css('top','-150px');
		$(".protocol_out").fadeIn();
		$(".shadows").show();	
	})
})
</script>
	<div class="left_frame f_left">
		<ul class="nav nav-pills nav-stacked">
		   <li class="active"><a href="#">Home</a></li>
		   <li><a href="#">基本信息</a></li>
		   <li><a href="#">消息中心</a></li>
		   <li><a href="#">数据统计</a></li>
		   <li><a href="#">我的关注</a></li>
		   <li><a href="#">我的粉丝</a></li>
		</ul>
	</div>
	<div class="right_frame f_left">
		<div class="image_frame f_left">
			<div class="image_frame_inner">
				{% if imgSrc is defined %}
				<img src="{{ imgSrc }}" />
				{% else %}
				<img src="../img/bootstrap/noPicture.png" />
				{% endif %}
				<img class="change_image" src="../img/bootstrap/uploadAvatar.png" />
			</div>
		</div>
		<div class="info_frame f_left">
			<ul>
				{% if name is defined %}
				<li>姓&nbsp;&nbsp;&nbsp;名：<a href="#">{{ name }}</a></li>
				{% endif %}
				{% if username is defined %}
				<li>用户名：<a href="#">{{ username }}</a></li>
				{% endif %}
				{% if email is defined %}
				<li>邮&nbsp;&nbsp;&nbsp;箱：<a href="#">{{ email }}</a></li>
				{% endif %}
				{% if guanzhu is defined %}
				<li>关注度：<a href="#">{{ guanzhu }}</a></li>
				{% endif %}
				{% if fensi is defined %}
				<li>积分数：<a href="#">{{ fensi }}</a></li>
				{% endif %}
			</ul>
		</div>
		<div class="change_infos f_right"><i class="change_infos_icon"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改资料</div>
		
		<div class="clear"></div>
		<div class="new_infos">最新动态</div>
<style>
.news_frame{
	width:95%;
}
.news_frame ul{
	list-style:none;
	margin:0;
	padding:0;
}
.news_frame ul li{
	width:100%;
	min-height:100px;
	margin-bottom:20px;
	border-bottom:1px dashed #ccc;
}
.listImgFrame{
	width:80px;
	height:80px;
	border-radius:50%;
	overflow:hidden;
	margin:10px 10px 10px auto;
	border:1px dashed #aaa;
}
.listImgFrame img{
	width:80px;
}
.listUsername{
	margin:15px auto;
}
.listType{
	margin:15px auto;
}
.listFrame0{
	width:764px;
	text-align:left;
}
.listDetailInfo{
	background:#eee;
	margin:10px auto;
	padding:10px;
	line-height:20px;
}
.good{
	position:absolute;
	margin-top:3px;
	height:15px;
	width:15px;
	background-position:374px 0px;
	background-image:url(../img/bootstrap/glyphicons-halflings.png);
}
.listDetailInfo em{
	margin-left:13px;
}
.listDetailInfoNums{
	color:#ccc;
}
.listDetailInfoTime{
	color:#999;
}
.listDetailInfoTime a{
	color:#999;
}
.listDetailInfoTime a:hover,.listDetailInfoTime a:focus{
	color:#428bca;
	text-decoration:none;
}
.listDetailInfoNums a{
	color:#999;
}
.listDetailInfoNums a:hover,.listDetailInfoNums a:focus{
	color:#428bca;
	text-decoration:none;
}

</style>		
		<div class="news_frame">
			<ul>
			
<!--动态-->			
				<li>
					<div class="listImgFrame f_left">
						{% if imgSrc is defined %}
						<img src="{{ imgSrc }}" />
						{% else %}
						<img src="../img/bootstrap/noPicture.png" />
						{% endif %}
					</div>				
					<div class="listFrame0 f_left">
						<div class="listUsername f_left"><b>{{ username }} </b></div>
						<div class="listType f_left">
							<a href="#">&nbsp;[客官][店家]</a>
						</div>
						<div class="clear"></div>
						<div>暂无微博 暂无微博 暂无微博 暂无微博 暂无微博 暂无微博 暂无微博 暂无微博 暂无微博 暂无微博 暂无微博 暂无微博 暂无微博 暂无微博 暂无微博 暂无微博 暂无微博 暂无微博</div>					
						<div class="listDetailInfo">
							<p>this is a test 	this is a test 	this is a test 	this is a test 	this is a test 	this is a test 	this is a test 	this is a test 	this is a test</p>
							<div class="listDetailImg">
								<img src="" />
							</div>
							<div class="listDetailInfoTime f_left">
								<a>今天 12:36</a> 
								来自 维肯小屋 
								<a>viconhouse.com</a> 
							</div>
							<div class="listDetailInfoNums f_right">
								<a href="#">转发 149</a> |
								<a href="#">评论 229</a> |
								<a href="#"><i class="good"></i> <em>1191</em></a>
							</div>
							<div class="clear"></div>	
						</div>
					</div>
					<div class="clear"></div>				
				</li>
<!--/动态-->				
			</ul>	
		</div>
	</div>
	<div class="clear"></div>
	
<div class="shadows"></div>
<div class="protocol_out">
	<div class="protocol_in">
		<div id="protocol_body" class="protocol_body">
			<div class="protocol alt dn" style="display:block;">
				<a class="alt_close" title="关闭" ></a>
				<h2 class="alt_tit">更换头像</h2>
				<div class="alt_c">
					<div class="alt_in">
						<ul>
						<?php for($i=1;$i<30;$i++){ ?>
							<?php if($i != 29){ ?><li class="f_left"><img src="../img/waibo/<?php  echo $i; ?>_r.jpg" width="100"/></li><?php } ?>
							<li class="f_left"><img src="../img/waibo/<?php echo $i;?>_l.jpg" width="100"/></li>
						<?php } ?>
						</ul>
					</div>
				</div>
				<div class="alt_b clearfix">
					<a class="btn btn-success">确 定</a>
					<a class="btn btn-default">取 消</a>
				</div>	
			</div>
		</div>
	</div>
</div>	
	