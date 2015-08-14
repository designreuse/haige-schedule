<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${ctx}/asset/js/plugins/bspaginator/bootstrap-paginator.js"></script>
<script type="text/javascript">

    function addNewClassType() {
        window.location.href = "${ctx}/classtype/add";
    }


    function deleteClassType(id) {
        if (window.confirm("您确定要删除该方案吗？")) {
            window.location.href = "${ctx}/classtype/delete/" + id;
        }
    }

    function editClassType(id) {
        window.location.href = "${ctx}/classtype/edit/" + id;
    }

    $(document).ready(function () {

    });

</script>