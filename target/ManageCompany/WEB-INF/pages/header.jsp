<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Home</title>

    <!-- Bootstrap -->
    <spring:url value="/resources/bootstrap/css/bootstrap.min.css" var="bootstrapCss"/>
    <link href="${bootstrapCss}" rel="stylesheet" media="screen"/>

</head>
<body>
<spring:url value="/resources/images/header.png" var="banner"/>
<img src="${banner}" width="100%"/>

<div class="navbar" style="width: 100%;">
    <div class="navbar-inner">
        <ul class="nav">
            <li style="width: 100px;"><a href="<spring:url value="/" htmlEscape="true" />"><i
                    class=" icon-home"></i><s:message code="home.page" text="default text"/></a></li>
            <li style="width: 130px;"><a href="<spring:url value="/detailsCompany" htmlEscape="true" />"><i
                    class="icon-search"></i> <s:message code="company.company" text="default text"/> </a></li>
            <li style="width: 140px;"><a href="<spring:url value="/detailsEmployee" htmlEscape="true" />"><i
                    class="icon-search"></i> <s:message    code="employee.employee" text="default text"/> </a></li>
            <li style="width: 400px;">
                <div style="text-align: right">Language : <a href="?lang=en">English</a>|<a href="?lang=fr">Francais</a>
                </div>
            </li>

        </ul>
    </div>
</div>
</body>
<footer>
    <spring:url value="/resources/bootstrap/js/bootstrap.js" var="bootstrapJs"/>
    <script src="${bootstrapJs}"></script>
</footer>
</html>
