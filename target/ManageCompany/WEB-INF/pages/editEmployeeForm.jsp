<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <title>Edit Employee</title>
</head>
<body>
<div class="container">
    <jsp:include page="header.jsp"/>

    <h2>Edit Employee</h2>
    <c:url var="addUrl" value="/updateEmployee"/>
    <form:form method="put" action="${addUrl}" modelAttribute="employee" role="form" class="form-actions">
        <div class="form-group">
            <form:label path="firstName">First Name:</form:label>
            <form:input path="firstName"/>
        </div>
        <div class="form-group">
            <form:label path="lastName">Last Name:</form:label>
            <form:input path="lastName"/>
        </div>
        <div class="form-group">
            <form:label path="job">Job:</form:label>
            <form:input path="job"/>
        </div>
        <div class="form-group">
            <form:label path="started_date">Started Date:</form:label>
            <form:input path="started_date"/>
        </div>
        <div class="form-group">
            <form:label path="age">Age:</form:label>
            <form:input path="age"/>
        </div>
        <div class="form-group">
            <form:select path="userType">
                <form:option value="Homme">Homme</form:option>
                <form:option value="Femme">Femme</form:option>
            </form:select>
        </div>
        <button type="submit" class="btn btn-default">Save Employee</button>
    </form:form>
    <br/>

    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
