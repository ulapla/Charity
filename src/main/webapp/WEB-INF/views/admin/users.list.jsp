<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.admin.jsp"/>
<section class="login-page">
    <h2>Użytkownicy</h2>
    <ul class="help--slides-items">
        <li></li>
        <c:forEach items="${users}" var="user">
            <li>
                <div class="col">
                    <div class="title">${user.name} ${user.surname} </div>

                    <div class="title">${user.email}</div>
                    <div class="subtitle">Zablokowany:
                        <c:choose>
                            <c:when test="${user.enabled == 1}">
                                Nie
                            </c:when>
                            <c:otherwise>
                                Tak
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <form method="post" action="/admin/user/edit" style="display: inline">
                        <input name="id" type="hidden" value="${user.id}"/>
                        <button type="submit" class="btn">Edytuj</button>
                    </form>
                    <form method="post" action="/admin/user/delete" style="display: inline">
                        <input name="id" type="hidden" value="${user.id}"/>
                        <button type="submit" class="btn">Usuń</button>
                    </form>
                </div>
            </li>


        </c:forEach>

    </ul>

</section>


<jsp:include page="../footer.jsp"/>