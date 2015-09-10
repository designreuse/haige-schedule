<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<script type="text/javascript" src="${ctx}/asset/js/plugins/validation/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/asset/js/plugins/validation/messages_zh.js"></script>

<script type="text/javascript">

    function initValidator() {
        return $("#phaseAddForm").validate({
            rules: {
                "name": {required: true}
            }
        });
    }

    $(document).ready(function () {
        initValidator();
    });
</script>
