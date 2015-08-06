<?php use Phalcon\Tag as Tag ?>
{{ content() }}
<style type="text/css">
.viconFrame{
	width:100%;
	background:url('../img/bootstrap/saybg.jpg');
	height:360px;
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
	height:200px;
	background:#000;
	position:relative;
	top:50px;
	margin:auto;
	border-radius:10px;
	filter:alpha(opacity=70);
	-moz-opacity:0.7;
	-khtml-opacity:0.7;
	opacity:0.7; 
	z-index:0;
}
.viconFrameInput>h2{
	position:relative;
	top:230px;
	left:50px;
	color:#5bb75b;
}
.viconFrameInput>div:nth-of-type(1){
	width:470px;
	height:100xp;
	position:relative;
	left:350px;
	top:230px;
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

{{ form('index/list','class':'mapForm','method':'post') }}
	<div class="viconFrame">
		<div class="viconFrameInputBg"></div>
		<div class="viconFrameInput">
		<h2>搜索信息</h2>
			<div>
				<input type="text" name="keywords" value="" /> 
				<label><?php echo Tag::submitButton(array("点击搜索", "class" => "btn btn-success")) ?></label>
			</div>
		</div>
	</div>
</form>

	
