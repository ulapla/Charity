<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp"/>
<section>
<nav class="container container--70">

        <a href="/edit/user" class="btn btn--without-border">Edycja danych</a>
        <a href="/api/form" class="btn btn--without-border">Przekaż nowy datek</a>

</nav>
</section>
<section class="login-page">

    <h2>Twoje donacje</h2>
    <ul class="help--slides-items">
        <c:forEach items="${donations}" var="donation">
            <li>
                <div class="col">
                <div class="title">${donation.institution.name},
                    Ilość worków: ${donation.quantity},
                    Data przekazania: ${donation.pickUpDate}
                </div>
                    <div class="subtitle">
                    <c:if test="${donation.pickedUp == false}">
                        jeszcze nie
                    </c:if>
                    przekazano
                </div>
                </div>
                <form method="post" action="/api/donation/details">
                    <input type="hidden" name="id" value="${donation.id}"/>
                    <button type="submit" class="btn">Szczegóły</button>
                </form>
            </li>
        </c:forEach>
    </ul>
</section>

<jsp:include page="footer.jsp"/>