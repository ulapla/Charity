<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp"/>

<section class="login-page">

    <a href="/api/form" class="btn btn--without-border">Przekaż nowy datek</a>
    <h2>Twoje donacje</h2>
    <ul class="help--slides-items">
        <c:forEach items="${donations}" var="donation">
            <li>
                <div class="col">
                <div class="title">${donation.institution.name},
                    Ilość worków: ${donation.quantity},
                       Data przekazania: ${donation.pickUpDate}</div>
                </div>
            </li>
        </c:forEach>
    </ul>
</section>

<jsp:include page="footer.jsp"/>