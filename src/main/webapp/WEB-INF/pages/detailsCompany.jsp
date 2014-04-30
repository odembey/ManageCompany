<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <title><spring:message code="company.company" text="default text"/></title>
</head>
<body>
<div class="container">
    <jsp:include page="header.jsp"/>

    <h2><spring:message code="msg.find.company" text="default text"/></h2>

    <c:url value="/findCompany" var="formUrl"/>
    <form:form modelAttribute="company" action="${fn:escapeXml(formUrl)}" method="get" class="form-horizontal"
               id="search-owner-form">
        <fieldset>
            <div class="control-group" id="name">
                <label class="control-label"> <spring:message code="company.name" text="default text"/> </label>
                <form:input path="name" size="30" maxlength="80"/>
                <span class="help-inline"><form:errors path="*"/></span>
            </div>
            <div class="form-actions">
                <button type="submit"><spring:message code="msg.find.company" text="default text"/></button>
            </div>
        </fieldset>
    </form:form>
    <br/>
    <c:url var="addCmp" value="/addCmpForm"/>
    <form:form action="${fn:escapeXml(addCmp)}" method="get" modelAttribute="company" role="form" class="form-actions">

        <button type="submit" class="btn btn-default"><spring:message code="msg.add.company" text="default text"/></button>

    </form:form>
    <br/>
    <jsp:include page="companyList.jsp"/>
    <br/>

    <jsp:include page="footer.jsp"/>

</div>
</body>

</html>
