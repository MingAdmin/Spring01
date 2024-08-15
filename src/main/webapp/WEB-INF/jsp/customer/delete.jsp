<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
	<%
		int m_no = Integer.parseInt(request.getParameter("m_no"));
	%>
	<h3>회원탈퇴</h3>
	<form action="/customer/delete_ok.do" name="member" method="post">
		<input type = "hidden" name="m_no" value="<%=m_no%>">
		* 회원탈퇴를 위해 비밀번호를 입력하세요 : <input type = "password" name= "passwd">
		<input type = "submit" value="회원탈퇴">
		<input type = "button" value="취소" onclick="history.back()">
	</form> 
</body>
</html>