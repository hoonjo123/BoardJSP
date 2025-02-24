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
	게시글 수정
</h1>
<form name="form" id="form" role="form" method="post" action="/board/boardUpdate?boardIdxno=${data.boardIdxno}">
	<div class="mb-3">
		<label for="title">제목</label>
		<input type="text" value="${data.boardTitle}" class="form-control" name="boardTitle" id="boardTitle" placeholder="제목을 입력해 주세요">
	</div>
	<div class="mb-3">
		<label for="board_name">작성자</label>
		<input type="text" value="${data.boardName}" class="form-control" name="boardName" id="boardName" placeholder="이름을 입력해 주세요">
	</div>
	<div class="mb-3">
		<label for="board_content">내용</label>
		<textarea class="form-control" rows="5" name="boardContent" id="boardContent" placeholder="내용을 입력해 주세요">${data.boardContent}</textarea>
	</div>
</form>
<div>
	<button type="submit" class="btn btn-sm btn-primary" id="update">수정</button>
	<a href="/board/boardList" type="button" class="btn btn-sm btn-primary">목록</a>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

$(document).ready(function(){
	if($("#boardTitle").val() == ""){
	  	alert("제목을 입력해주세요");
		return false;
	}
	if($("#boardName").val() == ""){
	  	alert("작성자를 입력해주세요");
		return false;
	}
	if($("#boardContent").val() == ""){
	  	alert("내용 입력해주세요");
		return false;
	}

	$('#update').click(function () {
		$("form").submit();
	});
});

</script>
</body>
</html>