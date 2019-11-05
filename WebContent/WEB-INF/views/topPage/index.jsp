<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h1>”ららら”は</h1>
        <p>音楽は好きだけど自分にはセンスがない、と奥手になっている人のための音楽投稿サイトです。<br>歌や弾き語り、演奏に自作曲、その他音楽であればなんでもを気軽に投稿でき、他のユーザーの音楽を聴いて、ユーザー同士で自由にコメントを送り合うことができます。</p>

    </c:param>
</c:import>