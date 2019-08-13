<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.admin.jsp"/>
<section class="login-page">
    <h2>Zaufane instytucje</h2>
    <a href="/admin/institution/add" class="btn btn--without-border">Dodaj nową instytucję</a>
    <ul class="help--slides-items">
        <li></li>
        <c:forEach items="${institutions}" var="admin">
            <li>
                <div class="col">
                    <div class="title">${admin.name}</div>

                    <div class="subtitle">Cel i misja: ${admin.description}</div>

                </div>

                    <form method="post" action="/admin/institutions">
                        <input name="id" type="hidden" value="${admin.id}"/>
                        <button name="action" value="edit" type="submit" class="btn">Edytuj</button>
                        <button name="action" value="delete" type="submit" class="btn">Usuń</button>
                    </form>



            </li>
        </c:forEach>

    </ul>

</section>


<jsp:include page="../footer.jsp"/>