<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp"/>

<section class="login-page">

    <h2>Edytuj dane</h2>

    <form:form method="post" action="/edit/user" modelAttribute="user">
    <div class="form-group form-group--inline">
        <label> Imię <br><form:input path="name" value="${user.name}"/> </label>
    </div>
    <div class="form-group form-group--inline">
        <label> Nazwisko <br><form:input path="surname" value="${user.surname}"/> </label>
    </div>
    <div class="form-group form-group--inline">
        <label> email <br> <form:input path="email" value="${user.email}"/> </label>
    </div>
    <div class="form-group form-group--inline">
        <label>nowe hasło <br><form:password path="password"/></label>
    </div>

    <form:hidden path="id" value="${user.id}"/>

    <div class="form-group form-group--buttons">
        <form:button type="submit" class="btn">Zapisz</form:button>

        </form:form>
    </div>
</section>

<jsp:include page="./footer.jsp"/>