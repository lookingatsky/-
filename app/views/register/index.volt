
{{ content() }}

<div class="page-header">
    <h2>注册维肯小屋</h2>
</div>

{{ form('register/sendemail', 'id': 'registerForm', 'onbeforesubmit': 'return false') }}

    <fieldset>

        <div class="control-group">
            {{ form.label('email', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('email', ['class': 'form-control']) }}
                <p class="help-block">(必填)</p>
                <div class="alert alert-warning" id="email_alert">
                    <strong>错误 !</strong> 请输入邮箱
                </div>
            </div>
        </div>

        <div class="form-actions">
            {{ submit_button('发送邮件', 'class': 'btn btn-primary', 'onclick': 'return SignUp.validate();') }}
            <p class="help-block">我已阅读并同意<a href="#">《使用协议》</a></p>
        </div>

    </fieldset>
</form>
