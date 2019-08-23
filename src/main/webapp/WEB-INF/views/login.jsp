<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp"/>

<section class="login-page">
    <c:if test="${not empty activateMessage}">
        <h1>
            <div class="alert alert-success">
                    ${activateMessage}
            </div>
        </h1>
    </c:if>
    <h2>Zaloguj się</h2>

    <form method="post">

        <div class="form-group">
            <input type="email" name="username" placeholder="Email" />
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="Hasło" />
<%--            <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>--%>
        </div>

        <div class="form-group form-group--buttons">
            <a href="/register" class="btn btn--without-border">Załóż konto</a>
            <button class="btn" type="submit">Zaloguj się</button>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</section>

<jsp:include page="footer.jsp"/>