<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
    <%
    request.setCharacterEncoding("UTF-8");

    String m_id = request.getParameter("m_id");
    String m_passwd = request.getParameter("m_passwd");
    String m_name = request.getParameter("m_name");
    String m_zipcode = request.getParameter("m_zipcode");
    String m_addr = request.getParameter("m_addr");
    String m_addrdetail = request.getParameter("m_addrdetail");
    String m_tel = request.getParameter("m_tel1")+"-"+request.getParameter("m_tel2")+"-"+request.getParameter("m_tel3");
    String m_email = request.getParameter("m_email") + "@" + request.getParameter("m_emaildomain");
    String m_gender = request.getParameter("m_gender");
    String m_profile = request.getParameter("m_profile");
    String m_ip = request.getRemoteAddr();

    PreparedStatement pstmt = null;

    try {
        String sql = "INSERT INTO member(m_no, m_id, m_passwd, m_name, m_zipcode, m_addr, m_addrdetail, m_tel, m_gender, m_email, m_profile, m_regdate, m_ip)";
        sql = sql+" values(seq_member.nextval,?,?,?,?,?,?,?,?,?,?,sysdate,?)";

        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, m_id);
        pstmt.setString(2, m_passwd);
        pstmt.setString(3, m_name);
        pstmt.setString(4, m_zipcode);
        pstmt.setString(5, m_addr);
        pstmt.setString(6, m_addrdetail);
        pstmt.setString(7, m_tel);
        pstmt.setString(8, m_gender);
        pstmt.setString(9, m_email);
        pstmt.setString(10, m_profile);
        pstmt.setString(11, m_ip);

        pstmt.executeUpdate();

        response.sendRedirect("/customer/list.do");

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	    	if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
	    }
    %>
    <%
	    String sql = "INSERT INTO orders(m_no, m_id, m_passwd, m_name, m_zipcode, m_addr, m_addrdetail, m_tel, m_gender, m_email, m_profile, m_regdate, m_ip)";
	    sql = sql+" values(seq_member.nextval,?,?,?,?,?,?,?,?,?,?,sysdate,?)";
    %>
</body>
</html>
