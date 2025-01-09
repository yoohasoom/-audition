<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe" , "system", "1234");

int result = 0;
String str = request.getParameter("year");
String str2 = request.getParameter("month");
String str3 = request.getParameter("day");
String artist_birth = str + str2 + str3;

String sql = "insert into tbl_artist_201905 values(?, ?, ?, ?, ?, ?)";

PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, request.getParameter("artist_id"));
pstmt.setString(2, request.getParameter("artist_name"));
pstmt.setString(3, artist_birth);
pstmt.setString(4, request.getParameter("gender"));
pstmt.setString(5, request.getParameter("talent"));
pstmt.setString(6, request.getParameter("agency"));

result = pstmt.executeUpdate();

if(result == 1) {
%>
<script type="text/javascript">
alert("참가신청이 정상적으로 등록되었습니다!");
location = "List.jsp";
</script>
<%
}
%>
</body>
</html>