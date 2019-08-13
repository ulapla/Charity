<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<header class="header--main-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="/api/main_page" class="btn btn--small btn--without-border">Moje konto</a></li>
            <li><a href="/admin/panel" class="btn btn--small btn--without-border">Panel administratora</a></li>
            <li><a href="/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="/logout" class="btn btn--small btn--without-border">Wyloguj</a></li>
            <li><a href="/register" class="btn btn--small btn--highlighted">Załóż konto</a></li>
        </ul>

        <ul>
            <li><a href="/admin/institutions" class="btn btn--without-border">Zaufane instutucje</a></li>
            <li><a href="/admin/allAdmins" class="btn btn--without-border active">Administratorzy</a></li>
            <li><a href="/admin/allUsers" class="btn btn--without-border active">Użytkownicy</a></li>

        </ul>
    </nav>

</header>