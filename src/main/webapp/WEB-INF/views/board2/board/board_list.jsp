<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/common.jsp" %>
<%@ include file="../common/nav.jsp" %>
	<meta charset="UTF-8">
	<title>게시판</title>
</head>
<body>
<h1>
	게시판
</h1>
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
		<c:forEach var="boardList" items="${boardList}">
			<tr>
				<td>${boardList.boardIdxno}</td>
				<td><a href="/board/boardRead?boardIdxno=${boardList.boardIdxno}">${boardList.boardTitle}</a></td>
				<td>${boardList.boardName}</td>
				<td>${boardList.boardRegdate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a type="button" class="btn btn-success" href="/board/boardWriteFrm">글쓰기</a>

</body>
</html>