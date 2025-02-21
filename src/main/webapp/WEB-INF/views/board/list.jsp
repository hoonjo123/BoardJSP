<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<%@ include file="/WEB-INF/views/nav/nav.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
    <style>
        .table-container {
            margin-top: 30px;
        }
        .btn-container {
            margin-top: 20px;
            text-align: left;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>게시판</h2>
        <div class="table-container">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="post" items="${boardList}">
                        <tr>
                            <td>${post.id}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/board/view/${post.id}">
                                    ${post.title}
                                </a>
                            </td>
                            <td>${post.writer}</td>
                            <td>${post.regdate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="btn-container">
            <a href="${pageContext.request.contextPath}/board/write" class="btn btn-success">글쓰기</a>
        </div>
    </div>
</body>
</html>
