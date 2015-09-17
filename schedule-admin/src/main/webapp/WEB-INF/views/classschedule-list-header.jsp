<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<script type="text/javascript" src="${ctx}/asset/js/plugins/datetimepicke/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
        src="${ctx}/asset/js/plugins/datetimepicke/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<link type="text/css" href="${ctx}/asset/js/plugins/datetimepicke/css/bootstrap-datetimepicker.min.css"
      rel="stylesheet"/>

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

    function addNewSchedule() {
        window.location.href = "${ctx}/schedule/${scheduleType}/add";
    }

    function finishSchedule(id) {
        $('#ev_scheduleid').val(id);
        $('#cmModal').modal('show');
    }

    function deleteSchedule(id) {
        if (window.confirm("您确定要删除该会员吗？")) {
            window.location.href = "${ctx}/schedule/${scheduleType}/delete/" + id;
        }
    }

    function editSchedule(id) {
        window.location.href = "${ctx}/schedule/${scheduleType}/edit/" + id;
    }

    $(document).ready(function () {
        $("#queryDate").datetimepicker({
            format: 'yyyy-mm-dd', language: 'zh-CN',
            pickDate: true,
            pickTime: false,
            minView: 2, autoclose: true
        });

        if (${totalPage>0}) {
            createPaginator("paginator", ${page}, ${totalPage}, "${ctx}/schedule/${scheduleType}/list");
        }
    });

</script>