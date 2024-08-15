function check(){
		if(member.m_id.value==""){
			alert("아이디sdfsdfs를 입력하세요.");
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

		if(member.m_ame.value==""){
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
	    var pop = window.open("jusoPopup.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
	}
	
	function jusoCallBack(roadAddrPart1, addrDetail, zipNo) {
	    document.member.m_zipcode.value = zipNo;
	    document.member.m_addr.value = roadAddrPart1;
	    document.member.m_addrdetail.value = addrDetail;
	}
	
	function idcheck() {
	    var pop = window.open("idsearch.jsp", "pop", "width=500, height=200, top=0, left=0");
	}
	
	function idCallBack(m_id) {
	    document.member.m_id.value = m_id;
	}