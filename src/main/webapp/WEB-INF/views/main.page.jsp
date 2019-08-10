<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp"/>

<section class="login-page">
    <h2>Twoje donacje</h2>
    <ul>
        <c:forEach items="${donations}" var="donation">
            <li>
                ${donation.institution}, ${donation.pickUpDate}
            </li>
        </c:forEach>
    </ul>
</section>

<jsp:include page="footer.jsp"/>