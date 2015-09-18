<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<head>
    <title>flash上传头像组件演示</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="Keywords" content="flash头像上传组件，仿新浪微博头像上传组件，头像图片剪裁"/>
    <meta name="Description" content="flash 上传头像，用户体验好，头像剪裁，预览组件"/>
    <style type="text/css" media="screen">
        html, body {
            height: 100%;
            background-color: #ffffff;
        }

        #flashContent {
            width: 100%;
            height: 100%;
        }
    </style>

    <script type="text/javascript">
        function uploadevent(status) {
            //alert(status);
            status += '';
            switch (status) {
                case '1':
                    var time = new Date().getTime();
                    document.getElementById('avatar_priview').innerHTML = "头像1 : <img src='1.png?" + time + "'/> <br/> 头像2: <img src='2.png?" + time + "'/><br/> 头像3: <img src='3.png?" + time + "'/>";

                    break;
                    break;
                case '-1':
                    window.location.reload();
                    break;
                default:
                    window.location.reload();
            }
        }
    </script>
</head>
<body>
<div id="altContent">


    <OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"
            WIDTH="650" HEIGHT="450" id="myMovieName">
        <PARAM NAME=movie VALUE="avatar.swf">
        <PARAM NAME=quality VALUE=high>
        <PARAM NAME=bgcolor VALUE=#FFFFFF>
        <param name="flashvars"
               value="imgUrl=${ctx}/member_pic/avatar.png&uploadUrl=${ctx}/member/savePic/1&uploadSrc=false&memberId=${memberId}"/>
        <EMBED src="${ctx}/asset/image/avatar.swf" quality=high bgcolor=#FFFFFF WIDTH="650" HEIGHT="450"
               wmode="transparent"
               flashVars="imgUrl=${ctx}/member_pic/avatar.png&uploadUrl=${ctx}/member/savePic/1&uploadSrc=false&memberId=${memberId}"
               NAME="myMovieName" ALIGN="" TYPE="application/x-shockwave-flash" allowScriptAccess="always"
               PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">
        </EMBED>
    </OBJECT>


</div>

<div id="avatar_priview"></div>

</body>
</html>