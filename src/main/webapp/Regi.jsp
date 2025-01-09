<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<br>
	<h2 style="text-align: center;">오디션 등록</h2>
	<br>
	<section style="display: flex; justify-content: center;">
		<form action="RegiConfirm.jsp" name="form">
			<table style="border-spacing: 0px;" border="1">
				<tr>
					<th>참가번호</th>
					<td><input type="text" name="artist_id">*참가번호 (AA00)4자리입니다</td>
				</tr>
				<tr>
					<th>참가자명</th>
					<td><input type="text" name="artist_name"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="text" name="year">년
						<input type="text" name="month">월
						<input type="text" name="day">일
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						 <input type="radio" name="gender" value="M">남
						 <input type="radio" name="gender" value="F">여
					 </td>
				</tr>
				<tr>
					<th>특기</th>
					<td><select name="talent">
							<option value="">특기선택</option>
							<option value="1">보컬</option>
							<option value="2">댄스</option>
							<option value="3">랩</option>
					</select></td>
				</tr>
				<tr>
					<th>소속사</th>
					<td><input type="text" name="agency"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="오디션 등록" onclick="fn_submit(); return false;">
						<input type="reset" value="다시쓰기" onclick="fn_reset();">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
	function fn_submit() {
	var f = document.form;
	
	if(f.artist_id.value == "") {
		alert("참가번호가 입력되지 않았습니다!");
		f.artist_id.focus(); return false;
	}
	if(f.artist_name.value == "") {
		alert("참가자명이 입력되지 않았습니다!");
		f.artist_name.focus(); return false;
	}
	if(f.year.value == "") {
		alert("생년월일이 입력되지 않았습니다!");
		f.year.focus(); return false;
	}
	if(f.month.value == "") {
		alert("생년월일이 입력되지 않았습니다!");
		f.month.focus(); return false;
	}
	if(f.day.value == "") {
		alert("생년월일이 입력되지 않았습니다!");
		f.day.focus(); return false;
	}
	if(f.gender.value == "") {
		alert("성별이 선택되지 않았습니다!");
		f.gender[0].focus(); return false;
	}
	if(f.talent.value == "") {
		alert("특기가 선택되지 않았습니다!");
		f.talent.focus(); return false;
	}
	if(f.agency.value == "") {
		alert("소속사가 입력되지 않았습니다!");
		f.agency.focus(); return false;
	}
	f.submit();
	}
	function fn_reset() {
		var f = document.form;
		
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		f.artist_id.focus();
		
	}
	</script>
</body>
</html>