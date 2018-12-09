<#include "/default/utils/ui.ftl"/>

<@layout "联系博主">

<div class="row main">
    <div class="col-xs-12 col-md-9 side-left topics-show">
        <!-- view show -->
        <div class="topic panel panel-default">
            <div class="infos panel-heading">

                <h1 class="panel-title topic-title">本站博主</h1>
                <div class="clearfix">
                	<span>在上海奋斗的小程序员，希望向大佬看齐！</span>
                </div>
            </div>

            <div class="content-body entry-content panel-body ">
                <div class="markdown-body" id="emojify">
                    <p><strong>联系我</strong></p>
                    <p>有问题讨论，可以 <a target="_blank" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=youxiu326@foxmail.com" style="text-decoration:none;"><img src="http://rescdn.qqmail.com/zh_CN/htmledition/images/function/qm_open/ico_mailme_01.png"/></a></p>
                    <p>QQ群&nbsp;交流，可以<a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=9668ffd1e63fc6eb8704ebc17b8cecbf6cce77481b92c419f58d246cf3a43a0b">&nbsp;<img border="0" width="82px" height="18" src="https://sqimg.qq.com/qq_product_operations/im/pcqq/9.0/1920/logo.png" alt="youxiu326交流群" title="youxiu326交流群"></a></p>
                    <p>QQ和我联系，可以<a target="_blank" href="http://sighttp.qq.com/msgrd?v=1&uin=2473538988">&nbsp;<img border="0" width="82px" height="18" src="https://sqimg.qq.com/qq_product_operations/im/pcqq/9.0/1920/logo.png" alt="第三次" title="第三次"></a></p>
				</div>
            </div>
            <div class="panel-footer operate">
            </div>
            <div class="panel-footer operate">
                <div class="hidden-xs">
                    <div class="social-share" data-sites="weibo, wechat, facebook, twitter, google, qzone, qq"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- /view show -->
    </div>
    <div class="col-xs-12 col-md-3 side-right hidden-xs hidden-sm">
		<#include "/card/inc/right.ftl"/>
    </div>
</div>

</@layout>