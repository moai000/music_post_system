<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app2.jsp">
    <c:param name="content">
        <h1>音楽投稿</h1>
        <br /><br />

        <form method="POST" enctype="multipart/form-data" action="/music_post_system/music/create">
            <c:import url="_form.jsp" />
        </form>
        <p><a href="/music_post_system/music/index">一覧に戻る</a></p>
    </c:param>
</c:import>