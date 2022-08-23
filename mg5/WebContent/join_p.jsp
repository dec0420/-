<%@ page import="mg5.DBconnect" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String sql="insert into TBL_VACCRESV_202108 values (?, ?, ?, ?, ?, ?)";
	
	Connection conn = DBconnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setInt(1, Integer.parseInt(request.getParameter("RESVNO")));
	pstmt.setString(2, request.getParameter("JUMIN"));
	pstmt.setString(3, request.getParameter("VCODE"));
	pstmt.setString(4, request.getParameter("HOSPCODE"));
	pstmt.setString(5, request.getParameter("RESVDATE"));
	pstmt.setString(6, request.getParameter("RESVTIME"));
	
	pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="join.jsp"></jsp:forward>
</body>
</html>