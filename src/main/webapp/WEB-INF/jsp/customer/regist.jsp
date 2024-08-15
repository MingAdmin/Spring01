<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입양식</title>
<link rel="stylesheet" href="../css/regist.css">
<script>
	function check(){
		if(member.m_id.value==""){
			alert("아이디를 입력하세요.");
			member.m_id.focus();
			return false;
		}
	
		if(member.m_passwd.value==""){
			alert("비밀번호를 입력하세요.");
			member.m_passwd.focus();
			return false;
		}
		
		if(member.m_passwd.value.length<8 || member.m_passwd.value.length>12){
			alert("비밀번호는 8자리 이상 12자리 이하로 입력하세요.");
			member.m_passwd.value="";
			member.m_passwd2.value="";
			member.m_passwd.focus();
			return false;
		}
		
		if(member.m_passwd.value!=member.m_passwd2.value){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			member.m_passwd.value="";
			member.m_passwd2.value="";
			member.m_passwd.focus();
			return false;
		}
	
		if(member.m_name.value==""){
			alert("이름을 입력하세요.");
			member.m_name.focus();
			return false;
		}
		
		if(member.m_tel2.value=="" || member.m_tel3.value==""){
			alert("전화번호를 입력하세요.");
			member.m_tel2.value="";
			member.m_tel3.value="";
			member.m_tel2.focus();
			return false;
		}
	
		if(member.m_tel2.value.length!=4 || member.m_tel3.value.length!=4){
			alert("국번과 전화번호는 4자리로 입력하세요.");
			member.m_tel2.value="";
			member.m_tel3.value="";
			member.m_tel2.focus();
			return false;
		}
		
		member.submit();
	}
	
	function goPopup() {
	    var pop = window.open("/customer/jusoPopup.do", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
	}
	
	function jusoCallBack(roadAddrPart1, addrDetail, zipNo) {
	    document.member.m_zipcode.value = zipNo;
	    document.member.m_addr.value = roadAddrPart1;
	    document.member.m_addrdetail.value = addrDetail;
	}
	
	function idcheck() {
	    var pop = window.open("/customer/idsearch.do", "pop", "width=500, height=200, top=0, left=0");
	}
	
	function idCallBack(m_id) {
	    document.member.m_id.value = m_id;
	}
</script>
</head>
<body>
<h3>회원가입</h3>
<form action="/customer/regist_ok.do" name="member" method="post">
    <div class="input-group">
        <label for="id">아이디</label>
        <input type="text" id="id" name="m_id" readonly onclick="member.idbtn.focus()">
        <input type="button" name="idbtn" value="아이디 중복조회" onclick="idcheck()">
    </div>
    <div class="input-group">
        <label for="passwd">비밀번호</label>
        <input type="password" id="passwd" name="m_passwd">
    </div>
    <div class="input-group">
        <label for="passwd2">비밀번호확인</label>
        <input type="password" id="passwd2" name="m_passwd2">
    </div>
    <div class="input-group">
        <label for="name">이름</label>
        <input type="text" id="name" name="m_name">
    </div>
    <div class="input-group">
        <label for="zipNo">우편번호</label>
        <input type="text" id="zipNo" name="m_zipcode" size="5" readonly onclick="member.zipbtn.focus()">
        <input type="button" name="zipbtn" value="우편번호검색" onclick="goPopup()">
    </div>
    <div class="input-group">
        <label for="roadAddrPart1">주소</label>
        <input type="text" id="roadAddrPart1" name="m_addr" size="40" readonly onclick="member.zipbtn.focus()">
    </div>
    <div class="input-group">
        <label for="addrDetail">상세주소</label>
        <input type="text" id="addrDetail" name="m_addrdetail" size="40" readonly onclick="member.zipbtn.focus()">
    </div>
    <div class="input-group">
        <label for="tel1">연락처</label>
        <select id="tel1" name="m_tel1">
            <option value="010">010</option>
            <option value="011">011</option>
            <option value="016">016</option>
            <option value="017">017</option>
            <option value="018">018</option>
            <option value="019">019</option>
        </select>
        -
        <input type="text" maxlength="4" size="4" name="m_tel2"
            onKeyup="if(member.tel2.value.length==4) member.tel3.focus()"> -
        <input type="text" maxlength="4" size="4" name="m_tel3">
    </div>
    <div class="input-group">
        <label for="email">이메일</label>
        <input type="text" id="email" name="m_email">
        @
        <select id="emaildomain" name="m_emaildomain">
            <option value="naver.com">naver.com</option>
            <option value="google.com">google.com</option>
            <option value="직접입력">직접입력</option>
        </select>
        <!-- <input type="text" id="emailmain" name="emailmain"> -->
    </div>
    <div class="input-group">
        <label>성별</label>
        <input type="radio" name="m_gender" value="남성" checked>남성
        <input type="radio" name="m_gender" value="여성">여성
    </div>
    <div class="input-group">
        <label>가입인사</label>
        <textarea name="m_profile" cols="60" rows="6" placeholder="가입인사를 입력해주세요"></textarea>
    </div>
    <div class="button-group">
        <input type="button" value="가입하기" onclick="check()">
        <input type="reset" value="다시쓰기">
    </div>
</form>
</body>
</html>
