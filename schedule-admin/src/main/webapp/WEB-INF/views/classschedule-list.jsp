<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            课程安排管理
        </h1>
        <ol class="breadcrumb">
            <li><a href="${ctx}/index"><i class="fa fa-dashboard"></i> 首页</a></li>
        </ol>
    </section>

    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">课程安排列表</h3>

                        <div class="box-tools pull-right" style="margin-right: 80px;">
                            <a class="btn btn-primary btn-flat" style="color: #ffffff;" role="button"
                               onclick="addNewSchedule();">新增课程安排</a>
                        </div>
                    </div>
                    <div class="box-body table-responsive">
                        <form class="form-horizontal" role="form" method="post" action="${ctx}/schedule/list">
                            <div class="form-group">
                                <label for="queryName" class="col-sm-1 control-label">课程:</label>

                                <div class="col-sm-2">
                                    <input type="text" value="${queryName}" class="form-control"
                                           id="queryName"
                                           name="queryName" placeholder="课程">
                                </div>

                                <label for="queryTeacherId" class="col-sm-1 control-label">教练:</label>

                                <div class="col-sm-2">
                                    <select name="queryTeacherId" id="queryTeacherId" style="width: 100%">
                                        <option value=""></option>
                                        <c:forEach items="${teachers}" var="r">
                                            <option value="${r.id}"
                                                    <c:if test="${queryTeacherId==r.id}">selected</c:if> >${r.realName}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <label for="queryDate" class="col-sm-2 control-label">日期:</label>

                                <div class="col-sm-2">
                                    <input type="text" value="${queryScheduleDate}" class="form-control"
                                           id="queryDate"
                                           name="queryDate" placeholder="日期">
                                </div>


                                <div class="col-sm-2">
                                <span class="input-group-btn">
                                    <button type="submit"
                                            class="btn btn-primary btn-flat">查询
                                    </button>
                                </span>
                                </div>
                            </div>


                        </form>
                        <table id="scheduleTable" style="margin-top: 10px" class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th class="text-center">课程</th>
                                <th class="text-center">教练</th>
                                <th class="text-center">日期</th>
                                <th class="text-center">开始时间</th>
                                <th class="text-center">结束时间</th>
                                <th class="text-center" width="10%">学员</th>
                                <th class="text-center" style="width: 100px">操 作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty schedules}">
                                <c:forEach items="${schedules}" var="item">
                                    <tr>
                                        <td class="text-center">${item.classBase.name}-${item.classBase.type}</td>
                                        <td class="text-center">${item.teacher.realName}</td>
                                        <td class="text-center">${item.scheduleDate}</td>
                                        <td class="text-center">
                                            <fmt:formatDate value="${item.startTime}" pattern="HH:mm"/>
                                        </td>
                                        <td class="text-center">
                                            <fmt:formatDate value="${item.endTime}" pattern="HH:mm"/>
                                        </td>
                                        <td class="text-center" style="WORD-WRAP: break-word">
                                            <c:forEach items="${item.members}" var="member">
                                                ${member.realName}
                                            </c:forEach>
                                        </td>
                                        <td class="text-center">
                                            <a class="btn btn-primary btn-xs" onclick="finishSchedule(${item.id});">
                                                <i class="fa fa-play"></i>
                                            </a>
                                            <a class="btn btn-primary btn-xs" onclick="editSchedule (${item.id});">
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            <a class="btn btn-primary btn-xs" onclick="deleteSchedule(${item.id});">
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
                        <p class="pull-left">共 <span>${totalCount}</span> 项&nbsp;&nbsp;页次 : <span><span
                                style="color: red; "><c:choose><c:when
                                test="${totalPage==0}">0</c:when><c:otherwise>${page}</c:otherwise></c:choose></span> / ${totalPage}</span>
                        </p>
                        <ul id="paginator" class="pagination">
                        </ul>
                    </div>
                </div>
                <!-- /.box -->
            </div>
        </div>
    </section>
</aside>


<div class="modal fade" id="cmModal" tabindex="-100" role="dialog" aria-labelledby="mcModalTitle" aria-hidden="true">
    <div class="modal-dialog">
        <form role="form" class="form-horizontal" method="post" id="scheduleEditForm"
              action="${ctx}/schedule/finish">
            <div class="modal-content" style="width: 550px;">
                <button class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div class="modal-header">
                    <h4 class="modal-title" id="cmModalTitle">结束课程</h4>
                </div>
                <div class="modal-body" style="height: 100px;">

                    <div class="box-body">
                        <input type="hidden" id="ev_scheduleid" name="ev_scheduleid"/>

                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="evaluation" class="col-sm-2 control-label">评价</label>

                                <div class="col-sm-10">
                                    <textarea type="text" class="form-control" name="evaluation" id="evaluation"
                                              placeholder="评价"></textarea>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary btn-flat">结束课程</button>
                </div>
            </div>
        </form>
    </div>
</div>
