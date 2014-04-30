<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <title>Edit Company</title>
</head>
<body>
<div class="container">
    <jsp:include page="header.jsp"/>

    <h2>Edit Company</h2>
    <c:url var="addUrl" value="/updateCompany"/>
    <form:form method="put" action="${addUrl}" modelAttribute="company" role="form" class="form-actions">
        <div class="form-group">
            <form:label path="name">Name:</form:label>
            <form:input path="name"/>
        </div>
        <div class="form-group">
            <form:label path="adresse">Adresse:</form:label>
            <form:input path="adresse"/>
        </div>
        <div class="form-group">
            <form:label path="phone">Phone:</form:label>
            <form:input path="phone"/>
        </div>
        <button type="submit" class="btn btn-default">Save Company</button>
    </form:form>
    <br/>

    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
