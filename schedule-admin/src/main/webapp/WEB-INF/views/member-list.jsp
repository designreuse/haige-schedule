<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="zh">
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            会员管理
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
                        <h3 class="box-title">会员列表</h3>
                        <shiro:hasAnyRoles name="root,admin,advisor">

                            <div class="box-tools pull-right" style="margin-right: 80px;">
                                <a class="btn btn-primary btn-flat" style="color: #ffffff;" role="button"
                                   onclick="addNewMember();">新增会员</a>
                            </div>
                        </shiro:hasAnyRoles>
                    </div>
                    <div class="box-body table-responsive">
                        <form class="form-horizontal" role="form" method="post" action="${ctx}/member/list">
                            <div class="form-group">
                                <label for="queryName" class="col-sm-1 control-label">姓名</label>

                                <div class="col-sm-2">
                                    <input type="text" value="${queryName}" class="form-control" id="queryName"
                                           name="queryName" placeholder="姓名">
                                </div>

                                <label for="queryBirthYear" class="col-sm-2 control-label">出生年</label>

                                <div class="col-sm-2">
                                    <input type="text" value="${queryBirthYear}" class="form-control"
                                           id="queryBirthYear"
                                           name="queryBirthYear" placeholder="出生年">
                                </div>

                                <label for="queryPhaseId" class="col-sm-1 control-label">阶段</label>

                                <div class="col-sm-1">
                                    <select name="queryPhaseId" id="queryPhaseId" style="width: 100%">
                                        <option value=""></option>
                                        <c:forEach items="${phases}" var="r">
                                            <option value="${r.id}"
                                                    <c:if test="${queryPhaseId==r.id}">selected</c:if> >${r.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <shiro:hasAnyRoles name="root,admin,cashier">

                                    <label for="queryAdvisorId" class="col-sm-1 control-label">顾问</label>

                                    <div class="col-sm-1">
                                        <select name="queryAdvisorId" id="queryAdvisorId" style="width: 100%">
                                            <option value=""></option>
                                            <c:forEach items="${advisors}" var="r">
                                                <option value="${r.id}"
                                                        <c:if test="${queryAdvisorId==r.id}">selected</c:if> >${r.realName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </shiro:hasAnyRoles>

                                <div class="col-sm-1">
                                <span class="input-group-btn">
                                    <button type="submit"
                                            class="btn btn-primary btn-flat">查询
                                    </button>
                                </span>
                                </div>
                            </div>


                        </form>
                        <table id="memberTable" style="margin-top: 10px" class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th class="text-center">昵称</th>
                                <th class="text-center">姓名</th>
                                <th class="text-center">剩余课时</th>
                                <th class="text-center">有效期</th>
                                <th class="text-center">性别</th>
                                <th class="text-center">年龄</th>
                                <th class="text-center">出生日期</th>
                                <th class="text-center">阶段</th>
                                <th class="text-center">顾问</th>
                                <th class="text-center">地址</th>
                                <th class="text-center" style="width: 210px">操 作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty members}">
                                <c:forEach items="${members}" var="item">
                                    <tr>
                                        <td class="text-center">${item.memberName}</td>
                                        <td class="text-center">${item.realName}</td>
                                        <td class="text-center">${item.leftTime}</td>
                                        <c:set var="nowDate" value="<%=new Date()%>"></c:set>
                                        <td class="text-center"
                                                <c:if test="${item.endDate < nowDate}"> style="background-color: indianred" </c:if>
                                                >${item.endDate}</td>
                                        <td class="text-center">${item.sex.title}</td>
                                        <td class="text-center">${item.age}</td>
                                        <td class="text-center">${item.birthday}</td>
                                        <td class="text-center">${item.phase.name}</td>
                                        <td class="text-center">${item.advisor.realName}</td>
                                        <td class="text-center">${item.address}</td>
                                        <td class="text-center">

                                            <a class="btn btn-primary btn-xs" onclick="editMember(${item.id});">
                                                <i class="fa fa-edit">详情</i>
                                            </a>

                                            <shiro:hasAnyRoles name="root,admin,advisor">
                                                <a class="btn btn-primary btn-xs" target="_blank "
                                                   onclick="picMember(${item.id});">
                                                    <i class="fa fa-edit">设置照片</i>
                                                </a>
                                            </shiro:hasAnyRoles>

                                            <shiro:hasAnyRoles name="root,admin">
                                                <a class="btn btn-primary btn-xs" onclick="deleteMember(${item.id});">
                                                    <i class="fa fa-times">删除</i>
                                                </a>
                                            </shiro:hasAnyRoles>
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

