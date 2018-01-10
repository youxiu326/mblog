<#include "/default/utils/ui.ftl"/>

<#assign title = ret.title + ' - ' + site_name />
<#assign keywords = ret.keywords?default(site_keywords) />
<#assign description = ret.description?default(site_description) />

<@layout title keywords description>
<div class="row main">
    <div class="col-xs-12 col-md-9 side-left topics-show">
        <!-- view show -->
        <div class="topic panel panel-default">
            <div class="infos panel-heading">

                <h1 class="panel-title topic-title">${ret.title}</h1>

                <div class="meta inline-block">

                    <a class="author" href="#">
                    ${ret.author.name}
                    </a>
                    <abbr class="timeago">${timeAgo(ret.created)}</abbr>
                    ⋅
                ${ret.views} 阅读

                </div>
                <div class="clearfix"></div>
            </div>

            <div class="content-body entry-content panel-body ">
                <div class="markdown-body" id="emojify">
                ${ret.content}
                </div>
            </div>
            <div class="panel-footer operate">
                <#list ret.tagsArray as tag>
                    <span>
                            <a class="label label-default" href="${base}/tag/${tag}/">#${tag}</a>
                        </span>
                </#list>
            </div>
            <div class="panel-footer operate">
                <div class="hidden-xs">
                    <div class="social-share" data-sites="weibo, wechat, facebook, twitter, google, qzone, qq"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

        <!-- Comments -->
        <div id="chat" class="chats shadow-box">
            <div class="chat_other">
                <h4>全部评论: <i id="chat_count">0</i> 条</h4>
            </div>
            <ul id="chat_container" class="its"></ul>
            <div id="pager" class="text-center"></div>
            <div class="cbox-wrap">
                <div class="cbox-title">我有话说: <span id="chat_reply" style="display:none;">@<i
                        id="chat_to"></i></span>
                </div>
                <div class="cbox-post">
                    <div class="cbox-input">
                        <textarea id="chat_text" rows="3" placeholder="请输入评论内容"></textarea>
                        <input type="hidden" value="0" name="chat_pid" id="chat_pid"/>
                    </div>
                    <div class="cbox-ats clearfix">
                        <div class="ats-func">
                            <ul class="func-list">
                                <li class="list-b">
                                    <a href="javascript:void(0);" class="join" id="c-btn"><i
                                            class="fa fa-smile-o fa-2"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="ats-issue">
                            <button id="btn-chat" class="btn btn-success btn-sm bt">发送</button>
                        </div>
                    </div>
                </div>
                <div class="phiz-box" id="c-phiz" style="display:none">
                    <div class="phiz-list" view="c-phizs"></div>
                </div>
            </div>
        </div>
        <!-- /view show -->
    </div>
    <div class="col-xs-12 col-md-3 side-right hidden-xs hidden-sm">
        <ul class="list-group about-user">
            <li class="list-group-item user-card" >
                <div class="ava">
                    <a href="${base}/ta/${ret.author.id}">
                        <@showAva ret.author.avatar "img-circle"/>
                    </a>
                </div>
                <div class="user-info">
                    <div class="nk mb10">${ret.author.name}</div>
                    <div class="mb6">
                        <a class="btn btn-success btn-xs" href="javascript:void(0);" data-id="${ret.author.id}" rel="follow">+ 关注</a>
                    </div>
                </div>
            </li>

            <li class="list-group-item">
                <div class="user-datas">
                    <ul>
                        <li><strong>${ret.author.posts}</strong><span>发布</span></li>
                        <li class="noborder"><strong>${ret.author.comments}</strong><span>评论</span></li>
                    </ul>
                </div>
            </li>
            <li class="list-group-item">
                <div class="text-center padding-md">
                    <a class="btn btn-success btn-sm" href="javascript:void(0);" data-id="${ret.id}" rel="favor">喜欢</a>
                    <strong id="favors">${ret.favors}</strong> 喜欢
                </div>
            </li>
        </ul>
        <#include "/default/inc/right.ftl"/>
    </div>
</div>

<script type="text/plain" id="chat_template">
    <li id="chat{5}">
        <a class="avt fl" target="_blank" href="${base}/ta/{0}">
            <img src="${base}{1}">
        </a>
        <div class="chat_body">
            <h5>
                <div class="fl"><a class="chat_name" href="${base}/ta/{0}">{2}</a><span>{3}</span></div>
                <div class="fr reply_this"><a href="javascript:void(0);" onclick="goto('{5}', '{2}')">[回复]</a></div>
                <div class="clear"></div>
            </h5>
            <div class="chat_p">
                <div class="chat_pct">{4}</div> {6}
            </div>
        </div>
        <div class="clear"></div>
        <div class="chat_reply"></div>
    </li>
</script>

<script type="text/javascript">
    function goto(pid, user) {
        document.getElementById('chat_text').scrollIntoView();
        $('#chat_text').focus();
        $('#chat_text').val('');
        $('#chat_to').text(user);
        $('#chat_pid').val(pid);

        $('#chat_reply').show();
    }
    var container = $("#chat_container");
    var template = $('#chat_template')[0].text;

    seajs.use('comment', function (comment) {
        comment.init({
            load_url: '${base}/comment/list/${ret.id}',
            post_url: '${base}/comment/submit',
            toId: '${ret.id}',
            onLoad: function (i, data) {

                var content = ContentRender.wrapItem(data.content);

                var quoto = '';
                if (data.pid > 0 && !(data.parent === null)) {
                    var pat = data.parent;
                    var pcontent = ContentRender.wrapItem(pat.content);
                    quoto = '<div class="quote"><a href="${base}/ta/' + pat.author.id + '">@' + pat.author.name + '</a>: ' + pcontent + '</div>';
                }
                var item = jQuery.format(template,
                        data.author.id,
                        data.author.avatar,
                        data.author.name,
                        data.created,
                        content,
                        data.id, quoto);
                return item;
            }
        });
    });

    seajs.use(['phiz', 'view'], function (phiz) {
        $("#c-btn").jphiz({
            base: '${base}/dist',
            textId: 'chat_text',
            lnkBoxId: 'c-lnk',
            phizBoxId: 'c-phiz'
        });
    });

</script>
</@layout>
