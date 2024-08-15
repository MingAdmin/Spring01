<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");

        int m_no = Integer.parseInt(request.getParameter("m_no"));
        String passwd = request.getParameter("passwd");
        ResultSet rs = null;
        PreparedStatement pstmt = null;

        try{
            String sql = "SELECT m_passwd FROM member WHERE m_no=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, m_no);
            rs = pstmt.executeQuery();

            if(rs.next()){
                String rpasswd = rs.getString("m_passwd"); 
                if(passwd.equals(rpasswd)){
                    sql = "DELETE FROM member WHERE m_no=?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, m_no);
                    pstmt.executeUpdate();

                    response.sendRedirect("/customer/list.do");
                }
                else{
    %>
                    <script>
                        alert("회원탈퇴를 위한 비밀번호가 틀렸습니다.");
                        history.back();
                    </script>
    <%
                }
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
    %>
</body>
</html>
