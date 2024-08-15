<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="../css/main.css" type="text/css">
</head>
<body>
    <div id="container">
        <%@ include file="header.jsp" %>
        <div id="slideShow">
            <div id="slides">
                <img src="../images/photo-1.jpg" alt="">
                <img src="../images/photo-2.jpg" alt="">
                <img src="../images/photo-1.jpg" alt="">
                <button id="prev">&lang;</button>
                <button id="next">&rang;</button>
            </div>
        </div>
        <div id="contents">
            <div id="tabMenu">
                <input type="radio" id="tab1" name="tabs" checked>
                <label for="tab1">공지사항</label>

                <div id="notice" class="tabContent">
                    <%@ include file="notice.jsp" %> 
                </div>
                <div id="event" class="tabContent">
                    <h2>갤러리 내용입니다.</h2>
                </div>
            </div>
            <div id="links">
                <ul>
                    <li>
                        <a href="/board/openBoardList.do">
                            <span id="quick-icon1"></span>
                            <p>공지사항</p>
                        </a>
                    </li>
                    <li>
                        <a href="/event/eventList.do">
                            <span id="quick-icon2"></span>
                            <p>이벤트</p>
                        </a>
                    </li>
                    <li>
                        <a href="/review/reviewList.do">
                            <span id="quick-icon3"></span>
                            <p>수강후기</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <%@ include file="footer.jsp" %>
    </div>
    <script src="../js/slideShow.js"></script>
</body>
</html>
