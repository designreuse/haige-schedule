<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            类别管理
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
                        <h3 class="box-title">类别列表</h3>

                        <div class="box-tools pull-right" style="margin-right: 80px;">
                            <a class="btn btn-primary btn-flat" style="color: #ffffff;" role="button"
                               onclick="addNewClassBase();">新增</a>
                        </div>
                    </div>
                    <div class="box-body table-responsive">

                        <table id="typeTable" style="margin-top: 10px" class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th class="text-center">名 称</th>
                                <th class="text-center">介 绍</th>
                                <th class="text-center">备 注</th>
                                <th class="text-center">操 作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty allClasses}">
                                <c:forEach items="${allClasses}" var="item">
                                    <tr>
                                        <td class="text-center">${item.name}</td>
                                        <td class="text-center">${item.recommend}</td>
                                        <td class="text-center">${item.comment}</td>
                                        <td class="text-center">
                                            <a class="btn btn-primary btn-xs" onclick="editClassBase(${item.id});">
                                                <i class="fa fa-edit">详情</i>
                                            </a>
                                            <a class="btn btn-primary btn-xs" onclick="deleteClassBase(${item.id});">
                                                <i class="fa fa-times">删除</i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>

                            </tbody>
                        </table>

                    </div>
                </div>
                <!-- /.box -->
            </div>
        </div>
    </section>
</aside>

