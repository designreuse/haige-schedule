<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${ctx}/asset/js/plugins/bspaginator/bootstrap-paginator.js"></script>
<script type="text/javascript">

    function addNewClassBase() {
        window.location.href = "${ctx}/classbase/add";
    }


    function deleteClassBase(id) {
        if (window.confirm("您确定要删除该课程吗？")) {
            window.location.href = "${ctx}/classbase/delete/" + id;
        }
    }

    function editClassBase(id) {
        window.location.href = "${ctx}/classbase/edit/" + id;
    }

    $(document).ready(function () {

    });

</script>