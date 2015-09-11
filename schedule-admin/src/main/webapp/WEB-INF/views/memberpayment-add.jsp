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
                        <h3 class="box-title">添加会员缴费信息</h3>
                    </div>
                    <form role="form" class="form-horizontal" method="post" id="paymentAddForm"
                          action="${ctx}/member_payment/save">

                        <input type="hidden" id="memberId" name="memberId" value="${memberId}"/>


                        <div class="box-body">
                            <div class="form-group">
                                <label for="payPerson" class="col-sm-2 control-label">缴款人</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="payPerson" id="payPerson"
                                           placeholder="缴款人姓名">
                                </div>

                                <label for="payDate" class="col-sm-2 control-label">缴款日期</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="payDate" id="payDate"
                                           placeholder="缴款日期">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="payment" class="col-sm-2 control-label">缴款金额</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="payment" id="payment"
                                           placeholder="缴款金额">
                                </div>

                                <label for="purchaseCount" class="col-sm-2 control-label">充值次数</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="purchaseCount" id="purchaseCount"
                                           placeholder="充值次数"/>
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
                                <shiro:hasAnyRoles name="root,admin,cashier">
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

