<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp"/>
<section>
    <nav class="container container--70">
<a href="/api/form" class="btn btn--without-border">Przekaż nowy datek</a>

    </nav>
</section>
<section class="login-page">

    <h2>Szczegóły donacji</h2>
    <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title">
                    Status:
                    <c:if test="${donation.pickedUp == false}">
                        nie
                    </c:if>
                    przekazano<br>
                </div>
                    <div class="title">${donation.institution.name}<br>

                        Ilość worków: ${donation.quantity}<br>
                        Data przekazania: ${donation.pickUpDate}<br>
                        Data utworzenia: ${donation.createdOn}<br>
                        Rodzaj przekazanych darów:<br>
                        <c:forEach items="${donation.categories}" var="category">
                           ${category.name}<br>
                        </c:forEach>

                    </div>
                </div>
            </li>
    </ul>
    <a href="/api/main_page" class="btn btn--without-border">Powrót</a>
</section>

<jsp:include page="footer.jsp"/>