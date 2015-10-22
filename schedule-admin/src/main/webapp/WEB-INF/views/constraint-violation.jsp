<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            数据一致性错误
        </h1>
        <ol class="breadcrumb">
            <li><a href="${ctx}/index"><i class="fa fa-dashboard"></i> Home</a></li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="error-page">
            <%--<h5 class="headline">500</h5>--%>
            <div class="error-content">


                <c:if test="${fn:contains(exception.getRootCause(),'Cannot delete or update ')}">
                    <h3><i class="fa fa-warning text-yellow"></i> 存在关联数据!</h3>

                    <h4>
                        该数据被课程或会员等数据引用，无法删除或修改。请处理关联数据后重试！
                    </h4>
                </c:if>


                <c:if test="${fn:contains(exception.getRootCause(),'Duplicate ')}">
                    <h3><i class="fa fa-warning text-yellow"></i> 该数据已存在!</h3>

                    <h4>
                        请修改用户名、登录名等关键信息后重试!
                    </h4>
                </c:if>
                <p> ${exception.getRootCause()} </p>
                <button class="btn btn-primary btn-flat text-center" onclick="window.history.go(-1);">返 回</button>
            </div>
        </div>
        <!-- /.error-page -->

    </section>
    <!-- /.content -->
</aside>
<!-- /.right-side -->
