<%@ page import="mg5.DBconnect" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql="select max(RESVNO) from TBL_VACCRESV_202108";

	Connection conn = DBconnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	int num = rs.getInt(1)+1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
	function checkValue() {
		if(!document.data.JUMIN.value) {
			alert("주민번호가 입력이 안되었습니다.");
			document.data.JUMIN.focus();
			return false;
		} else if(!document.data.VCODE.value) {
			alert("백신코드가 입력이 안되었습니다.");
			document.data.VCODE.focus();
			return false;
		} else if(!document.data.HOSPCODE.value) {
			alert("병원코드가 입력이 안되었습니다.");
			document.data.HOSPCODE.focus();
			return false;
		} else if(!document.data.RESVDATE.value) {
			alert("예약날짜가 입력이 안되었습니다.");
			document.data.RESVDATE.focus();
			return false;
		} else if(!document.data.RESVTIME.value) {
			alert("예약시간이 입력이 안되었습니다.");
			document.data.RESVTIME.focus();
			return false;
		} alert("등록되었습니다.");
	}
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<jsp:include page="layout/nav.jsp"></jsp:include>
<div class="section">
<h3 class="title">백신예약</h3>
<form name="data" action="join_p.jsp" method="post" onsubmit="return checkValue()">
<table class="table_line">
	<tr>
		<th>예약번호</th>
		<td><input type="text" name="RESVNO" value="<%= num %>" size="20" readonly></td>
	</tr>
	<tr>
		<th>주민번호</th>
		<td><input type="text" name="JUMIN" size="20"></td>
	</tr>
	<tr>
		<th>백신코드</th>
		<td>
			<select name="VCODE">
				<option value="" selected disable hidden></option>
				<option value="V001">A백신</option>
				<option value="V002">B백신</option>
				<option value="V003">C백신</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>병원코드</th>
		<td>
			<input type="radio" name="HOSPCODE" value="H001">가_병원
			<input type="radio" name="HOSPCODE" value="H002">나_병원
			<input type="radio" name="HOSPCODE" value="H003">다_병원
		</td>
	</tr>
	<tr>
		<th>예약날짜</th>
		<td><input type="text" name="RESVDATE" size="20">예)20210101</td>
	</tr>
	<tr>
		<th>예약시간</th>
		<td><input type="text" name="RESVTIME" size="20">예)0930, 1130</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="등록">
		<input type="button" value="취소" onclick="location.href='join.jsp'">
	</tr>
</table>
</form>
</div>
<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>













