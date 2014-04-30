<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

<head>
    <title><spring:message code="employee.employee" text="default text"/></title>
</head>

<body>
<div class="container">
    <jsp:include page="header.jsp"/>

    <h2><spring:message code="msg.find.employee" text="default text"/></h2>

    <c:url value="/findEmployee" var="formUrl"/>
    <form:form modelAttribute="employee" action="${fn:escapeXml(formUrl)}" method="get" class="form-horizontal"
               id="search-owner-form">
        <fieldset>
            <div class="control-group" id="firstName">
                <label class="control-label"> <spring:message code="employee.firstName" text="default text"/> &nbsp </label>
                <form:input path="firstName" size="30" maxlength="80"/>
                <span class="help-inline"><form:errors path="*"/></span>
            </div>
            <div class="form-actions">
                <button type="submit"><spring:message code="msg.find.employee" text="default text"/></button>
            </div>
        </fieldset>
    </form:form>

    <br/>
    <c:url var="addEmp" value="/addEmpForm"/>
    <form:form action="${fn:escapeXml(addEmp)}" method="get" modelAttribute="employee" role="form" class="form-actions">

        <button type="submit" class="btn btn-default"><spring:message code="msg.add.employee" text="default text"/></button>

    </form:form>
    <br/>
    <jsp:include page="employeeList.jsp"/>
    <br/>

    <jsp:include page="footer.jsp"/>

</div>
</body>

</html>
