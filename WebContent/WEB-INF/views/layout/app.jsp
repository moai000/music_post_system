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
                <div id="header_title">
                    <h2>　ららら　<span>音楽投稿サイト</span></h2>
                </div>
                    <div id="header_menu">
                       <a href="<c:url value='/login' />">ログイン</a>&nbsp;&nbsp;&nbsp;
                       <a href="<c:url value='users/new' />">会員登録</a><br>
                    </div>
            </div><br>
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