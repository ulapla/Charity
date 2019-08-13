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
                    <div class="title">Dane: ${user.name} ${user.surname} </div>

                    <div class="title">Email: ${user.email}</div>
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
                    <form method="post" action="/admin/user/action">
                        <input name="id" type="hidden" value="${user.id}"/>
                        <button name="action" value="edit" type="submit" class="btn">Edytuj</button>
                        <button name="action" value="delete" type="submit" class="btn">Usuń</button>
                    </form>
                </div>
            </li>


        </c:forEach>

    </ul>

</section>


<jsp:include page="../footer.jsp"/>