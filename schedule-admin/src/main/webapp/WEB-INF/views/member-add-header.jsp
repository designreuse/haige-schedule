<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<script type="text/javascript" src="${ctx}/asset/js/plugins/validation/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/asset/js/plugins/validation/messages_zh.js"></script>
<script type="text/javascript" src="${ctx}/asset/js/plugins/datetimepicke/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
        src="${ctx}/asset/js/plugins/datetimepicke/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<link type="text/css" href="${ctx}/asset/js/plugins/datetimepicke/css/bootstrap-datetimepicker.min.css"
      rel="stylesheet"/>

<script type="text/javascript">

    function initValidator() {
        return $("#memberAddForm").validate({
            rules: {
                "memberName": {required: true},
                "sex": {required: true},
                "realName": {required: true},
                "endDate": {required: true}
            }
        });
    }

    $(document).ready(function () {
        $("#birthday").datetimepicker({
            initialDate: new Date(),
            format: 'yyyy-mm-dd',
            language: 'zh-CN',
            pickDate: true,
            pickTime: false,
            minView: 2,
            autoclose: true
        });
        $("#endDate").datetimepicker({
            initialDate: new Date(),
            format: 'yyyy-mm-dd',
            language: 'zh-CN',
            pickDate: true,
            pickTime: false,
            minView: 2,
            autoclose: true
        });
        initValidator();
    });
</script>
