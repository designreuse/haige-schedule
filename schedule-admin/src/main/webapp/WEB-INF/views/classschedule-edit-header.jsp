<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<script type="text/javascript" src="${ctx}/asset/js/plugins/validation/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/asset/js/plugins/validation/messages_zh.js"></script>
<script type="text/javascript" src="${ctx}/asset/js/plugins/template/jsrender.js"></script>
<script type="text/javascript" src="${ctx}/asset/js/plugins/iCheck/icheck.js"></script>
<script type="text/javascript" src="${ctx}/asset/js/plugins/bspaginator/bootstrap-paginator.js"></script>

<script type="text/javascript" src="${ctx}/asset/js/plugins/datetimepicke/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
        src="${ctx}/asset/js/plugins/datetimepicke/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<link type="text/css" href="${ctx}/asset/js/plugins/datetimepicke/css/bootstrap-datetimepicker.min.css"
      rel="stylesheet"/>
<script id="memberTableItems" type="text/x-jsrender">
    <tr>
        <td><input type="checkbox" name="idCheckbox" qid={{:id}} /></td>
        <td class="text-center">{{:memberName}}</td>
        <td class="text-center">{{:realName}}</td>
        <td class="text-center">{{:sex}}</td>
        <td class="text-center">{{:age}}</td>
        <td class="text-center">{{:birthday}}</td>
        <td class="text-center">{{:advisor.realName}}</td>
        <td class="text-center">{{:address}}</td>
    </tr>








</script>

<script id="advisorItem" type="text/x-jsrender">
    <option value="{{:id}}">{{:realName}}</option>








</script>


<script type="text/javascript">
    var mcIds = [];

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


    function createPaginator(el, curPage, totalPage) {
        if (totalPage == 0 || curPage > totalPage) {
            return;
        }
        var pgOptions = {
            bootstrapMajorVersion: 3,
            currentPage: curPage,
            totalPages: totalPage,
            elementCls: "pagination pagination-sm no-margin pull-right",
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
        $(el).bootstrapPaginator(pgOptions);
    }

    function bindAllCheckEvent() {
        $("#allCheckbox").on("ifChanged", function () {
            $("input[name='idCheckbox']").prop("checked", this.checked);
            $("input[name='idCheckbox']").trigger("change");
        })
    }

    function bindCheckboxChangeEvent() {
        $("input[name='idCheckbox']").on("change", function () {
            var qid = $(this).attr("qid");
            var sel = $(this).parent().parent().children("td.text-center")[1],
                    iel = $(sel).children()[0],
                    score = $(iel).val();
            if (this.checked) {
                if ($.inArray(qid, mcIds) == -1) {
                    mcIds.push(qid);
                }
            } else {
                var idx = $.inArray(qid, mcIds);
                if (idx != -1) {
                    mcIds.splice(idx, 1);
                }
            }
        });
    }

    function saveMC(page) {
        if (mcIds.length > 0) {
            var params = {'scheduleId':${schedule.id}, 'mcIds': mcIds};
            $.post("${ctx}/schedule/mc/save", {
                params: JSON.stringify(params)
            }, function (data) {
                if (data.success) {
                    loadCMData();
                } else {
                    alert(data.message);
                }
            });
        }
        else {
            alert("未选择学员");
        }
    }


    function deleteCM(memberId) {
        $.post("${ctx}/schedule/mc/deleteMember", {
            'scheduleId':${schedule.id},
            'memberId': memberId
        }, function (data) {
            if (data.success) {
                location.reload();
            } else {
                alert(data.message);
            }
        });

    }

    function loadCMData(page) {
        $.get("${ctx}/member/cmQuery", {
            cmScheduleId: $("#id").val(),
            cmQueryName: $("#cmQueryName").val(),
            cmQueryAdvisorId: $("#cmQueryAdvisorId").val(),
            page: page,
            size: 10
        }, function (data) {
            if (data.totalPage > 0) {
                $("#cmQueryName").val(data.cmQueryName);

                $("#memberTableBody").empty();

                var tpl = $.templates("#memberTableItems");
                $("#memberTableBody").html(tpl.render(data.members));
                bindCheckboxChangeEvent();

                $("#cmQueryAdvisorId").empty();
                var tplAd = $.templates("#advisorItem");
                $("#cmQueryAdvisorId").html("<option value=''></option>" + tplAd.render(data.advisors));
                $("#cmQueryAdvisorId").val(data.cmQueryAdvisorId);

                if (data.totalPage > 0) {
                    createPaginator("#mcPaginator", data.page, data.totalPage);
                    $("#mcPaginator").bootstrapPaginator({
                        onPageClicked: function (e, originalEvent, type, page) {
                            var p = page - 1;
                            loadCMData(p);
                        }
                    });
                }
            } else {
                $("#memberTableBody").empty();
                $("#mcPaginator").empty();
            }
        });
    }


    function addCM() {
        loadCMData();
        $('#cmModal').modal('show');
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

        bindAllCheckEvent();
        bindCheckboxChangeEvent();
        initValidator();
    });
</script>
