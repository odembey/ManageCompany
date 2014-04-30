<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="en">
<head>
    <title>Find Employee</title>
</head>
<body>
<div class="container">

    <jsp:include page="header.jsp"/>
    <h2>Results</h2>
    <br/>
    <c:if test="${!empty employeess}">
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Job</th>
                <th>Started Date</th>
                <th>Age</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${employeess}" var="employee">
                <tr>
                    <td>${employee.firstName}</td>
                    <td>${employee.lastName}</td>
                    <td>${employee.job}</td>
                    <td>${employee.started_date}</td>
                    <td>${employee.age}</td>
                    <td>
                        <c:url var="dltEmp" value="deleteEmployee/${employee.id}"/>
                        <form:form action="${fn:escapeXml(dltEmp)}" method="post"><input type="submit"
                                                                                         class="btn btn-danger btn-mini"
                                                                                         value="Delete"/>
                        </form:form>
                    </td>
                    <td>
                        <form:form action="editEmployee/${employee.id}" method="post"><input type="submit"
                                                                                             class="btn btn-success btn-mini"
                                                                                             value="Edit"/>
                        </form:form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty employeess}">
        <h3 style="color: #CC0000">No results founds</h3>
    </c:if>
    <br/>
    <jsp:include page="footer.jsp"/>

</div>
</body>

</html>
