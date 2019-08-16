<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.admin.jsp"/>
<section class="login-page">
    <h2>Zaufane instytucje</h2>
    <a href="/admin/institution/add" class="btn btn--without-border">Dodaj nową instytucję</a>
    <ul class="help--slides-items">
        <li></li>
        <c:forEach items="${institutions}" var="institution">
            <li>
                <div class="col">
                    <div class="title">${institution.name}</div>

                    <div class="subtitle">Cel i misja: ${institution.description}</div>
                    <form method="post" action="/admin/institution/edit" style="display: inline">
                        <input name="id" type="hidden" value="${institution.id}"/>
                        <button type="submit" class="btn">Edytuj</button>
                    </form>
                    <form method="post" action="/admin/institution/delete" style="display: inline">
                        <input name="id" type="hidden" value="${institution.id}"/>
                        <button type="submit" class="btn">Usuń</button>
                    </form>

                </div>



            </li>
        </c:forEach>

    </ul>

</section>


<jsp:include page="../footer.jsp"/>