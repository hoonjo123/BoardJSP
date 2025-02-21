<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<div class="form-container" id="writeFormInner">
    <form id="writeForm">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" required>
        </div>
        <div class="form-group">
            <label for="writer">작성자</label>
            <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자를 입력하세요" required>
        </div>
        <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name="content" rows="8" placeholder="내용을 입력하세요" required></textarea>
        </div>
        <button type="button" id="submitWrite" class="btn btn-edit">작성</button>
    </form>
</div>

<script>
    $("#submitWrite").on("click", function(){
        var title = $("#title").val().trim();
        var writer = $("#writer").val().trim();
        var content = $("#content").val().trim();
        
        if(title === ""){
            alert("제목을 입력해 주세요.");
            return;
        }
        if(writer === ""){
            alert("작성자를 입력해 주세요.");
            return;
        }
        if(content === ""){
            alert("내용을 입력해 주세요.");
            return;
        }
        
        axios.post("${pageContext.request.contextPath}/board/write", {
            title: title,
            writer: writer,
            content: content
        })
        .then(function(response){
            $("#writeFormContainer").slideUp(function(){
                $(this).empty();
            });
            $.ajax({
                url: "${pageContext.request.contextPath}/board/listAjaxJson",
                type: "GET",
                dataType: "json",
                success: function(data) {
                    var rows = "";
                    $.each(data, function(index, post){
                        rows += "<tr>" +
                                    "<td>" +
                                    "<div class='form-check'>" +
                                      "<input class='form-check-input' type='checkbox' value='" + post.id + "' id='checkbox-" + post.id + "'>" +
                                      "<label class='form-check-label' for='checkbox-" + post.id + "'></label>" +
                                    "</div>" +
                                    "</td>" +
                                    "<td>" + post.id + "</td>" +
                                    "<td><a href='#' class='post-title' data-id='" + post.id + "'>" + post.title + "</a></td>" +
                                    "<td>" + post.writer + "</td>" +
                                    "<td class='date-cell'>" +
                                        "<span class='date-text'>" + post.regdate + "</span>" +
                                        "<a href='#' class='btn btn-delete delete-btn' data-id='" + post.id + "'>삭제</a>" +
                                    "</td>" +
                                "</tr>";
                    });
                    $("#boardTable tbody").html(rows);
                },
                error: function(xhr, status, error) {
                    console.error("게시판 목록 업데이트 실패: ", error);
                }
            });
        })
        .catch(function(error){
            console.error("글 등록 실패:", error);
            alert("글 등록에 실패하였습니다.");
        });
    });
</script>

<style>
    .btn-edit,
    .btn-edit:hover,
    .btn-edit:focus,
    .btn-edit:active,
    .btn-edit.active {
        background-color: #36B0D5 !important;
        background-image: none !important;
        color: white !important;
        border: none;
    }
</style>
