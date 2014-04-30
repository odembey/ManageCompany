<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="en">
<head>
    <title>Find Company</title>
</head>
<body>
<div class="container">

    <jsp:include page="header.jsp"/>
    <h2>Results</h2>
    <br/>
    <c:if test="${!empty companiess}">
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>Name</th>
                <th>Adresse</th>
                <th>Phone</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${companiess}" var="company">
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
                        <form:form action="editCompany/${company.id}" method="post"><input type="submit"
                                                                                           class="btn btn-success btn-mini"
                                                                                           value="Edit"/>
                        </form:form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty companiess}">
        <h3 style="color: #CC0000">No results founds</h3>
    </c:if>
    <br/>
    <jsp:include page="footer.jsp"/>

</div>
</body>

</html>
