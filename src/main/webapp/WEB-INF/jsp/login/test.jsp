<%-- <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>최근 게시물</title>
</head>
<body>
    <h1>최근 게시물</h1>
    <table border="1">
        <tr>
            <th>게시물 번호</th>
            <th>제목</th>
            <th>조회수</th>
            <th>작성일시</th>
            <th>글 내용</th>
        </tr>
        <% 
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            try {
                
                String sql = "SELECT board_idx, title, hit_cnt, created_datetime, content " +
                             "FROM (SELECT * FROM t_board ORDER BY board_idx DESC) " +
                             "WHERE ROWNUM <= 5";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                while (rs.next()) {
                    int boardIdx = rs.getInt("board_idx");
                    String title = rs.getString("title");
                    int hitCnt = rs.getInt("hit_cnt");
                    Timestamp createdDatetime = rs.getTimestamp("created_datetime");
                    String content = rs.getString("content");
                    
                    int maxLength = 5; 
                    if (title.length() > maxLength) {
                    	title = title.substring(0, maxLength) + "...";
                    }
        %>
        <tr>
            <td><%= boardIdx %></td>
            <td><%= title %></td>
            <td><%= hitCnt %></td>
            <td><%= createdDatetime %></td>
            <td><%= content %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </table>
</body>
</html>
 --%>