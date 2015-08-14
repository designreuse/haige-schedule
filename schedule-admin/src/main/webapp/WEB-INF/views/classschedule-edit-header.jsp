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
        return $("#scheduleEditForm").validate({
            rules: {
                "classId": {required: true},
                "teacherId": {required: true},
                "scheduleDate": {required: true},
                "startTime": {required: true},
                "endTime": {required: true}
            }
        });
    }

    $(document).ready(function () {
        $("#scheduleDate").datetimepicker({format: 'yyyy-mm-dd', language: 'zh-CN', minView: 2, autoclose: true});

        $("#startTime").datetimepicker({
            format: 'hh:ii',
            language: 'zh-CN',
            startView: 1,
            maxView: 1,
            autoclose: true
        });
        $("#endTime").datetimepicker({
            format: 'hh:ii',
            language: 'zh-CN',
            startView: 1,
            maxView: 1,
            autoclose: true
        });

        initValidator();
    });
</script>
