<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/nav/nav.jsp" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />
    <style>
        .detail-container {
            margin-top: 30px;
        }
        .detail-header {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .detail-item {
            margin-bottom: 10px;
            font-size: 16px;
        }
        .detail-label {
            font-weight: bold;
            margin-right: 10px;
        }
        .button-container {
            margin-top: 20px;
            text-align: left;
        }
    </style>
</head>

<body>
    <div class="container detail-container">
        <h2>게시글 상세</h2>
        <div class="detail-item">
            <span class="detail-label">번호</span>
            <span>${board.id}</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">제목</span>
            <span>${board.title}</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">작성자</span>
            <span>${board.writer}</span>
        </div>
        <div class="detail-item">
		    <span class="detail-label">내용</span>
		    <div style="margin-top: 10px;">${board.content}</div>
		</div>
        <div class="button-container">
            <a href="${pageContext.request.contextPath}/board/edit/${board.id}" class="btn btn-edit">수정</a>
            <a href="${pageContext.request.contextPath}/board/delete/${board.id}" class="btn btn-delete" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
            <a href="${pageContext.request.contextPath}/board/list" class="btn btn-list">목록</a>
        </div>
    </div>
</body>
</html>
