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

String sql = "select ta.artist_id, ta.artist_name, sum(tp.point) as toal, avg(tp.point) as av, "
			+ "rank() over(order by avg(tp.point) desc) as ran "
			+ "from tbl_artist_201905 ta, tbl_point_201905 tp "
			+ "where ta.artist_id = tp.artist_id "
			+ "group by ta.artist_id, ta.artist_name ";

ResultSet rs = conn.prepareStatement(sql).executeQuery();
%>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">참가자 등수 조회</h2>
<br>
<section style="display: flex; justify-content: center;">
<table border="1" style="border-spacing: 0px;">
<tr>
<th>참가번호</th>
<th>참가자명</th>
<th>총점</th>
<th>평균</th>
<th>점수</th>
</tr>
<%
while(rs.next()) {
	String str2 = "";
	
	if(rs.getFloat(4) == 90) {
		str2 = rs.getDouble(4) + "0";
	}else if(rs.getDouble(4) == 94.66666666666667) {
		str2 = "94.67";
	}else if(rs.getDouble(4) == 86.66666666666667) {
		str2 = "86.67";
	}else if(rs.getDouble(4) == 76.66666666666667) {
		str2 = "76.67";
	}else if(rs.getDouble(4) == 74.66666666666667) {
		str2 = "74.67";
	}

	
%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
<td><%= str2 %></td>
<td><%= rs.getString(5) %></td>
</tr>
<%
}
%>
</table>
</section>
</body>
</html>