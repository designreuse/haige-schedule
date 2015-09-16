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


            <shiro:hasAnyRoles name="root,admin,advisor,coach,cashier">
                <li class="treeview active">
                    <a href="#">
                        <i class="fa fa-bar-chart-o"></i>
                        <span>课程管理</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <shiro:hasAnyRoles name="root">
                            <li><a href="${ctx}/classbase/list"><i class="fa fa-angle-double-right"></i>课程基本信息</a></li>
                        </shiro:hasAnyRoles>
                        <li><a href="${ctx}/schedule/list"><i class="fa fa-angle-double-right"></i>课程安排</a></li>
                    </ul>
                </li>
            </shiro:hasAnyRoles>

            <shiro:hasAnyRoles name="root,admin,advisor,cashier">
                <li class="treeview active">
                    <a href="#">
                        <i class="fa fa-laptop"></i>
                        <span>会员管理</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="${ctx}/member/list"><i class="fa fa-angle-double-right"></i>会员信息</a></li>
                    </ul>
                </li>
            </shiro:hasAnyRoles>

            <shiro:hasAnyRoles name="root,admin">
                <li class="treeview active">
                    <a href="#">
                        <i class="fa fa-edit"></i> <span>系统管理</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="${ctx}/rbac/userList"><i class="fa fa-angle-double-right"></i>用户管理</a></li>
                        <shiro:hasAnyRoles name="root">
                            <li><a href="${ctx}/phase/list"><i class="fa fa-angle-double-right"></i>阶段管理</a></li>
                        </shiro:hasAnyRoles>
                    </ul>
                </li>
            </shiro:hasAnyRoles>

            <shiro:hasAnyRoles name="root,admin,advisor,coach">
                <li class="treeview active">
                    <a href="#">
                        <i class="fa fa-laptop"></i>
                        <span>报表统计</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="${ctx}/report/schedule"><i class="fa fa-angle-double-right"></i>课程安排</a></li>
                        <li><a href="${ctx}/report/his_schedule"><i class="fa fa-angle-double-right"></i>历史课程</a></li>
                        <shiro:hasAnyRoles name="root,admin,advisor">
                            <li><a href="${ctx}/report/member"><i class="fa fa-angle-double-right"></i>会员信息</a></li>
                        </shiro:hasAnyRoles>
                        <shiro:hasAnyRoles name="coach">
                            <li><a href="${ctx}/report/coach_member"><i class="fa fa-angle-double-right"></i>会员信息</a>
                            </li>
                        </shiro:hasAnyRoles>
                    </ul>
                </li>
            </shiro:hasAnyRoles>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
