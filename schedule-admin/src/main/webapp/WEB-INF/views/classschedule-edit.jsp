<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="right-side">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-10">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">修改课程安排</h3>
                    </div>
                    <form role="form" class="form-horizontal" method="post" id="scheduleEditForm"
                          action="${ctx}/schedule/save">
                        <div class="box-body">
                            <input type="hidden" id="id" name="id" value="${schedule.id}"/>

                            <div class="form-group">
                                <label for="classId" class="col-sm-2 control-label">课程</label>

                                <div class="col-sm-5">
                                    <select name="classId" id="classId" style="width: 100%">
                                        <c:forEach items="${classes}" var="r">
                                            <option value="${r.id}"
                                                    <c:if test="${schedule.classBase.id==r.id}">selected</c:if> >${r.name}-${r.type}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="teacherId" class="col-sm-2 control-label">教练</label>

                                <div class="col-sm-5">
                                    <select name="teacherId" id="teacherId" style="width: 100%">
                                        <c:forEach items="${teachers}" var="r">
                                            <option value="${r.id}"
                                                    <c:if test="${schedule.teacher.id==r.id}">selected</c:if> >${r.realName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="scheduleDate" class="col-sm-2 control-label">日期</label>

                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="scheduleDate" id="scheduleDate"
                                           value="${schedule.scheduleDate}" placeholder="日期">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="startTime" class="col-sm-2 control-label">开始时间</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="startTime" id="startTime"
                                           value="<fmt:formatDate value="${schedule.startTime}"  pattern="HH:mm"/>"
                                           placeholder="开始时间" readonly style="cursor:pointer">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="endTime" class="col-sm-2 control-label">结束时间</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="endTime" id="endTime"
                                           value="<fmt:formatDate value="${schedule.endTime}"  pattern="HH:mm"/>"
                                           placeholder="结束时间" readonly style="cursor:pointer">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="comment" class="col-sm-2 control-label">备注</label>

                                <div class="col-sm-5">
                                    <textarea type="text" class="form-control" name="comment" id="comment"
                                              placeholder="备注">${schedule.comment}</textarea>
                                </div>
                            </div>
                            <div class="box box-info">
                                <h4 class="box-title">修改课程学员<span class="text-muted">(修改后将会自动保存)</span></h4>

                                <div class="box-header" style="text-align: center;margin: 0">
                                    <a id="addCMBtn" class="btn btn-primary btn-flat"
                                       onclick="addCM()">添加学员
                                    </a>
                                </div>

                                <div class="box-body">
                                    <table id="cmTable" style="margin-top: 10px"
                                           class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th class="text-center">用户名</th>
                                            <th class="text-center">姓名</th>
                                            <th class="text-center">性别</th>
                                            <th class="text-center">年龄</th>
                                            <th class="text-center">出生日期</th>
                                            <th class="text-center">顾问</th>
                                            <th class="text-center">地址</th>
                                            <th class="text-center">操 作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${not empty schedule.classMembers}">
                                            <c:forEach items="${schedule.classMembers}" var="item">
                                                <tr>
                                                    <td class="text-center">${item.member.memberName}</td>
                                                    <td class="text-center">${item.member.realName}</td>
                                                    <td class="text-center">${item.member.sex.title}</td>
                                                    <td class="text-center">${item.member.age}</td>
                                                    <td class="text-center">${item.member.birthday}</td>
                                                    <td class="text-center">${item.member.advisor.realName}</td>
                                                    <td class="text-center">${item.member.address}</td>
                                                    <td class="text-center">
                                                        <a class="btn btn-primary btn-xs"
                                                           onclick="deleteCM(${item.member.id});">
                                                            <i class="fa fa-times"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="box-footer" style="text-align: center;margin: 0">

                                </div>

                            </div>


                            <div class="box-footer" style="text-align: center;margin: 0">
                                <button type="submit" class="btn btn-primary btn-flat">保存</button>

                                <button type="button" class="btn btn-success btn-flat" style="margin-right: 20px"
                                        onclick="window.history.go(-1);">返回
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.box -->
            </div>

        </div>
    </section>
    <!-- /.content -->
</aside>

<div class="modal fade" id="cmModal" tabindex="-100" role="dialog" aria-labelledby="mcModalTitle" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 850px;">
            <div class="modal-header">
                <button class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="cmModalTitle"></h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal margin" role="form">
                    <div class="form-group">

                        <label for="cmQueryName" class="col-sm-1 control-label">姓名:</label>

                        <div class="col-sm-3">
                            <input type="text" value="${cmQueryName}" class="form-control" id="cmQueryName"
                                   name="cmQueryName" placeholder="姓名">
                        </div>

                        <label for="cmQueryAdvisorId" class="col-sm-1 control-label">顾问:</label>

                        <div class="col-sm-2">
                            <select name="cmQueryAdvisorId" id="cmQueryAdvisorId" style="width: 100%">
                                <%--<option value=""></option>--%>
                                <%--<c:forEach items="${advisors}" var="r">--%>
                                <%--<option value="${r.id}"--%>
                                <%--<c:if test="${cmQueryAdvisorId==r.id}">selected</c:if> >${r.realName}</option>--%>
                                <%--</c:forEach>--%>
                            </select>
                        </div>

                        <div class="input-group col-sm-3">
                                        <span class="input-group-btn">
                                            <button class="btn btn-primary btn-flat" type="button"
                                                    onclick="loadCMData()">查询
                                            </button>
                                        </span>
                        </div>
                    </div>
                </form>
                <table id="memberTable" class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th><input type="checkbox" id="allCheckbox" name="allCheckbox"/></th>
                        <th class="text-center">用户名</th>
                        <th class="text-center">姓名</th>
                        <th class="text-center">性别</th>
                        <th class="text-center">年龄</th>
                        <th class="text-center">出生日期</th>
                        <th class="text-center">顾问</th>
                        <th class="text-center">地址</th>
                    </tr>
                    </thead>
                    <tbody id="memberTableBody">

                    </tbody>
                </table>
                <div class="margin" style="height: 30px;">
                    <ul id="mcPaginator" class="pagination pagination-sm no-margin pull-right">asdf
                    </ul>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">关闭
                </button>
                <button type="button" class="btn btn-primary" id="mcBtn" onclick="saveMC()">添加</button>
            </div>
        </div>
    </div>
</div>
