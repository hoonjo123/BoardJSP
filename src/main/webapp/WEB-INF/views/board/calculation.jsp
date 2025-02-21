<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<%@ include file="/WEB-INF/views/nav/nav.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>계산기 테이블</title>
  <style>
  
    table {
      width: 100%;
      max-width: 1000px;
      table-layout: fixed;
      border-collapse: collapse;
      margin-top: 40px;
      margin-left: 40px;
    }
    td {
      border: 1px solid #000;
      text-align: center;
      padding: 10px;
      font-size: 17px;
    }

    #display {
      height: 20px;
      text-align: right;
      line-height: 20px;
      overflow: hidden;
    }
    
    #display:empty::before {
      content: "\00a0";
    }
    
    table tr:not(:first-child) td:active {
      background-color: gray;
    }
    
  </style>
  
</head>
<body>

  <table border="1" cellspacing="0" cellpadding="10">

    <tr>
      <td colspan="4" id="display"></td>
    </tr>

    <tr>
      <td>7</td>
      <td>8</td>
      <td>9</td>
      <td>X</td>
    </tr>
    <tr>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>-</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>+</td>
    </tr>
    <tr>
      <td>Del</td>
      <td>0</td>
      <td>.</td>
      <td>=</td>
    </tr>
  </table>
  
  <script>
  $(function() {
    var $display = $("#display");
    $("table tr:not(:first-child) td").on("click", function() {
      var text = $(this).text().trim();
      var current = $display.text();

      if (/^\d+$/.test(text)) {
        $display.text(current + text);
      }
      else if (text === "X" || text === "-" || text === "+" || text === ".") {
        
        if (current === "") return;
        
        var lastChar = current.slice(-1);
        if (lastChar === "*" || lastChar === "-" || lastChar === "+" || lastChar === ".") return;
        
        if (text === "X") {
          $display.text(current + "*");
        } else {
          $display.text(current + text);
        }
      }
      else if (text === "=") {
        try {
          var result = math.evaluate(current);
          $display.text(result);
        } catch (e) {
          $display.text("Error");
        }
      }
      else if (text === "Del") {
        $display.text(current.slice(0, -1));
      }
    });
  });
</script>
  
</body>
</html>
