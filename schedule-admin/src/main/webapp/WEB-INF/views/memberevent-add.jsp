<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="right-side">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">添加会员活动信息</h3>
                    </div>
                    <form role="form" class="form-horizontal" method="post" id="eventAddForm"
                          action="${ctx}/member_event/save">

                        <input type="hidden" id="memberId" name="memberId" value="${memberId}"/>
                        <input type="hidden" id="id" name="id" value="${id}"/>


                        <div class="box-body">
                            <div class="form-group">
                                <label for="creator" class="col-sm-2 control-label">创建人</label>

                                <div class="col-sm-4">
                                    <input type="text" readonly class="form-control" name="creator" id="creator"
                                           value="${currUserName}" placeholder="创建人">
                                </div>


                                <label for="eventDate" class="col-sm-2 control-label">日期</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="eventDate" id="eventDate"
                                           placeholder="日期">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="startTime" class="col-sm-2 control-label">开始时间</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="startTime" id="startTime"

                                           placeholder="开始时间" readonly style="cursor:pointer">
                                </div>

                                <label for="endTime" class="col-sm-2 control-label">结束时间</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="endTime" id="endTime"

                                           placeholder="结束时间" readonly style="cursor:pointer">
                                </div>
                            </div>

                            <div class="form-group">

                                <label for="costTimes" class="col-sm-2 control-label">消耗课时</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="costTimes" id="costTimes"
                                           placeholder="消耗课时"/>
                                </div>

                                <label for="comment" class="col-sm-2 control-label">备注</label>

                                <div class="col-sm-4">
                                    <textarea type="text" class="form-control" name="comment" id="comment"
                                              placeholder="备注"></textarea>
                                </div>
                            </div>
                            <div class="box-footer" style="text-align: center;margin: 0">
                                <shiro:hasAnyRoles name="root,admin,advisor">
                                    <button type="submit" class="btn btn-primary btn-flat">保存</button>
                                </shiro:hasAnyRoles>
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

