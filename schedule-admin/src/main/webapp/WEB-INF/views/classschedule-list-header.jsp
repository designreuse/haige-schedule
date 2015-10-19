<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${ctx}/asset/js/plugins/validation/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/asset/js/plugins/validation/messages_zh.js"></script>
<script type="text/javascript" src="${ctx}/asset/js/plugins/template/jsrender.js"></script>

<script type="text/javascript" src="${ctx}/asset/js/plugins/bspaginator/bootstrap-paginator.js"></script>

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


<script id="evaluationTableItems" type="text/x-jsrender">
     <tr>
        <td class="text-center"> <label>{{:memberName}}</label> </td>
        <td class="text-center"> <label>{{:realName}}</label> </td>
        <td class="text-center" >
         <input hidden type="text"  name="memberIds" value="{{:id}}"/>
         <input style="width: 100%" type="text" class="required" id="evaluation_{{:id}}" name="evaluations"/>
         </td>
     </tr>
</script>

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
        loadCMData();
    }

    function deleteSchedule(id) {
        if (window.confirm("您确定要删除该会员吗？")) {
            window.location.href = "${ctx}/schedule/${scheduleType}/delete/" + id;
        }
    }

    function editSchedule(id) {
        window.location.href = "${ctx}/schedule/${scheduleType}/edit/" + id;
    }

    function loadCMData(page) {
        $.ajax({
            type: "GET",
            url: "${ctx}/member/cm/memberList",
            timeout: 5000, //超时时间设置，单位毫秒
            data: {
                cmScheduleId: $("#ev_scheduleid").val()
            },
            contentType: 'application/json',
            dataType: "json",
            success: function (data) {
                $("#evaluationTableBody").empty();


                var tpl = $.templates("#evaluationTableItems");
                $("#evaluationTableBody").html(tpl.render(data.members));

                $('#cmModal').modal('show');
            }
            ,
            error: function () {
                alert("加载失败！");
            }
        })
    }

    function submitFinish() {
        var hasEmptyVal = false;
        $("input[name='evaluations']").each(function () {
            if ($("#" + this.id).val().length <= 0) {
                hasEmptyVal = true;
                return false;
            }
        });
        if (hasEmptyVal)
            alert("评价不能为空！");
        else
            $("#evaluationForm").submit();
    }

    $(document).ready(function () {
        $("#queryDate").datetimepicker({
            initialDate: new Date(),
            format: 'yyyy-mm-dd', language: 'zh-CN',
            pickDate: true,
            pickTime: false,
            minView: 2, autoclose: true
        });

        $("#evaluationForm").validate({

            rules: {
                "ev_scheduleid": {
                    required: true
                }
            }
        });

        if (${totalPage>0}) {
            createPaginator("paginator", ${page}, ${totalPage}, "${ctx}/schedule/${scheduleType}/list");
        }
    });

</script>