<!-- Login dialog BEGIN -->
<div id="loginalert" style="display: none; top: 0px;" class="fade in">
    <div class="pd20 loginpd">
        <h3><i class="closealert fr" data-dismiss="modal" aria-label="Close"></i><div class="clear"></div></h3>
        <div class="loginwrap">
            <div class="loginh">
                <div class="fl">会员登录</div>
                <div class="fr">还没有账号<a id="sigup_now" href="${base}/reg">立即注册</a></div>
            </div>
            <h3><span class="login_warning" id="login_warning" style="display: none;">用户名或密码错误</span><div class="clear"></div></h3>
            <form action="" method="post" id="login_form">
                <div class="logininput">
                    <input type="text" id="alt_un" name="username" class="loginusername" value="" placeholder="用户名">
                    <input type="password" id="alt_pw" name="password" class="loginuserpasswordp" placeholder="密码">
                </div>
                <div class="loginbtn">
                    <div class="loginsubmit fl"><input type="button" value="登录" id="alt_login" class="btn"></div>
                    <!--
                    <div class="fr" style="margin:26px 0 0 0;"><a href="##">忘记密码?</a></div>
                    -->
                    <div class="clear"></div>
                </div>
            </form>
        </div>
    </div>
    <div class="thirdlogin">
        <div class="pd50">
            <h4>用第三方帐号直接登录</h4>
            <ul>
                <li id="sinal"><a href="${base}/oauth/callback/call_weibo">微博帐号注册</a></li>
                <li id="qql" style="margin-right: 0px;"><a href="${base}/oauth/callback/call_qq">QQ帐号注册</a></li>
            </ul>
            <div class="clear"></div>
        </div>
    </div>
</div>
<!-- Login dialog END -->

<!-- Fixed navbar -->
<header class="site-header headroom">
    <!--[if lt IE 9]>
	<div class="alert alert-danger alert-dismissible fade in" role="alert" style="margin-bottom:0">
		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<strong>您正在使用低版本浏览器，</strong> 在本页面的显示效果可能有差异。
		建议您升级到
		<a href="http://www.google.cn/intl/zh-CN/chrome/" target="_blank">Chrome</a>
		或以下浏览器：
		<a href="www.mozilla.org/en-US/firefox/‎" target="_blank">Firefox</a> /
		<a href="http://www.apple.com.cn/safari/" target="_blank">Safari</a> /
		<a href="http://www.opera.com/" target="_blank">Opera</a> /
		<a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie" target="_blank">Internet Explorer 9+</a>
	</div>
    <![endif]-->

    <div class="container">
        <nav class="navbar" role="navigation">
            <div class="navbar-header">
                <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${base}/">
                    <img src="${base}/static/default/images/logo.png"/>
                </a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
					<#if profile??>
						<li data="user">
							<a href="${base}/user" nav="user">我的主页</a>
						</li>
					</#if>
					<#list channels as row>
						<li>
							<a href="${base}/channel/${row.id}" nav="${row.name}">${row.name}</a>
						</li>
					</#list>
                </ul>
                <ul class="navbar-button list-inline" id="header_user">
                    <li view="search" class="hidden-xs hidden-sm">
                        <form method="GET" action="${base}/search" accept-charset="UTF-8" class="navbar-form navbar-left">
                            <div class="form-group">
                                <input class="form-control search-input mac-style" placeholder="搜索" name="kw" type="text" value="${kw}">
                                <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                            </div>
                        </form>
                    </li>

				<#if profile??>
                    <li><a href="${base}/post/new" class="btn btn-default btn-sm"><i class="icon icon-note"></i> 写文章</a></li>
                    <li class="dropdown">
                        <a href="#" class="user dropdown-toggle" data-toggle="dropdown">
                            <img class="img-circle" src="${base}${profile.avatar}">
                            <span>围城</span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <a href="${base}/user/profile">编辑资料</a>
                            </li>
                            <li class="divider"></li>
                            <@shiro.hasPermission name="admin">
                                <li><a href="${base}/admin">后台管理</a></li>
                            </@shiro.hasPermission>

                            <li><a href="${base}/logout">退出</a></li>
                        </ul>
                    </li>
				<#else>
                    <li><a href="${base}/login" class="btn btn-default btn-sm signup">登录</a></li>

                    <li><a href="${base}/register" class="btn btn-primary btn-sm signup">注册</a></li>
				</#if>

                </ul>
            </div>
        </nav>
    </div>
</header>

<script type="text/javascript">
$(function () {
	$('a[nav]').each(function(){  
        $this = $(this);
        if($this[0].href == String(window.location)){  
            $this.closest('li').addClass("active");  
        }  
    });
});
</script>
<!-- Header END -->