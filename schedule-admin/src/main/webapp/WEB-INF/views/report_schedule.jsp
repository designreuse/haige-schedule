<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh">
<body>

<div class="content">

    <div class="workplace">
        <div class="head clearfix">
            <div class="isw-documents"></div>
            <h1>销售日报统计</h1>
        </div>
        <iframe id="reportFrame"
                src="${ctx}/ReportServer?reportlet=sale_report_detail.cpt&__bypagesize__=false"
                width="99%" height="600px"></iframe>
    </div>
</div>
</body>