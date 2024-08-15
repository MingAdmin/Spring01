<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Result</title>
</head>
<body>
    <%

    request.setCharacterEncoding("UTF-8");
    
    String id = request.getParameter("m_id");
    String passwd = request.getParameter("m_passwd");
    
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    
    try {
        String sql = "SELECT m_no, m_id, m_passwd FROM member WHERE m_id = ?"; 
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            String num = rs.getString("m_no");
            String rid = rs.getString("m_id");
            String rpasswd = rs.getString("m_passwd"); 
            
            if (id.equals(rid) && passwd.equals(rpasswd)) {
                session.setAttribute("m_no", num);
                session.setAttribute("m_id", id);
                response.sendRedirect("/board/index.do");
            } else {
    %>
                <script>
                    alert("아이디 또는 비밀번호를 확인하시고 다시 로그인하세요!");
                    location.href = "/login/login.do";
                </script>
    <%
            }
        } else {
    %>
            <script>
                alert("해당 아이디가 존재하지 않습니다.");
                location.href = "/login/login.do";
            </script>
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
