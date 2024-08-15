<%@page import="java.sql.SQLException"%>
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
    <table border="0">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>조회수</th>
            <th>작성일</th>
        </tr>
        <% 
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            try {
                
                String sql = "SELECT N_BOARD_IDX, N_TITLE, N_HIT_CNT, TO_CHAR(N_CREATED_DATETIME, 'YYYY-MM-DD') AS CREATED_DATE " +
                             "FROM (SELECT * FROM N_BOARD ORDER BY N_BOARD_IDX DESC) " +
                             "WHERE ROWNUM <= 5";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                while (rs.next()) {
                    int nBoardIdx = rs.getInt("N_BOARD_IDX");
                    String nTitle = rs.getString("N_TITLE");
                    int nHitCnt = rs.getInt("N_HIT_CNT");
                    String nCreatedDate = rs.getString("CREATED_DATE");
                    
                    int maxLength = 10; 
                    if (nTitle.length() > maxLength) {
                        nTitle = nTitle.substring(0, maxLength) + "...";
                    }
        %>
        <tr>
            <td><%= nBoardIdx %></td>
            <td><%= nTitle %></td>
            <td><%= nHitCnt %></td>
            <td><%= nCreatedDate %></td>
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
