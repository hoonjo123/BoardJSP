<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../common/nav.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JS TEST</title>
</head>
<body>
<h3>TEST2 - 구구단</h3>
<select id="dan" size="1" >
	<option value ="">선택</option>
	<option value ="1">1단</option>
	<option value ="2">2단</option>
	<option value ="3">3단</option>
	<option value ="4">4단</option>
	<option value ="5">5단</option>
	<option value ="6">6단</option>
	<option value ="7">7단</option>
	<option value ="8">8단</option>
	<option value ="9">9단</option>
</select>
<button onclick="gugudan()">계산</button>
<div id="output"></div>

<h3>TEST4 - 색상변경</h3>
<div id="colorlist">
	<p>첫번째</p>
	<p>두번째</p>
	<p>세번째</p>
	<p>네번째</p>
</div>
<!-- <p>첫번째</p> -->
<!-- <p>두번째</p> -->
<!-- <p>세번째</p> -->
<!-- <p>네번째</p> -->
<select id="order">
	<option value=''>선택</option>
	<option value='all'>전체</option>
	<option value='0'>첫번째</option>
	<option value='1'>두번째</option>
	<option value='2'>세번째</option>
	<option value='3'>네번째</option>
</select>
<select id="color">
	<option value="">선택</option>
	<option value="red">빨강</option>
	<option value="blue">파랑</option>
	<option value="yellow">노랑</option>
	<option value="green">초록</option>
</select>
<!-- <select id="color"> -->
<!-- 	<option value="">선택</option> -->
<!-- 	<option value="red">빨강</option> -->
<!-- 	<option value="blue">파랑</option> -->
<!-- 	<option value="yellow">노랑</option> -->
<!-- 	<option value="green">초록</option> -->
<!-- </select> -->
<button onclick="changeColor()" id="changeBtn">변경</button>

<h3>TEST6</h3>
<input type="number" id="inputNumber">
<button id="selectBtn" onclick="createTable()">선택</button>
<table id="tableArea" style="border:1px solid"></table>

</body>
<script>
// 구구단
function gugudan() {
	var dan = document.getElementById("dan").value;
	var result = "";
	var temp = "";
	for (var i = 1; i <= 9; i++) {
		temp += dan + " x " + i + " = " + dan*i + "<br>";
	}
	result += "<p>" + dan + "단<br>" + temp 

	+ "</p>";
	document.getElementById("output").innerHTML = result;
}

// 색상 변경
function changeColor() {
	var eq = $("#order").val();
	var color = $("#color").val();
	$("#colorlist").find("p").removeAttr("style");
	if(eq == "all") {
		$("#colorlist").find("p").css("color", color);
	} else {
		$("#colorlist").find("p").eq(eq).css("color", color);
	}
	
// 	const pTag = document.querySelectorAll("p");
// 	const orderValue = document.querySelector("#order").value;
// 	const colorValue = document.querySelector("#color").value;
	
// 	for(let i=0; i<pTag.length; i++) {
// 		pTag[i].style.color = "";
// 	}
		
// 	for(let i=0; i<pTag.length; i++) {
// 		if(orderValue === "전체" || orderValue === pTag[i].innerHTML) {
// 			pTag[i].style.color = colorValue;
// 		}
// 	}
// 	if(colorValue === "") {
// 		alert("색상을 선택해주세요!");
// 		return;
// 	}
}

// TEST6
function createTable() {
	let v = document.querySelector('#inputNumber').value;
	let v4 = 0;
	if(4 - (v%4) != 4) {
		v4 = 4 - (v%4);
	}
	v = Number(v) + Number(v4);
	let h = "";
	for(let i = 1; i <= v; i++) {
		if(i%4 == 1) {
			h += "<tr>";
		}
		if(i > (v-v4)) {
			h += "<td>X</td>";
		} else {
			h += "<td>"+i+"</td>";
		}
		if(i%4 == 0) {
			h += "</tr>";
			
		}
	}
	$("#tableArea").html(h);
// 	const inputNumber = document.querySelector('#inputNumber').value;
// 	if (inputNumber === 0 ) {
// 		document.querySelector('#tableArea').innerHTML = '';
// 		return;
// 	}
// 	let tableHTML = '';
// 	let count = 1;
// 	for (let i=0; i < Math.ceil(inputNumber/4); i++) {
// 		tableHTML += '<tr>';
// 		for (let j=0; j<4; j++) {
// 			if (count <= inputNumber) {
// 				tableHTML += '<td>' + count + '</td>';
// 			} else {
// 				tableHTML += '<td>X</td>';
// 			}
// 			count++;
// 		}
// 		tableHTML += '</tr>';
// 	}
// 	document.querySelector('#tableArea').innerHTML = tableHTML;
}
</script>
</html>