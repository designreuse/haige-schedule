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
        $("#scheduleDate").datetimepicker({
            format: 'yyyy-mm-dd', language: 'zh-CN',
            pickDate: true,
            pickTime: false,
            minView: 2, autoclose: true
        });

        $("#startTime").datetimepicker({
            format: 'hh:ii',
            language: 'zh-CN',
            pickDate: false,
            pickTime: true,
            startView: 1,
            maxView: 1,
            autoclose: true
        }).on("changeDate", function (sv) {
            var end = $("#endTime").val();
            if (end && end.length > 0) {
                var start = $("#startTime").val();

                var etSec = end.split(":");
                var stSec = start.split(":");

                var stTime = new Date(sv.date.valueOf());
                stTime.setHours(stSec[0]);
                stTime.setMinutes(stSec[1]);
                var etTime = new Date(sv.date.valueOf());
                etTime.setHours(etSec[0]);
                etTime.setMinutes(etSec[1]);

                if (stTime >= etTime) {
                    alert("开始时间必须小于结束时间！");
                    $("#startTime").val("");
                }
            }
        });

        $("#endTime").datetimepicker({
            format: 'hh:ii',
            language: 'zh-CN',
            pickDate: false,
            pickTime: true,
            startView: 1,
            maxView: 1,
            autoclose: true
        }).on("changeDate", function (ev) {
            var start = $("#startTime").val();
            if (start && start.length > 0) {
                var end = $("#endTime").val();

                var etSec = end.split(":");
                var stSec = start.split(":");

                var stTime = new Date(ev.date.valueOf());
                stTime.setHours(stSec[0]);
                stTime.setMinutes(stSec[1]);
                var etTime = new Date(ev.date.valueOf());
                etTime.setHours(etSec[0]);
                etTime.setMinutes(etSec[1]);

                if (stTime >= etTime) {
                    alert("结束时间必须大于开始时间！");
                    $("#endTime").val("");
                }
            }
        });


        initValidator();
    });
</script>
