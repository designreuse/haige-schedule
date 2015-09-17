<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="right-side">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">添加会员</h3>
                    </div>
                    <form role="form" class="form-horizontal" method="post" id="memberAddForm"
                          action="${ctx}/member/saveNew">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="memberName" class="col-sm-2 control-label">昵称</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="memberName" id="memberName"
                                           placeholder="昵称">
                                </div>

                                <label for="realName" class="col-sm-2 control-label">姓名</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="realName" id="realName"
                                           placeholder="姓名">
                                </div>
                            </div>

                            <div class="form-group">

                            </div>


                            <div class="form-group">
                                <label for="sex" class="col-sm-2 control-label">性别</label>

                                <div class="col-sm-2">
                                    <select name="sex" id="sex" style="width: 100%">
                                        <option value=""></option>
                                        <c:forEach items="${sex}" var="r">--%>
                                            <option value="${r}">${r.title}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <label for="phaseId" class="col-sm-2 control-label">阶段</label>

                                <div class="col-sm-2">
                                    <select name="phaseId" id="phaseId" style="width: 100%">
                                        <option value=""></option>
                                        <c:forEach items="${phases}" var="r">
                                            <option value="${r.id}">${r.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <shiro:hasAnyRoles name="root,admin">
                                    <label for="advisorId" class="col-sm-2 control-label">顾问</label>

                                    <div class="col-sm-2">
                                        <select name="advisorId" id="advisorId" style="width: 100%">
                                            <option value=""></option>
                                            <c:forEach items="${advisors}" var="r">
                                                <option value="${r.id}">${r.realName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </shiro:hasAnyRoles>
                            </div>

                            <div class="form-group">
                                <label for="birthday" class="col-sm-2 control-label">出生日期</label>

                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="birthday" id="birthday"
                                           placeholder="出生日期">
                                </div>

                                <label for="proType" class="col-sm-2 control-label">产品类型</label>

                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="proType" id="proType"
                                           placeholder="产品类型">
                                </div>

                                <label for="registrationChannel" class="col-sm-2 control-label">报名渠道</label>

                                <div class="col-sm-2">

                                    <input type="text" class="form-control" name="registrationChannel"
                                           id="registrationChannel"
                                           placeholder="报名渠道">
                                </div>
                            </div>

                            <div class="form-group">

                            </div>

                            <div class="form-group">
                                <label for="address" class="col-sm-2 control-label">地址</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="address" id="address"
                                           placeholder="地址">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="comment" class="col-sm-2 control-label">备注</label>

                                <div class="col-sm-10">
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

