	function check(){
		if(login.id.value==""){
			alert("아이디를 입력하세요!");
			login.id.focus();
			return false;
		}
		if(login.passwd.value==""){
			alert("비밀번호를 입력하세요!");
			login.passwd.focus();
			return false;
		}
		
		login.submit();
	}

	function regist(){
		location.href = "../member/regist.jsp";
	}