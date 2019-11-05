<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app2.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h1>投稿音楽　一覧</h1>
        <table id="music_list">
            <tbody>
                <tr>
                    <th class="user_name">ユーザー名</th>
                    <th class="song">曲名</th>
                    <th class="singer">歌手</th>
                    <th class="genre">ジャンル</th>
                    <th class="created_at">投稿日</th>
                    <th class="action">操作</th>
                </tr>
                <c:forEach var="music" items="${music}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="user_name"><c:out value="${music.user.name}" /></td>
                        <td class="song">${music.song}</td>
                        <td class="singer">${music.singer}</td>
                        <td class="genre">${music.genre}</td>
                        <td class="created_at">${music.created_at}</td>
                        <td class="action"><a href="<c:url value='/music/show?id=${music.id}' />">音楽を聴く</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${music_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((music_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/music/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div><br /><br />
        <div id="music_post">
            <a href="<c:url value='/music/new' />">音楽投稿</a>
        </div>
    </c:param>
</c:import>