<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/common.jsp" %>
<%@ include file="../common/nav.jsp" %>
	<meta charset="UTF-8">
	<title>캘린더</title>
    <style>
		td {
			width: 50px;
			height: 50px;
			text-align: center;
			font-size: 20px;
			font-family: 굴림;
			border:2px border-color:#3333FF;
			border-radius: 8px;
		}
		tbody {
			text-align: left;
		}
	</style>

<body>
<h3>캘린더</h3>
<table id="calendar" align="center">
	<tr>
		<td>
			<label onclick="prevCalendar()"><</label>
		</td>
		<td align="center" id="tbCalendarYM" colspan="5">yyyy년 m월</td>
		<td>
			<label onclick="nextCalendar()">></label>
		</td>
	</tr>
	<tr>
		<td align="center"><font color ="red">일</td>
		<td align="center">월</td>
		<td align="center">화</td>
		<td align="center">수</td>
		<td align="center">목</td>
		<td align="center">금</td>
		<td align="center"><font color ="blue">토</td>
	</tr> 
</table>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title fs-5" id="exampleModalLabel">스케줄 입력</h3>
				<p id="modalYM"></p>
			</div>
			<form name="form" id="form" role="form" method="post" action="/board/calInsert">
				<input type="hidden" name="calYear" id="calYear" value="">
				<input type="hidden" name="calMonth" id="calMonth" value="">
				<input type="hidden" name="calDay" id="calDay" value="">
				<input type="hidden" name="calReq" id="calReq" value="">
				<table class="table">
					<tr>
						<th>시간</th>
						<th>내용</th>
						<th>중요</th>
						<th>삭제</th>        	
					</tr>
					<tbody id="scheduleBody">
					</tbody>
					<tr>
						<th>시간 <br><input type="time" name="calTime" id="calTime"></th>
					</tr>
					<tr>
						<th colspan="2">내용<br><input type="text" name="calContents" id="calContents" placeholder="스케줄 내용을 입력해주세요."></th>
					</tr>
					<tr>
						<th colspan="2"><input type="checkbox" name="calReqCheckbox" id="calReqCheckbox">중요스케줄 체크시 *표시 됩니다.</th>
					</tr>
				</table>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="closeModal()">취소</button>
				<button type="button" class="btn btn-primary" id="insert">저장</button>
			</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	var today = new Date();
	var date = new Date();
	// 이전달
	function prevCalendar() {
		today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
		buildCalendar();
	}

	// 다음달
	function nextCalendar() {
		today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
		buildCalendar();
	}
	
	var scheduleData = [];
	var daySchedules = [];
	var schedules = {};
	
	// 현재 달 달력 만들기
	function buildCalendar() {
		var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
		var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
		var tbCalendar = document.getElementById("calendar");
		var tbCalendarYM = document.getElementById("tbCalendarYM");
		tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 

		while (tbCalendar.rows.length > 2) {
			tbCalendar.deleteRow(tbCalendar.rows.length-1);
		}
		var row = null;
		row = tbCalendar.insertRow();
		var cnt = 0;
		for(i=0; i<doMonth.getDay(); i++) {
			cell = row.insertCell();
			cnt = cnt + 1;	
		}
		
// 		function hasSchedule(date, scheduleData) {
// 			for (var i=0; i<scheduleData.length; i++) {
// 				var schedule = scheduleData[i];
// // 				console.log("schedule===="+JSON.stringify(schedule));
// // 				console.log(date.getDate());
// 				//&& date.getDate() == schedule.calDay
// 				if (date.getFullYear() == schedule.calYear && date.getMonth() + 1 == schedule.calMonth && date.getDate() == schedule.calDay) {
// // 					console.log("123");
// 					return true;
// 				}
// 			}
// 			return false;
// 		}
		
		var currentDate = new Date();
		var currentYear = today.getFullYear();
		var currentMonth = today.getMonth() + 1;
				
		$.ajax({
			url: '/board/calSelect',
			method: 'GET',
			dataType: 'json',
			data: {
				year: currentYear,
				month: currentMonth
			},
			success: function (response) {
// 				console.log("response===="+JSON.stringify(response));
				scheduleData.length = 0;
				schedules = {}; // 초기화
// 				console.log(scheduleData.length);
				$.each(response, function (index, schedule) {
					scheduleData.push(Number(schedule.calDay));
	                var scheduleKey = schedule.calYear + '-' + schedule.calMonth + '-' + schedule.calDay;
	                if (!schedules[scheduleKey]) {
	                    schedules[scheduleKey] = [];
	                }
	                schedules[scheduleKey].push(schedule);
// 					console.log(JSON.stringify(scheduleData));
				});

				// 달력 출력 1일부터 마지막 일까지 돌림
				for (i=1; i<=lastDate.getDate(); i++) {
					cell = row.insertCell();
					cell.innerHTML = "<div onclick=myModal(" + i + ")>" + i + "</div>";
					cnt = cnt + 1;

					var currentDate = new Date(today.getFullYear(), today.getMonth(), i);

					// 스케줄이 있는 날짜라면 초록색으로 표시
// 					console.log("currentDate===="+currentDate.getDate());
// 					console.log("scheduleData===="+scheduleData);
// 					console.log("===="+typeof currentDate.getDate());
					if(scheduleData.includes(currentDate.getDate())) {
						cell.style.backgroundColor = "green";
					}
// 					if (hasSchedule(currentDate, scheduleData)) {
// 						cell.style.backgroundColor = "green";
// 					}

					// 일요일 계산
					if (cnt % 7 == 1) {
						cell.innerHTML = "<div style=color:red; onclick=myModal(" + i + ")>" + i + "</div>";
					}

					// 토요일 계산
					if (cnt % 7 == 0) {
						cell.innerHTML = "<div style=color:blue; onclick=myModal(" + i + ")>" + i + "</div>";
						row = calendar.insertRow();
					}
				}
			},
			error: function (xhr, status, error) {
				console.error('스케줄 데이터를 가져오는데 실패했습니다:', error);
			}
		});
	}

	function deleteSchedule(i) {
		if (confirm("삭제 하시겠습니까?") == true) {
			$.ajax({
				url: "/board/calDelete",
				type: "POST",
				datatype: "JSON",
				contentType: "application/json",
				data: JSON.stringify({ "calNo": daySchedules[i].calNo }),
				success: function (data) {
					daySchedules.splice(i, 1);

					var selectedDate = $("#calDay").val();
					myModal(selectedDate);
	
					alert("삭제하였습니다.");
					buildCalendar();
				},
				error: function (jqXHR, textStatus, errorThrown) {
					alert('error');
					console.log("data==" + data);
				}
			});
		}
	}
	
	
	function myModal(selectedDate) {
		document.getElementById("modalYM").innerText = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월 " + selectedDate + "일";
		document.getElementById("calYear").value = today.getFullYear();
		document.getElementById("calMonth").value = today.getMonth() + 1;
		document.getElementById("calDay").value = selectedDate;
		document.getElementById("calTime").value = "";
		document.getElementById("calContents").value = "";
		document.getElementById("calReqCheckbox").checked = false;
// 		console.log(selectedDate);
// 		var scheduleTable = document.getElementsByClassName("table")[0];
// 		while (scheduleTable.rows.length > 2) {
// 		    scheduleTable.deleteRow(scheduleTable.rows.length - 1);
// 		}
	    var scheduleKey = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + selectedDate;
	    daySchedules = schedules[scheduleKey] || [];

	    // 해당 날짜에 스케줄이 있는지 확인하고 스케줄을 가져옴
	    var h = "";
	    if (daySchedules.length > 0) {
		    for (var i = 0; i < daySchedules.length; i++) {
		        var schedule = daySchedules[i];
		        if (today.getFullYear() == schedule.calYear && today.getMonth() + 1 == schedule.calMonth && selectedDate == schedule.calDay) {
		            h += "<tr>";
		            h += "<td style=text-align:left;>" + schedule.calTime + "</td>";
		            h += "<td style=text-align:left;>" + schedule.calContents + "</td>";
		            h += "<td style=color:red; text-align:left;>" + (schedule.calReq == 'Y' ? '*' : '') + "</td>";
	 	            h += "<td style=color:blue; text-align:left; onclick='deleteSchedule(" + i + ")'>x</td>";
		            h += "</tr>";
		        }
		    }
	    }
// 	    console.log(schedule.calTime);
	    $("#scheduleBody").html(h);

		$("#myModal").modal("show");
	}
	
	function closeModal() {
		$('#myModal').modal('hide');
	}
	
	var savedDates = [];

	function modalValidation() {
		var calTime = document.querySelector("#calTime").value;
		var calContents = document.querySelector("#calContents").value;

		if(calTime == ""){
			alert("시간을 입력해주세요");
			return false;
		}
		if(calContents == "") {
			alert("스케줄을 입력해주세요");
			return false;
		}
		return true;
	}

$('#insert').click(function () {
	if($("#calReqCheckbox").is(":checked")) {
		$("input[name=calReq]").val("Y");
	} else {
		$("input[name=calReq]").val("N");
	}
	if(modalValidation()) {
		var formData = $("#form").serialize();
		$.ajax({
			url: '/board/calInsert',
			type: 'POST',
			data: formData,
			success: function (data) {
				var inputYear = parseInt($("#calYear").val());
				var inputMonth = parseInt($("#calMonth").val()) - 1;
				today = new Date(inputYear, inputMonth);

				buildCalendar();

				closeModal();
			},
			error: function (jqXHR, textStatus, errorThrown) {
				console.error('스케줄 저장에 실패했습니다:', errorThrown);
			}
		});
	}
});

buildCalendar();
</script>
</body>
</html>