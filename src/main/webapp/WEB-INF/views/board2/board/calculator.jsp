<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/common.jsp" %>
<%@ include file="../common/nav.jsp" %>
	<meta charset="UTF-8">
	<title>계산기</title>
<style>
input {
	border: none;
	text-align: right;
	width: 100%;
}
input:focus {
	outline: none;
}
table {
	border: 1px solid;
}
td {
	width: 50px;
	height: 50px;
	text-align: center;
	vertical-align: middle;
}

td .active {
	background-color: gray;
}
</style>
</head>
<body>
<h1>
계산기
</h1>
<table class="table">
	<tr>
	   	<td colspan="4"><input type="text" id="result"></td>
	</tr>
	<tr>
	    <td onclick="add(7)" id="button-7">7</td>
	    <td onclick="add(8)" id="button-8">8</td>
	    <td onclick="add(9)" id="button-9">9</td>
	    <td onclick="add('*')" id="button-multiply">X</td>
	</tr>
	<tr>
	    <td onclick="add(4)" id="button-4">4</td>
	    <td onclick="add(5)" id="button-5">5</td>
	    <td onclick="add(6)" id="button-6">6</td>
	    <td onclick="add('-')" id="button-subtract">-</td>
	</tr>
	<tr>
	    <td onclick="add(1)" id="button-1">1</td>
	    <td onclick="add(2)" id="button-2">2</td>
	    <td onclick="add(3)" id="button-3">3</td>
	    <td onclick="add('+')" id="button-add">+</td>
	</tr>
	<tr>
	    <td onclick="reset()" id="button-del">Del</td>
	    <td onclick="add(0)" id="button-0">0</td>
	    <td onclick="add('.')" id="button-dot">.</td>
	    <td onclick="calculate()" id="button-eqal">=</td>
	</tr>
</table>
</body>
<script>
var resultClear = true;
function add(char) {
	var result = document.querySelector('#result');
	if(!isNaN(char) && !resultClear) {
		console.log("aaaaaaa");
		document.querySelector('#result').value = '';
	}

	
	resultClear = true;
	var lastChar = result.value[result.value.length - 1]; // 마지막으로 입력된 문자 가져옴
	if ((result.value === '' && (char === '*' || char === '+' || char === '-' || char === '=' || char === '.'))) {
	    return;
	} else if ((lastChar === '*' || lastChar === '+' || lastChar === '-') && (char === '*' || char === '+' || char === '-' || char === '.')) {
	    return;
	} else if (lastChar === '.' && char === '.') {
	    return;
	} else {
	    result.value = result.value + char;
	}
// 	if (!isNaN(lastCalcNum)) {
// 		lastCalcNum.value = char;
// 	} else {
// 		result.value = '';
// 	}
}

function calculate() {
// 	var result = document.querySelector('#result');
// 	var result = eval(result.value);
// 	document.querySelector('#result').value = result;
// 	if(result == undefined) {
// 		document.querySelector('#result').value = '';
// 	}
	var result = document.querySelector('#result');
	var lastCalcNum = eval(result.value);
	document.querySelector('#result').value = lastCalcNum;
	console.log(lastCalcNum);
	if(result == undefined) {
		document.querySelector('#result').value = '';
	}
	resultClear = false;
}

function reset() {
	var result = document.querySelector('#result');
	result.value = result.value.slice(0 ,-1);
}

var buttons = document.querySelectorAll('td');
for (var i = 0; i < buttons.length; i++) {
	buttons[i].addEventListener('click', function() {
		this.classList.add('active');
		setTimeout(function() {
			this.classList.remove('active');
		}.bind(this), 100);
	});
}

</script>
</html>