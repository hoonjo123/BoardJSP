<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<%@ include file="/WEB-INF/views/nav/nav.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>JS테스트</title>
    <style>
    	table { border-collapse: collapse; margin-top: 5px; }
        td { border: 1px solid #000; padding: 8px; width: 50px; }
    </style>
</head>
<body>

	<div>
	    <h2>TEST2 - 구구단</h2>
	    <select id="danSelect">
	        <option value="선택">선택</option>
	        <option value="1">1단</option>
	        <option value="2">2단</option>
	        <option value="3">3단</option>
	        <option value="4">4단</option>
	        <option value="5">5단</option>
	        <option value="6">6단</option>
	        <option value="7">7단</option>
	        <option value="8">8단</option>
	        <option value="9">9단</option>
	    </select>
	    
	    <button onclick="calculateMultiplication()">계산</button>
	    <div id="result"></div>
    </div>
    
    <div>
	    <h2>TEST4 - 색상변경</h2>
	    
	    <div id="colorList">
	    	<p data-index="0">첫번째</p>
	    	<p data-index="0">두번째</p>
	    	<p data-index="0">세번째</p>
	    	<p data-index="0">네번째</p>
	    </div>
	    
	    <select id="lineOption">
		    <option value="선택">선택</option>
		    <option value="전체">전체</option>
		    <option value="첫번째">첫번째</option>
		    <option value="두번째">두번째</option>
		    <option value="세번째">세번째</option>
		    <option value="네번째">네번째</option>
	    </select>
	    
	    <select id="colorOption">
	    	<option value="선택">선택</option>
	    	<option value="red">빨강</option>
	    	<option value="blue">파랑</option>
	    	<option value="yellow">노랑</option>
	    	<option value="green">초록</option>
	    </select>
	    <button onclick="applyColor()">변경</button>    
    </div>
    
    <div>
    	<h2>TEST6</h2>
    	
    	<input id="number" type="number">
    	<button onclick="boxNumber()">선택</button>
    	
    	<div id=boxResult></div>  
    </div>
    
   

    <script>
        function calculateMultiplication() {
            var dan = $('#danSelect').val();
            if (dan === "선택") {
            	$('#result').html("");
                return;
            }
            var result = "";
            for (var i = 1; i <= 9; i++){
                result += dan + " x " + i + " = " + (dan * i) + "<br>";
            }
            $('#result').html(result);
        }

        function applyColor(){
            var lineChoice = $('#lineOption').val();
            var colorChoice = $('#colorOption').val();
            
            if (colorChoice === "선택") {
                alert("변경할 색상을 선택해 주세요.");
                return;
            }
            
            var $lines = $('#colorList p');

            $lines.css("color", "black");

            if (lineChoice === "전체") {
                 $lines.css("color", colorChoice);
            } else {
                var mapping = {
                    "첫번째": 0,
                    "두번째": 1,
                    "세번째": 2,
                    "네번째": 3
                };
                var targetIndex = mapping[lineChoice];
                
                if (targetIndex !== undefined && targetIndex < $lines.length) {
                    $lines.eq(targetIndex).css("color", colorChoice);
                }
            }
        }

        function boxNumber(){
            var inputVal = $('#number').val();
            var n = parseInt(inputVal);
            if(n === 0) {
            	$('#boxResult').html("");
                return;
            }
            
            var html = "<table>";
            var count = 1;
            while(count <= n) {
                html += "<tr>";
                for(var col = 0; col < 4; col++){
                    if(count <= n) {
                        html += "<td>" + count + "</td>";
                        count++;
                    } else {
                        html += "<td> X </td>";
                    }
                }
                html += "</tr>";
            }
            html += "</table>";
            
            $('#boxResult').html(html);
        }
    </script>
</body>
</html>
