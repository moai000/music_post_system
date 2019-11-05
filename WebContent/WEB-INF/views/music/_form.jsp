<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <c:if test="${errors != null}">
        <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            <c:out value="${error}" /><br />
        </c:forEach>
        </div>
        </c:if>

        <label for="song">曲名</label><br />
        <input type="text" name="song" value="${music.song}" />
        <br /><br />

        <label for="singer">アーティスト名</label><br />
        <input type="text" name="singer" value="${music.singer}" />
        <br /><br />

        <label for="genre">ジャンル</label><br />
        <input type="radio" name="genre" value="カラオケ" checked>カラオケ
        <input type="radio" name="genre" value="弾き語り">弾き語り
        <input type="radio" name="genre" value="演奏">演奏
        <input type="radio" name="genre" value="自作曲">自作曲
        <input type="radio" name="genre" value="その他">その他
        <br /><br />

        <label for="introduction">一言</label><br />
        <textarea name="introduction" rows="10" cols="50">${music.introduction}</textarea>
        <br /><br />

        <label for="file">音楽データ</label><br />
            <input type="file" name="file" accept="audio/mp3"/>

        <br /><br /><br /><br />

        <input type="hidden" name="_token" value="${_token}" />
        <button type="submit">投稿</button>
