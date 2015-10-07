<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="right-side">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">修改课程活动</h3>
                    </div>
                    <form role="form" class="form-horizontal" method="post" id="scheduleEditForm"
                          action="${ctx}/schedule/${scheduleType}/save">
                        <div class="box-body">
                            <input type="hidden" id="id" name="id" value="${schedule.id}"/>
                            <input type="hidden" id="classId" name="classId" value="${schedule.classBase.id}"/>
                            <input type="hidden" id="creatorId" name="creatorId" value="${schedule.creator.id}"/>

                            <div class="form-group">
                                <label for="className" class="col-sm-2 control-label">类型</label>

                                <div class="col-sm-2">
                                    <input disabled name="className" id="className" style="width: 100%"
                                           value="${schedule.classBase.name}">
                                </div>

                                <label for="creatorName" class="col-sm-2 control-label">顾问</label>

                                <div class="col-sm-2">
                                    <input disabled name="creatorName" id="creatorName" style="width: 100%"
                                           value="${schedule.creator.realName}">
                                </div>

                                <label for="teacherId" class="col-sm-2 control-label">教练</label>

                                <div class="col-sm-2">
                                    <select name="teacherId" id="teacherId" style="width: 100%">
                                        <c:if test="${scheduleType==2}">
                                            <option value=""></option>
                                        </c:if>
                                        <c:forEach items="${teachers}" var="r">
                                            <option value="${r.id}"
                                                    <c:if test="${schedule.teacher.id==r.id}">selected</c:if> >${r.realName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="scheduleDate" class="col-sm-2 control-label">日期</label>

                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="scheduleDate" id="scheduleDate"
                                           value="${schedule.scheduleDate}" placeholder="日期">
                                </div>

                                <label for="startTime" class="col-sm-2 control-label">开始时间</label>

                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="startTime" id="startTime"
                                           value="<fmt:formatDate value="${schedule.startTime}"  pattern="HH:mm"/>"
                                           placeholder="开始时间" readonly style="cursor:pointer">
                                </div>

                                <label for="endTime" class="col-sm-2 control-label">结束时间</label>

                                <div class="col-sm-2">
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

                                <c:if test="${scheduleType==1}">
                                    <input hidden name="costTimes" id="costTimes1" value="${schedule.costTimes}">
                                </c:if>
                                <c:if test="${scheduleType==2}">
                                    <label for="costTimes2" class="col-sm-2 control-label">扣除课时</label>

                                    <div class="col-sm-2">
                                        <input type="text" class="form-control,required,digits" name="costTimes"
                                               id="costTimes2" value="${schedule.costTimes}"
                                               placeholder="扣除课时">
                                    </div>
                                </c:if>

                            </div>
                            <div class="box box-info">
                                <h4 class="box-title">课程学员<span class="text-muted">(修改后将会自动保存)</span></h4>
                                <shiro:hasAnyRoles name="root,admin,advisor">
                                    <div class="box-header" style="text-align: center;margin: 0">
                                        <a id="addCMBtn" class="btn btn-primary btn-flat"
                                           onclick="addCM()">添加学员
                                        </a>
                                    </div>
                                </shiro:hasAnyRoles>
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
                                            <th class="text-center">阶段</th>
                                            <th class="text-center">地址</th>
                                            <th class="text-center">操 作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${not empty schedule.members}">
                                            <c:forEach items="${schedule.members}" var="item">
                                                <tr>
                                                    <td class="text-center">${item.memberName}</td>
                                                    <td class="text-center">${item.realName}</td>
                                                    <td class="text-center">${item.sex.title}</td>
                                                    <td class="text-center">${item.age}</td>
                                                    <td class="text-center">${item.birthday}</td>
                                                    <td class="text-center">${item.advisor.realName}</td>
                                                    <td class="text-center">${item.phase.name}</td>
                                                    <td class="text-center">${item.address}</td>
                                                    <td class="text-center">
                                                        <a class="btn btn-primary btn-xs"
                                                           onclick="deleteCM(${item.id});">
                                                            <i class="fa fa-times">删除</i>
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
                                <shiro:hasAnyRoles name="root,admin">
                                    <button type="submit" class="btn btn-primary btn-flat">保存</button>
                                </shiro:hasAnyRoles>
                                <button type="button" class="btn btn-success btn-flat" style="margin-right: 20px"
                                        onclick="window.location.href = '${ctx}/schedule/${scheduleType}/list'">返回
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

                        <div class="col-sm-2">
                            <input type="text" value="${cmQueryName}" class="form-control" id="cmQueryName"
                                   name="cmQueryName" placeholder="姓名">
                        </div>

                        <label for="cmQueryAdvisorId" class="col-sm-1 control-label">顾问:</label>

                        <div class="col-sm-2">
                            <select name="cmQueryAdvisorId" id="cmQueryAdvisorId" style="width: 100%">
                            </select>
                        </div>

                        <label for="cmQueryPhaseId" class="col-sm-1 control-label">阶段:</label>

                        <div class="col-sm-2">
                            <select name="cmQueryPhaseId" id="cmQueryPhaseId" style="width: 100%">
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
                        <th class="text-center">剩余课时</th>
                        <th class="text-center">性别</th>
                        <th class="text-center">年龄</th>
                        <th class="text-center">出生日期</th>
                        <th class="text-center">顾问</th>
                        <th class="text-center">阶段</th>
                        <th class="text-center">地址</th>
                    </tr>
                    </thead>
                    <tbody id="memberTableBody">

                    </tbody>
                </table>
                <div class="margin" style="height: 30px;">
                    <ul id="mcPaginator" class="pagination pagination-sm no-margin pull-right">
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
