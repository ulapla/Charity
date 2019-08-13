<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.admin.jsp"/>

<section class="login-page">
    <h2>Administrator</h2>
    <div>

        <form action="/admin/add" method="post">
            <div class="form-group form-group--inline">
               <label> Nadaj uprawnienia administratora wybranemu użytkownikowi</label>

                <select name="id" style="font-size: 140%">
                <c:forEach items="${users}" var="user">
                    <option value="${user.id}">${user.surname} ${user.name}, ${user.email}</option>
                </c:forEach>
                </select>
                <div class="form-group form-group--buttons">
                    <button type="submit" class="btn">Zapisz</button>
                </div>
            </div>
        </form>


    </div>
</section>

<jsp:include page="../footer.jsp"/>