<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="right-side">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-10">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">添加用户</h3>
                    </div>
                    <form role="form" class="form-horizontal" method="post" id="classUserAddForm"
                          action="${ctx}/rbac/saveUser">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="userName" class="col-sm-2 control-label">登陆名</label>

                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="userName" id="userName"
                                           placeholder="登陆名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="role.id" class="col-sm-2 control-label">角色</label>

                                <div class="col-sm-5">
                                    <select name="role.id" id="role.id" style="width: 100%">
                                        <option value=""></option>
                                        <c:forEach items="${roles}" var="r">
                                            <option value="${r.id}">${r.roleName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="realName" class="col-sm-2 control-label">用户名</label>

                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="realName" id="realName"
                                           placeholder="用户名">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="tel" class="col-sm-2 control-label">联系电话</label>

                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="tel" id="tel" placeholder="联系电话">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="weChat" class="col-sm-2 control-label">微信</label>

                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="weChat" id="weChat" placeholder="微信">
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

