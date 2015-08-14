<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            用户管理
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
                        <h3 class="box-title">用户列表</h3>

                        <div class="box-tools pull-right" style="margin-right: 80px;">
                            <a class="btn btn-primary btn-flat" style="color: #ffffff;" role="button"
                               onclick="addNewUser();">新增用户</a>
                        </div>
                    </div>
                    <div class="box-body table-responsive">
                        <form class="form-horizontal" role="form" method="post" action="${ctx}/rbac/userList">
                            <div class="form-group">
                                <label for="queryName" class="col-sm-2 control-label">用户名:</label>

                                <div class="col-sm-3">
                                    <input type="text" value="${queryName}" class="form-control" id="queryName"
                                           name="queryName" placeholder="用户名">
                                </div>


                                <label for="queryRoleId" class="col-sm-2 control-label">角色:</label>

                                <div class="col-sm-3">
                                    <select name="queryRoleId" id="queryRoleId" style="width: 100%">
                                        <option value=""></option>
                                        <c:forEach items="${roles}" var="r">
                                            <option value="${r.id}"
                                                    <c:if test="${queryRoleId==r.id}">selected</c:if> >${r.realName}</option>
                                        </c:forEach>

                                    </select>
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
                        <table id="useTable" style="margin-top: 10px" class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th class="text-center">登陆名</th>
                                <th class="text-center">用户名</th>
                                <th class="text-center">角色</th>
                                <th class="text-center">联系电话</th>
                                <th class="text-center">微信</th>
                                <th class="text-center">操 作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty users}">
                                <c:forEach items="${users}" var="item">
                                    <tr>
                                        <td class="text-center">${item.userName}</td>
                                        <td class="text-center">${item.realName}</td>
                                        <td class="text-center">${item.role.realName}</td>
                                        <td class="text-center">${item.tel}</td>
                                        <td class="text-center">${item.weChat}</td>
                                        <td class="text-center">
                                            <a class="btn btn-primary btn-xs" onclick="editUser(${item.id});">
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            <a class="btn btn-primary btn-xs" onclick="deleteUser(${item.id});">
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

