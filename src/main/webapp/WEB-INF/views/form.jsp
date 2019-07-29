<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<jsp:include page="header.jsp"/>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form:form method="post" action="" modelAttribute="donation">
        <div data-step="1" class="active">
            <h3>Zaznacz co chcesz oddać:</h3>

            <c:forEach items="${categories}" var="category">
                <div class="form-group form-group--checkbox">
                    <label>
                        <input type="checkbox" name="categories" value="books"/>
                        <form:checkbox path="categories" value="${category.id}"/>
                        <span class="checkbox"></span>
                        <span class="description">${category.name}</span>
                    </label>
                </div>
            </c:forEach>

            <div class="form-group form-group--buttons">
                <button type="button" class="btn next-step">Dalej</button>
            </div>
        </div>


            <%--        <form:select path="institution" items="${institutions}" itemLabel="name"  itemValue="id"/>--%>
            <%--                        <form:input path="zipCode" />--%>
            <%--                        <form:input path="street" />--%>
            <%--                        <form:input path="city"/>--%>
            <%--                        <form:input path="quantity"/>--%>
            <%--                        <form:textarea path="pickUpComment"/>--%>
            <%--                        <form:input type="date" path="pickUpDate"/>--%>
            <%--                        <form:input type="time" path="pickUpTime" />--%>
        </form:form>

</section>
</body>

<jsp:include page="footer.jsp"/>