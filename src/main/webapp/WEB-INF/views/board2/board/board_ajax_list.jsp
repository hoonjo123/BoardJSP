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
			<th><input type="checkbox" id="selectAll">전체선택</th>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
		<td><button type="button" class='btn btn-danger' id="deleteSelected">선택 삭제</button></td>
	</thead>
	<tbody id="boardBody">
	</tbody>
</table>
<button type="button" class="btn btn-success" id="btn_write">글쓰기</button>

<form id="boardAjaxWriteFrm" name="boardAjaxWriteFrm" action="/board/boardInsert"  method="post">
 	<div class="mb-3">
		<label>제목</label>
		<input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요">
 	</div>
 	<div class="mb-3">
		<label>작성자</label>
		<input type="text" class="form-control" id="boardName"  name="boardName" placeholder="작성자를 입력하세요">
 	</div>
 	<div class="mb-3">
		<label>내용</label>
		<textarea class="form-control" id="boardContent"  name="boardContent" rows="20" placeholder="내용을 입력하세요"></textarea>
 	</div>
 	<button type="button" class="btn btn-info" id="ajaxBoardInsert">작성</button>
</form>


<form id="ajaxBoardViewFrm" name="ajaxBoardViewFrm">
	번호:<br>
		<input type="text" id="boardIdxno" name="abc" style="border:none;" readonly><br>
	제목:<br>
		<input type="text" id="boardTitleRead" style="border:none;" readonly><br>
	작성자:<br>
		<input type="text" id="boardNameRead" style="border:none;" readonly><br>
	내용:<br>
		<input type="text" id="boardContentRead" style="border:none;" readonly><br>
	<button type="button" class="btn btn-info" id="closeBoardBtn">닫기</button>
</form>


</body>
<script>
$(document).ready(function() {
	ajaxBoardSel();
	$("#boardAjaxWriteFrm").hide();
	$("#ajaxBoardViewFrm").hide();	
});
$("#closeBoardBtn").click(function(){
	$("#ajaxBoardViewFrm").hide();
});
$("#btn_write").click(function(){
	$("#boardAjaxWriteFrm").toggle();
});
$("#selectAll").click(function() {
	$(".chkboardIdxno").prop("checked", this.checked);
});



// 게시판 목록 조회
function ajaxBoardSel() {
	$.ajax({
		url : "/board/boardAjaxListSel",
		type : "GET",
// 		data : $("#updateForm").serialize(),
		dataType : "JSON",
		contentType : "application/json",
// 		async : 'false',
		success : function (data) {
// 			console.log("data="+JSON.stringify(data));
// 		    console.log("data==="+data[0].boardIdxno);
// 		    console.log("data==="+data.length);
			var h = "";
		    for(var i = 0; i < data.length; i ++) {
			    h += "<tr>";
			    h += "<td><input type="+"checkbox"+" class="+"chkboardIdxno"+" value="+data[i].boardIdxno+"></td>";
			    h += "<td>"+data[i].boardIdxno+"</td>";
			    h += "<td><a href='javascript:readAjaxBoard("+data[i].boardIdxno+", \""+data[i].boardTitle+"\");'>"+data[i].boardTitle+"</a></td>";
			    h += "<td>"+data[i].boardName+"</td>";
			    h += "<td>"+data[i].boardRegdate+"<button type='button' class='btn btn-danger' onclick='deleteAjaxBoard("+data[i].boardIdxno+")'>삭제</button></td>";
			    h += "</tr>";
			}
			$("#boardBody").html(h);
// 			$("#boardBody").append(h);
		},
		error : function (jqXHR, textStatus, errorThrown) {
		    
		}
	});

}
// 게시판 글삭제
function deleteAjaxBoard(boardIdxno) {
	console.log("boardIdxno==="+boardIdxno);
	var boardno = JSON.stringify({"boardIdxno" : boardIdxno});
// 	console.log("boardno==="+boardno);
// 	console.log("boardIdxno=="+JSON.stringify(boardIdxno));
// 	console.log("JSON.stringify(boardIdxno)=="+JSON.stringify(boardIdxno));
	if(confirm("삭제 하시겠습니까?") == true) {
		$.ajax({
			url : "/board/boardAjaxDelete",
			type : "POST",
			datatype : "JSON",
			contentType: "application/json",
			data : JSON.stringify({"boardIdxno" : boardIdxno}),
			success : function(data){
				console.log('성공===='+data);
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert('error');
				console.log("data=="+JSON.stringify(data));
			}
		});
	}
}

