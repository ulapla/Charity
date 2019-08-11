<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.admin.jsp"/>

<section class="login-page">
    <h2>Administrator</h2>


    <form:form action="/admin/add" method="post" modelAttribute="user">
        <div class="form-group form-group--inline">
           <label> Nadaj uprawnienia administratora wybranemu użytkownikowi</label>
            <form:select style="font-size: 2rem" path="id" items="${users}" itemLabel="email" itemValue="id"/>
            <div class="form-group form-group--buttons">
                <form:button type="submit" class="btn">Zapisz</form:button>
            </div>
        </div>
    </form:form>

<%--    <form:form method="post" action="/admin/save" modelAttribute="admin">--%>
<%--    <div class="form-group form-group--inline">--%>
<%--        <label> Imię<br><form:textarea--%>
<%--                path="name" value="${institution.name}"/> </label>--%>
<%--    </div>--%>
<%--    <div class="form-group form-group--inline">--%>
<%--        <label> Cel i misja instytucji <form:textarea--%>
<%--                path="description" value="${institution.description}"/> </label>--%>
<%--    </div>--%>

<%--    <div class="form-group form-group--buttons">--%>
<%--        <form:button type="submit" class="btn">Zapisz</form:button>--%>

<%--        </form:form>--%>
<%--    </div>--%>
</section>

<jsp:include page="footer.jsp"/>