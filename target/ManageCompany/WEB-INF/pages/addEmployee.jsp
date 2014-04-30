<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <title><spring:message code="msg.add.employee" text="default text"/></title>
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

    <h2>Add Employee</h2>
    <c:url var="addUrl" value="/addEmployee"/>
    <form:form method="post" action="${addUrl}" commandName="employee" role="form" class="form-actions">
        <form:errors path="*" cssClass="errorblock" element="div"/>
        <div class="form-group">
            <form:label path="firstName"><spring:message code="employee.firstName" text="default text"/>:</form:label>
            <form:input path="firstName" class="form-control" placeholder="FirstName"/>
            <td><form:errors path="firstName" cssClass="error"/></td>
        </div>
        <div class="form-group">
            <form:label path="lastName"><spring:message code="employee.lastName" text="default text"/>:</form:label>
            <form:input path="lastName" class="form-control" placeholder="LastName"/>
            <td><form:errors path="lastName" cssClass="error"/></td>
        </div>
        <div class="form-group">
            <form:label path="job"><spring:message code="employee.job" text="default text"/>:</form:label>
            <form:input path="job" class="form-control" placeholder="Job"/>
        </div>
        <div class="form-group">
            <form:label path="started_date"><spring:message code="employee.date" text="default text"/>:</form:label>
            <form:input path="started_date" class="form-control" placeholder="Started_Date"/>
        </div>
        <div class="form-group">
            <form:label path="age">Age:</form:label>
            <form:input path="age" class="form-control" placeholder="Age"/>
            <td><form:errors path="age" cssClass="error"/></td>
            <c:if test="${!empty msg}">
                <h5 style="color: #CC0000">${msg}</h5>
            </c:if>
        </div>
        <div class="form-group">
            <form:select path="userType">
                <form:option value="Homme">Homme</form:option>
                <form:option value="Femme">Femme</form:option>
            </form:select>
        </div>
        <button type="submit" class="btn btn-default"><spring:message code="msg.add.employee" text="default text"/></button>
    </form:form>
    <br/>

    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
