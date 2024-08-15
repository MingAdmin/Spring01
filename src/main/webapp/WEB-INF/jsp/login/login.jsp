<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="../css/login.css">
<script>
function check(){
    if(login.m_id.value==""){
        alert("아이디를 입력하세요!");
        login.m_id.focus();
        return false;
    }
    if(login.m_passwd.value==""){
        alert("비밀번호를 입력하세요!");
        login.m_passwd.focus();
        return false;
    }
    
    login.submit();
}

function regist(){
    location.href = "/customer/joinexplanation.do";
}
function idfind(){    
    var pop = window.open("/login/idfind.do", "pop", "width=500, height=200, top=0, left=0");
}
function idCallBackFromPopup(m_id) {
    document.login.m_id.value = m_id;
}
function passwdfind(){    
    var pop = window.open("/login/passwdfind.do", "pop", "width=500, height=200, top=0, left=0");
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
    <%
    String m_no = "";
    String m_id = "";

    if(session.getAttribute("m_id") != null){
        m_no = (String)session.getAttribute("m_no");
        m_id = (String)session.getAttribute("m_id");
    }
    // 관리자로 로그인했다면?
    if(m_id.equals("admin")){
%>
    <p><%=m_id %>님 환영합니다.</p>
    <a href="/customer/list.do">회원목록</a>
    <a href="/login/logout.do">로그아웃</a>
<%
    }
    // 일반사용자로 로그인했다면?
    else if(!m_id.equals("")){
%>
    <p><%=m_id %>님 환영합니다.</p>
    <a href="/login/logout.do">로그아웃</a>
    <a href="/customer/edit.do?m_no=<%=m_no%>">회원정보수정</a>
    <a href="/customer/delete.do?m_no=<%=m_no%>">회원탈퇴</a>
    <a href="/board/index.do">메인페이지이동</a>
<%
    }
    // 비로그인(게스트)으로 접속했다면?
    else {
%>
    <h4>로그인</h4>
    <form name="login" action="/login/login_ok.do" method="post">
    <label for="m_id">아이디 :</label> 
    <input type="text" name="m_id" id="m_id">
    <input type="button" value="아이디찾기" onclick="idfind()">
    <br>

    <label for="m_passwd">비밀번호 :</label>
    <input type="password" name="m_passwd" id="m_passwd">
    <input type="button" value="비밀번호찾기" onclick="passwdfind()">
    <br>

    <div class="center-buttons">
    <input type="button" value="로그인" onclick="check()">
    <input type="button" value="회원가입" onclick="regist()">
	</div>
</form>
<%
    }
%>
<%@ include file="footer.jsp" %>
</body>
</html>
