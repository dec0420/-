<%@ page import="mg5.DBconnect" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql="select HOSPADDR from TBL_HOSP_202108";

	Connection conn = DBconnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<jsp:include page="layout/nav.jsp"></jsp:include>
<div class="section">
<h3 class="title">백신예약현황</h3>
<table class="table_line">
	<tr>
		<th>병원지역</th>
		<th>병원지역명</th>
		<th>접종예약건수</th>
	</tr>
	<%
		while(rs.next()) {
	%>
	<tr class="center">
		<td><%= rs.getString("HOSPADDR") %></td>
		<td></td>
		<td></td>
	</tr>
	<%
		}
	%>
	<tr class="center">
		<td colspan="2">총합</td>
		<td></td>
	</tr>
</table>
</div>
<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>