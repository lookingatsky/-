
{{ content() }}

<div class="page-header">
    <h4>Email验证成功，设置帐号的登录密码，完成注册。</h4>
</div>
{{ form('register/register', 'id': 'registerForm', 'onbeforesubmit': 'return false') }}
<style>
.controls_title{
	width:200px;
	margin:15px 15px 15px auto;
	text-align:right;
}
.controls{
	width:300px;
	margin:15px auto;	
}
.f_left{
	float:left;
}
.f_right{
	float:right;
}
.clear{
	clear:both;
}
.form-actions{
	margin:auto auto 15px 215px;
}
.form-actions .confirmProtocol{
	margin:7px 7px auto auto;
}


/* 协议 */
.protocol_out{
	position:absolute;
	background:rgba(255, 255, 255, 0.6) none repeat scroll 0 0;
	border-radius:3px;
	box-shadow:0 0 6px rgba(0, 0, 0, 0.5);
	padding:5px;
	left:510px;
	top:80px;
	width:auto;
	z-index:2000;
	display:none;
}
.protocol_in{
	background:#fafafa none repeat scroll 0 0;
	border:1px solid #fff;
	border-radius:3px;
}
.protocol_body{
	background:white none repeat scroll 0 0;
}
.alt{
	position:relative;
	width:540px;
}
.alt_close{
    background: rgba(0, 0, 0, 0) url("/img/bootstrap/bg2.png");
	background-position:121px -467px;
    height:33px;
    position:absolute;
    right:8px;
    top:13px;
    width:33px;
	cursor:pointer;
}
.alt_tit{
    border-bottom: 1px dotted #d1d1d1;
    font-size: 16px;
    line-height: 22px;
    margin: 0 30px;
    padding: 30px 0 10px;
	color:#333;
	font-weight:bold;
}
.alt_c{
	padding: 10px 30px 20px;
}
.protocol .alt_in{
	height:400px;
}
.alt_in{
    overflow: auto;
    width: 100%;
}
.clearfix::after{
    clear: both;
    content: ".";
    display: block;
    font-size: 0;
    height: 0;
    line-height: 0;
    overflow: hidden;
    visibility: hidden;
}
.alt_b{
    padding: 0 30px 20px;
    text-align: center;
}
.protocol p{
	color:#aaa;
	line-height: 1.6;
}
.protocol h4{
	color:#000;
	font-weight:bold;
}
.fs14 {
    font-size: 14px;
}
.mb5 {
    margin-bottom: 5px;
}
.mt10 {
    margin-top: 10px;
}
.shadows{
	position:absolute;
	z-index:1000;
	top:0;
	left:0;
	width:100%;
	height:719px;
	background:#000;
	filter:alpha(opacity=40);
	opacity:0.4;
	display:none;
}
</style>

    <fieldset>
		<div class="control-group">
			<div class="controls_title f_left">
            {{ form.label('email', ['class': 'control-label']) }}
            </div>
			<div class="controls f_left">
				{{ email }}
				<input type="hidden" name="email" value="{{ email }}" />
            </div>
			<div class="clear"></div>
        </div>	

        <div class="control-group">
			<div class="controls_title f_left">
            {{ form.label('username', ['class': 'control-label']) }}
            </div>		       
            <div class="controls f_left">
                {{ form.render('username', ['class': 'form-control']) }}
                <div class="alert alert-warning" id="username_alert">
                    <strong>错误 !</strong> 请输入用户名
                </div>
            </div>
			<div class="clear"></div>
        </div> 

         <div class="control-group">
			<div class="controls_title f_left">
            {{ form.label('password', ['class': 'control-label']) }}
            </div>				 
            <div class="controls f_left">
                {{ form.render('password', ['class': 'form-control']) }}
                <div class="alert alert-warning" id="password_alert">
                    <strong>错误 !</strong> 请输入密码
                </div>
            </div>
			<div class="clear"></div>
        </div>

        <div class="control-group">
			<div class="controls_title f_left">
				<label class="control-label">确认密码</label>
            </div>			
            <div class="controls f_left">
                {{ password_field('repeatPassword', 'class': 'form-control') }}
                <div class="alert" id="repeatPassword_alert">
                    <strong>错误 !</strong> 两次密码不一样
                </div>
            </div>
			<div class="clear"></div>
        </div> 

        <div class="form-actions">
			<p class="help-block">
				<input type="checkbox" class="confirm_protocol" />
				我已阅读并同意<a class="show_protocol" href="javascript:;">《使用协议》</a>
			</p>
			
            {{ submit_button('完 成', 'class': 'btn btn-primary', 'onclick': 'return SignUp.validate();') }}
        </div>	
    </fieldset>
</form>

