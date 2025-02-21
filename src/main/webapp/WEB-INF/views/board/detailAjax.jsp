<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String idParam = request.getParameter("id");
    int postId = 0;
    try {
        if(idParam != null) {
            postId = Integer.parseInt(idParam);
        }
    } catch(NumberFormatException e) {
    	
    }
%>
<div id="detailFormInner">
    <p><strong>번호</strong></p>
    <p id="postId"></p>
    
    <p><strong>제목</strong></p>
    <p id="postTitle"></p>
    
    <p><strong>작성자</strong></p>
    <p id="postWriter"></p>
    
    <p><strong>내용</strong></p>
    <p id="postContent"></p>
    
    <button type="button" id="closeDetail" class="btn btn-list">닫기</button>
</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
    $("#detailFormInner").hide().slideDown();
    
    var postId = <%= postId %>;
    if(postId) {
        axios.get("${pageContext.request.contextPath}/board/detailAjaxJson", {
            params: { id: postId }
        })
        .then(function(response) {
            var post = response.data;
            $("#postId").text(post.id);
            $("#postTitle").text(post.title);
            $("#postWriter").text(post.writer);
            $("#postContent").text(post.content);
        })
        .catch(function(error) {
            console.error("상세 조회 실패:", error);
            alert("상세 조회에 실패하였습니다.");
        });
    } else {
        alert("게시글 번호가 없습니다.");
    }
    $("#closeDetail").on("click", function(){
        $("#detailFormInner").slideUp();
    });
</script>
