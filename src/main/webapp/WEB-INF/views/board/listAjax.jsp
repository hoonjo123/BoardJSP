<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<%@ include file="/WEB-INF/views/nav/nav.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판 목록 (Ajax JSON)</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />
    <style>
        .table-container {
            margin-top: 30px;
        }
        .btn-container {
            margin-top: 20px;
            text-align: left;
        }
        #writeFormContainer {
            margin-top: 20px;
            display: none;
        }
        #detailFormContainer {
            margin-top: 20px;
            display: none;
        }
        .date-cell {
            display: flex;
            align-items: center;
            justify-content: flex-start;
        }
        .date-cell .date-text {
            margin-right: 10px;
        }
        #deleteSelected {
            background-image: linear-gradient(to bottom, #D95551, #C53531);
            color: white;
            border: none;
            padding: 6px 12px;
            cursor: pointer;
            border-radius: 5px;
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>게시판</h2>
        <div class="table-container">
            <table class="table table-striped" id="boardTable">
                <thead>
                    <tr>
                    	<th>
                    	<input type="checkbox" id="selectAll">
                    	전체선택
                    	</th>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <button id="deleteSelected">선택삭제</button>
                        </td>
                    </tr>
                </thead>
                
                <tbody>
                </tbody>
            </table>
        </div>
        <div class="btn-container">
            <button id="toggleWrite" class="btn btn-success">글쓰기</button>
        </div>
        <div id="writeFormContainer"></div>
        <div id="detailFormContainer"></div>
    </div>
    
    <script>
        $(document).ready(function(){
            var baseUrl = "${pageContext.request.contextPath}";
            
            // 게시판 목록 로드
            $.ajax({
                url: baseUrl + "/board/listAjaxJson",
                type: "GET",
                dataType: "json",
                success: function(data) {
                    var rows = "";
                    $.each(data, function(index, post){
                        var formattedDate = post.regdate;
                        
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
                                        "<span class='date-text'>" + formattedDate + "</span>" +
                                        "<a href='#' class='btn btn-delete delete-btn' data-id='" + post.id + "'>삭제</a>" +
                                    "</td>" +
                                "</tr>";
                    });
                    $("#boardTable tbody").html(rows);
                },
                error: function(xhr, status, error) {
                    console.error("게시판 목록 로드 실패: ", error);
                }
            });

            $("#selectAll").change(function(){
                var isChecked = $(this).is(":checked");
                $(".form-check-input").prop("checked", isChecked);
            });
            
            // 삭제 버튼 클릭 이벤트
            $(document).on("click", ".delete-btn", function(e){
                e.preventDefault();
                var btn = $(this);
                var id = btn.data("id");
                if(confirm("삭제하시겠습니까?")){
                    $.ajax({
                        url: baseUrl + "/board/deleteAjax",
                        type: "GET",
                        data: { id: id },
                        dataType: "json",
                        success: function(result) {
                            if(result.success){
                                btn.closest("tr").remove();
                            } else {
                                alert("삭제 실패");
                            }
                        },
                        error: function(xhr, status, error) {
                            console.error("삭제 요청 실패: ", error);
                        }
                    });
                }
            });

            $("#deleteSelected").click(function(){
                var selected = [];
                $(".form-check-input:checked").each(function(){
                    selected.push($(this).val());
                });
                if(selected.length === 0){
                    alert("삭제할 대상을 체크하여 주십시오.");
                } else { 
                	alert(selected.join(", "));
                	if(confirm("선택된 게시글을 정말 삭제하시겠습니까?")){
                        $.each(selected, function(index, id){
                            $.ajax({
                                url: baseUrl + "/board/deleteAjax",
                                type: "GET",
                                data: { id: id },
                                dataType: "json",
                                success: function(result) {
                                    if(result.success){
                                        $("#checkbox-" + id).closest("tr").remove();
                                    } else {
                                        alert("게시글 " + id + " 삭제 실패");
                                    }
                                },
                                error: function(xhr, status, error) {
                                    console.error("게시글 " + id + " 삭제 요청 실패: ", error);
                                }
                            });
                        });
                    }
                }
            });
            
            $("#toggleWrite").click(function(){
                if ($("#detailFormContainer").is(":visible")) {
                     $("#detailFormContainer").hide();
                }
                
                var container = $("#writeFormContainer");
                if(container.is(":visible")){
                     container.hide();
                     container.empty();
                } else {
                     container.load(baseUrl + "/board/writeAjax", function(response, status, xhr){
                         if(status === "error"){
                             console.error("글쓰기 폼 로드 실패: ", xhr.statusText);
                         } else {
                             container.show();
                         }
                     });
                }
            });
                        
            // 게시글 제목 클릭 이벤트
            $(document).on("click", ".post-title", function(e){
                e.preventDefault();

                if ($("#writeFormContainer").is(":visible")) {
                     $("#writeFormContainer").hide();
                     $("#writeFormContainer").empty();
                }
                var id = $(this).data("id");
                var container = $("#detailFormContainer");
                container.load(baseUrl + "/board/detailAjax?id=" + id, function(response, status, xhr){
                     if(status === "error"){
                         console.error("상세 조회 폼 로드 실패: ", xhr.statusText);
                     } else {
                         container.show();
                     }
                });
            });
        });
    </script>
</body>
</html>