//선택삭제 버튼 클릭 시 선택된 글 삭제
$('#deleteSelected').click(function() {
  var checkedBoxes = $('input[type="checkbox"]:checked:not(#selectAll)');
  if (checkedBoxes.length > 0) {
  
    var boardIdxnoList = [];
    $('input[type="checkbox"]:checked').each(function() {
    	//boardIdxnoList.push(("input[name=abc]", document.ajaxBoardViewFrm)).val();
//     	boardIdxnoList.push($(this).val());
    	boardIdxnoList.push($(this).val());
    });
//     console.log(boardIdxnoList);
	alert(boardIdxnoList);
    
    $.ajax({
		url : "/board/boardAjaxSelectDelete",
		type : "POST",
		datatype : "JSON",
		contentType: "application/json",
		data : JSON.stringify(boardIdxnoList),
		success : function(data){
			console.log('성공===='+data);
			ajaxBoardSel();
		},
		error : function(jqXHR, textStatus, errorThrown){
		  alert('error');
		}
    });
  } else {
    alert('삭제할 대상을 체크하여 주십시오');
    return;
  }
});



// 게시판 상세글조회
function readAjaxBoard(boardIdxno, dd) {
	console.log("boardIdxno===="+boardIdxno);
	console.log("dd===="+dd);
	$("#ajaxBoardViewFrm").show();
	$.ajax({
		url : "/board/boardAjaxRead",
		type : "POST",
		datatype : "JSON",
// 		contentType: "application/json",
		data : {"boardIdxno" : boardIdxno,
				"dd" : dd
				},
// 		data : JSON.stringify({"boardIdxno" : boardIdxno}),
		success : function(data) {
// 			console.log(data);
			$("#boardIdxno").val(data.boardIdxno);
			$("#boardTitleRead").val(data.boardTitle);
			$("#boardNameRead").val(data.boardName);
// 			console.log(JSON.stringify(data.boardName));
			$("#boardContentRead").val(data.boardContent);
// 			console.log("boardContent===="+JSON.stringify(data.boardContent));
			console.log('성공===='+data);
		},
		error : function(jqXHR, textStatus, errorThrown){
			alert('error');
		}
	});
}

// 게시판 글작성
 $("#ajaxBoardInsert").click(function() {
	$("#boardAjaxWriteFrm")[0].reset();
	var boardTitle = $("#boardTitle").val();
	var boardName = $("#boardName").val();
	var boardContent = $("#boardContent").val();
	var insertAjax = {"boardTitle" : boardTitle,
						"boardName" : boardName,
						"boardContent" : boardContent}	
	console.log("insertAjax=="+JSON.stringify(insertAjax));
 	if(boardTitle == "") {
 		alert("제목을 입력해주요");
 		return false;
 	}
 	if(boardName == "") {
 		alert("작성자을 입력해주요");
 		return false;
 	}
 	if(boardContent == "") {
 		alert("내용을 입력해주요");
 		return false;
 	}
	$("#boardAjaxWriteFrm").hide();
//  	console.log("test");
	$.ajax({
		url : "/board/boardAjaxInsert",
		type : "post",
		dataType : "text",
		contentType : "application/json",
		data : JSON.stringify(insertAjax),
		success : function(data){
			ajaxBoardSel();
			console.log('성공===='+data);
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("실패");
		}
	});



 });

</script>
</html>