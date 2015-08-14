<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="right-side">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-10">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">添加客户</h3>
                    </div>
                    <form role="form" class="form-horizontal" method="post" id="classMemberAddForm"
                          action="${ctx}/member/save">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="memberName" class="col-sm-2 control-label">用户名</label>

                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="memberName" id="memberName"
                                           placeholder="用户名">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="realName" class="col-sm-2 control-label">姓名</label>

                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="realName" id="realName"
                                           placeholder="姓名">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="sex" class="col-sm-2 control-label">性别</label>

                                <div class="col-sm-5">
                                    <select name="sex" id="sex" style="width: 100%">
                                        <option value=""></option>
                                        <c:forEach items="${sex}" var="r">--%>
                                            <option value="${r}">${r.realName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="birthday" class="col-sm-2 control-label">出生日期</label>

                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="birthday" id="birthday"
                                           placeholder="出生日期">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="advisorId" class="col-sm-2 control-label">顾问</label>

                                <div class="col-sm-5">
                                    <select name="advisorId" id="advisorId" style="width: 100%">
                                        <option value=""></option>
                                        <c:forEach items="${advisors}" var="r">
                                            <option value="${r.id}">${r.realName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="address" class="col-sm-2 control-label">地址</label>

                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="address" id="address"
                                           placeholder="地址">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="comment" class="col-sm-2 control-label">备注</label>

                                <div class="col-sm-5">
                                    <div class="col-sm-5">
                                    <textarea type="text" class="form-control" name="comment" id="comment"
                                              placeholder="备注"></textarea>
                                    </div>
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

