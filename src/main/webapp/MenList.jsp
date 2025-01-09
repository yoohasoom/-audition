<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
text-align: center;
}
</style>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe" , "system", "1234");

String sql = "select tp.serial_no, tp.artist_id, ta.artist_name, substr(ta.artist_birth, 1, 4), substr(ta.artist_birth, 5, 2), "
			 + "substr(ta.artist_birth, 7, 2), tp.point, tm.mento_name "
			 + "from tbl_artist_201905 ta, tbl_mento_201905 tm, tbl_point_201905 tp "
			 + "where ta.artist_id = tp.artist_id and tm.mento_id = tp.mento_id "
			 + "order by tp.serial_no";

ResultSet rs = conn.prepareStatement(sql).executeQuery();
%>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">멘토점수조회</h2>
<br>
<section style="display: flex; justify-content: center;">
<table style="border-spacing: 0px;" border="1">
<tr>
<th>채점번호</th>
<th>참가번호</th>
<th>참가자명</th>
<th>생년월일</th>
<th>점수</th>
<th>평점</th>
<th>멘토</th>
</tr>
<%
while(rs.next()) {
	
	String str = "";
	
	if(rs.getInt(7) >= 90) {
		str = "A";
	}else if(rs.getInt(7) >= 80) {
		str = "B";
	}else if(rs.getInt(7) >= 70) {
		str = "C";
	}else if(rs.getInt(7) >= 60) {
		str = "D";
	}else {
		str = "F";
	}
%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(4) %>년<%= rs.getString(5) %>월<%= rs.getString(6) %>일</td>
<td><%= rs.getString(7) %></td>
<td><%= str %></td>
<td><%= rs.getString(8) %></td>
</tr>
<%
}
%>
</table>
</section>
</body>
</html>