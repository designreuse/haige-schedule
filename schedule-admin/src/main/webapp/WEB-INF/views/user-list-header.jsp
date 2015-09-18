<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<style>
    .box .box-tools a {
        color: #ffffff;
    }
</style>
<script type="text/javascript" src="${ctx}/asset/js/plugins/bspaginator/bootstrap-paginator.js"></script>
<script type="text/javascript">
    function createPaginator(ulId, curPage, totalPage, toUrl) {
        var pgOptions = {
            bootstrapMajorVersion: 3,
            currentPage: curPage,
            totalPages: totalPage,
            onPageClicked: function (e, originalEvent, type, page) {
                var p = page - 1;
                window.location.href = toUrl + "?page=" + p + "&size=10";
            },
            elementCls: "pagination pagination-sm no-margin",
            itemTexts: function (type, page) {
                switch (type) {
                    case "first":
                        return "&laquo;";
                    case "prev":
                        return "&lsaquo;";
                    case "next":
                        return "&rsaquo;";
                    case "last":
                        return "&raquo;";
                    case "page":
                        return page;
                }
            }
        };
        $("#" + ulId).bootstrapPaginator(pgOptions);
    }

    function addNewUser() {
        window.location.href = "${ctx}/rbac/addUser";
    }


    function deleteUser(id) {
        if (window.confirm("您确定要删除该方案吗？")) {
            window.location.href = "${ctx}/rbac/deleteUser/" + id;
        }
    }

    function editUser(id) {
        window.location.href = "${ctx}/rbac/editUser/" + id;
    }

    function resetPassword(id) {
        if (window.confirm("您确定重置该用户密码吗？")) {
            window.location.href = "${ctx}/rbac/resetPassword/" + id;
        }
    }


    $(document).ready(function () {
        if (${totalPage>0}) {
            createPaginator("paginator", ${page}, ${totalPage}, "${ctx}/rbac/userList");
        }
    });

</script>