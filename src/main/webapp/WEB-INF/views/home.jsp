<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<%@ include file="/WEB-INF/views/nav/nav.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <!-- 공통 CSS/JS 포함 -->

    <style>
        /* 메인 콘텐츠 스타일: 왼쪽 정렬 */
        .content {
            text-align: left;
            margin-top: 50px;
            padding-left: 20px;
        }
        /* 로고 이미지 스타일 */
        .logo-image {
            max-width: 100%;
            height: auto;
            cursor: pointer;
            margin-top: 10px;
        }

    </style>
</head>
<body>
    <!-- 네비게이션 포함 -->

    
    <!-- 메인 콘텐츠 -->
    <div class="container content">
        <h1>HOME</h1>
        <div class="logo">
            <!-- 이미지를 클릭하면 새 창에서 홈페이지로 이동 -->
            <a href="http://www.wooriict.com/" target="_blank">
                <img src="${pageContext.request.contextPath}/img/wooriict.png" alt="WOORIICT Logo" class="logo-image" />
            </a>
        </div>
    </div>
</body>
</html>
