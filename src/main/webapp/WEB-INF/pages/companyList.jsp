<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">

<body>
<div class="container">
    <c:if test="${!empty companies}">
        <h3><spring:message code="msg.companies" text="default text"/></h3>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th><spring:message code="company.name" text="default text"/></th>
                <th><spring:message code="company.adresse" text="default text"/></th>
                <th><spring:message code="company.phone" text="default text"/></th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${companies}" var="company">
                <tr>
                    <td>${company.name}</td>
                    <td>${company.adresse}</td>
                    <td>${company.phone}</td>
                    <td>
                        <c:url var="dltCmp" value="deleteCompany/${company.id}"/>
                        <form:form action="${fn:escapeXml(dltCmp)}" method="post"><input type="submit"
                                                                                         class="btn btn-danger btn-mini"
                                                                                         value="Delete"/>
                        </form:form>
                    </td>
                    <td>
                        <form:form action="editCompany/${company.id}" method="get"><input type="submit"
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
