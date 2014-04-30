<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">

<body>
<div class="container">
    <c:if test="${!empty employees}">
        <h3><spring:message code="msg.employees" text="default text"/></h3>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th><spring:message code="employee.firstName" text="default text"/></th>
                <th><spring:message code="employee.lastName" text="default text"/></th>
                <th><spring:message code="employee.job" text="default text"/></th>
                <th><spring:message code="employee.date" text="default text"/></th>
                <th>Age</th>
                <th>Type</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${employees}" var="employee">
                <tr>
                    <td>${employee.firstName}</td>
                    <td>${employee.lastName}</td>
                    <td>${employee.job}</td>
                    <td>${employee.started_date}</td>
                    <td>${employee.age}</td>
                    <td>${employee.userType}</td>
                    <td>
                        <c:url var="dltEmp" value="deleteEmployee/${employee.id}"/>
                        <form:form action="${fn:escapeXml(dltEmp)}" method="post"><input type="submit"
                                                                                         class="btn btn-danger btn-mini"
                                                                                         value="Delete"/>
                        </form:form>
                    </td>
                    <td>
                        <form:form action="editEmployee/${employee.id}" method="get"><input type="submit"
                                                                                            class="btn btn-success btn-mini"
                                                                                            value="Edit"/>
                        </form:form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
</body>

</html>
