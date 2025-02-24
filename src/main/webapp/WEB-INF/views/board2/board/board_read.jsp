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
	게시글 상세
</h1>
<table class="table">
	<tr>
		<th scope="col" >번호</th>
			<td>${data.boardIdxno}</td>
	</tr>
	<tr>
		<th scope="col" >작성자</th>
			<td>${data.boardName}</td>
	</tr>
	<tr>
		<th scope="col">제목</th>
			<td>${data.boardTitle}</td>
	</tr>
	<tr>
		<th scope="col">내용</th>
			<td>${data.boardContent}</td>
	</tr>
</table>
<div>
	<a href="/board/boardUpdate?boardIdxno=${data.boardIdxno}" type="button" class="btn btn-sm btn-primary">수정</a>
	<a href="/board/boardDelete?boardIdxno=${data.boardIdxno}" type="button" class="btn btn-danger">삭제</a>
	<a href="/board/boardList" type="button" class="btn btn-sm btn-primary">목록</a>
</div>
</body>
</html>