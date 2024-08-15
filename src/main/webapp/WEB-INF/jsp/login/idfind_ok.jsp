<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String m_name = request.getParameter("m_name");    
    
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    
    try {
        String sql = "SELECT m_id FROM member WHERE m_name=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, m_name);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            String m_id = rs.getString("m_id");
	%>
            <h4><%=m_name %>님의 아이디는 <%=m_id %>입니다.</h4>
            <input type="button" value="닫기" onclick="closewin('<%=m_id %>')">
	<%
        } else {
	%>
            <script>
                alert("일치하는 정보가 없습니다. 이름을 확인해주세요.");
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
    function closewin(m_id) {
        opener.idCallBackFromPopup(m_id);
        window.close();
    }
</script>
</body>
</html>
