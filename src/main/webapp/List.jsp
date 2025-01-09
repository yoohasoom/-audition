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

String sql = "select artist_id, artist_name, substr(artist_birth, 1, 4), substr(artist_birth, 5, 2), substr(artist_birth, 7, 2), artist_gender, talent, agency from tbl_artist_201905";

ResultSet rs = conn.prepareStatement(sql).executeQuery();
%>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">참가자목록조회</h2>
<br>
<section style="display: flex; justify-content: center;">
<table border="1" style="border-spacing: 0px;">
<tr>
<th>참가번호</th>
<th>참가자명</th>
<th>생년월일</th>
<th>성별</th>
<th>특기</th>
<th>소속사</th>
</tr>
<%
while(rs.next()) {
%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %>년<%= rs.getString(4) %>월<%= rs.getString(5) %>일</td>
<td><%= rs.getString(6).equalsIgnoreCase("M") ? "남" : (rs.getString(6).equalsIgnoreCase("F") ? "여" :  "") %></td>
<td><%= rs.getString(7).equalsIgnoreCase("1") ? "보컬" : rs.getString(7).equalsIgnoreCase("2") ? "댄스" : (rs.getString(7).equalsIgnoreCase("3") ? "랩" :  "") %></td>
<td><%= rs.getString(8) %></td>
</tr>
<%
}
%>
</table>
</section>
</body>
</html>