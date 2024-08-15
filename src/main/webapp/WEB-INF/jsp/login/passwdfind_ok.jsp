<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String m_name = request.getParameter("m_name");
    String m_id = request.getParameter("m_id");
    
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    
    try {
        String sql = "SELECT m_passwd FROM member WHERE m_name=? AND m_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, m_name);
        pstmt.setString(2, m_id);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            String m_passwd = rs.getString("m_passwd");
	%>
            <h4><%=m_name %>님의 비밀번호는 <%=m_passwd %>입니다.</h4>
            <input type="button" value="닫기" onclick="closewin()">
	<%
        } else {
	%>
            <script>
                alert("일치하는 정보가 없습니다. 이름과 아이디를 확인해주세요.");
                history.back();
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
<script>
    function closewin() {
        window.close();
    }
</script>
</body>
</html>
