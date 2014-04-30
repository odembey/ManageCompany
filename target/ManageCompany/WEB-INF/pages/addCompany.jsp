<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html lang="en">
<head>
    <title>Add Company</title>
    <style>
        .error {
            color: #ff0000;
        }

        .errorblock {
            color: #000;
            background-color: #ffEEEE;
            border: 3px solid #ff0000;
            padding: 8px;
            margin: 16px;
        }
    </style>
</head>
<body>
<div class="container">
    <jsp:include page="header.jsp"/>

    <h2><spring:message code="msg.add.company" text="default text"/></h2>
    <c:url var="addUrl" value="/addCompany"/>
    <form:form method="post" action="${addUrl}" commandName="company" role="form" class="form-actions">
        <form:errors path="*" cssClass="errorblock" element="div"/>
        <div class="form-group">
            <form:label path="name"><spring:message code="company.name" text="default text"/>:</form:label>
            <form:input path="name" class="form-control" placeholder="Name"/>
            <td><form:errors path="name" cssClass="error"/></td>
            <c:if test="${!empty msgName}">
                <h5 style="color: #CC0000">${msgName}</h5>
            </c:if>
        </div>
        <div class="form-group">
            <form:label path="adresse"><spring:message code="company.adresse" text="default text"/>:</form:label>
            <form:input path="adresse" class="form-control" placeholder="Adresse"/>
            <td><form:errors path="adresse" cssClass="error"/></td>
        </div>
        <div class="form-group">
            <form:label path="phone"><spring:message code="company.phone" text="default text"/>:</form:label>
            <form:input path="phone" class="form-control" placeholder="Phone"/>
            <c:if test="${!empty msgPhone}">
                <h5 style="color: #CC0000">${msgPhone}</h5>
            </c:if>
        </div>
        <button type="submit" class="btn btn-default"><spring:message code="msg.add.company" text="default text"/></button>
    </form:form>
    <br/>

    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
