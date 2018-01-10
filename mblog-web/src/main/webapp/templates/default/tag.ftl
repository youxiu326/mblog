<#include "/default/utils/layout.ftl"/>
<#include "/default/utils/utils.ftl"/>

<@ui_ltr "标签:" + tag>

<div class="shadow-box">
	<div class="filter">
		<div class="alert" style="margin-bottom:0">
			<i class="fa fa-tag fa-lg"></i> ${tag}
		</div>
	</div>
	<div class="stream-list p-stream">
		<#list page.content as row>
			<@showBlog row/>
		</#list>
		<#if  page.content?size == 0>
            <div class="stream-item">
                <i class="fa fa-info-circle fa-lg"></i>  该标签下没发表过文章!
            </div>
		</#if>
	</div>
</div>

<div class="text-center clr">
	<@pager request.requestURI!"" page 5 />
</div>
</@ui_ltr>