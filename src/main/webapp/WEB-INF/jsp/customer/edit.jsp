<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" type="text/css" href="../css/edit_ok.css">
<script language="javascript">
    function goPopup() {
        var pop = window.open("jusoPopup.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
    }

    function jusoCallBack(roadAddrPart1, addrDetail, zipNo) {
        document.member.roadAddrPart1.value = roadAddrPart1;
        document.member.addrDetail.value = addrDetail;
        document.member.zipNo.value = zipNo;
    }
</script>
</head>
<body>
    <%
    int m_no = Integer.parseInt(request.getParameter("m_no"));

    ResultSet rs = null;
    PreparedStatement pstmt = null;

    try {
        String sql = "SELECT * FROM member WHERE m_no=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, m_no);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String id = rs.getString("m_id");
            String name = rs.getString("m_name");
            String zipcode = rs.getString("m_zipcode");
            String addr = rs.getString("m_addr");
            String addrdetail = rs.getString("m_addrdetail");
            String tel = rs.getString("m_tel");
            String gender = rs.getString("m_gender");
            String email = rs.getString("m_email");
            String profile = rs.getString("m_profile");
    %>
    <h3>회원정보수정</h3>
    <form action="/customer/edit_ok.do" name="member" method="post">
        <input type="hidden" name="num" value="<%=m_no%>">
        <div class="input-group">
            <label for="id">아이디</label>
            <%=id%> <input type="button" value="아이디 중복검사">
        </div>
        <div class="input-group">
            <label for="passwd">비밀번호</label>
            <input type="password" id="passwd" name="passwd">
        </div>
        <div class="input-group">
            <label for="passwd2">비밀번호확인</label>
            <input type="password" id="passwd2" name="passwd2">
        </div>
        <div class="input-group">
            <label for="name">이름</label>
            <input type="text" id="name" name="name" value="<%=name%>">
        </div>
        <div class="input-group">
            <label for="zipNo">우편번호</label>
            <input type="text" id="zipNo" name="zipNo" size="5" value="<%=zipcode%>" readonly>
            <input type="button" value="우편번호검색" onclick="goPopup()">
        </div>
        <div class="input-group">
            <label for="roadAddrPart1">주소</label>
            <input type="text" id="roadAddrPart1" name="roadAddrPart1" size="40" value="<%=addr%>" readonly>
        </div>
        <div class="input-group">
            <label for="addrDetail">상세주소</label>
            <input type="text" id="addrDetail" name="addrDetail" size="40" value="<%=addrdetail%>" readonly>
        </div>
        <div class="input-group">
            <label for="tel1">연락처</label>
            <select id="tel1" name="tel1">
                <option value="010" <%=tel.substring(0, 3).equals("010") ? "selected" : ""%>>010</option>
                <option value="011" <%=tel.substring(0, 3).equals("011") ? "selected" : ""%>>011</option>
                <option value="016" <%=tel.substring(0, 3).equals("016") ? "selected" : ""%>>016</option>
                <option value="017" <%=tel.substring(0, 3).equals("017") ? "selected" : ""%>>017</option>
                <option value="018" <%=tel.substring(0, 3).equals("018") ? "selected" : ""%>>018</option>
                <option value="019" <%=tel.substring(0, 3).equals("019") ? "selected" : ""%>>019</option>
            </select>
            -
            <input type="text" maxlength="4" size="4" name="tel2" value="<%=tel.substring(4, 8)%>"> -
            <input type="text" maxlength="4" size="4" name="tel3" value="<%=tel.substring(9, 13)%>">
        </div>
        <div class="input-group">
            <label>성별</label>
            <input type="radio" name="gender" value="남성" <%=gender.equals("남성") ? "checked" : ""%>>남성
            <input type="radio" name="gender" value="여성" <%=gender.equals("여성") ? "checked" : ""%>>여성
        </div>
        <div class="input-group">
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" value="<%=email%>"> @
            <select name="emaildomain">
                <option value="naver.com">naver.com</option>
                <option value="gmail.com">gmail.com</option>
                <option value="yahoo.com">yahoo.com</option>
                <option value="" <%=email.equals("") ? "selected" : ""%>></option>
            </select>
        </div>
        <div class="input-group">
            <label>가입인사</label>
            <textarea name="profile" cols="60" rows="6" placeholder="가입인사를 입력해주세요"><%=profile%></textarea>
        </div>
        <div class="button-group">
            <input type="submit" value="회원정보수정">
            <input type="button" value="취소" onclick="history.back()">
        </div>
    </form>
    <%
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
    %>
</body>
</html>
