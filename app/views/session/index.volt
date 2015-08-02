
{{ content() }}

<div class="row">

    <div class="col-md-6">
        <div class="page-header">
            <h4>登 录</h4>
        </div>
        {{ form('session/start', 'role': 'form') }}
            <fieldset>
                <div class="form-group">
                    <label for="email">邮箱/帐号</label>
                    <div class="controls">
                        {{ text_field('email', 'class': "form-control") }}
                    </div>
                </div>
                <div class="form-group">
                    <label for="password">密 码</label>
                    <div class="controls">
                        {{ password_field('password', 'class': "form-control") }}
                    </div>
                </div>
                <div class="form-group">
                    {{ submit_button('登 录', 'class': 'btn btn-primary btn-large') }}
                </div>
            </fieldset>
        </form>
    </div>

    <div class="col-md-6">

        <div class="page-header">
            <h4>还没有帐号?</h4>
        </div>

        <p>拥有帐号您也可以拥有以前几条:</p>
        <ul>
            <li>创建您的维肯小屋信息</li>
            <li>创建商户信息</li>
            <li>修改商户展示信息</li>
        </ul>

        <div class="clearfix center">
            {{ link_to('register', '注 册', 'class': 'btn btn-primary btn-large btn-success') }}
        </div>
    </div>

</div>
