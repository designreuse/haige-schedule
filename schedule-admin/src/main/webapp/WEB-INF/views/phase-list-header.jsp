<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${ctx}/asset/js/plugins/bspaginator/bootstrap-paginator.js"></script>
<script type="text/javascript">

    function addNewPhase() {
        window.location.href = "${ctx}/phase/add";
    }


    function deletePhase(id) {
        if (window.confirm("您确定要删除该阶段吗？")) {
            window.location.href = "${ctx}/phase/delete/" + id;
        }
    }

    function editPhase(id) {
        window.location.href = "${ctx}/phase/edit/" + id;
    }

    $(document).ready(function () {

    });

</script>