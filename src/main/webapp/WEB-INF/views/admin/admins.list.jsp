<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.admin.jsp"/>
<section class="login-page">
    <h2>Administratorzy</h2>
    <a href="/admin/add" class="btn btn--without-border">Dodaj nowego administratora</a>
    <ul class="help--slides-items">
        <li></li>
        <c:forEach items="${admins}" var="admin">
            <li>
                <div class="col">
                    <div class="title">Dane: ${admin.name} ${admin.surname} </div>

                    <div class="title">Email: ${admin.email}</div>
                    <div class="subtitle">Zablokowany:
                        <c:choose>
                            <c:when test="${admin.enabled == 1}">
                                Nie
                            </c:when>
                            <c:otherwise>
                                Tak
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <form method="post" action="/admin/action">
                        <input name="id" type="hidden" value="${admin.id}"/>
                        <button name="action" value="edit" type="submit" class="btn">Edytuj</button>
                        <button name="action" value="delete" type="submit" class="btn">Usuń</button>
                    </form>
                </div>
            </li>
        </c:forEach>

    </ul>

</section>


<jsp:include page="../footer.jsp"/>