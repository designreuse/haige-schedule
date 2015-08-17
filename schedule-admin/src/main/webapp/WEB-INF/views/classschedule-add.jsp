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
                    <form role="form" class="form-horizontal" method="post" id="scheduleAddForm"
                          action="${ctx}/schedule/save">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="classId" class="col-sm-2 control-label">课程</label>

                                <div class="col-sm-5">
                                    <select name="classId" id="classId" style="width: 100%">
                                        <c:forEach items="${classes}" var="r">
                                            <option value="${r.id}">${r.name}-${r.type}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="teacherId" class="col-sm-2 control-label">教练</label>

                                <div class="col-sm-5">
                                    <select name="teacherId" id="teacherId" style="width: 100%">
                                        <c:forEach items="${teachers}" var="r">
                                            <option value="${r.id}">${r.realName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="scheduleDate" class="col-sm-2 control-label">日期</label>

                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="scheduleDate" id="scheduleDate"
                                           placeholder="日期">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="startTime" class="col-sm-2 control-label">开始时间</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="startTime" id="startTime"
                                           placeholder="开始时间" readonly style="cursor:pointer">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="endTime" class="col-sm-2 control-label">结束时间</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="endTime" id="endTime"
                                           placeholder="结束时间" readonly style="cursor:pointer">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="comment" class="col-sm-2 control-label">备注</label>

                                <div class="col-sm-5">
                                    <textarea type="text" class="form-control" name="comment" id="comment"
                                              placeholder="备注"></textarea>
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

