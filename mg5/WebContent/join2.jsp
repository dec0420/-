<%@ page import="mg5.DBconnect" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
	function checkValue() {
		if(!document.data.RESVNO.value) {
			alert("예약번호를 입력하세요.");
			document.data.RESVNO.focus();
			return false;
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<jsp:include page="layout/nav.jsp"></jsp:include>
<div class="section">
<h3 class="title">백신예약</h3>
<form name="data" action="join2_p.jsp" method="post" onsubmit="return checkValue()">
<table class="table_line">
	<tr>
		<th>예약번호</th>
		<td><input type="text" name="RESVNO" size="20"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="조회하기">
		<input type="button" value="홈으로" onclick="location.href='index.jsp'">
	</tr>
</table>
</form>
</div>
<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>