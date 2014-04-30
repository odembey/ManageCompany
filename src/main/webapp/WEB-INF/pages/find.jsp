<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html lang="en">
<head>
    <title><spring:message code="company.company" text="default text"/></title>
</head>
<body>
<div class="container">

    <jsp:include page="header.jsp"/>
    <h2><spring:message code="msg.welcome" text="default text"/></h2>
    <br/>
    <spring:url value="/resources/images/company.png" var="banner"/>
    <img src="${banner}" width="600px" height="600px"/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <jsp:include page="footer.jsp"/>

</div>
</body>

</html>
