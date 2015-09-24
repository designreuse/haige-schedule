<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<head>
    <meta charset="utf-8"/>
    <title>Simple demo</title>
    <script type="text/javascript" src="${ctx}/asset/imageupload/scripts/swfobject.js"></script>
    <script type="text/javascript" src="${ctx}/asset/imageupload/scripts/fullAvatarEditor.js"></script>
</head>
<body>
<div style="width:630px;margin: 0 auto;">
    <h1 style="text-align:center">会员头像编辑</h1>

    <div>
        <p id="swfContainer">
            本组件需要安装Flash Player后才可使用，请从<a href="http://www.adobe.com/go/getflashplayer">这里</a>下载安装。
        </p>
    </div>
    <%--<p style="text-align:center">--%>
    <%--<button type="button" id="upload">自定义上传按钮</button>--%>
    <%--</p>--%>
</div>
<script type="text/javascript">
    swfobject.addDomLoadEvent(function () {
        var swf = new fullAvatarEditor("swfContainer", {
                    id: 'swf',
                    upload_url: '${ctx}/member/savePic/${memberId}',
                    src_upload: 2
                }, function (msg) {
                    switch (msg.code) {
                        case 1 :
//                            alert("页面成功加载了组件！");
                            break;
                        case 2 :
//                            alert("已成功加载默认指定的图片到编辑面板。");
                            break;
                        case 3 :
                            if (msg.type == 0) {
//                                alert("摄像头已准备就绪且用户已允许使用。");
                            }
                            else if (msg.type == 1) {
                                alert("摄像头已准备就绪但用户未允许使用！");
                            }
                            else {
                                alert("摄像头被占用！");
                            }
                            break;
                        case 5 :
                            location.replace("${ctx}/member/edit/${memberId}");
                            break;
                    }
                }
        );

    });
</script>
</body>