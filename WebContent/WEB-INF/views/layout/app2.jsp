<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>ららら　音楽投稿サイト</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <h2>　ららら　<span>音楽投稿サイト</span></h2>
                <div id="header_menu">
                    <c:if test="${sessionScope.login_user != null}">
                        <a href="<c:url value='/user/account' />"><c:out value="${sessionScope.login_user.name}" />&nbsp;さん</a>&nbsp;&nbsp;&nbsp;
                        <a href="<c:url value='/logout' />">ログアウト</a>
                    </c:if>
                </div>
            </div>
            <div class="line1">
            </div>
            <div class="line2">
            </div>
            <div id="content">
                ${param.content}
            </div>
            <div id="footer">
                by Eiichi Shimizu.
            </div>
        </div>
    </body>
</html>
