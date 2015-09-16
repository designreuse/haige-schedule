<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="right-side">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">修改会员联系人</h3>
                    </div>
                    <form role="form" class="form-horizontal" method="post" id="linkmanEditForm"
                          action="${ctx}/member_linkman/save">

                        <input type="hidden" id="memberId" name="memberId" value="${memberId}"/>
                        <input type="hidden" id="id" name="id" value="${id}"/>

                        <div class="box-body">
                            <div class="form-group">
                                <label for="name" class="col-sm-2 control-label">姓名</label>

                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="name" id="name"
                                           value="${linkman.name}" placeholder="姓名">
                                </div>


                                <label for="sex" class="col-sm-2 control-label">性别</label>

                                <div class="col-sm-2">
                                    <select name="sex" id="sex" style="width: 100%">
                                        <c:forEach items="${sex}" var="r">
                                            <option value="${r}"
                                                    <c:if test="${linkman.sex==r}">selected</c:if>>${r.title}</option>
                                        </c:forEach>

                                    </select>
                                </div>


                                <label for="relation" class="col-sm-2 control-label">关系</label>

                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="relation" id="relation"
                                           value="${linkman.relation}" placeholder="与客户关系"/>
                                </div>
                            </div>

                            <shiro:hasAnyRoles name="root,admin,advisor,coach">
                            <div class="form-group">
                                <label for="tel" class="col-sm-2 control-label">电话</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="tel" id="tel"
                                           value="${linkman.tel}" placeholder="电话"/>
                                </div>

                                <label for="weChat" class="col-sm-2 control-label">微信</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="weChat" id="weChat"
                                           value="${linkman.weChat}" placeholder="微信"/>
                                </div>
                            </div>
                            </shiro:hasAnyRoles>

                            <div class="box-footer" style="text-align: center;margin: 0">
                                <shiro:hasAnyRoles name="root,admin,advisor">
                                    <button type="submit" class="btn btn-primary btn-flat">保存</button>
                                </shiro:hasAnyRoles>
                                <button type="button" class="btn btn-success btn-flat" style="margin-right: 20px"
                                        onclick="window.history.go(-1);">返回
                                </button>
                            </div>
                    </form>
                </div>
                <!-- /.box -->
            </div>

        </div>
    </section>
    <!-- /.content -->
</aside>

