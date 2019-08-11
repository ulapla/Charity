<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp"/>
<section>
    <h2>Zaufane instytucje</h2>
    <ul class="help--slides-items">
        <c:forEach items="${institutions}" var="inst">
            <li>
                <div class="col">
                    <div class="title">${inst.name},
                        Cel: ${inst.description},
                        </div>
                </div>
            </li>
        </c:forEach>
    </ul>

</section>


<jsp:include page="footer.jsp"/>