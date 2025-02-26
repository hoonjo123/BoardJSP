<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<ul class="nav nav-tabs">
    <li role="presentation" class="home">
        <a href="${pageContext.request.contextPath}/">Home</a>
    </li>
    <li role="presentation" class="dropdown board">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
            게시판 <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><a href="${pageContext.request.contextPath}/board/list">게시판목록</a></li>
            <li><a href="${pageContext.request.contextPath}/board/listAjax">게시판 목록 Ajax</a></li>
        </ul>
    </li>
    <li role="presentation" class="test">
        <a href="${pageContext.request.contextPath}/board/multiplication">JS</a>
    </li>
    <li role="presentation" class="calculation">
        <a href="${pageContext.request.contextPath}/board/calculation">계산기</a>
    </li>
    <li role="presentation" class="calendar">
        <a href="${pageContext.request.contextPath}/calendar">캘린더</a>
    </li>
</ul>

<script>
$(document).ready(function() {
    console.log("[네비게이션바] 적용 jsp");
    var path = location.pathname;
    if (path === "/" || path.indexOf("/home") > -1) {
        $(".home").addClass("active");
    } else if (path.indexOf("/board/multiplication") > -1) {
        $(".test").addClass("active"); 
    } else if (path.indexOf("/board/calculation") > -1) {
        $(".calculation").addClass("active");
    } else if (path.indexOf("/calendar/calendar") > -1) {
        $(".calendar").addClass("active");
    } else if (path.indexOf("/board") > -1) {
        $(".board").addClass("active");
    }
});
</script>
