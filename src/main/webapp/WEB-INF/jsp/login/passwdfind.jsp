<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script>
	function passwdfindCallBack(m_name, m_id) {
	    document.passwdfind.m_name.value = m_name;
        document.passwdfind.m_id.value = m_id;
	}
</script>
</head>
<body>
	<h4>비밀번호 찾기</h4>
	<form name="passwdfind" method="post" action="/login/passwdfind_ok.do">
	    이름을 입력하세요: <input type="text" name="m_name"><br>
        아이디를 입력하세요: <input type="text" name="m_id"><br>
	    <input type="button" value="비밀번호 찾기" onclick="passwdfind.submit()">
	</form>
</body>
</html>
