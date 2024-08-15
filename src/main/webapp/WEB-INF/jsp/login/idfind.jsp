<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script>
    function idcheck() {
	    var pop = window.open("/login/idfind_ok.do", "pop", "width=500, height=200, top=0, left=0");
	}
	
	function idCallBack(m_name) {
	    document.member.m_name.value = m_name;
	}
</script>
</head>
<body>
	<h4>아이디 찾기</h4>
	<form name="idfind" method="post" action="/login/idfind_ok.do">
	    이름을 입력하세요: <input type="text" name="m_name">
	    <input type="button" value="아이디 찾기" onclick="idcheck()">
	</form>
</body>
</html>
