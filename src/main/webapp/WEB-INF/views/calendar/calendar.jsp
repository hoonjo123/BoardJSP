<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<%@ include file="/WEB-INF/views/nav/nav.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/calendar.css" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>캘린더</title>
</head>

<body>
    <div class="calendar-container">
        <div id="yearDisplay" class="calendar-header"></div>

        <div class="calendar-nav">
            <a id="prevMonth">&lt;</a>
            <span id="monthDisplay"></span>
            <a id="nextMonth">&gt;</a>
        </div>
        
        <!-- 달력 테이블 -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>일</th>
                    <th>월</th>
                    <th>화</th>
                    <th>수</th>
                    <th>목</th>
                    <th>금</th>
                    <th>토</th>
                </tr>
            </thead>
            <tbody id="calendarBody">

            </tbody>
        </table>
    </div>
    
    <!-- 스케줄 등록/조회용 모달 -->
    <div id="scheduleModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="scheduleModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <form id="scheduleForm">
          
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
              <h4 class="modal-title" id="scheduleModalLabel" style="font-weight:bold;">스케줄 입력</h4>
              <div class="form-group">
                <span id="scheduleDateDisplay" style="font-size:16px;"></span>
                <input type="hidden" id="scheduleDate" name="scheduleDate">
              </div>
            </div>
            
            <div class="modal-body">
              <table class="table" id="existingScheduleTable" style="display: none;">      
                <thead>
                  <tr>
                    <th scope="col">시간</th>
                    <th scope="col">내용</th>
                    <th scope="col">중요</th>
                    <th scope="col">삭제</th>
                  </tr>
                </thead>
                <tbody id="existingScheduleBody">

                </tbody>
              </table>
              
              <!-- 시간 입력 -->
              <div class="form-group">
                <label for="scheduleTime">시간</label>
                <input type="time" class="form-control" id="scheduleTime" name="scheduleTime" style="width: 130px;">
              </div>
              
              <!-- 스케줄 내용 입력 -->
              <div class="form-group">
                <label for="scheduleContent">내용</label>
                <input class="form-control" id="scheduleContent" name="scheduleContent" rows="1" placeholder="스케쥴 내용을 입력해 주세요."></input>
              </div>
              
              <!-- 중요 체크박스 -->
              <div class="checkbox">
				  <label>
				    <input type="checkbox" id="scheduleImportant" name="scheduleImportant" style="vertical-align: middle;">
				    <span style="vertical-align: middle;">중요 스케줄 (체크시 <span style="color:red;">*</span> 표시됩니다.)</span>
				  </label>
			</div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
              <button type="button" id="saveSchedule" class="btn btn-primary">저장</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    
    <script>
        var currentDate = new Date();
        function renderCalendar(date) {
            var year = date.getFullYear();
            var month = date.getMonth();
            $("#yearDisplay").text(year);
            $("#monthDisplay").text((month + 1) + "월");
            
            var firstDay = new Date(year, month, 1);
            var startingDay = firstDay.getDay();
            var lastDay = new Date(year, month + 1, 0);
            var daysInMonth = lastDay.getDate();
            
            var calendarBody = document.getElementById("calendarBody");
            calendarBody.innerHTML = "";
            var row = document.createElement("tr");
            
            for (let i = 0; i < startingDay; i++) {
                let emptyCell = document.createElement("td");
                row.appendChild(emptyCell);
            }
            
            for (let day = 1; day <= daysInMonth; day++) {
                if (row.childNodes.length % 7 === 0 && row.childNodes.length > 0) {
                    calendarBody.appendChild(row);
                    row = document.createElement("tr");
                }
                let cell = document.createElement("td");
                cell.textContent = day;
                let cellDate = year + "-" + (month + 1).toString().padStart(2, '0') + "-" + day.toString().padStart(2, '0');
                cell.setAttribute("data-date", cellDate);
                
                cell.addEventListener("click", function() {
                    var parts = cellDate.split("-");
                    var formattedDate = parts[0] + "년 " + parseInt(parts[1]) + "월 " + parseInt(parts[2]) + "일";
                    $("#scheduleDateDisplay").text(formattedDate);
                    $("#scheduleDate").val(cellDate);
                    loadSchedulesForDate(cellDate);
                    $("#scheduleModal").modal("show");
                });
                row.appendChild(cell);
            }
            
            while (row.childNodes.length < 7) {
                let emptyCell = document.createElement("td");
                row.appendChild(emptyCell);
            }
            calendarBody.appendChild(row);
            loadSchedulesForMonth(year, month + 1);
        }
        
        function loadSchedulesForDate(dateVal) {
            var year = dateVal.substring(0, 4);
            var month = dateVal.substring(5, 7);
            var targetMonth = year + "-" + month;
            $.ajax({
                url: "${pageContext.request.contextPath}/calendar/schedules",
                type: "GET",
                data: { month: targetMonth },
                success: function(schedules) {
                    var filteredSchedules = schedules.filter(function(sch) {
                        return sch.calDate.substring(0, 10) === dateVal;
                    });
                    var $tbody = $("#existingScheduleBody");
                    $tbody.empty();
      
                    if (filteredSchedules.length > 0) {
                    	filteredSchedules.forEach(function(sch) {
                    	    var important = sch.calReq === "Y" ? "<span style='color:red;'>*</span>" : "";
                    	    var $tr = $("<tr></tr>");
                    	    $tr.append("<td>" + sch.calTime + "</td>");
                    	    $tr.append("<td style='width: 70%;'>" + sch.calContents + "</td>");
                    	    $tr.append("<td style='text-align: left;'>" + important + "</td>");
                    	    $tr.append("<td style='text-align: center; cursor:pointer; color: #6095C6;' class='deleteScheduleCell' data-calno='" + sch.calNo + "'>×</td>");
                    	    $tbody.append($tr);
                    	});
                        $("#existingScheduleTable").show();
                    } else {
                        $("#existingScheduleTable").hide();
                    }
                },
                error: function() {
                    console.log("해당 날짜의 스케줄을 불러오는데 실패했습니다.");
                }
            });
        }
        
        function loadSchedulesForMonth(year, month) {
            let monthStr = month.toString().padStart(2, '0');
            let targetMonth = year + "-" + monthStr;
            $.ajax({
                url: "${pageContext.request.contextPath}/calendar/schedules",
                type: "GET",
                data: { month: targetMonth },
                success: function(schedules) {
                    if (schedules && schedules.length > 0) {
                        schedules.forEach(function(schedule) {
                            let dateVal = schedule.calDate;
                            $("#calendarBody td").each(function() {
                                if ($(this).attr("data-date") === dateVal) {
                                    $(this).addClass("has-schedule");
                                }
                            });
                        });
                    }
                },
                error: function() {
                    console.log("스케줄 데이터를 불러오는데 실패했습니다.");
                }
            });
        }
        
        $("#prevMonth").on("click", function() {
            currentDate.setMonth(currentDate.getMonth() - 1);
            renderCalendar(currentDate);
        });
        
        $("#nextMonth").on("click", function() {
            currentDate.setMonth(currentDate.getMonth() + 1);
            renderCalendar(currentDate);
        });
        
        renderCalendar(currentDate);
        
        $("#saveSchedule").on("click", function() {
            var dateVal = $("#scheduleDate").val();
            var timeVal = $("#scheduleTime").val().trim();
            var contentVal = $("#scheduleContent").val().trim();
            var isImportant = $("#scheduleImportant").is(":checked");
            
            if (!timeVal) {
                alert("스케줄 시간을 입력하세요.");
                return;
            }
            if (!contentVal) {
                alert("스케줄 내용을 입력하세요.");
                return;
            }
            
            var parts = dateVal.split("-");
            if (parts.length < 3) {
                alert("날짜 형식이 올바르지 않습니다.");
                return;
            }
            var calYear = parts[0];
            var calMonth = parts[1];
            var calDay = parts[2];
            
            var scheduleData = {
                calDate: dateVal,
                calYear: calYear,
                calMonth: calMonth,
                calDay: calDay,
                calTime: timeVal,
                calContents: contentVal,
                calReq: isImportant ? "Y" : "N"
            };
            
            $.ajax({
                url: "${pageContext.request.contextPath}/calendar/schedules",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(scheduleData),
                success: function(response) {
                    if (response.success) {
                        $("#scheduleModal").modal("hide");
                        $("#scheduleTime").val("");
                        $("#scheduleContent").val("");
                        $("#scheduleImportant").prop("checked", false);
                        $("#calendarBody td").each(function() {
                            if ($(this).attr("data-date") === dateVal) {
                                $(this).addClass("has-schedule");
                            }
                        });
                    } else {
                        alert("스케줄 저장에 실패했습니다.");
                    }
                },
                error: function() {
                    alert("스케줄 저장 중 오류가 발생했습니다.");
                }
            });
        });
        
        $("#existingScheduleBody").on("click", ".deleteScheduleCell", function() {
            var calNo = $(this).data("calno");
            if (!confirm("해당 스케줄을 삭제하시겠습니까?")) {
                return;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/calendar/schedules/" + calNo,
                type: "DELETE",
                success: function(res) {
                    if (res.success) {
                        var dateVal = $("#scheduleDate").val();
                        loadSchedulesForDate(dateVal);
                        $("#calendarBody td").each(function() {
                            if ($(this).attr("data-date") === dateVal) {
                                $(this).removeClass("has-schedule");
                            }
                        });
                    } else {
                        alert("삭제 실패");
                    }
                },
                error: function() {
                    alert("삭제 중 오류가 발생했습니다.");
                }
            });
        });
    </script>
</body>
</html>
