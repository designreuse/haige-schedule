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


    function addNewLinkman(memberId) {
        window.location.href = "${ctx}/member_linkman/add?memberId=" + memberId;
    }

    function addNewLinkman(memberId) {
        window.location.href = "${ctx}/member_linkman/add?memberId=" + memberId;
    }


    function deleteLinkman(id) {
        if (window.confirm("您确定要删除该联系人吗？")) {
            window.location.href = "${ctx}/member_linkman/delete/" + id;
        }
    }

    function editLinkman(id) {
        window.location.href = "${ctx}/member_linkman/edit/" + id;
    }


    function addNewPayment(memberId) {
        window.location.href = "${ctx}/member_payment/add?memberId=" + memberId;
    }


    function deletePayment(id) {
        if (window.confirm("您确定要删除该缴费记录吗？")) {
            window.location.href = "${ctx}/member_payment/delete/" + id;
        }
    }

    function editPayment(id) {
        window.location.href = "${ctx}/member_payment/edit/" + id;
    }

    function addNewEvent(memberId) {
        window.location.href = "${ctx}/member_event/add?memberId=" + memberId;
    }


    function deleteEvent(id) {
        if (window.confirm("您确定要删除该活动吗？")) {
            window.location.href = "${ctx}/member_event/delete/" + id;
        }
    }

    function editEvent(id) {
        window.location.href = "${ctx}/member_event/edit/" + id;
    }

    function initValidator() {
        return $("#classMemberEditForm").validate({
            rules: {
                "memberName": {required: true},
                "sex": {required: true},
                "birthday": {required: true},
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
