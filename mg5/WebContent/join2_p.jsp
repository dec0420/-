<%@ page import="mg5.DBconnect" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql="select RESVNO, JUMIN, decode(HOSPCODE,'H001','가_병원','H002','나_병원','H003','다_병원') HOSPCODE, to_char(RESVDATE, 'yyyy-mm-dd') RESVDATE, substr(RESVTIME, 1, 2)||':'||substr(RESVTIME, 3, 2) RESVTIME, decode(VCODE,'V001','A백신','V002','B백신','V003','C백신') VCODE from TBL_VACCRESV_202108 where RESVNO="+request.getParameter("RESVNO");

	Connection conn = DBconnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<jsp:include page="layout/nav.jsp"></jsp:include>
<div class="section">
<h3 class="title">백신예약조회</h3>
<table class="table_line">
	<%
		if(rs.next()) {
	%>
	<tr>
		<th>예약번호</th>
		<th>주민번호</th>
		<th>병원코드</th>
		<th>예약날짜</th>
		<th>예약시간</th>
		<th>백신코드</th>
	</tr>
	<tr>
		<td><%= rs.getString("RESVNO") %></td>
		<td><%= rs.getString("JUMIN") %></td>
		<td><%= rs.getString("HOSPCODE") %></td>
		<td><%= rs.getString("RESVDATE") %></td>
		<td><%= rs.getString("RESVTIME") %></td>
		<td><%= rs.getString("VCODE") %></td>
	</tr>
	<% } else { %>
	<tr>
		<td>예약번호 <%= request.getParameter("RESVNO") %>로 조회된 결과가 없습니다.</td>
	<% } %>
	<tr>
		<td colspan="6" align="center">
		<input type="button" value="홈으로" onclick="location.href='index.jsp'">
		</td>
	</tr>
</table>
</div>
<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>