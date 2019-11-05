<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app2.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${music != null}">
                <h1>投稿音楽　詳細ページ</h1>
                <br /><br /><br /><br />

                <audio src="<c:url value='/WEB-INF/uploaded/music_file/${music.file}' />" controls></audio>
                <br /><br />
                <table>
                    <tbody>
                        <tr>
                            <th>ユーザー名</th>
                            <td><c:out value="${music.user.name}" /></td>
                        </tr>
                        <tr>
                            <th>曲名</th>
                            <td><c:out value="${music.song}" /></td>
                        </tr>
                        <tr>
                            <th>歌手名</th>
                            <td>
                                <c:out value="${music.singer}" />
                            </td>
                        </tr>
                        <tr>
                            <th>ジャンル</th>
                            <td><c:out value="${music.genre}" /></td>
                        </tr>
                        <tr>
                            <th>一言</th>
                            <td>
                                <c:out value="${music.introduction}" />
                            </td>
                        </tr>
                        <tr>
                            <th>投稿日時</th>
                            <td>
                                <fmt:formatDate value="${music.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td>
                                <fmt:formatDate value="${music.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>

                <c:if test="${sessionScope.login_user.id == music.user.id}">
                    <p><a href="<c:url value='/music/edit?id=${music.id}' />">この投稿を編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value='/music/index' />">一覧に戻る</a></p>
    </c:param>
</c:import>