<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<fmt:setBundle basename="appConfig" var="appConfig"/>
<fmt:message key="question.list.type" bundle="${appConfig}" var="questionListType"/>
<aside class="left-side sidebar-offcanvas">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${ctx}/asset/img/avatar3.png" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p>你好, <shiro:principal/></p>

                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>
        <ul class="sidebar-menu">
            <li class="active">
                <a href="${ctx}/index">
                    <i class="fa fa-dashboard"></i> <span>个人面板</span>
                </a>
            </li>
            <li class="treeview active">
                <a href="#">
                    <i class="fa fa-bar-chart-o"></i>
                    <span>课程管理</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="${ctx}/store/list"><i class="fa fa-angle-double-right"></i>课程分类</a></li>
                    <li><a href="${ctx}/store/list"><i class="fa fa-angle-double-right"></i>课程信息</a></li>
                    <li><a href="${ctx}/question/list"><i class="fa fa-angle-double-right"></i>课程安排</a></li>
                </ul>
            </li>
            <li class="treeview active">
                <a href="#">
                    <i class="fa fa-laptop"></i>
                    <span>客户管理</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="${ctx}/template/new"><i class="fa fa-angle-double-right"></i>客户信息</a></li>
                    <%--<li><a href="paper.jsp"><i class="fa fa-angle-double-right"></i> 试卷生成</a></li>--%>
                </ul>
            </li>

            <li class="treeview active">
                <a href="#">
                    <i class="fa fa-edit"></i> <span>系统管理</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="${ctx}/index/admin"><i class="fa fa-angle-double-right"></i>用户管理</a></li>
                    <li><a href="${ctx}/rbac/userRolesList"><i class="fa fa-angle-double-right"></i>用户角色管理</a></li>
            </li>
        </ul>
        </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
