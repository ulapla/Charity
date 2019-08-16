<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.admin.jsp"/>

<section class="login-page">
    <h2>Edycja instytucji</h2>


    <form:form method="post" action="/admin/institution/save" modelAttribute="institution">
        <div class="form-group form-group--inline">
            <label> Nazwa instytucji<br><form:textarea
                    path="name" value="${institution.name}"/> </label>
        </div>
        <div class="form-group form-group--inline">
            <label> Cel i misja instytucji <form:textarea
                    path="description" value="${institution.description}"/> </label>
        </div>

        <div class="form-group form-group--buttons">
            <form:hidden path="id" value="${institution.id}"/>
            <form:button type="submit" class="btn">Zapisz</form:button>
        </div>
    </form:form>

</section>

<jsp:include page="../footer.jsp"/>