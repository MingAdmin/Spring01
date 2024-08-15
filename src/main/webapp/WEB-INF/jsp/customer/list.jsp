<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<link rel="stylesheet" type="text/css" href="../css/course.css">
</head>
<body>
    <h3>회원목록</h3>
    <table border="1" width="700">
        <tr>
            <td>번호</td>
            <td>아이디</td>
            <td>이름</td>
            <td>연락처</td>
            <td>성별</td>
            <td>가입일</td>
            <td>수정/탈퇴</td>
        </tr>
        
        <%
            ResultSet rs = null;
            PreparedStatement pstmt = null;
            
            try {
                String sql =  "select m_no, m_id, m_name, m_tel, m_gender, m_regdate from member order by m_no desc";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                //int i = 1;
                
                while (rs.next()) {
                    int m_no = rs.getInt("m_no");
                    String m_id = rs.getString("m_id");
                    String m_name = rs.getString("m_name");
                    String m_tel = rs.getString("m_tel");
                    String m_gender = rs.getString("m_gender");
                    String m_regdate = rs.getString("m_regdate");
        %>
                    <tr>
                        <td><%= m_no %></td>
                        <td><%= m_id %></td>
                        <td><%= m_name %></td>
                        <td><%= m_tel %></td>
                        <td><%= m_gender %></td>
                        <td><%= m_regdate %></td>
                        <td>
                            <a href="/customer/edit.do?m_no=<%= m_no %>">수정</a>
                            <a href="/customer/delete.do?m_no=<%= m_no %>">탈퇴</a>
                        </td>
                    </tr>
        <%
        			//i++;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>
    </table>
</body>
</html>
