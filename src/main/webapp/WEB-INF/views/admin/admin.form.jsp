<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.admin.jsp"/>

<section class="login-page">
    <h2>Edycja administratora</h2>

    <form:form method="post" action="/admin/admin/update" modelAttribute="user">
    <div class="form-group form-group--inline">
        <label> Imię <br><form:input path="name" value="${user.name}"/> </label>
    </div>
    <div class="form-group form-group--inline">
        <label> Nazwisko <br><form:input path="surname" value="${user.surname}"/> </label>
    </div>
    <div class="form-group form-group--inline">
        <label> Email <br> <form:input path="email" value="${user.email}"/> </label>
    </div>
    <div class="form-group form-group--inline">
        <label>Zablokowany <br>
            <form:radiobutton path="enabled" value="1"/>nie
            <form:radiobutton path="enabled" value="0" label="tak"/>
        </label>
    </div>
    <div class="form-group form-group--inline">
        <label>Role użykownika<br>
        <form:checkboxes itemValue="id" itemLabel="name" path="roles" items="${allRoles}" />
        </label>
    </div>
    <form:hidden path="id" value="${user.id}"/>
    <form:hidden path="password" value="${user.password}"/>


    <div class="form-group form-group--buttons">
        <form:button type="submit" class="btn">Zapisz</form:button>

        </form:form>
    </div>
</section>

<jsp:include page="../footer.jsp"/>