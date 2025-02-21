<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/nav/nav.jsp" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />
    <style>
        .form-container {
            margin-top: 30px;
        }
    </style>
</head>

<body>
    <div class="container form-container">
        <h2>게시글 수정</h2>
        <form action="${pageContext.request.contextPath}/board/edit" method="post">
            <input type="hidden" name="id" value="${board.id}" />
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" class="form-control" id="title" name="title" value="${board.title}" required>
            </div>
            <div class="form-group">
                <label for="writer">작성자</label>
                <input type="text" class="form-control" id="writer" name="writer" value="${board.writer}" required>
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control" id="content" name="content" rows="8" required>${board.content}</textarea>
            </div>
            <!-- 외부 CSS의 버튼 클래스 사용 -->
            <button type="submit" class="btn btn-edit">수정</button>
            <a href="${pageContext.request.contextPath}/board/view/${board.id}" class="btn btn-list">목록</a>
        </form>
    </div>
</body>
</html>
