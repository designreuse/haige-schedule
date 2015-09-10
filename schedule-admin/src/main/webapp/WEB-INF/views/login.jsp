<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html class="bg-black">
<head>
    <meta charset="UTF-8">
    <title>管理系统后台-登录</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- bootstrap 3.0.2 -->
    <link href="${ctx}/asset/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <!-- font Awesome -->
    <link href="${ctx}/asset/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    <!-- Theme style -->
    <link href="${ctx}/asset/css/AdminLTE.css" rel="stylesheet" type="text/css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>

    <script src="${ctx}/asset/js/html5shiv.min.js"></script>

    <script src="${ctx}/asset/js/respond.min.js"></script>
    <![endif]-->


</head>
<body class="bg-black">

<div class="form-box" id="login-box">
    <div class="header">管理系统后台</div>
    <form action="${ctx}/login" method="post" id="loginForm">
        <div class="body bg-gray">
            <div class="form-group">
                <input type="text" name="username" id="username" class="form-control" placeholder="用户名"/>
            </div>
            <div class="form-group">
                <input type="password" name="password" id="password" class="form-control" placeholder="密码"/>
            </div>
            <div class="form-group">
                <p>${info}</p>
            </div>
            <%--<div class="form-group">--%>
            <%--<input type="checkbox" name="rememberMe" id="rememberMe"/> 记住我--%>
            <%--</div>--%>
        </div>
        <div class="footer">
            <button type="submit" class="btn bg-olive btn-block">登 录</button>
            <%--<p><a href="#">忘记密码?</a></p>--%>
        </div>
    </form>

</div>


<script src="${ctx}/asset/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${ctx}/asset/js/jquery-ui-1.10.3.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/asset/js/plugins/validation/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/asset/js/plugins/validation/messages_zh.js"></script>

<!-- Bootstrap -->
<script src="${ctx}/asset/js/bootstrap.js" type="text/javascript"></script>


<script type="text/javascript">
    function initValidator() {
        return $("#loginForm").validate({
            rules: {
                "username": {required: true},
                "password": {required: true}
            }
        });
    }

    $(document).ready(function () {
        initValidator();
    });
</script>

</body>
</html>
