<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<aside class="right-side">
    <section class="content-header">
        <h1>进行中的教学计划</h1>
    </section>

    <section class="content">
        <iframe id="reportFrame" style="margin-left: 50px;"
                src="${ctx}/ReportServer?reportlet=report_his_schedule.cpt&op=view"
                width="90%" height="800px"></iframe>
    </section>

</aside>