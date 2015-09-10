<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Right side column. Contains the navbar and content of the page -->
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="right-side">
    <section class="content-header">
        <h1>
            个人面板
        </h1>
        <ol class="breadcrumb">
            <li><a href="${ctx}/index"><i class="fa fa-dashboard"></i> 首页</a></li>
            <li class="active">个人面板</li>
        </ol>
    </section>

    <section class="content">

        <div class="row">

            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-yellow">
                    <div class="inner">
                        <h3>
                            ${mCount}
                        </h3>

                        <p>会员数</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person-add"></i>
                    </div>

                    <shiro:hasAnyRoles name="root,admin,advisor">
                        <a href="${ctx}/member/list" class="small-box-footer">
                            查看我的会员 <i class="fa fa-arrow-circle-right"></i>
                        </a>
                    </shiro:hasAnyRoles>
                    <shiro:hasAnyRoles name="coach">
                        <div class="small-box-footer">
                            <i class="fa fa-arrow-circle-right"></i>
                        </div>
                    </shiro:hasAnyRoles>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-red">
                    <div class="inner">
                        <h3>
                            ${csCount}
                        </h3>

                        <p>当前课程安排</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-pie-graph"></i>
                    </div>
                    <a href="${ctx}/schedule/list" class="small-box-footer">
                        查看 <i class="fa fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>
            <!-- ./col -->
        </div>


        <div class="row">
            <section class="col-lg-6 connectedSortable">
                <div class="box box-warning">
                    <div class="box-header">
                        <i class="fa fa-calendar"></i>

                        <div class="box-title">日历</div>

                        <!-- tools box -->
                        <div class="pull-right box-tools">
                            <!-- button with a dropdown -->
                            <div class="btn-group">
                                <button class="btn btn-warning btn-sm dropdown-toggle" data-toggle="dropdown"><i
                                        class="fa fa-bars"></i></button>
                                <ul class="dropdown-menu pull-right" role="menu">
                                    <shiro:hasAnyRoles name="root,admin">
                                        <li><a href="${ctx}/schedule/add">添加课程计划</a></li>
                                    </shiro:hasAnyRoles>
                                    <li><a href="${ctx}/schedule/list">查看课程计划</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- /. tools -->
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <!--The calendar -->
                        <div id="calendar"></div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </section>
            <section class="col-lg-6 connectedSortable">

            </section>
        </div>
    </section>
    <!-- /.content -->
</aside>
<!-- /.right-side -->