<script type="text/javascript">
$(function(){
	$(".alt_close").hover(function(){
		$(this).css("background-position","155px -467px");
	},function(){
		$(this).css("background-position","121px -467px");
	})
	$(".alt_close").click(function(){
		$(".shadows").hide();
		$(".protocol_out").hide();
	})
	$(".show_protocol").click(function(){
		$(".shadows").show();
		$(".protocol_out").show();		
	})
})
</script>
<!--协议-->
<div class="shadows"></div>
<div class="protocol_out">
	<div class="protocol_in">
		<div id="protocol_body" class="protocol_body">
			<div class="protocol alt dn" style="display:block;">
				<a class="alt_close" title="关闭" ></a>
				<h2 class="alt_tit">维肯小屋使用协议</h2>
				<div class="alt_c">
					<div class="alt_in">
						<p>以下详述维肯小屋为您提供服务的条款。 </p>
						<p>本协议详述您在http://www.viconhouse.com （"维肯小屋网站"）使用维肯小屋的服务所须遵守的条款和条件。如您有任何疑问，请及时联系本公司。 </p>
						<p>您只有完全同意下列所有服务条款并完成注册程序，才能成为维肯小屋的用户并使用相应服务。您注册成为维肯小屋用户前，必须仔细阅读本用户协议和隐私声明， 一旦您注册成为了维肯小屋用户即表示您已经阅读、同意并接受本用户协议和隐私声明中所含的所有条款和条件。您只要使用了维肯小屋提供的服务， 即视为您已了解并完全同意本服务条款各项内容，包括维肯小屋对服务条款随时做的任何修改。如您不同意该修订，您必须终止您与维肯小屋的用户关系。</p>
						
						<h4 class="mt10 mb5 fs14">1、 服务内容</h4>
						<p>1.1 维肯小屋是基于维肯小屋开放平台的手机软件快速生成系统，为用户提供免费的手机软件在线制作服务。用户可以将生成的手机软件进行发布，也可以将手机软件分享给其他个人。</p>
						<p>1.2 维肯小屋的具体服务内容由本公司根据实际情况提供具体功能与服务。本公司保留变更、调整或终止部分服务内容的权利。</p>
						<p>1.3 本公司保留根据实际情况随时调整维肯小屋平台提供的服务种类、形式。本公司不承担因业务调整给用户造成的损失。 </p>
						
						<h4 class="mt10 mb5 fs14">2、 内容使用权</h4>
						<p>2.1 本公司鼓励用户充分利用维肯小屋平台自由地制作和共享他们自己的手机客户端软件（以下简称用户软件）。您可以自由从维肯小屋中制作不同类别的手机软件，但制作过程中的频道内容必须符合中国知识产权法的规定，不得侵犯他人的知识产权。本公司如果收到版权投诉，有权删除被投诉侵权的内容。用户对于其创作并在维肯小屋平台上发布的合法内容依法享有著作权及其相关权利。</p>
						
						<h4 class="mt10 mb5 fs14">3、 隐私保护</h4>
						<p>3.1 保护用户隐私是维肯小屋的重点原则，本公司通过技术手段、提供隐私保护服务功能、强化内部管理等办法充分保护用户的个人资料安全。</p>
						<p>3.2 本公司保证不对外公开或向第三方提供用户注册的个人资料，及用户在使用服务时存储的非公开内容。 但下列情况除外： </p>
						<p>3.2.1 事先获得用户的明确授权；</p>
						<p>3.2.2 按照相关司法机构或政府主管部门的要求。</p>
						<p></p>
						
						<h4 class="mt10 mb5 fs14">4、 服务准则</h4>
						<p>4.1 用户在申请使用维肯小屋服务时，必须提供真实的个人资料，并不断更新注册资料。如果因注册信息不真实而引起的问题及其后果，维肯小屋网站不承担任何责任。</p>
						<p>4.2 用户在使用维肯小屋服务过程中，必须遵循国家的相关法律法规，不得利用维肯小屋平台，发布危害国家安全、色情、暴力等非法内容；不得利用维肯小屋网平台发布含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、或其它道德上令人反感的内容。</p>
						<p>4.3 用户使用本服务的行为若有任何违反国家法律法规或侵犯任何第三方的合法权益的情形时，本公司有权直接删除该等违反规定之内容。</p>
						<p>4.4 除非用户已获得第三方授权，否则不得将第三方内容用于商业目的。 </p>
						<p>4.5 用户不可以通过自动程序等方式批量创建多个账户，也不可以对账户使用自动系统执行操作。</p>
						<p>4.6 用户影响系统总体稳定性或完整性的操作可能会被暂停或终止，直到问题得到解决。</p>
						<p>4.7 用户不可违规或恶意使用维肯小屋的开放接口，否则本公司有权随时终止该用户服务。如用户由于不当行为对本公司造成损失，用户应予赔偿。</p>
						
						<h4 class="mt10 mb5 fs14">5、 知识产权声明</h4>
						<p>5.1 维肯小屋所提供的网络服务的相关著作权、专利权、商标权、商业秘密及其它任何所有权或权利，均属本公司所有。非经本公司的同意，任何人或用户均不得擅自下载、复制、传输、改编、编辑，否则应负所有法律责任。本公司拥有向用户提供网络服务过程中所产生并储存于维肯小屋服务器中的任何数据信息的所有权。用户不得在未获得本公司允许的情况下，私自通过不法途径获取软件源代码。软件源代码归本公司所有。</p>
						<h4 class="mt10 mb5 fs14">6、 免责声明</h4>
						<p>6.1 互联网是一个开放平台，用户将照片等个人资料上传到互联网上，有可能会被其他组织或个人复制、转载、删改或做其它非法用途，用户必须充分意识此类风险的存在。用户明确同意其使用维肯小屋服务所存在的风险将完全由其自己承担；因其使用维肯小屋服务而产生的一切后果也由其自己承担，本公司对用户不承担任何责任。</p>
					</div>
				</div>
				<div class="alt_b clearfix">
					<a class="btn btn-success">同意</a>
					<a class="btn btn-default">取消</a>
				</div>	
			</div>
		</div>
	</div>
</div>