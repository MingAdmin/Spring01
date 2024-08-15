<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
    <%
    request.setCharacterEncoding("UTF-8");
    
    int m_no = Integer.parseInt(request.getParameter("m_no"));
    String passwd = request.getParameter("passwd");
    String name = request.getParameter("name");
    String zipcode = request.getParameter("zipNo");
    String addr = request.getParameter("roadAddrPart1");
    String addrdetail = request.getParameter("addrDetail");
    String tel = request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-" + request.getParameter("tel3");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email") + "@" + request.getParameter("emaildomain");
    String profile = request.getParameter("profile");
    String ip = request.getRemoteAddr();

    ResultSet rs = null;
    PreparedStatement pstmt = null;

    try {
        String sql = "SELECT m_passwd FROM member WHERE m_no=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, m_no);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String rpasswd = rs.getString("m_passwd");

            if (passwd.equals(rpasswd)) {
                sql = "UPDATE member SET m_name=?, m_zipcode=?, m_addr=?, m_addrdetail=?, ";
                sql = sql + "m_tel=?, m_gender=?, m_email=?, m_profile=?, m_ip=? WHERE m_no=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, zipcode);
                pstmt.setString(3, addr);
                pstmt.setString(4, addrdetail);
                pstmt.setString(5, tel);
                pstmt.setString(6, gender);
                pstmt.setString(7, email);
                pstmt.setString(8, profile);
                pstmt.setString(9, ip);
                pstmt.setInt(10, m_no);
                pstmt.executeUpdate();

                response.sendRedirect("list.jsp");
            } else {
    %>
                <script>
                    alert("회원정보 수정을 위한 비밀번호가 틀렸습니다.");
                    history.back();
                </script>
    <%
            }
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
