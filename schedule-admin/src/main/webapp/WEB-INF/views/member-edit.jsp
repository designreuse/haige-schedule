<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="right-side">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">修改会员</h3>
                    </div>
                    <form role="form" class="form-horizontal" method="post" id="classMemberEditForm"
                          action="${ctx}/member/save">
                        <div class="box-body">
                            <input type="hidden" id="id" name="id" value="${member.id}"/>


                            <div class="form-group">
                                <label for="memberName" class="col-sm-2 control-label">用户名</label>

                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="memberName" id="memberName"
                                           value="${member.memberName}" placeholder="用户名">
                                </div>

                                <label for="realName" class="col-sm-2 control-label">姓名</label>

                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="realName" id="realName"
                                           value="${member.realName}" placeholder="姓名">
                                </div>

                                <label for="leftTime" class="col-sm-2 control-label">剩余课时</label>

                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="leftTime" id="leftTime"
                                           disabled value="${member.leftTime}" placeholder="剩余课时">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="sex" class="col-sm-2 control-label">性别</label>

                                <div class="col-sm-2">
                                    <select name="sex" id="sex" style="width: 100%">
                                        <c:forEach items="${sex}" var="r">
                                            <option value="${r}"
                                                    <c:if test="${member.sex==r}">selected</c:if>>${r.title}</option>
                                        </c:forEach>

                                    </select>
                                </div>

                                <label for="phaseId" class="col-sm-2 control-label">阶段</label>

                                <div class="col-sm-2">
                                    <select name="phaseId" id="phaseId" style="width: 100%">
                                        <c:forEach items="${phases}" var="r">
                                            <option value="${r.id}"
                                                    <c:if test="${member.phase.id==r.id}">selected</c:if>>${r.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <shiro:hasAnyRoles name="root,admin">
                                    <label for="advisorId" class="col-sm-2 control-label">顾问</label>

                                    <div class="col-sm-2">
                                        <select name="advisorId" id="advisorId" style="width: 100%">
                                            <c:forEach items="${advisors}" var="r">
                                                <option value="${r.id}"
                                                        <c:if test="${member.advisor.id==r.id}">selected</c:if> >${r.realName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </shiro:hasAnyRoles>
                            </div>

                            <div class="form-group">
                                <label for="birthday" class="col-sm-2 control-label">出生日期</label>

                                <div class="col-sm-2">

                                    <input type="text" class="form-control" name="birthday" id="birthday"
                                           value="${member.birthday}" placeholder="出生日期">
                                </div>
                                <shiro:hasAnyRoles name="root,admin,advisor,coach">
                                    <label for="proType" class="col-sm-2 control-label">产品类型</label>

                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" name="proType" id="proType"
                                               placeholder="产品类型">
                                    </div>

                                    <label for="registrationChannel" class="col-sm-2 control-label">报名渠道</label>

                                    <div class="col-sm-2">

                                        <input type="text" class="form-control" name="registrationChannel"
                                               id="registrationChannel"
                                               value="${member.registrationChannel}" placeholder="报名渠道">
                                    </div>
                                </shiro:hasAnyRoles>
                            </div>


                            <div class="form-group">
                                <shiro:hasAnyRoles name="root,admin,advisor,coach">
                                    <label for="address" class="col-sm-2 control-label">地址</label>

                                    <div class="col-sm-4">
                                    <textarea type="text" class="form-control" name="address" id="address"
                                              placeholder="地址">${member.address}</textarea>
                                    </div>
                                </shiro:hasAnyRoles>
                                <label for="comment" class="col-sm-2 control-label">备注</label>

                                <div class="col-sm-4">
                                    <textarea type="text" class="form-control" name="comment" id="comment"
                                              placeholder="备注">${member.comment}</textarea>
                                </div>
                            </div>


                            <div class="box-footer" style="text-align: center;margin: 0">
                                <shiro:hasAnyRoles name="root,admin,advisor">
                                    <button type="submit" class="btn btn-primary btn-flat">保存</button>
                                </shiro:hasAnyRoles>
                                <button type="button" class="btn btn-success btn-flat" style="margin-right: 20px"
                                        onclick="window.location.href = '${ctx}/member/list'">返回
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- /.box -->
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">会员联系人</h3>
                        <shiro:hasAnyRoles name="root,admin,advisor">
                            <div class="box-tools pull-right" style="margin-right: 80px;">
                                <a class="btn btn-primary btn-flat" style="color: #ffffff;" role="button"
                                   onclick="addNewLinkman(${member.id});">添加联系人</a>
                            </div>
                        </shiro:hasAnyRoles>
                    </div>
                    <div class="box-body">
                        <table id="linkManTable" class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th class="text-center">姓名</th>
                                <th class="text-center">关系</th>
                                <th class="text-center">性别</th>
                                <th class="text-center">电话</th>
                                <th class="text-center">微信</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty member.linkman}">
                            <c:forEach items="${member.linkman}" var="item">
                            <tr>
                                <td class="text-center">${item.name}</td>
                                <td class="text-center">${item.relation}</td>
                                <td class="text-center">${item.sex.title}</td>
                                <td class="text-center">${item.tel}</td>
                                <td class="text-center">${item.weChat}</td>
                                <td class="text-center">
                                    <a class="btn btn-primary btn-xs" onclick="editLinkman(${item.id});">
                                        <i class="fa fa-edit">详情</i>
                                    </a>
                                    <shiro:hasAnyRoles name="root,admin,advisor">
                                        <a class="btn btn-primary btn-xs" onclick="deleteLinkman(${item.id});">
                                            <i class="fa fa-times">删除</i>
                                        </a>
                                    </shiro:hasAnyRoles>
                                </td>
                            </tr>
                            </c:forEach>
                            </c:if>
                        </table>
                    </div>
                </div>

                <!-- /.box -->
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">会员缴费信息</h3>

                        <shiro:hasAnyRoles name="root,admin,cashier">
                            <div class="box-tools pull-right" style="margin-right: 80px;">
                                <a class="btn btn-primary btn-flat" style="color: #ffffff;" role="button"
                                   onclick="addNewPayment(${member.id});">添加缴费信息</a>
                            </div>
                        </shiro:hasAnyRoles>

                    </div>
                    <div class="box-body">
                        <table id="paymentTable" class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th class="text-center">缴费人</th>
                                <th class="text-center">缴费时间</th>
                                <th class="text-center">金额</th>
                                <th class="text-center">充值次数</th>
                                <shiro:hasAnyRoles name="root,admin">
                                    <th class="text-center">操作</th>
                                </shiro:hasAnyRoles>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty member.payment}">
                            <c:forEach items="${member.payment}" var="item">
                            <tr>
                                <td class="text-center">${item.payPerson}</td>
                                <td class="text-center">${item.payDate}</td>
                                <td class="text-center">${item.payment}</td>
                                <td class="text-center">${item.purchaseCount}</td>
                                <shiro:hasAnyRoles name="root,admin">
                                    <td class="text-center">
                                        <a class="btn btn-primary btn-xs" onclick="editPayment(${item.id});">
                                            <i class="fa fa-edit">详情</i>
                                        </a>
                                        <a class="btn btn-primary btn-xs" onclick="deletePayment(${item.id});">
                                            <i class="fa fa-times">删除</i>
                                        </a>
                                    </td>
                                </shiro:hasAnyRoles>
                            </tr>
                            </c:forEach>
                            </c:if>
                        </table>
                    </div>
                </div>

            </div>
        </div>

        </div>
    </section>
    <!-- /.content -->
</aside>

